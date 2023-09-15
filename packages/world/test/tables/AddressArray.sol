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

library AddressArray {
  /** Get the table values' field layout */
  function getFieldLayout() internal pure returns (FieldLayout) {
    uint256[] memory _fieldLayout = new uint256[](0);

    return FieldLayoutLib.encode(_fieldLayout, 1);
  }

  /** Get the table's key schema */
  function getKeySchema() internal pure returns (Schema) {
    SchemaType[] memory _keySchema = new SchemaType[](1);
    _keySchema[0] = SchemaType.BYTES32;

    return SchemaLib.encode(_keySchema);
  }

  /** Get the table's value schema */
  function getValueSchema() internal pure returns (Schema) {
    SchemaType[] memory _valueSchema = new SchemaType[](1);
    _valueSchema[0] = SchemaType.ADDRESS_ARRAY;

    return SchemaLib.encode(_valueSchema);
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
  function register(bytes32 _tableId) internal {
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
  function _register(bytes32 _tableId) internal {
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
  function register(IStore _store, bytes32 _tableId) internal {
    _store.registerTable(_tableId, getFieldLayout(), getKeySchema(), getValueSchema(), getKeyNames(), getFieldNames());
  }

  /** Get value */
  function get(bytes32 _tableId, bytes32 key) internal view returns (address[] memory value) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = key;

    bytes memory _blob = StoreSwitch.getField(_tableId, _keyTuple, 0, getFieldLayout());
    return (SliceLib.getSubslice(_blob, 0, _blob.length).decodeArray_address());
  }

  /** Get value */
  function _get(bytes32 _tableId, bytes32 key) internal view returns (address[] memory value) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = key;

    bytes memory _blob = StoreCore.getField(_tableId, _keyTuple, 0, getFieldLayout());
    return (SliceLib.getSubslice(_blob, 0, _blob.length).decodeArray_address());
  }

  /** Get value (using the specified store) */
  function get(IStore _store, bytes32 _tableId, bytes32 key) internal view returns (address[] memory value) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = key;

    bytes memory _blob = _store.getField(_tableId, _keyTuple, 0, getFieldLayout());
    return (SliceLib.getSubslice(_blob, 0, _blob.length).decodeArray_address());
  }

  /** Set value */
  function set(bytes32 _tableId, bytes32 key, address[] memory value) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = key;

    StoreSwitch.setField(_tableId, _keyTuple, 0, EncodeArray.encode((value)), getFieldLayout());
  }

  /** Set value */
  function _set(bytes32 _tableId, bytes32 key, address[] memory value) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = key;

    StoreCore.setField(_tableId, _keyTuple, 0, EncodeArray.encode((value)), getFieldLayout());
  }

  /** Set value (using the specified store) */
  function set(IStore _store, bytes32 _tableId, bytes32 key, address[] memory value) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = key;

    _store.setField(_tableId, _keyTuple, 0, EncodeArray.encode((value)), getFieldLayout());
  }

  /** Get the length of value */
  function length(bytes32 _tableId, bytes32 key) internal view returns (uint256) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = key;

    uint256 _byteLength = StoreSwitch.getFieldLength(_tableId, _keyTuple, 0, getFieldLayout());
    unchecked {
      return _byteLength / 20;
    }
  }

  /** Get the length of value */
  function _length(bytes32 _tableId, bytes32 key) internal view returns (uint256) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = key;

    uint256 _byteLength = StoreCore.getFieldLength(_tableId, _keyTuple, 0, getFieldLayout());
    unchecked {
      return _byteLength / 20;
    }
  }

  /** Get the length of value (using the specified store) */
  function length(IStore _store, bytes32 _tableId, bytes32 key) internal view returns (uint256) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = key;

    uint256 _byteLength = _store.getFieldLength(_tableId, _keyTuple, 0, getFieldLayout());
    unchecked {
      return _byteLength / 20;
    }
  }

  /**
   * Get an item of value
   * (unchecked, returns invalid data if index overflows)
   */
  function getItem(bytes32 _tableId, bytes32 key, uint256 _index) internal view returns (address) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = key;

    unchecked {
      bytes memory _blob = StoreSwitch.getFieldSlice(
        _tableId,
        _keyTuple,
        0,
        getFieldLayout(),
        _index * 20,
        (_index + 1) * 20
      );
      return (address(Bytes.slice20(_blob, 0)));
    }
  }

  /**
   * Get an item of value
   * (unchecked, returns invalid data if index overflows)
   */
  function _getItem(bytes32 _tableId, bytes32 key, uint256 _index) internal view returns (address) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = key;

    unchecked {
      bytes memory _blob = StoreCore.getFieldSlice(
        _tableId,
        _keyTuple,
        0,
        getFieldLayout(),
        _index * 20,
        (_index + 1) * 20
      );
      return (address(Bytes.slice20(_blob, 0)));
    }
  }

  /**
   * Get an item of value (using the specified store)
   * (unchecked, returns invalid data if index overflows)
   */
  function getItem(IStore _store, bytes32 _tableId, bytes32 key, uint256 _index) internal view returns (address) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = key;

    unchecked {
      bytes memory _blob = _store.getFieldSlice(
        _tableId,
        _keyTuple,
        0,
        getFieldLayout(),
        _index * 20,
        (_index + 1) * 20
      );
      return (address(Bytes.slice20(_blob, 0)));
    }
  }

  /** Push an element to value */
  function push(bytes32 _tableId, bytes32 key, address _element) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = key;

    StoreSwitch.pushToField(_tableId, _keyTuple, 0, abi.encodePacked((_element)), getFieldLayout());
  }

  /** Push an element to value */
  function _push(bytes32 _tableId, bytes32 key, address _element) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = key;

    StoreCore.pushToField(_tableId, _keyTuple, 0, abi.encodePacked((_element)), getFieldLayout());
  }

  /** Push an element to value (using the specified store) */
  function push(IStore _store, bytes32 _tableId, bytes32 key, address _element) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = key;

    _store.pushToField(_tableId, _keyTuple, 0, abi.encodePacked((_element)), getFieldLayout());
  }

  /** Pop an element from value */
  function pop(bytes32 _tableId, bytes32 key) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = key;

    StoreSwitch.popFromField(_tableId, _keyTuple, 0, 20, getFieldLayout());
  }

  /** Pop an element from value */
  function _pop(bytes32 _tableId, bytes32 key) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = key;

    StoreCore.popFromField(_tableId, _keyTuple, 0, 20, getFieldLayout());
  }

  /** Pop an element from value (using the specified store) */
  function pop(IStore _store, bytes32 _tableId, bytes32 key) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = key;

    _store.popFromField(_tableId, _keyTuple, 0, 20, getFieldLayout());
  }

  /**
   * Update an element of value at `_index`
   * (checked only to prevent modifying other tables; can corrupt own data if index overflows)
   */
  function update(bytes32 _tableId, bytes32 key, uint256 _index, address _element) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = key;

    unchecked {
      StoreSwitch.updateInField(_tableId, _keyTuple, 0, _index * 20, abi.encodePacked((_element)), getFieldLayout());
    }
  }

  /**
   * Update an element of value at `_index`
   * (checked only to prevent modifying other tables; can corrupt own data if index overflows)
   */
  function _update(bytes32 _tableId, bytes32 key, uint256 _index, address _element) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = key;

    unchecked {
      StoreCore.updateInField(_tableId, _keyTuple, 0, _index * 20, abi.encodePacked((_element)), getFieldLayout());
    }
  }

  /**
   * Update an element of value (using the specified store) at `_index`
   * (checked only to prevent modifying other tables; can corrupt own data if index overflows)
   */
  function update(IStore _store, bytes32 _tableId, bytes32 key, uint256 _index, address _element) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = key;

    unchecked {
      _store.updateInField(_tableId, _keyTuple, 0, _index * 20, abi.encodePacked((_element)), getFieldLayout());
    }
  }

  /** Tightly pack full data using this table's field layout */
  function encode(address[] memory value) internal pure returns (bytes memory) {
    PackedCounter _encodedLengths;
    // Lengths are effectively checked during copy by 2**40 bytes exceeding gas limits
    unchecked {
      _encodedLengths = PackedCounterLib.pack(value.length * 20);
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
  function deleteRecord(bytes32 _tableId, bytes32 key) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = key;

    StoreSwitch.deleteRecord(_tableId, _keyTuple, getFieldLayout());
  }

  /* Delete all data for given keys */
  function _deleteRecord(bytes32 _tableId, bytes32 key) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = key;

    StoreCore.deleteRecord(_tableId, _keyTuple, getFieldLayout());
  }

  /* Delete all data for given keys (using the specified store) */
  function deleteRecord(IStore _store, bytes32 _tableId, bytes32 key) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = key;

    _store.deleteRecord(_tableId, _keyTuple, getFieldLayout());
  }
}
