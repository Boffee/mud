import {
  renderArguments,
  renderCommonData,
  RenderField,
  RenderType,
  renderWithStore,
} from "@latticexyz/common/codegen";
import { RenderTableOptions } from "./types";

export function renderFieldMethods(options: RenderTableOptions) {
  const storeArgument = options.storeArgument;
  const { _typedTableId, _typedKeyArgs, _keyTupleDefinition, _keyhashDefinition } = renderCommonData(options);

  let result = "";
  let offset = 0;
  for (const [schemaIndex, field] of options.fields.entries()) {
    const _typedFieldName = `${field.typeWithLocation} ${field.name}`;
    const dynamicSchemaIndex = schemaIndex - options.staticFields.length;
    const pointerOffset = Math.floor(offset / 32);
    const slotOffset = offset % 32;

    if (field.isDynamic) {
      result += renderWithStore(
        storeArgument,
        (_typedStore, _store, _commentSuffix, _, _methodNamePrefix) => `
        /** Get ${field.name}${_commentSuffix} */
        function ${_methodNamePrefix}get${field.methodNameSuffix}(${renderArguments([
          _typedStore,
          _typedTableId,
          _typedKeyArgs,
        ])}) internal view returns (${_typedFieldName}) {
          ${_keyhashDefinition}
          uint256 storagePointer = StoreCoreInternal._getDynamicDataLocation(_tableId, _keyHash, ${dynamicSchemaIndex});
          uint256 lengthStoragePointer = StoreCoreInternal._getDynamicDataLengthLocation(_tableId, _keyHash);
          bytes memory _blob = ${_store}.loadDynamicField(storagePointer, lengthStoragePointer, ${dynamicSchemaIndex});
          return ${renderDecodeFieldSingle(field)};
        }
      `
      );

      result += renderWithStore(
        storeArgument,
        (_typedStore, _store, _commentSuffix, _, _methodNamePrefix) => `
        /** Set ${field.name}${_commentSuffix} */
        function ${_methodNamePrefix}set${field.methodNameSuffix}(${renderArguments([
          _typedStore,
          _typedTableId,
          _typedKeyArgs,
          _typedFieldName,
        ])}) internal {
          ${_keyTupleDefinition}
          ${_store}.setField(_tableId, _keyTuple, ${schemaIndex}, ${renderEncodeFieldSingle(field)}, getFieldLayout());
        }
      `
      );
    } else {
      const remainderBits = (field.staticByteLength + slotOffset - 32) * 8;
      result += renderWithStore(
        storeArgument,
        (_typedStore, _store, _commentSuffix, _, _methodNamePrefix) => `
        /** Get ${field.name}${_commentSuffix} */
        function ${_methodNamePrefix}get${field.methodNameSuffix}(${renderArguments([
          _typedStore,
          _typedTableId,
          _typedKeyArgs,
        ])}) internal view returns (${_typedFieldName}) {
          ${_keyhashDefinition}
          ${
            _methodNamePrefix == "_"
              ? `
          uint256 storagePointer;
          unchecked {
            storagePointer = uint256(_tableId ^ SLOT ^ _keyHash)${pointerOffset ? ` + ${pointerOffset}` : ""};
          }
          ${field.internalTypeId} _blob;
          assembly {
            _blob := ${
              remainderBits == 0
                ? `sload(storagePointer)`
                : remainderBits < 0
                ? `shr(${-remainderBits}, sload(storagePointer))`
                : `or(shl(${remainderBits}, sload(storagePointer), shr(${
                    256 - remainderBits
                  }, sload(add(storagePointer, 1)))))`
            }
          }
          return ${field.typeWrap ? `${field.typeWrap}(_blob)` : "_blob"};`
              : `
          uint256 storagePointer = StoreCoreInternal._getStaticDataLocation(_tableId, _keyHash);
          bytes32 _blob = ${_store}.loadStaticField(storagePointer, ${field.staticByteLength}, ${offset});
          return ${renderDecodeStaticValueType(field)};`
          }
        }
      `
      );

      result += renderWithStore(
        storeArgument,
        (_typedStore, _store, _commentSuffix, _, _methodNamePrefix) => `
        /** Set ${field.name}${_commentSuffix} */
        function ${_methodNamePrefix}set${field.methodNameSuffix}(${renderArguments([
          _typedStore,
          _typedTableId,
          _typedKeyArgs,
          _typedFieldName,
        ])}) internal {
          ${_keyTupleDefinition}
          ${_keyhashDefinition}
          uint256 storagePointer = StoreCoreInternal._getStaticDataLocation(_tableId, _keyHash);
          ${_store}.storeStaticField(storagePointer, ${field.staticByteLength}, ${offset}, ${renderEncodeFieldSingle(
          field
        )}, _tableId, _keyTuple, ${schemaIndex}, getFieldLayout());
        }
      `
      );
    }

    if (field.isDynamic) {
      const portionData = fieldPortionData(field);

      result += renderWithStore(
        storeArgument,
        (_typedStore, _store, _commentSuffix, _, _methodNamePrefix) => `
        /** Get the length of ${field.name}${_commentSuffix} */
        function ${_methodNamePrefix}length${field.methodNameSuffix}(${renderArguments([
          _typedStore,
          _typedTableId,
          _typedKeyArgs,
        ])}) internal view returns (uint256) {
          ${_keyhashDefinition}
          uint256 lengthStoragePointer = StoreCoreInternal._getDynamicDataLengthLocation(_tableId, _keyHash);
          uint256 _byteLength = ${_store}.loadFieldLength(lengthStoragePointer, ${dynamicSchemaIndex});
          unchecked {
            return _byteLength / ${portionData.elementLength};
          }
        }
      `
      );

      result += renderWithStore(
        storeArgument,
        (_typedStore, _store, _commentSuffix, _, _methodNamePrefix) => `
        /**
         * Get an item of ${field.name}${_commentSuffix}
         * (unchecked, returns invalid data if index overflows)
         */
        function ${_methodNamePrefix}getItem${field.methodNameSuffix}(${renderArguments([
          _typedStore,
          _typedTableId,
          _typedKeyArgs,
          "uint256 _index",
        ])}) internal view returns (${portionData.typeWithLocation}) {
          ${_keyhashDefinition}
          uint256 storagePointer = StoreCoreInternal._getDynamicDataLocation(_tableId, _keyHash, ${dynamicSchemaIndex});
          unchecked {
            bytes memory _blob = ${_store}.loadFieldSlice(
              storagePointer,
              _index * ${portionData.elementLength},
              (_index + 1) * ${portionData.elementLength}
            );
            return ${portionData.decoded};
          }
        }
      `
      );

      result += renderWithStore(
        storeArgument,
        (_typedStore, _store, _commentSuffix, _, _methodNamePrefix) => `
        /** Push ${portionData.title} to ${field.name}${_commentSuffix} */
        function ${_methodNamePrefix}push${field.methodNameSuffix}(${renderArguments([
          _typedStore,
          _typedTableId,
          _typedKeyArgs,
          `${portionData.typeWithLocation} ${portionData.name}`,
        ])}) internal {
          ${_keyTupleDefinition}
          ${_store}.pushToField(_tableId, _keyTuple, ${schemaIndex}, ${portionData.encoded}, getFieldLayout());
        }
      `
      );

      result += renderWithStore(
        storeArgument,
        (_typedStore, _store, _commentSuffix, _, _methodNamePrefix) => `
        /** Pop ${portionData.title} from ${field.name}${_commentSuffix} */
        function ${_methodNamePrefix}pop${field.methodNameSuffix}(${renderArguments([
          _typedStore,
          _typedTableId,
          _typedKeyArgs,
        ])}) internal {
          ${_keyTupleDefinition}
          ${_store}.popFromField(_tableId, _keyTuple, ${schemaIndex}, ${portionData.elementLength}, getFieldLayout());
        }
      `
      );

      result += renderWithStore(
        storeArgument,
        (_typedStore, _store, _commentSuffix, _, _methodNamePrefix) => `
        /**
         * Update ${portionData.title} of ${field.name}${_commentSuffix} at \`_index\`
         * (checked only to prevent modifying other tables; can corrupt own data if index overflows)
         */
        function ${_methodNamePrefix}update${field.methodNameSuffix}(${renderArguments([
          _typedStore,
          _typedTableId,
          _typedKeyArgs,
          "uint256 _index",
          `${portionData.typeWithLocation} ${portionData.name}`,
        ])}) internal {
          ${_keyTupleDefinition}
          unchecked {
            ${_store}.updateInField(
              _tableId,
              _keyTuple,
              ${schemaIndex},
              _index * ${portionData.elementLength},
              ${portionData.encoded},
              getFieldLayout()
            );
          }
        }
      `
      );
    }

    offset += field.staticByteLength;
  }
  return result;
}

