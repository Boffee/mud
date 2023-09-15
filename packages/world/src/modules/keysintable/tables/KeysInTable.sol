// SPDX-License-Identifier: MIT
pragma solidity >=0.8.0;

/* Autogenerated file. Do not edit manually. */

// Import schema type
import { SchemaType } from "@latticexyz/schema-type/src/solidity/SchemaType.sol";

// Import store internals
import { IStore } from "@latticexyz/store/src/IStore.sol";
import { StoreSwitch } from "@latticexyz/store/src/StoreSwitch.sol";
import { StoreCore } from "@latticexyz/store/src/StoreCore.sol";
import { Bytes } from "@latticexyz/store/src/Bytes.sol";
import { Memory } from "@latticexyz/store/src/Memory.sol";
import { SliceLib } from "@latticexyz/store/src/Slice.sol";
import { EncodeArray } from "@latticexyz/store/src/tightcoder/EncodeArray.sol";
import { FieldLayout, FieldLayoutLib } from "@latticexyz/store/src/FieldLayout.sol";
import { Schema, SchemaLib } from "@latticexyz/store/src/Schema.sol";
import { PackedCounter, PackedCounterLib } from "@latticexyz/store/src/PackedCounter.sol";

bytes32 constant _tableId = bytes32(abi.encodePacked(bytes16(""), bytes16("KeysInTable")));
bytes32 constant KeysInTableTableId = _tableId;

FieldLayout constant _fieldLayout = FieldLayout.wrap(
  0x0000000500000000000000000000000000000000000000000000000000000000
);

struct KeysInTableData {
  bytes32[] keys0;
  bytes32[] keys1;
  bytes32[] keys2;
  bytes32[] keys3;
  bytes32[] keys4;
}

