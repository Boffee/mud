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

bytes32 constant _tableId = bytes32(abi.encodePacked(bytes16("mudstore"), bytes16("Vector2")));
bytes32 constant Vector2TableId = _tableId;

FieldLayout constant _fieldLayout = FieldLayout.wrap(
  0x0008020004040000000000000000000000000000000000000000000000000000
);

struct Vector2Data {
  uint32 x;
  uint32 y;
}

library Vector2 {
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
    SchemaType[] memory _schema = new SchemaType[](2);
    _schema[0] = SchemaType.UINT32;
    _schema[1] = SchemaType.UINT32;

    return SchemaLib.encode(_schema);
  }

  /** Get the table's key names */
  function getKeyNames() internal pure returns (string[] memory keyNames) {
    keyNames = new string[](1);
    keyNames[0] = "key";
  }

  /** Get the table's field names */
  function getFieldNames() internal pure returns (string[] memory fieldNames) {
    fieldNames = new string[](2);
    fieldNames[0] = "x";
    fieldNames[1] = "y";
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

  /** Get x */
  function getX(bytes32 key) internal view returns (uint32 x) {
    bytes32 _keyHash = keccak256(abi.encode(key));
    uint256 storagePointer = StoreCoreInternal._getStaticDataLocation(_tableId, _keyHash);
    bytes32 _blob = StoreSwitch.loadStaticField(storagePointer, 4, 0);
    return (uint32(bytes4(_blob)));
  }

  /** Get x (using the specified store) */
  function getX(IStore _store, bytes32 key) internal view returns (uint32 x) {
    bytes32 _keyHash = keccak256(abi.encode(key));
    uint256 storagePointer = StoreCoreInternal._getStaticDataLocation(_tableId, _keyHash);
    bytes32 _blob = _store.loadStaticField(storagePointer, 4, 0);
    return (uint32(bytes4(_blob)));
  }

  /** Set x */
  function setX(bytes32 key, uint32 x) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = key;

    uint256 storagePointer = StoreCoreInternal._getStaticDataLocation(_tableId, _keyTuple);
    StoreSwitch.storeStaticField(storagePointer, 4, 0, abi.encodePacked((x)), _tableId, _keyTuple, 0, getFieldLayout());
  }

  /** Set x (using the specified store) */
  function setX(IStore _store, bytes32 key, uint32 x) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = key;

    uint256 storagePointer = StoreCoreInternal._getStaticDataLocation(_tableId, _keyTuple);
    _store.storeStaticField(storagePointer, 4, 0, abi.encodePacked((x)), _tableId, _keyTuple, 0, getFieldLayout());
  }

  /** Get y */
  function getY(bytes32 key) internal view returns (uint32 y) {
    bytes32 _keyHash = keccak256(abi.encode(key));
    uint256 storagePointer = StoreCoreInternal._getStaticDataLocation(_tableId, _keyHash);
    bytes32 _blob = StoreSwitch.loadStaticField(storagePointer, 4, 4);
    return (uint32(bytes4(_blob)));
  }

  /** Get y (using the specified store) */
  function getY(IStore _store, bytes32 key) internal view returns (uint32 y) {
    bytes32 _keyHash = keccak256(abi.encode(key));
    uint256 storagePointer = StoreCoreInternal._getStaticDataLocation(_tableId, _keyHash);
    bytes32 _blob = _store.loadStaticField(storagePointer, 4, 4);
    return (uint32(bytes4(_blob)));
  }

  /** Set y */
  function setY(bytes32 key, uint32 y) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = key;

    uint256 storagePointer = StoreCoreInternal._getStaticDataLocation(_tableId, _keyTuple);
    StoreSwitch.storeStaticField(storagePointer, 4, 4, abi.encodePacked((y)), _tableId, _keyTuple, 1, getFieldLayout());
  }

  /** Set y (using the specified store) */
  function setY(IStore _store, bytes32 key, uint32 y) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = key;

    uint256 storagePointer = StoreCoreInternal._getStaticDataLocation(_tableId, _keyTuple);
    _store.storeStaticField(storagePointer, 4, 4, abi.encodePacked((y)), _tableId, _keyTuple, 1, getFieldLayout());
  }

  /** Get the full data */
  function get(bytes32 key) internal view returns (Vector2Data memory _table) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = key;

    bytes memory _blob = StoreSwitch.getRecord(_tableId, _keyTuple, getFieldLayout());
    return decode(_blob);
  }

  /** Get the full data (using the specified store) */
  function get(IStore _store, bytes32 key) internal view returns (Vector2Data memory _table) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = key;

    bytes memory _blob = _store.getRecord(_tableId, _keyTuple, getFieldLayout());
    return decode(_blob);
  }

  /** Set the full data using individual values */
  function set(bytes32 key, uint32 x, uint32 y) internal {
    bytes memory _data = encode(x, y);

    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = key;

    StoreSwitch.setRecord(_tableId, _keyTuple, _data, getFieldLayout());
  }

  /** Set the full data using individual values (using the specified store) */
  function set(IStore _store, bytes32 key, uint32 x, uint32 y) internal {
    bytes memory _data = encode(x, y);

    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = key;

    _store.setRecord(_tableId, _keyTuple, _data, getFieldLayout());
  }

  /** Set the full data using the data struct */
  function set(bytes32 key, Vector2Data memory _table) internal {
    set(key, _table.x, _table.y);
  }

  /** Set the full data using the data struct (using the specified store) */
  function set(IStore _store, bytes32 key, Vector2Data memory _table) internal {
    set(_store, key, _table.x, _table.y);
  }

  /** Decode the tightly packed blob using this table's field layout */
  function decode(bytes memory _blob) internal pure returns (Vector2Data memory _table) {
    _table.x = (uint32(Bytes.slice4(_blob, 0)));

    _table.y = (uint32(Bytes.slice4(_blob, 4)));
  }

  /** Tightly pack full data using this table's field layout */
  function encode(uint32 x, uint32 y) internal pure returns (bytes memory) {
    return abi.encodePacked(x, y);
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

  /* Delete all data for given keys (using the specified store) */
  function deleteRecord(IStore _store, bytes32 key) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = key;

    _store.deleteRecord(_tableId, _keyTuple, getFieldLayout());
  }
}