export function renderEncodeFieldSingle(field: RenderField) {
  let func;
  if (field.arrayElement) {
    func = "EncodeArray.encode";
  } else if (field.isDynamic) {
    func = "bytes";
  } else {
    func = "abi.encodePacked";
  }
  return `${func}(${field.typeUnwrap}(${field.name}))`;
}

export function renderDecodeValueType(field: RenderType, offset: number) {
  const { staticByteLength, internalTypeId } = field;

  const innerSlice = `Bytes.slice${staticByteLength}(_blob, ${offset})`;
  const bits = staticByteLength * 8;

  let result;
  if (internalTypeId.match(/^uint\d{1,3}$/) || internalTypeId === "address") {
    result = `${internalTypeId}(${innerSlice})`;
  } else if (internalTypeId.match(/^int\d{1,3}$/)) {
    result = `${internalTypeId}(uint${bits}(${innerSlice}))`;
  } else if (internalTypeId.match(/^bytes\d{1,2}$/)) {
    result = innerSlice;
  } else if (internalTypeId === "bool") {
    result = `_toBool(uint8(${innerSlice}))`;
  } else {
    throw new Error(`Unknown value type id ${internalTypeId}`);
  }
  return `${field.typeWrap}(${result})`;
}

export function renderDecodeStaticValueType(field: RenderType) {
  const { staticByteLength, internalTypeId } = field;

  const innerSlice = `bytes${staticByteLength}(_blob)`;
  const bits = staticByteLength * 8;

  let result;
  if (internalTypeId.match(/^uint\d{1,3}$/) || internalTypeId === "address") {
    result = `${internalTypeId}(${innerSlice})`;
  } else if (internalTypeId.match(/^int\d{1,3}$/)) {
    result = `${internalTypeId}(uint${bits}(${innerSlice}))`;
  } else if (internalTypeId.match(/^bytes\d{1,2}$/)) {
    result = innerSlice;
  } else if (internalTypeId === "bool") {
    result = `_toBool(uint8(${innerSlice}))`;
  } else {
    throw new Error(`Unknown value type id ${internalTypeId}`);
  }
  return `${field.typeWrap}(${result})`;
}