library KeysInTable {
  /** Get the table values' field layout */
  function getFieldLayout() internal pure returns (FieldLayout) {
    return _fieldLayout;
  }

  /** Get the table's key schema */
  function getKeySchema() internal pure returns (Schema) {
    SchemaType[] memory _keySchema = new SchemaType[](1);
    _keySchema[0] = SchemaType.BYTES32;

    return SchemaLib.encode(_keySchema);
  }

  /** Get the table's value schema */
  function getValueSchema() internal pure returns (Schema) {
    SchemaType[] memory _valueSchema = new SchemaType[](5);
    _valueSchema[0] = SchemaType.BYTES32_ARRAY;
    _valueSchema[1] = SchemaType.BYTES32_ARRAY;
    _valueSchema[2] = SchemaType.BYTES32_ARRAY;
    _valueSchema[3] = SchemaType.BYTES32_ARRAY;
    _valueSchema[4] = SchemaType.BYTES32_ARRAY;

    return SchemaLib.encode(_valueSchema);
  }

  /** Get the table's key names */
  function getKeyNames() internal pure returns (string[] memory keyNames) {
    keyNames = new string[](1);
    keyNames[0] = "sourceTable";
  }

  /** Get the table's field names */
  function getFieldNames() internal pure returns (string[] memory fieldNames) {
    fieldNames = new string[](5);
    fieldNames[0] = "keys0";
    fieldNames[1] = "keys1";
    fieldNames[2] = "keys2";
    fieldNames[3] = "keys3";
    fieldNames[4] = "keys4";
  }

  /** Register the table with its config */
  function register() internal {
    StoreSwitch.registerTable(_tableId, _fieldLayout, getKeySchema(), getValueSchema(), getKeyNames(), getFieldNames());
  }

  /** Register the table with its config (using the specified store) */
  function register(IStore _store) internal {
    _store.registerTable(_tableId, _fieldLayout, getKeySchema(), getValueSchema(), getKeyNames(), getFieldNames());
  }

  /** Get keys0 */
  function getKeys0(bytes32 sourceTable) internal view returns (bytes32[] memory keys0) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = sourceTable;

    bytes memory _blob = StoreSwitch.getField(_tableId, _keyTuple, 0, _fieldLayout);
    return (SliceLib.getSubslice(_blob, 0, _blob.length).decodeArray_bytes32());
  }

  /** Get keys0 (using the specified store) */
  function getKeys0(IStore _store, bytes32 sourceTable) internal view returns (bytes32[] memory keys0) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = sourceTable;

    bytes memory _blob = _store.getField(_tableId, _keyTuple, 0, _fieldLayout);
    return (SliceLib.getSubslice(_blob, 0, _blob.length).decodeArray_bytes32());
  }

  /** Set keys0 */
  function setKeys0(bytes32 sourceTable, bytes32[] memory keys0) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = sourceTable;

    StoreSwitch.setField(_tableId, _keyTuple, 0, EncodeArray.encode((keys0)), _fieldLayout);
  }

  /** Set keys0 (using the specified store) */
  function setKeys0(IStore _store, bytes32 sourceTable, bytes32[] memory keys0) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = sourceTable;

    _store.setField(_tableId, _keyTuple, 0, EncodeArray.encode((keys0)), _fieldLayout);
  }

  /** Get the length of keys0 */
  function lengthKeys0(bytes32 sourceTable) internal view returns (uint256) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = sourceTable;

    uint256 _byteLength = StoreSwitch.getFieldLength(_tableId, _keyTuple, 0, _fieldLayout);
    unchecked {
      return _byteLength / 32;
    }
  }

  /** Get the length of keys0 (using the specified store) */
  function lengthKeys0(IStore _store, bytes32 sourceTable) internal view returns (uint256) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = sourceTable;

    uint256 _byteLength = _store.getFieldLength(_tableId, _keyTuple, 0, _fieldLayout);
    unchecked {
      return _byteLength / 32;
    }
  }

  /**
   * Get an item of keys0
   * (unchecked, returns invalid data if index overflows)
   */
  function getItemKeys0(bytes32 sourceTable, uint256 _index) internal view returns (bytes32) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = sourceTable;

    unchecked {
      bytes memory _blob = StoreSwitch.getFieldSlice(
        _tableId,
        _keyTuple,
        0,
        _fieldLayout,
        _index * 32,
        (_index + 1) * 32
      );
      return (Bytes.slice32(_blob, 0));
    }
  }

  /**
   * Get an item of keys0 (using the specified store)
   * (unchecked, returns invalid data if index overflows)
   */
  function getItemKeys0(IStore _store, bytes32 sourceTable, uint256 _index) internal view returns (bytes32) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = sourceTable;

    unchecked {
      bytes memory _blob = _store.getFieldSlice(_tableId, _keyTuple, 0, _fieldLayout, _index * 32, (_index + 1) * 32);
      return (Bytes.slice32(_blob, 0));
    }
  }

  /** Push an element to keys0 */
  function pushKeys0(bytes32 sourceTable, bytes32 _element) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = sourceTable;

    StoreSwitch.pushToField(_tableId, _keyTuple, 0, abi.encodePacked((_element)), _fieldLayout);
  }

  /** Push an element to keys0 (using the specified store) */
  function pushKeys0(IStore _store, bytes32 sourceTable, bytes32 _element) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = sourceTable;

    _store.pushToField(_tableId, _keyTuple, 0, abi.encodePacked((_element)), _fieldLayout);
  }

  /** Pop an element from keys0 */
  function popKeys0(bytes32 sourceTable) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = sourceTable;

    StoreSwitch.popFromField(_tableId, _keyTuple, 0, 32, _fieldLayout);
  }

  /** Pop an element from keys0 (using the specified store) */
  function popKeys0(IStore _store, bytes32 sourceTable) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = sourceTable;

    _store.popFromField(_tableId, _keyTuple, 0, 32, _fieldLayout);
  }

  /**
   * Update an element of keys0 at `_index`
   * (checked only to prevent modifying other tables; can corrupt own data if index overflows)
   */
  function updateKeys0(bytes32 sourceTable, uint256 _index, bytes32 _element) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = sourceTable;

    unchecked {
      StoreSwitch.updateInField(_tableId, _keyTuple, 0, _index * 32, abi.encodePacked((_element)), _fieldLayout);
    }
  }

  /**
   * Update an element of keys0 (using the specified store) at `_index`
   * (checked only to prevent modifying other tables; can corrupt own data if index overflows)
   */
  function updateKeys0(IStore _store, bytes32 sourceTable, uint256 _index, bytes32 _element) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = sourceTable;

    unchecked {
      _store.updateInField(_tableId, _keyTuple, 0, _index * 32, abi.encodePacked((_element)), _fieldLayout);
    }
  }

  /** Get keys1 */
  function getKeys1(bytes32 sourceTable) internal view returns (bytes32[] memory keys1) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = sourceTable;

    bytes memory _blob = StoreSwitch.getField(_tableId, _keyTuple, 1, _fieldLayout);
    return (SliceLib.getSubslice(_blob, 0, _blob.length).decodeArray_bytes32());
  }

  /** Get keys1 (using the specified store) */
  function getKeys1(IStore _store, bytes32 sourceTable) internal view returns (bytes32[] memory keys1) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = sourceTable;

    bytes memory _blob = _store.getField(_tableId, _keyTuple, 1, _fieldLayout);
    return (SliceLib.getSubslice(_blob, 0, _blob.length).decodeArray_bytes32());
  }

  /** Set keys1 */
  function setKeys1(bytes32 sourceTable, bytes32[] memory keys1) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = sourceTable;

    StoreSwitch.setField(_tableId, _keyTuple, 1, EncodeArray.encode((keys1)), _fieldLayout);
  }

  /** Set keys1 (using the specified store) */
  function setKeys1(IStore _store, bytes32 sourceTable, bytes32[] memory keys1) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = sourceTable;

    _store.setField(_tableId, _keyTuple, 1, EncodeArray.encode((keys1)), _fieldLayout);
  }

  /** Get the length of keys1 */
  function lengthKeys1(bytes32 sourceTable) internal view returns (uint256) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = sourceTable;

    uint256 _byteLength = StoreSwitch.getFieldLength(_tableId, _keyTuple, 1, _fieldLayout);
    unchecked {
      return _byteLength / 32;
    }
  }

  /** Get the length of keys1 (using the specified store) */
  function lengthKeys1(IStore _store, bytes32 sourceTable) internal view returns (uint256) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = sourceTable;

    uint256 _byteLength = _store.getFieldLength(_tableId, _keyTuple, 1, _fieldLayout);
    unchecked {
      return _byteLength / 32;
    }
  }

  /**
   * Get an item of keys1
   * (unchecked, returns invalid data if index overflows)
   */
  function getItemKeys1(bytes32 sourceTable, uint256 _index) internal view returns (bytes32) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = sourceTable;

    unchecked {
      bytes memory _blob = StoreSwitch.getFieldSlice(
        _tableId,
        _keyTuple,
        1,
        _fieldLayout,
        _index * 32,
        (_index + 1) * 32
      );
      return (Bytes.slice32(_blob, 0));
    }
  }

  /**
   * Get an item of keys1 (using the specified store)
   * (unchecked, returns invalid data if index overflows)
   */
  function getItemKeys1(IStore _store, bytes32 sourceTable, uint256 _index) internal view returns (bytes32) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = sourceTable;

    unchecked {
      bytes memory _blob = _store.getFieldSlice(_tableId, _keyTuple, 1, _fieldLayout, _index * 32, (_index + 1) * 32);
      return (Bytes.slice32(_blob, 0));
    }
  }

  /** Push an element to keys1 */
  function pushKeys1(bytes32 sourceTable, bytes32 _element) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = sourceTable;

    StoreSwitch.pushToField(_tableId, _keyTuple, 1, abi.encodePacked((_element)), _fieldLayout);
  }

  /** Push an element to keys1 (using the specified store) */
  function pushKeys1(IStore _store, bytes32 sourceTable, bytes32 _element) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = sourceTable;

    _store.pushToField(_tableId, _keyTuple, 1, abi.encodePacked((_element)), _fieldLayout);
  }

  /** Pop an element from keys1 */
  function popKeys1(bytes32 sourceTable) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = sourceTable;

    StoreSwitch.popFromField(_tableId, _keyTuple, 1, 32, _fieldLayout);
  }

  /** Pop an element from keys1 (using the specified store) */
  function popKeys1(IStore _store, bytes32 sourceTable) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = sourceTable;

    _store.popFromField(_tableId, _keyTuple, 1, 32, _fieldLayout);
  }

  /**
   * Update an element of keys1 at `_index`
   * (checked only to prevent modifying other tables; can corrupt own data if index overflows)
   */
  function updateKeys1(bytes32 sourceTable, uint256 _index, bytes32 _element) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = sourceTable;

    unchecked {
      StoreSwitch.updateInField(_tableId, _keyTuple, 1, _index * 32, abi.encodePacked((_element)), _fieldLayout);
    }
  }

  /**
   * Update an element of keys1 (using the specified store) at `_index`
   * (checked only to prevent modifying other tables; can corrupt own data if index overflows)
   */
  function updateKeys1(IStore _store, bytes32 sourceTable, uint256 _index, bytes32 _element) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = sourceTable;

    unchecked {
      _store.updateInField(_tableId, _keyTuple, 1, _index * 32, abi.encodePacked((_element)), _fieldLayout);
    }
  }

  /** Get keys2 */
  function getKeys2(bytes32 sourceTable) internal view returns (bytes32[] memory keys2) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = sourceTable;

    bytes memory _blob = StoreSwitch.getField(_tableId, _keyTuple, 2, _fieldLayout);
    return (SliceLib.getSubslice(_blob, 0, _blob.length).decodeArray_bytes32());
  }

  /** Get keys2 (using the specified store) */
  function getKeys2(IStore _store, bytes32 sourceTable) internal view returns (bytes32[] memory keys2) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = sourceTable;

    bytes memory _blob = _store.getField(_tableId, _keyTuple, 2, _fieldLayout);
    return (SliceLib.getSubslice(_blob, 0, _blob.length).decodeArray_bytes32());
  }

  /** Set keys2 */
  function setKeys2(bytes32 sourceTable, bytes32[] memory keys2) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = sourceTable;

    StoreSwitch.setField(_tableId, _keyTuple, 2, EncodeArray.encode((keys2)), _fieldLayout);
  }

  /** Set keys2 (using the specified store) */
  function setKeys2(IStore _store, bytes32 sourceTable, bytes32[] memory keys2) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = sourceTable;

    _store.setField(_tableId, _keyTuple, 2, EncodeArray.encode((keys2)), _fieldLayout);
  }

  /** Get the length of keys2 */
  function lengthKeys2(bytes32 sourceTable) internal view returns (uint256) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = sourceTable;

    uint256 _byteLength = StoreSwitch.getFieldLength(_tableId, _keyTuple, 2, _fieldLayout);
    unchecked {
      return _byteLength / 32;
    }
  }

  /** Get the length of keys2 (using the specified store) */
  function lengthKeys2(IStore _store, bytes32 sourceTable) internal view returns (uint256) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = sourceTable;

    uint256 _byteLength = _store.getFieldLength(_tableId, _keyTuple, 2, _fieldLayout);
    unchecked {
      return _byteLength / 32;
    }
  }

  /**
   * Get an item of keys2
   * (unchecked, returns invalid data if index overflows)
   */
  function getItemKeys2(bytes32 sourceTable, uint256 _index) internal view returns (bytes32) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = sourceTable;

    unchecked {
      bytes memory _blob = StoreSwitch.getFieldSlice(
        _tableId,
        _keyTuple,
        2,
        _fieldLayout,
        _index * 32,
        (_index + 1) * 32
      );
      return (Bytes.slice32(_blob, 0));
    }
  }

  /**
   * Get an item of keys2 (using the specified store)
   * (unchecked, returns invalid data if index overflows)
   */
  function getItemKeys2(IStore _store, bytes32 sourceTable, uint256 _index) internal view returns (bytes32) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = sourceTable;

    unchecked {
      bytes memory _blob = _store.getFieldSlice(_tableId, _keyTuple, 2, _fieldLayout, _index * 32, (_index + 1) * 32);
      return (Bytes.slice32(_blob, 0));
    }
  }

  /** Push an element to keys2 */
  function pushKeys2(bytes32 sourceTable, bytes32 _element) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = sourceTable;

    StoreSwitch.pushToField(_tableId, _keyTuple, 2, abi.encodePacked((_element)), _fieldLayout);
  }

  /** Push an element to keys2 (using the specified store) */
  function pushKeys2(IStore _store, bytes32 sourceTable, bytes32 _element) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = sourceTable;

    _store.pushToField(_tableId, _keyTuple, 2, abi.encodePacked((_element)), _fieldLayout);
  }

  /** Pop an element from keys2 */
  function popKeys2(bytes32 sourceTable) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = sourceTable;

    StoreSwitch.popFromField(_tableId, _keyTuple, 2, 32, _fieldLayout);
  }

  /** Pop an element from keys2 (using the specified store) */
  function popKeys2(IStore _store, bytes32 sourceTable) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = sourceTable;

    _store.popFromField(_tableId, _keyTuple, 2, 32, _fieldLayout);
  }

  /**
   * Update an element of keys2 at `_index`
   * (checked only to prevent modifying other tables; can corrupt own data if index overflows)
   */
  function updateKeys2(bytes32 sourceTable, uint256 _index, bytes32 _element) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = sourceTable;

    unchecked {
      StoreSwitch.updateInField(_tableId, _keyTuple, 2, _index * 32, abi.encodePacked((_element)), _fieldLayout);
    }
  }

  /**
   * Update an element of keys2 (using the specified store) at `_index`
   * (checked only to prevent modifying other tables; can corrupt own data if index overflows)
   */
  function updateKeys2(IStore _store, bytes32 sourceTable, uint256 _index, bytes32 _element) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = sourceTable;

    unchecked {
      _store.updateInField(_tableId, _keyTuple, 2, _index * 32, abi.encodePacked((_element)), _fieldLayout);
    }
  }

  /** Get keys3 */
  function getKeys3(bytes32 sourceTable) internal view returns (bytes32[] memory keys3) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = sourceTable;

    bytes memory _blob = StoreSwitch.getField(_tableId, _keyTuple, 3, _fieldLayout);
    return (SliceLib.getSubslice(_blob, 0, _blob.length).decodeArray_bytes32());
  }

  /** Get keys3 (using the specified store) */
  function getKeys3(IStore _store, bytes32 sourceTable) internal view returns (bytes32[] memory keys3) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = sourceTable;

    bytes memory _blob = _store.getField(_tableId, _keyTuple, 3, _fieldLayout);
    return (SliceLib.getSubslice(_blob, 0, _blob.length).decodeArray_bytes32());
  }

  /** Set keys3 */
  function setKeys3(bytes32 sourceTable, bytes32[] memory keys3) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = sourceTable;

    StoreSwitch.setField(_tableId, _keyTuple, 3, EncodeArray.encode((keys3)), _fieldLayout);
  }

  /** Set keys3 (using the specified store) */
  function setKeys3(IStore _store, bytes32 sourceTable, bytes32[] memory keys3) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = sourceTable;

    _store.setField(_tableId, _keyTuple, 3, EncodeArray.encode((keys3)), _fieldLayout);
  }

  /** Get the length of keys3 */
  function lengthKeys3(bytes32 sourceTable) internal view returns (uint256) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = sourceTable;

    uint256 _byteLength = StoreSwitch.getFieldLength(_tableId, _keyTuple, 3, _fieldLayout);
    unchecked {
      return _byteLength / 32;
    }
  }

  /** Get the length of keys3 (using the specified store) */
  function lengthKeys3(IStore _store, bytes32 sourceTable) internal view returns (uint256) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = sourceTable;

    uint256 _byteLength = _store.getFieldLength(_tableId, _keyTuple, 3, _fieldLayout);
    unchecked {
      return _byteLength / 32;
    }
  }

  /**
   * Get an item of keys3
   * (unchecked, returns invalid data if index overflows)
   */
  function getItemKeys3(bytes32 sourceTable, uint256 _index) internal view returns (bytes32) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = sourceTable;

    unchecked {
      bytes memory _blob = StoreSwitch.getFieldSlice(
        _tableId,
        _keyTuple,
        3,
        _fieldLayout,
        _index * 32,
        (_index + 1) * 32
      );
      return (Bytes.slice32(_blob, 0));
    }
  }

  /**
   * Get an item of keys3 (using the specified store)
   * (unchecked, returns invalid data if index overflows)
   */
  function getItemKeys3(IStore _store, bytes32 sourceTable, uint256 _index) internal view returns (bytes32) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = sourceTable;

    unchecked {
      bytes memory _blob = _store.getFieldSlice(_tableId, _keyTuple, 3, _fieldLayout, _index * 32, (_index + 1) * 32);
      return (Bytes.slice32(_blob, 0));
    }
  }

  /** Push an element to keys3 */
  function pushKeys3(bytes32 sourceTable, bytes32 _element) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = sourceTable;

    StoreSwitch.pushToField(_tableId, _keyTuple, 3, abi.encodePacked((_element)), _fieldLayout);
  }

  /** Push an element to keys3 (using the specified store) */
  function pushKeys3(IStore _store, bytes32 sourceTable, bytes32 _element) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = sourceTable;

    _store.pushToField(_tableId, _keyTuple, 3, abi.encodePacked((_element)), _fieldLayout);
  }

  /** Pop an element from keys3 */
  function popKeys3(bytes32 sourceTable) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = sourceTable;

    StoreSwitch.popFromField(_tableId, _keyTuple, 3, 32, _fieldLayout);
  }

  /** Pop an element from keys3 (using the specified store) */
  function popKeys3(IStore _store, bytes32 sourceTable) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = sourceTable;

    _store.popFromField(_tableId, _keyTuple, 3, 32, _fieldLayout);
  }

  /**
   * Update an element of keys3 at `_index`
   * (checked only to prevent modifying other tables; can corrupt own data if index overflows)
   */
  function updateKeys3(bytes32 sourceTable, uint256 _index, bytes32 _element) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = sourceTable;

    unchecked {
      StoreSwitch.updateInField(_tableId, _keyTuple, 3, _index * 32, abi.encodePacked((_element)), _fieldLayout);
    }
  }

  /**
   * Update an element of keys3 (using the specified store) at `_index`
   * (checked only to prevent modifying other tables; can corrupt own data if index overflows)
   */
  function updateKeys3(IStore _store, bytes32 sourceTable, uint256 _index, bytes32 _element) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = sourceTable;

    unchecked {
      _store.updateInField(_tableId, _keyTuple, 3, _index * 32, abi.encodePacked((_element)), _fieldLayout);
    }
  }

  /** Get keys4 */
  function getKeys4(bytes32 sourceTable) internal view returns (bytes32[] memory keys4) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = sourceTable;

    bytes memory _blob = StoreSwitch.getField(_tableId, _keyTuple, 4, _fieldLayout);
    return (SliceLib.getSubslice(_blob, 0, _blob.length).decodeArray_bytes32());
  }

  /** Get keys4 (using the specified store) */
  function getKeys4(IStore _store, bytes32 sourceTable) internal view returns (bytes32[] memory keys4) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = sourceTable;

    bytes memory _blob = _store.getField(_tableId, _keyTuple, 4, _fieldLayout);
    return (SliceLib.getSubslice(_blob, 0, _blob.length).decodeArray_bytes32());
  }

  /** Set keys4 */
  function setKeys4(bytes32 sourceTable, bytes32[] memory keys4) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = sourceTable;

    StoreSwitch.setField(_tableId, _keyTuple, 4, EncodeArray.encode((keys4)), _fieldLayout);
  }

  /** Set keys4 (using the specified store) */
  function setKeys4(IStore _store, bytes32 sourceTable, bytes32[] memory keys4) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = sourceTable;

    _store.setField(_tableId, _keyTuple, 4, EncodeArray.encode((keys4)), _fieldLayout);
  }

  /** Get the length of keys4 */
  function lengthKeys4(bytes32 sourceTable) internal view returns (uint256) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = sourceTable;

    uint256 _byteLength = StoreSwitch.getFieldLength(_tableId, _keyTuple, 4, _fieldLayout);
    unchecked {
      return _byteLength / 32;
    }
  }

  /** Get the length of keys4 (using the specified store) */
  function lengthKeys4(IStore _store, bytes32 sourceTable) internal view returns (uint256) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = sourceTable;

    uint256 _byteLength = _store.getFieldLength(_tableId, _keyTuple, 4, _fieldLayout);
    unchecked {
      return _byteLength / 32;
    }
  }

  /**
   * Get an item of keys4
   * (unchecked, returns invalid data if index overflows)
   */
  function getItemKeys4(bytes32 sourceTable, uint256 _index) internal view returns (bytes32) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = sourceTable;

    unchecked {
      bytes memory _blob = StoreSwitch.getFieldSlice(
        _tableId,
        _keyTuple,
        4,
        _fieldLayout,
        _index * 32,
        (_index + 1) * 32
      );
      return (Bytes.slice32(_blob, 0));
    }
  }

  /**
   * Get an item of keys4 (using the specified store)
   * (unchecked, returns invalid data if index overflows)
   */
  function getItemKeys4(IStore _store, bytes32 sourceTable, uint256 _index) internal view returns (bytes32) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = sourceTable;

    unchecked {
      bytes memory _blob = _store.getFieldSlice(_tableId, _keyTuple, 4, _fieldLayout, _index * 32, (_index + 1) * 32);
      return (Bytes.slice32(_blob, 0));
    }
  }

  /** Push an element to keys4 */
  function pushKeys4(bytes32 sourceTable, bytes32 _element) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = sourceTable;

    StoreSwitch.pushToField(_tableId, _keyTuple, 4, abi.encodePacked((_element)), _fieldLayout);
  }

  /** Push an element to keys4 (using the specified store) */
  function pushKeys4(IStore _store, bytes32 sourceTable, bytes32 _element) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = sourceTable;

    _store.pushToField(_tableId, _keyTuple, 4, abi.encodePacked((_element)), _fieldLayout);
  }

  /** Pop an element from keys4 */
  function popKeys4(bytes32 sourceTable) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = sourceTable;

    StoreSwitch.popFromField(_tableId, _keyTuple, 4, 32, _fieldLayout);
  }

  /** Pop an element from keys4 (using the specified store) */
  function popKeys4(IStore _store, bytes32 sourceTable) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = sourceTable;

    _store.popFromField(_tableId, _keyTuple, 4, 32, _fieldLayout);
  }

  /**
   * Update an element of keys4 at `_index`
   * (checked only to prevent modifying other tables; can corrupt own data if index overflows)
   */
  function updateKeys4(bytes32 sourceTable, uint256 _index, bytes32 _element) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = sourceTable;

    unchecked {
      StoreSwitch.updateInField(_tableId, _keyTuple, 4, _index * 32, abi.encodePacked((_element)), _fieldLayout);
    }
  }

  /**
   * Update an element of keys4 (using the specified store) at `_index`
   * (checked only to prevent modifying other tables; can corrupt own data if index overflows)
   */
  function updateKeys4(IStore _store, bytes32 sourceTable, uint256 _index, bytes32 _element) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = sourceTable;

    unchecked {
      _store.updateInField(_tableId, _keyTuple, 4, _index * 32, abi.encodePacked((_element)), _fieldLayout);
    }
  }

  /** Get the full data */
  function get(bytes32 sourceTable) internal view returns (KeysInTableData memory _table) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = sourceTable;

    bytes memory _blob = StoreSwitch.getRecord(_tableId, _keyTuple, _fieldLayout);
    return decode(_blob);
  }

  /** Get the full data (using the specified store) */
  function get(IStore _store, bytes32 sourceTable) internal view returns (KeysInTableData memory _table) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = sourceTable;

    bytes memory _blob = _store.getRecord(_tableId, _keyTuple, _fieldLayout);
    return decode(_blob);
  }

  /** Set the full data using individual values */
  function set(
    bytes32 sourceTable,
    bytes32[] memory keys0,
    bytes32[] memory keys1,
    bytes32[] memory keys2,
    bytes32[] memory keys3,
    bytes32[] memory keys4
  ) internal {
    bytes memory _data = encode(keys0, keys1, keys2, keys3, keys4);

    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = sourceTable;

    StoreSwitch.setRecord(_tableId, _keyTuple, _data, _fieldLayout);
  }

  /** Set the full data using individual values (using the specified store) */
  function set(
    IStore _store,
    bytes32 sourceTable,
    bytes32[] memory keys0,
    bytes32[] memory keys1,
    bytes32[] memory keys2,
    bytes32[] memory keys3,
    bytes32[] memory keys4
  ) internal {
    bytes memory _data = encode(keys0, keys1, keys2, keys3, keys4);

    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = sourceTable;

    _store.setRecord(_tableId, _keyTuple, _data, _fieldLayout);
  }

  /** Set the full data using the data struct */
  function set(bytes32 sourceTable, KeysInTableData memory _table) internal {
    set(sourceTable, _table.keys0, _table.keys1, _table.keys2, _table.keys3, _table.keys4);
  }

  /** Set the full data using the data struct (using the specified store) */
  function set(IStore _store, bytes32 sourceTable, KeysInTableData memory _table) internal {
    set(_store, sourceTable, _table.keys0, _table.keys1, _table.keys2, _table.keys3, _table.keys4);
  }

  /**
   * Decode the tightly packed blob using this table's field layout.
   * Undefined behaviour for invalid blobs.
   */
  function decode(bytes memory _blob) internal pure returns (KeysInTableData memory _table) {
    // 0 is the total byte length of static data
    PackedCounter _encodedLengths = PackedCounter.wrap(Bytes.slice32(_blob, 0));

    // Store trims the blob if dynamic fields are all empty
    if (_blob.length > 0) {
      // skip static data length + dynamic lengths word
      uint256 _start = 32;
      uint256 _end;
      unchecked {
        _end = 32 + _encodedLengths.atIndex(0);
      }
      _table.keys0 = (SliceLib.getSubslice(_blob, _start, _end).decodeArray_bytes32());

      _start = _end;
      unchecked {
        _end += _encodedLengths.atIndex(1);
      }
      _table.keys1 = (SliceLib.getSubslice(_blob, _start, _end).decodeArray_bytes32());

      _start = _end;
      unchecked {
        _end += _encodedLengths.atIndex(2);
      }
      _table.keys2 = (SliceLib.getSubslice(_blob, _start, _end).decodeArray_bytes32());

      _start = _end;
      unchecked {
        _end += _encodedLengths.atIndex(3);
      }
      _table.keys3 = (SliceLib.getSubslice(_blob, _start, _end).decodeArray_bytes32());

      _start = _end;
      unchecked {
        _end += _encodedLengths.atIndex(4);
      }
      _table.keys4 = (SliceLib.getSubslice(_blob, _start, _end).decodeArray_bytes32());
    }
  }

  /** Tightly pack full data using this table's field layout */
  function encode(
    bytes32[] memory keys0,
    bytes32[] memory keys1,
    bytes32[] memory keys2,
    bytes32[] memory keys3,
    bytes32[] memory keys4
  ) internal pure returns (bytes memory) {
    PackedCounter _encodedLengths;
    // Lengths are effectively checked during copy by 2**40 bytes exceeding gas limits
    unchecked {
      _encodedLengths = PackedCounterLib.pack(
        keys0.length * 32,
        keys1.length * 32,
        keys2.length * 32,
        keys3.length * 32,
        keys4.length * 32
      );
    }

    return
      abi.encodePacked(
        _encodedLengths.unwrap(),
        EncodeArray.encode((keys0)),
        EncodeArray.encode((keys1)),
        EncodeArray.encode((keys2)),
        EncodeArray.encode((keys3)),
        EncodeArray.encode((keys4))
      );
  }

  /** Encode keys as a bytes32 array using this table's field layout */
  function encodeKeyTuple(bytes32 sourceTable) internal pure returns (bytes32[] memory) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = sourceTable;

    return _keyTuple;
  }

  /* Delete all data for given keys */
  function deleteRecord(bytes32 sourceTable) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = sourceTable;

    StoreSwitch.deleteRecord(_tableId, _keyTuple, _fieldLayout);
  }

  /* Delete all data for given keys (using the specified store) */
  function deleteRecord(IStore _store, bytes32 sourceTable) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = sourceTable;

    _store.deleteRecord(_tableId, _keyTuple, _fieldLayout);
  }
}
