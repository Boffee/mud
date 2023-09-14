// SPDX-License-Identifier: MIT
pragma solidity >=0.8.0;

/* Autogenerated file. Do not edit manually. */

// Import schema type
import { SchemaType } from "@latticexyz/schema-type/src/solidity/SchemaType.sol";

// Import store internals
import { IStore } from "../../IStore.sol";
import { StoreSwitch } from "../../StoreSwitch.sol";
import { StoreCore, StoreCoreInternal } from "../../StoreCore.sol";
import { Bytes } from "../../Bytes.sol";
import { Memory } from "../../Memory.sol";
import { SliceLib } from "../../Slice.sol";
import { EncodeArray } from "../../tightcoder/EncodeArray.sol";
import { FieldLayout, FieldLayoutLib } from "../../FieldLayout.sol";
import { Schema, SchemaLib } from "../../Schema.sol";
import { PackedCounter, PackedCounterLib } from "../../PackedCounter.sol";

bytes32 constant _tableId = bytes32(abi.encodePacked(bytes16("mudstore"), bytes16("Callbacks")));
bytes32 constant CallbacksTableId = _tableId;

FieldLayout constant _fieldLayout = FieldLayout.wrap(
  0x0000000100000000000000000000000000000000000000000000000000000000
);

library Callbacks {
  /** Get the table values' field layout */
  function getFieldLayout() internal pure returns (FieldLayout) {
    return _fieldLayout;
  }

  /** Get the table's key schema */
  function getKeySchema() internal pure returns (Schema) {
    SchemaType[] memory _schema = new SchemaType[](1);
    _schema[0] = SchemaType.BYTES32;

    return SchemaLib.encode(_schema);
  }

  /** Get the table's value schema */
  function getValueSchema() internal pure returns (Schema) {
    SchemaType[] memory _schema = new SchemaType[](1);
    _schema[0] = SchemaType.BYTES24_ARRAY;

    return SchemaLib.encode(_schema);
  }

  /** Get the table's key names */
  function getKeyNames() internal pure returns (string[] memory keyNames) {
    keyNames = new string[](1);
    keyNames[0] = "key";
  }

  /** Get the table's field names */
  function getFieldNames() internal pure returns (string[] memory fieldNames) {
    fieldNames = new string[](1);
    fieldNames[0] = "value";
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

  /** Register the table with its config */
  function _register() internal {
    StoreCore.registerTable(
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

  /** Get value */
  function get(bytes32 key) internal view returns (bytes24[] memory value) {
    bytes32 _keyHash = keccak256(abi.encodePacked(key));

    uint256 storagePointer = StoreCoreInternal._getDynamicDataLocation(_tableId, _keyHash, 0);
    uint256 lengthStoragePointer = StoreCoreInternal._getDynamicDataLengthLocation(_tableId, _keyHash);
    bytes memory _blob = StoreSwitch.loadDynamicField(storagePointer, lengthStoragePointer, 0);
    return (SliceLib.getSubslice(_blob, 0, _blob.length).decodeArray_bytes24());
  }

  /** Get value */
  function _get(bytes32 key) internal view returns (bytes24[] memory value) {
    bytes32 _keyHash = keccak256(abi.encodePacked(key));

    uint256 storagePointer = StoreCoreInternal._getDynamicDataLocation(_tableId, _keyHash, 0);
    uint256 lengthStoragePointer = StoreCoreInternal._getDynamicDataLengthLocation(_tableId, _keyHash);
    bytes memory _blob = StoreCore.loadDynamicField(storagePointer, lengthStoragePointer, 0);
    return (SliceLib.getSubslice(_blob, 0, _blob.length).decodeArray_bytes24());
  }

  /** Get value (using the specified store) */
  function get(IStore _store, bytes32 key) internal view returns (bytes24[] memory value) {
    bytes32 _keyHash = keccak256(abi.encodePacked(key));

    uint256 storagePointer = StoreCoreInternal._getDynamicDataLocation(_tableId, _keyHash, 0);
    uint256 lengthStoragePointer = StoreCoreInternal._getDynamicDataLengthLocation(_tableId, _keyHash);
    bytes memory _blob = _store.loadDynamicField(storagePointer, lengthStoragePointer, 0);
    return (SliceLib.getSubslice(_blob, 0, _blob.length).decodeArray_bytes24());
  }

  /** Set value */
  function set(bytes32 key, bytes24[] memory value) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = key;

    StoreSwitch.setField(_tableId, _keyTuple, 0, EncodeArray.encode((value)), getFieldLayout());
  }

  /** Set value */
  function _set(bytes32 key, bytes24[] memory value) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = key;

    StoreCore.setField(_tableId, _keyTuple, 0, EncodeArray.encode((value)), getFieldLayout());
  }

  /** Set value (using the specified store) */
  function set(IStore _store, bytes32 key, bytes24[] memory value) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = key;

    _store.setField(_tableId, _keyTuple, 0, EncodeArray.encode((value)), getFieldLayout());
  }

  /** Get the length of value */
  function length(bytes32 key) internal view returns (uint256) {
    bytes32 _keyHash = keccak256(abi.encodePacked(key));

    uint256 lengthStoragePointer = StoreCoreInternal._getDynamicDataLengthLocation(_tableId, _keyHash);
    uint256 _byteLength = StoreSwitch.loadFieldLength(lengthStoragePointer, 0);
    unchecked {
      return _byteLength / 24;
    }
  }

  /** Get the length of value */
  function _length(bytes32 key) internal view returns (uint256) {
    bytes32 _keyHash = keccak256(abi.encodePacked(key));

    uint256 lengthStoragePointer = StoreCoreInternal._getDynamicDataLengthLocation(_tableId, _keyHash);
    uint256 _byteLength = StoreCore.loadFieldLength(lengthStoragePointer, 0);
    unchecked {
      return _byteLength / 24;
    }
  }

  /** Get the length of value (using the specified store) */
  function length(IStore _store, bytes32 key) internal view returns (uint256) {
    bytes32 _keyHash = keccak256(abi.encodePacked(key));

    uint256 lengthStoragePointer = StoreCoreInternal._getDynamicDataLengthLocation(_tableId, _keyHash);
    uint256 _byteLength = _store.loadFieldLength(lengthStoragePointer, 0);
    unchecked {
      return _byteLength / 24;
    }
  }

  /**
   * Get an item of value
   * (unchecked, returns invalid data if index overflows)
   */
  function getItem(bytes32 key, uint256 _index) internal view returns (bytes24) {
    bytes32 _keyHash = keccak256(abi.encodePacked(key));

    uint256 storagePointer = StoreCoreInternal._getDynamicDataLocation(_tableId, _keyHash, 0);
    unchecked {
      bytes memory _blob = StoreSwitch.loadFieldSlice(storagePointer, _index * 24, (_index + 1) * 24);
      return (Bytes.slice24(_blob, 0));
    }
  }

  /**
   * Get an item of value
   * (unchecked, returns invalid data if index overflows)
   */
  function _getItem(bytes32 key, uint256 _index) internal view returns (bytes24) {
    bytes32 _keyHash = keccak256(abi.encodePacked(key));

    uint256 storagePointer = StoreCoreInternal._getDynamicDataLocation(_tableId, _keyHash, 0);
    unchecked {
      bytes memory _blob = StoreCore.loadFieldSlice(storagePointer, _index * 24, (_index + 1) * 24);
      return (Bytes.slice24(_blob, 0));
    }
  }

  /**
   * Get an item of value (using the specified store)
   * (unchecked, returns invalid data if index overflows)
   */
  function getItem(IStore _store, bytes32 key, uint256 _index) internal view returns (bytes24) {
    bytes32 _keyHash = keccak256(abi.encodePacked(key));

    uint256 storagePointer = StoreCoreInternal._getDynamicDataLocation(_tableId, _keyHash, 0);
    unchecked {
      bytes memory _blob = _store.loadFieldSlice(storagePointer, _index * 24, (_index + 1) * 24);
      return (Bytes.slice24(_blob, 0));
    }
  }

  /** Push an element to value */
  function push(bytes32 key, bytes24 _element) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = key;

    StoreSwitch.pushToField(_tableId, _keyTuple, 0, abi.encodePacked((_element)), getFieldLayout());
  }

  /** Push an element to value */
  function _push(bytes32 key, bytes24 _element) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = key;

    StoreCore.pushToField(_tableId, _keyTuple, 0, abi.encodePacked((_element)), getFieldLayout());
  }

  /** Push an element to value (using the specified store) */
  function push(IStore _store, bytes32 key, bytes24 _element) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = key;

    _store.pushToField(_tableId, _keyTuple, 0, abi.encodePacked((_element)), getFieldLayout());
  }

  /** Pop an element from value */
  function pop(bytes32 key) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = key;

    StoreSwitch.popFromField(_tableId, _keyTuple, 0, 24, getFieldLayout());
  }

  /** Pop an element from value */
  function _pop(bytes32 key) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = key;

    StoreCore.popFromField(_tableId, _keyTuple, 0, 24, getFieldLayout());
  }

  /** Pop an element from value (using the specified store) */
  function pop(IStore _store, bytes32 key) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = key;

    _store.popFromField(_tableId, _keyTuple, 0, 24, getFieldLayout());
  }

  /**
   * Update an element of value at `_index`
   * (checked only to prevent modifying other tables; can corrupt own data if index overflows)
   */
  function update(bytes32 key, uint256 _index, bytes24 _element) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = key;

    unchecked {
      StoreSwitch.updateInField(_tableId, _keyTuple, 0, _index * 24, abi.encodePacked((_element)), getFieldLayout());
    }
  }

  /**
   * Update an element of value at `_index`
   * (checked only to prevent modifying other tables; can corrupt own data if index overflows)
   */
  function _update(bytes32 key, uint256 _index, bytes24 _element) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = key;

    unchecked {
      StoreCore.updateInField(_tableId, _keyTuple, 0, _index * 24, abi.encodePacked((_element)), getFieldLayout());
    }
  }

  /**
   * Update an element of value (using the specified store) at `_index`
   * (checked only to prevent modifying other tables; can corrupt own data if index overflows)
   */
  function update(IStore _store, bytes32 key, uint256 _index, bytes24 _element) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = key;

    unchecked {
      _store.updateInField(_tableId, _keyTuple, 0, _index * 24, abi.encodePacked((_element)), getFieldLayout());
    }
  }

  /** Tightly pack full data using this table's field layout */
  function encode(bytes24[] memory value) internal pure returns (bytes memory) {
    PackedCounter _encodedLengths;
    // Lengths are effectively checked during copy by 2**40 bytes exceeding gas limits
    unchecked {
      _encodedLengths = PackedCounterLib.pack(value.length * 24);
    }

    return abi.encodePacked(_encodedLengths.unwrap(), EncodeArray.encode((value)));
  }

  /** Encode keys as a bytes32 array using this table's field layout */
  function encodeKeyTuple(bytes32 key) internal pure returns (bytes32[] memory) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = key;

    return _keyTuple;
  }

  /* Delete all data for given keys */
  function deleteRecord(bytes32 key) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = key;

    StoreSwitch.deleteRecord(_tableId, _keyTuple, getFieldLayout());
  }

  /* Delete all data for given keys */
  function _deleteRecord(bytes32 key) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = key;

    StoreCore.deleteRecord(_tableId, _keyTuple, getFieldLayout());
  }

  /* Delete all data for given keys (using the specified store) */
  function deleteRecord(IStore _store, bytes32 key) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = key;

    _store.deleteRecord(_tableId, _keyTuple, getFieldLayout());
  }
}
