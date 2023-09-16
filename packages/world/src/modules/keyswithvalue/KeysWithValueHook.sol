// SPDX-License-Identifier: MIT
pragma solidity >=0.8.0;

import { StoreHook } from "@latticexyz/store/src/StoreHook.sol";
import { Bytes } from "@latticexyz/store/src/Bytes.sol";
import { FieldLayout } from "@latticexyz/store/src/FieldLayout.sol";
import { StoreSwitch } from "@latticexyz/store/src/StoreSwitch.sol";
import { PackedCounter } from "@latticexyz/store/src/PackedCounter.sol";
import { IBaseWorld } from "../../interfaces/IBaseWorld.sol";

import { ResourceSelector } from "../../ResourceSelector.sol";

import { MODULE_NAMESPACE } from "./constants.sol";
import { KeysWithValue } from "./tables/KeysWithValue.sol";
import { ArrayLib } from "../utils/ArrayLib.sol";
import { getTargetTableSelector } from "../utils/getTargetTableSelector.sol";

/**
 * This is a very naive and inefficient implementation for now.
 * We can optimize this by adding support for `setIndexOfField` in Store
 * (See https://github.com/latticexyz/mud/issues/444)
 *
 * Note: if a table with composite keys is used, only the first key of the tuple is indexed
 */
contract KeysWithValueHook is StoreHook {
  using ArrayLib for bytes32[];
  using ResourceSelector for bytes32;

  function _world() internal view returns (IBaseWorld) {
    return IBaseWorld(StoreSwitch.getStoreAddress());
  }

  function onBeforeSetRecord(
    bytes32 sourceTableId,
    bytes32[] memory keyTuple,
    bytes memory staticData,
    PackedCounter encodedLengths,
    bytes memory dynamicData,
    FieldLayout fieldLayout
  ) public {
    bytes32 targetTableId = getTargetTableSelector(MODULE_NAMESPACE, sourceTableId);

    // Get the previous value
    bytes32 previousValue = keccak256(_world().getRecord(sourceTableId, keyTuple, fieldLayout));

    // Remove the key from the list of keys with the previous value
    _removeKeyFromList(targetTableId, keyTuple[0], previousValue);

    // Push the key to the list of keys with the new value
    bytes memory data;
    if (dynamicData.length > 0) {
      data = abi.encodePacked(staticData, encodedLengths, dynamicData);
    } else {
      data = staticData;
    }
    KeysWithValue.push(targetTableId, keccak256(data), keyTuple[0]);
  }

  function onAfterSetRecord(
    bytes32 sourceTableId,
    bytes32[] memory keyTuple,
    bytes memory staticData,
    PackedCounter encodedLengths,
    bytes memory dynamicData,
    FieldLayout fieldLayout
  ) public {
    // NOOP
  }

  function onBeforeSetField(
    bytes32 sourceTableId,
    bytes32[] memory keyTuple,
    uint8,
    bytes memory,
    FieldLayout fieldLayout
  ) public {
    // Remove the key from the list of keys with the previous value
    bytes32 previousValue = keccak256(_world().getRecord(sourceTableId, keyTuple, fieldLayout));
    bytes32 targetTableId = getTargetTableSelector(MODULE_NAMESPACE, sourceTableId);
    _removeKeyFromList(targetTableId, keyTuple[0], previousValue);
  }

  function onAfterSetField(
    bytes32 sourceTableId,
    bytes32[] memory keyTuple,
    uint8,
    bytes memory,
    FieldLayout fieldLayout
  ) public {
    // Add the key to the list of keys with the new value
    bytes32 newValue = keccak256(_world().getRecord(sourceTableId, keyTuple, fieldLayout));
    bytes32 targetTableId = getTargetTableSelector(MODULE_NAMESPACE, sourceTableId);
    KeysWithValue.push(targetTableId, newValue, keyTuple[0]);
  }

  function onBeforeDeleteRecord(bytes32 sourceTableId, bytes32[] memory keyTuple, FieldLayout fieldLayout) public {
    // Remove the key from the list of keys with the previous value
    bytes32 previousValue = keccak256(_world().getRecord(sourceTableId, keyTuple, fieldLayout));
    bytes32 targetTableId = getTargetTableSelector(MODULE_NAMESPACE, sourceTableId);
    _removeKeyFromList(targetTableId, keyTuple[0], previousValue);
  }

  function onAfterDeleteRecord(bytes32 sourceTableId, bytes32[] memory keyTuple, FieldLayout fieldLayout) public {
    // NOOP
  }

  function _removeKeyFromList(bytes32 targetTableId, bytes32 key, bytes32 valueHash) internal {
    // Get the keys with the previous value excluding the current key
    bytes32[] memory keysWithPreviousValue = KeysWithValue.get(targetTableId, valueHash).filter(key);

    if (keysWithPreviousValue.length == 0) {
      // Delete the list of keys in this table
      KeysWithValue.deleteRecord(targetTableId, valueHash);
    } else {
      // Set the keys with the previous value
      KeysWithValue.set(targetTableId, valueHash, keysWithPreviousValue);
    }
  }
}
