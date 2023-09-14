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

bytes32 constant _tableId = bytes32(abi.encodePacked(bytes16(""), bytes16("NamespaceOwner")));
bytes32 constant NamespaceOwnerTableId = _tableId;

FieldLayout constant _fieldLayout = FieldLayout.wrap(
  0x0014010014000000000000000000000000000000000000000000000000000000
);

library NamespaceOwner {
  /** Get the table values' field layout */
  function getFieldLayout() internal pure returns (FieldLayout) {
    return _fieldLayout;
  }

  /** Get the table's key schema */
  function getKeySchema() internal pure returns (Schema) {
    SchemaType[] memory _schema = new SchemaType[](1);
    _schema[0] = SchemaType.BYTES16;

    return SchemaLib.encode(_schema);
  }

  /** Get the table's value schema */
  function getValueSchema() internal pure returns (Schema) {
    SchemaType[] memory _schema = new SchemaType[](1);
    _schema[0] = SchemaType.ADDRESS;

    return SchemaLib.encode(_schema);
  }

  /** Get the table's key names */
  function getKeyNames() internal pure returns (string[] memory keyNames) {
    keyNames = new string[](1);
    keyNames[0] = "namespace";
  }

  /** Get the table's field names */
  function getFieldNames() internal pure returns (string[] memory fieldNames) {
    fieldNames = new string[](1);
    fieldNames[0] = "owner";
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

  /** Get owner */
  function get(bytes16 namespace) internal view returns (address owner) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32(namespace);

    uint256 storagePointer = StoreCoreInternal._getStaticDataLocation(_tableId, _keyTuple);
    bytes32 _blob = StoreSwitch.loadStaticField(storagePointer, 20, 0);
    return (address(bytes20(_blob)));
  }

  /** Get owner (using the specified store) */
  function get(IStore _store, bytes16 namespace) internal view returns (address owner) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32(namespace);

    uint256 storagePointer = StoreCoreInternal._getStaticDataLocation(_tableId, _keyTuple);
    bytes32 _blob = _store.loadStaticField(storagePointer, 20, 0);
    return (address(bytes20(_blob)));
  }

  /** Set owner */
  function set(bytes16 namespace, address owner) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32(namespace);

    uint256 storagePointer = StoreCoreInternal._getStaticDataLocation(_tableId, _keyTuple);
    StoreSwitch.storeStaticField(
      storagePointer,
      20,
      0,
      abi.encodePacked((owner)),
      _tableId,
      _keyTuple,
      0,
      getFieldLayout()
    );
  }

  /** Set owner (using the specified store) */
  function set(IStore _store, bytes16 namespace, address owner) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32(namespace);

    uint256 storagePointer = StoreCoreInternal._getStaticDataLocation(_tableId, _keyTuple);
    _store.storeStaticField(storagePointer, 20, 0, abi.encodePacked((owner)), _tableId, _keyTuple, 0, getFieldLayout());
  }

  /** Tightly pack full data using this table's field layout */
  function encode(address owner) internal pure returns (bytes memory) {
    return abi.encodePacked(owner);
  }

  /** Encode keys as a bytes32 array using this table's field layout */
  function encodeKeyTuple(bytes16 namespace) internal pure returns (bytes32[] memory) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32(namespace);

    return _keyTuple;
  }

  /* Delete all data for given keys */
  function deleteRecord(bytes16 namespace) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32(namespace);

    StoreSwitch.deleteRecord(_tableId, _keyTuple, getFieldLayout());
  }

  /* Delete all data for given keys (using the specified store) */
  function deleteRecord(IStore _store, bytes16 namespace) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32(namespace);

    _store.deleteRecord(_tableId, _keyTuple, getFieldLayout());
  }
}
