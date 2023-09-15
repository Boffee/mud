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

// Import user types
import { Resource } from "./../../../Types.sol";

bytes32 constant _tableId = bytes32(abi.encodePacked(bytes16(""), bytes16("ResourceType")));
bytes32 constant ResourceTypeTableId = _tableId;

FieldLayout constant _fieldLayout = FieldLayout.wrap(
  0x0001010001000000000000000000000000000000000000000000000000000000
);

library ResourceType {
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
    SchemaType[] memory _valueSchema = new SchemaType[](1);
    _valueSchema[0] = SchemaType.UINT8;

    return SchemaLib.encode(_valueSchema);
  }

  /** Get the table's key names */
  function getKeyNames() internal pure returns (string[] memory keyNames) {
    keyNames = new string[](1);
    keyNames[0] = "resourceSelector";
  }

  /** Get the table's field names */
  function getFieldNames() internal pure returns (string[] memory fieldNames) {
    fieldNames = new string[](1);
    fieldNames[0] = "resourceType";
  }

  /** Register the table with its config */
  function register() internal {
    StoreSwitch.registerTable(_tableId, _fieldLayout, getKeySchema(), getValueSchema(), getKeyNames(), getFieldNames());
  }

  /** Register the table with its config (using the specified store) */
  function register(IStore _store) internal {
    _store.registerTable(_tableId, _fieldLayout, getKeySchema(), getValueSchema(), getKeyNames(), getFieldNames());
  }

  /** Get resourceType */
  function get(bytes32 resourceSelector) internal view returns (Resource resourceType) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = resourceSelector;

    bytes memory _blob = StoreSwitch.getField(_tableId, _keyTuple, 0, _fieldLayout);
    return Resource(uint8(Bytes.slice1(_blob, 0)));
  }

  /** Get resourceType (using the specified store) */
  function get(IStore _store, bytes32 resourceSelector) internal view returns (Resource resourceType) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = resourceSelector;

    bytes memory _blob = _store.getField(_tableId, _keyTuple, 0, _fieldLayout);
    return Resource(uint8(Bytes.slice1(_blob, 0)));
  }

  /** Set resourceType */
  function set(bytes32 resourceSelector, Resource resourceType) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = resourceSelector;

    StoreSwitch.setField(_tableId, _keyTuple, 0, abi.encodePacked(uint8(resourceType)), _fieldLayout);
  }

  /** Set resourceType (using the specified store) */
  function set(IStore _store, bytes32 resourceSelector, Resource resourceType) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = resourceSelector;

    _store.setField(_tableId, _keyTuple, 0, abi.encodePacked(uint8(resourceType)), _fieldLayout);
  }

  /** Tightly pack full data using this table's field layout */
  function encode(Resource resourceType) internal pure returns (bytes memory) {
    return abi.encodePacked(resourceType);
  }

  /** Encode keys as a bytes32 array using this table's field layout */
  function encodeKeyTuple(bytes32 resourceSelector) internal pure returns (bytes32[] memory) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = resourceSelector;

    return _keyTuple;
  }

  /* Delete all data for given keys */
  function deleteRecord(bytes32 resourceSelector) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = resourceSelector;

    StoreSwitch.deleteRecord(_tableId, _keyTuple, _fieldLayout);
  }

  /* Delete all data for given keys (using the specified store) */
  function deleteRecord(IStore _store, bytes32 resourceSelector) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = resourceSelector;

    _store.deleteRecord(_tableId, _keyTuple, _fieldLayout);
  }
}
