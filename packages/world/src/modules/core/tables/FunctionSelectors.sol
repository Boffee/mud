// SPDX-License-Identifier: MIT
pragma solidity >=0.8.0;

/* Autogenerated file. Do not edit manually. */

// Import schema type
import { SchemaType } from "@latticexyz/schema-type/src/solidity/SchemaType.sol";

// Import store internals
import { IStore } from "@latticexyz/store/src/IStore.sol";
import { StoreSwitch } from "@latticexyz/store/src/StoreSwitch.sol";
import { StoreCore, StoreCoreInternal } from "@latticexyz/store/src/StoreCore.sol";
import { Bytes } from "@latticexyz/store/src/Bytes.sol";
import { Memory } from "@latticexyz/store/src/Memory.sol";
import { SliceLib } from "@latticexyz/store/src/Slice.sol";
import { EncodeArray } from "@latticexyz/store/src/tightcoder/EncodeArray.sol";
import { FieldLayout, FieldLayoutLib } from "@latticexyz/store/src/FieldLayout.sol";
import { Schema, SchemaLib } from "@latticexyz/store/src/Schema.sol";
import { PackedCounter, PackedCounterLib } from "@latticexyz/store/src/PackedCounter.sol";

bytes32 constant _tableId = bytes32(abi.encodePacked(bytes16(""), bytes16("FunctionSelector")));
bytes32 constant FunctionSelectorsTableId = _tableId;

FieldLayout constant _fieldLayout = FieldLayout.wrap(
  0x0024020020040000000000000000000000000000000000000000000000000000
);

