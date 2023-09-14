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

bytes32 constant _tableId = bytes32(abi.encodePacked(bytes16(""), bytes16("Delegations")));
bytes32 constant DelegationsTableId = _tableId;

FieldLayout constant _fieldLayout = FieldLayout.wrap(
  0x0020010020000000000000000000000000000000000000000000000000000000
);

library Delegations {
  /** Get the table values' field layout */
  function getFieldLayout() internal pure returns (FieldLayout) {
    return _fieldLayout;
  }

  /** Get the table's key schema */
  function getKeySchema() internal pure returns (Schema) {
    SchemaType[] memory _schema = new SchemaType[](2);
    _schema[0] = SchemaType.ADDRESS;
    _schema[1] = SchemaType.ADDRESS;

    return SchemaLib.encode(_schema);
  }

  /** Get the table's value schema */
  function getValueSchema() internal pure returns (Schema) {
    SchemaType[] memory _schema = new SchemaType[](1);
    _schema[0] = SchemaType.BYTES32;

    return SchemaLib.encode(_schema);
  }

  /** Get the table's key names */
  function getKeyNames() internal pure returns (string[] memory keyNames) {
    keyNames = new string[](2);
    keyNames[0] = "delegator";
    keyNames[1] = "delegatee";
  }

  /** Get the table's field names */
  function getFieldNames() internal pure returns (string[] memory fieldNames) {
    fieldNames = new string[](1);
    fieldNames[0] = "delegationControlId";
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

  /** Get delegationControlId */
  function get(address delegator, address delegatee) internal view returns (bytes32 delegationControlId) {
    bytes32[] memory _keyTuple = new bytes32[](2);
    _keyTuple[0] = bytes32(uint256(uint160(delegator)));
    _keyTuple[1] = bytes32(uint256(uint160(delegatee)));

    uint256 storagePointer = StoreCoreInternal._getStaticDataLocation(_tableId, _keyTuple);
    bytes32 _blob = StoreSwitch.loadStaticField(storagePointer, 32, 0);
    return (bytes32(_blob));
  }

  /** Get delegationControlId (using the specified store) */
  function get(
    IStore _store,
    address delegator,
    address delegatee
  ) internal view returns (bytes32 delegationControlId) {
    bytes32[] memory _keyTuple = new bytes32[](2);
    _keyTuple[0] = bytes32(uint256(uint160(delegator)));
    _keyTuple[1] = bytes32(uint256(uint160(delegatee)));

    uint256 storagePointer = StoreCoreInternal._getStaticDataLocation(_tableId, _keyTuple);
    bytes32 _blob = _store.loadStaticField(storagePointer, 32, 0);
    return (bytes32(_blob));
  }

  /** Set delegationControlId */
  function set(address delegator, address delegatee, bytes32 delegationControlId) internal {
    bytes32[] memory _keyTuple = new bytes32[](2);
    _keyTuple[0] = bytes32(uint256(uint160(delegator)));
    _keyTuple[1] = bytes32(uint256(uint160(delegatee)));

    uint256 storagePointer = StoreCoreInternal._getStaticDataLocation(_tableId, _keyTuple);
    StoreSwitch.storeStaticField(
      storagePointer,
      32,
      0,
      abi.encodePacked((delegationControlId)),
      _tableId,
      _keyTuple,
      0,
      getFieldLayout()
    );
  }

  /** Set delegationControlId (using the specified store) */
  function set(IStore _store, address delegator, address delegatee, bytes32 delegationControlId) internal {
    bytes32[] memory _keyTuple = new bytes32[](2);
    _keyTuple[0] = bytes32(uint256(uint160(delegator)));
    _keyTuple[1] = bytes32(uint256(uint160(delegatee)));

    uint256 storagePointer = StoreCoreInternal._getStaticDataLocation(_tableId, _keyTuple);
    _store.storeStaticField(
      storagePointer,
      32,
      0,
      abi.encodePacked((delegationControlId)),
      _tableId,
      _keyTuple,
      0,
      getFieldLayout()
    );
  }

  /** Tightly pack full data using this table's field layout */
  function encode(bytes32 delegationControlId) internal pure returns (bytes memory) {
    return abi.encodePacked(delegationControlId);
  }

  /** Encode keys as a bytes32 array using this table's field layout */
  function encodeKeyTuple(address delegator, address delegatee) internal pure returns (bytes32[] memory) {
    bytes32[] memory _keyTuple = new bytes32[](2);
    _keyTuple[0] = bytes32(uint256(uint160(delegator)));
    _keyTuple[1] = bytes32(uint256(uint160(delegatee)));

    return _keyTuple;
  }

  /* Delete all data for given keys */
  function deleteRecord(address delegator, address delegatee) internal {
    bytes32[] memory _keyTuple = new bytes32[](2);
    _keyTuple[0] = bytes32(uint256(uint160(delegator)));
    _keyTuple[1] = bytes32(uint256(uint160(delegatee)));

    StoreSwitch.deleteRecord(_tableId, _keyTuple, getFieldLayout());
  }

  /* Delete all data for given keys (using the specified store) */
  function deleteRecord(IStore _store, address delegator, address delegatee) internal {
    bytes32[] memory _keyTuple = new bytes32[](2);
    _keyTuple[0] = bytes32(uint256(uint160(delegator)));
    _keyTuple[1] = bytes32(uint256(uint160(delegatee)));

    _store.deleteRecord(_tableId, _keyTuple, getFieldLayout());
  }
}
