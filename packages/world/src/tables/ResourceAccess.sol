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

bytes32 constant _tableId = bytes32(abi.encodePacked(bytes16(""), bytes16("ResourceAccess")));
bytes32 constant ResourceAccessTableId = _tableId;

FieldLayout constant _fieldLayout = FieldLayout.wrap(
  0x0001010001000000000000000000000000000000000000000000000000000000
);

library ResourceAccess {
  /** Get the table values' field layout */
  function getFieldLayout() internal pure returns (FieldLayout) {
    return _fieldLayout;
  }

  /** Get the table's key schema */
  function getKeySchema() internal pure returns (Schema) {
    SchemaType[] memory _schema = new SchemaType[](2);
    _schema[0] = SchemaType.BYTES32;
    _schema[1] = SchemaType.ADDRESS;

    return SchemaLib.encode(_schema);
  }

  /** Get the table's value schema */
  function getValueSchema() internal pure returns (Schema) {
    SchemaType[] memory _schema = new SchemaType[](1);
    _schema[0] = SchemaType.BOOL;

    return SchemaLib.encode(_schema);
  }

  /** Get the table's key names */
  function getKeyNames() internal pure returns (string[] memory keyNames) {
    keyNames = new string[](2);
    keyNames[0] = "resourceSelector";
    keyNames[1] = "caller";
  }

  /** Get the table's field names */
  function getFieldNames() internal pure returns (string[] memory fieldNames) {
    fieldNames = new string[](1);
    fieldNames[0] = "access";
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

  /** Get access */
  function get(bytes32 resourceSelector, address caller) internal view returns (bool access) {
    bytes32 _keyHash = keccak256(abi.encode(resourceSelector, caller));
    uint256 storagePointer = StoreCoreInternal._getStaticDataLocation(_tableId, _keyHash);
    bytes32 _blob = StoreSwitch.loadStaticField(storagePointer, 1, 0);
    return (_toBool(uint8(bytes1(_blob))));
  }

  /** Get access (using the specified store) */
  function get(IStore _store, bytes32 resourceSelector, address caller) internal view returns (bool access) {
    bytes32 _keyHash = keccak256(abi.encode(resourceSelector, caller));
    uint256 storagePointer = StoreCoreInternal._getStaticDataLocation(_tableId, _keyHash);
    bytes32 _blob = _store.loadStaticField(storagePointer, 1, 0);
    return (_toBool(uint8(bytes1(_blob))));
  }

  /** Set access */
  function set(bytes32 resourceSelector, address caller, bool access) internal {
    bytes32[] memory _keyTuple = new bytes32[](2);
    _keyTuple[0] = resourceSelector;
    _keyTuple[1] = bytes32(uint256(uint160(caller)));

    uint256 storagePointer = StoreCoreInternal._getStaticDataLocation(_tableId, _keyTuple);
    StoreSwitch.storeStaticField(
      storagePointer,
      1,
      0,
      abi.encodePacked((access)),
      _tableId,
      _keyTuple,
      0,
      getFieldLayout()
    );
  }

  /** Set access (using the specified store) */
  function set(IStore _store, bytes32 resourceSelector, address caller, bool access) internal {
    bytes32[] memory _keyTuple = new bytes32[](2);
    _keyTuple[0] = resourceSelector;
    _keyTuple[1] = bytes32(uint256(uint160(caller)));

    uint256 storagePointer = StoreCoreInternal._getStaticDataLocation(_tableId, _keyTuple);
    _store.storeStaticField(storagePointer, 1, 0, abi.encodePacked((access)), _tableId, _keyTuple, 0, getFieldLayout());
  }

  /** Tightly pack full data using this table's field layout */
  function encode(bool access) internal pure returns (bytes memory) {
    return abi.encodePacked(access);
  }

  /** Encode keys as a bytes32 array using this table's field layout */
  function encodeKeyTuple(bytes32 resourceSelector, address caller) internal pure returns (bytes32[] memory) {
    bytes32[] memory _keyTuple = new bytes32[](2);
    _keyTuple[0] = resourceSelector;
    _keyTuple[1] = bytes32(uint256(uint160(caller)));

    return _keyTuple;
  }

  /* Delete all data for given keys */
  function deleteRecord(bytes32 resourceSelector, address caller) internal {
    bytes32[] memory _keyTuple = new bytes32[](2);
    _keyTuple[0] = resourceSelector;
    _keyTuple[1] = bytes32(uint256(uint160(caller)));

    StoreSwitch.deleteRecord(_tableId, _keyTuple, getFieldLayout());
  }

  /* Delete all data for given keys (using the specified store) */
  function deleteRecord(IStore _store, bytes32 resourceSelector, address caller) internal {
    bytes32[] memory _keyTuple = new bytes32[](2);
    _keyTuple[0] = resourceSelector;
    _keyTuple[1] = bytes32(uint256(uint160(caller)));

    _store.deleteRecord(_tableId, _keyTuple, getFieldLayout());
  }
}

function _toBool(uint8 value) pure returns (bool result) {
  assembly {
    result := value
  }
}