library FunctionSelectors {
  /** Get the table values' field layout */
  function getFieldLayout() internal pure returns (FieldLayout) {
    return _fieldLayout;
  }

  /** Get the table's key schema */
  function getKeySchema() internal pure returns (Schema) {
    SchemaType[] memory _schema = new SchemaType[](1);
    _schema[0] = SchemaType.BYTES4;

    return SchemaLib.encode(_schema);
  }

  /** Get the table's value schema */
  function getValueSchema() internal pure returns (Schema) {
    SchemaType[] memory _schema = new SchemaType[](2);
    _schema[0] = SchemaType.BYTES32;
    _schema[1] = SchemaType.BYTES4;

    return SchemaLib.encode(_schema);
  }

  /** Get the table's key names */
  function getKeyNames() internal pure returns (string[] memory keyNames) {
    keyNames = new string[](1);
    keyNames[0] = "functionSelector";
  }

  /** Get the table's field names */
  function getFieldNames() internal pure returns (string[] memory fieldNames) {
    fieldNames = new string[](2);
    fieldNames[0] = "resourceSelector";
    fieldNames[1] = "systemFunctionSelector";
  }

  /** Register the table with its config */
  function register() internal {
    StoreSwitch.registerTable(
      _tableId,
      getFieldLayout(),
      getKeySchema(),
      getValueSchema(),
      getKeyNames(),
      getFieldNames()
    );
  }

  /** Register the table with its config (using the specified store) */
  function register(IStore _store) internal {
    _store.registerTable(_tableId, getFieldLayout(), getKeySchema(), getValueSchema(), getKeyNames(), getFieldNames());
  }

  /** Get resourceSelector */
  function getResourceSelector(bytes4 functionSelector) internal view returns (bytes32 resourceSelector) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32(functionSelector);

    uint256 storagePointer = StoreCoreInternal._getStaticDataLocation(_tableId, _keyTuple);
    bytes32 _blob = StoreSwitch.loadStaticField(storagePointer, 32, 0);
    return (bytes32(_blob));
  }

  /** Get resourceSelector (using the specified store) */
  function getResourceSelector(
    IStore _store,
    bytes4 functionSelector
  ) internal view returns (bytes32 resourceSelector) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32(functionSelector);

    uint256 storagePointer = StoreCoreInternal._getStaticDataLocation(_tableId, _keyTuple);
    bytes32 _blob = _store.loadStaticField(storagePointer, 32, 0);
    return (bytes32(_blob));
  }

  /** Set resourceSelector */
  function setResourceSelector(bytes4 functionSelector, bytes32 resourceSelector) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32(functionSelector);

    uint256 storagePointer = StoreCoreInternal._getStaticDataLocation(_tableId, _keyTuple);
    StoreSwitch.storeStaticField(
      storagePointer,
      32,
      0,
      abi.encodePacked((resourceSelector)),
      _tableId,
      _keyTuple,
      0,
      getFieldLayout()
    );
  }

  /** Set resourceSelector (using the specified store) */
  function setResourceSelector(IStore _store, bytes4 functionSelector, bytes32 resourceSelector) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32(functionSelector);

    uint256 storagePointer = StoreCoreInternal._getStaticDataLocation(_tableId, _keyTuple);
    _store.storeStaticField(
      storagePointer,
      32,
      0,
      abi.encodePacked((resourceSelector)),
      _tableId,
      _keyTuple,
      0,
      getFieldLayout()
    );
  }

  /** Get systemFunctionSelector */
  function getSystemFunctionSelector(bytes4 functionSelector) internal view returns (bytes4 systemFunctionSelector) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32(functionSelector);

    uint256 storagePointer = StoreCoreInternal._getStaticDataLocation(_tableId, _keyTuple);
    bytes32 _blob = StoreSwitch.loadStaticField(storagePointer, 4, 32);
    return (bytes4(_blob));
  }

  /** Get systemFunctionSelector (using the specified store) */
  function getSystemFunctionSelector(
    IStore _store,
    bytes4 functionSelector
  ) internal view returns (bytes4 systemFunctionSelector) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32(functionSelector);

    uint256 storagePointer = StoreCoreInternal._getStaticDataLocation(_tableId, _keyTuple);
    bytes32 _blob = _store.loadStaticField(storagePointer, 4, 32);
    return (bytes4(_blob));
  }

  /** Set systemFunctionSelector */
  function setSystemFunctionSelector(bytes4 functionSelector, bytes4 systemFunctionSelector) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32(functionSelector);

    uint256 storagePointer = StoreCoreInternal._getStaticDataLocation(_tableId, _keyTuple);
    StoreSwitch.storeStaticField(
      storagePointer,
      4,
      32,
      abi.encodePacked((systemFunctionSelector)),
      _tableId,
      _keyTuple,
      1,
      getFieldLayout()
    );
  }

  /** Set systemFunctionSelector (using the specified store) */
  function setSystemFunctionSelector(IStore _store, bytes4 functionSelector, bytes4 systemFunctionSelector) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32(functionSelector);

    uint256 storagePointer = StoreCoreInternal._getStaticDataLocation(_tableId, _keyTuple);
    _store.storeStaticField(
      storagePointer,
      4,
      32,
      abi.encodePacked((systemFunctionSelector)),
      _tableId,
      _keyTuple,
      1,
      getFieldLayout()
    );
  }

  /** Get the full data */
  function get(
    bytes4 functionSelector
  ) internal view returns (bytes32 resourceSelector, bytes4 systemFunctionSelector) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32(functionSelector);

    bytes memory _blob = StoreSwitch.getRecord(_tableId, _keyTuple, getFieldLayout());
    return decode(_blob);
  }

  /** Get the full data (using the specified store) */
  function get(
    IStore _store,
    bytes4 functionSelector
  ) internal view returns (bytes32 resourceSelector, bytes4 systemFunctionSelector) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32(functionSelector);

    bytes memory _blob = _store.getRecord(_tableId, _keyTuple, getFieldLayout());
    return decode(_blob);
  }

  /** Set the full data using individual values */
  function set(bytes4 functionSelector, bytes32 resourceSelector, bytes4 systemFunctionSelector) internal {
    bytes memory _data = encode(resourceSelector, systemFunctionSelector);

    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32(functionSelector);

    StoreSwitch.setRecord(_tableId, _keyTuple, _data, getFieldLayout());
  }

  /** Set the full data using individual values (using the specified store) */
  function set(
    IStore _store,
    bytes4 functionSelector,
    bytes32 resourceSelector,
    bytes4 systemFunctionSelector
  ) internal {
    bytes memory _data = encode(resourceSelector, systemFunctionSelector);

    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32(functionSelector);

    _store.setRecord(_tableId, _keyTuple, _data, getFieldLayout());
  }

  /** Decode the tightly packed blob using this table's field layout */
  function decode(bytes memory _blob) internal pure returns (bytes32 resourceSelector, bytes4 systemFunctionSelector) {
    resourceSelector = (Bytes.slice32(_blob, 0));

    systemFunctionSelector = (Bytes.slice4(_blob, 32));
  }

  /** Tightly pack full data using this table's field layout */
  function encode(bytes32 resourceSelector, bytes4 systemFunctionSelector) internal pure returns (bytes memory) {
    return abi.encodePacked(resourceSelector, systemFunctionSelector);
  }

  /** Encode keys as a bytes32 array using this table's field layout */
  function encodeKeyTuple(bytes4 functionSelector) internal pure returns (bytes32[] memory) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32(functionSelector);

    return _keyTuple;
  }

  /* Delete all data for given keys */
  function deleteRecord(bytes4 functionSelector) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32(functionSelector);

    StoreSwitch.deleteRecord(_tableId, _keyTuple, getFieldLayout());
  }

  /* Delete all data for given keys (using the specified store) */
  function deleteRecord(IStore _store, bytes4 functionSelector) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32(functionSelector);

    _store.deleteRecord(_tableId, _keyTuple, getFieldLayout());
  }
}