/** bytes/string are dynamic, but aren't really arrays */
function fieldPortionData(field: RenderField) {
  const methodNameSuffix = "";
  if (field.arrayElement) {
    const name = "_element";
    const elementFieldData = { ...field.arrayElement, arrayElement: undefined, name, methodNameSuffix };
    return {
      typeWithLocation: field.arrayElement.typeWithLocation,
      name: "_element",
      encoded: renderEncodeFieldSingle(elementFieldData),
      decoded: renderDecodeFieldSingle(elementFieldData),
      title: "an element",
      elementLength: field.arrayElement.staticByteLength,
    };
  } else {
    const name = "_slice";
    const elementFieldData = { ...field, name, methodNameSuffix };
    return {
      typeWithLocation: `${field.typeId} memory`,
      name,
      encoded: renderEncodeFieldSingle(elementFieldData),
      decoded: renderDecodeFieldSingle(elementFieldData),
      title: "a slice",
      elementLength: 1,
    };
  }
}

function renderDecodeFieldSingle(field: RenderField) {
  const { isDynamic, arrayElement } = field;
  if (arrayElement) {
    // arrays
    return `${field.typeWrap}(
      SliceLib.getSubslice(_blob, 0, _blob.length).decodeArray_${arrayElement.internalTypeId}()
    )`;
  } else if (isDynamic) {
    // bytes/string
    return `${field.typeWrap}(${field.internalTypeId}(_blob))`;
  } else {
    return renderDecodeValueType(field, 0);
  }
}
