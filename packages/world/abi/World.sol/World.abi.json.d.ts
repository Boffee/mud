declare const abi: [
  {
    inputs: [];
    stateMutability: "nonpayable";
    type: "constructor";
  },
  {
    inputs: [
      {
        internalType: "string";
        name: "resource";
        type: "string";
      },
      {
        internalType: "address";
        name: "caller";
        type: "address";
      }
    ];
    name: "AccessDenied";
    type: "error";
  },
  {
    inputs: [
      {
        internalType: "address";
        name: "delegator";
        type: "address";
      },
      {
        internalType: "address";
        name: "delegatee";
        type: "address";
      }
    ];
    name: "DelegationNotFound";
    type: "error";
  },
  {
    inputs: [
      {
        internalType: "uint256";
        name: "length";
        type: "uint256";
      }
    ];
    name: "FieldLayoutLib_InvalidLength";
    type: "error";
  },
  {
    inputs: [];
    name: "FieldLayoutLib_StaticLengthDoesNotFitInAWord";
    type: "error";
  },
  {
    inputs: [];
    name: "FieldLayoutLib_StaticLengthIsZero";
    type: "error";
  },
  {
    inputs: [
      {
        internalType: "bytes4";
        name: "functionSelector";
        type: "bytes4";
      }
    ];
    name: "FunctionSelectorExists";
    type: "error";
  },
  {
    inputs: [
      {
        internalType: "bytes4";
        name: "functionSelector";
        type: "bytes4";
      }
    ];
    name: "FunctionSelectorNotFound";
    type: "error";
  },
  {
    inputs: [
      {
        internalType: "uint256";
        name: "balance";
        type: "uint256";
      },
      {
        internalType: "uint256";
        name: "amount";
        type: "uint256";
      }
    ];
    name: "InsufficientBalance";
    type: "error";
  },
  {
    inputs: [
      {
        internalType: "address";
        name: "contractAddress";
        type: "address";
      },
      {
        internalType: "bytes4";
        name: "interfaceId";
        type: "bytes4";
      }
    ];
    name: "InterfaceNotSupported";
    type: "error";
  },
  {
    inputs: [
      {
        internalType: "string";
        name: "resource";
        type: "string";
      }
    ];
    name: "InvalidSelector";
    type: "error";
  },
  {
    inputs: [
      {
        internalType: "uint256";
        name: "length";
        type: "uint256";
      }
    ];
    name: "PackedCounter_InvalidLength";
    type: "error";
  },
  {
    inputs: [
      {
        internalType: "string";
        name: "resource";
        type: "string";
      }
    ];
    name: "ResourceExists";
    type: "error";
  },
  {
    inputs: [
      {
        internalType: "string";
        name: "resource";
        type: "string";
      }
    ];
    name: "ResourceNotFound";
    type: "error";
  },
  {
    inputs: [
      {
        internalType: "bytes";
        name: "data";
        type: "bytes";
      },
      {
        internalType: "uint256";
        name: "start";
        type: "uint256";
      },
      {
        internalType: "uint256";
        name: "end";
        type: "uint256";
      }
    ];
    name: "Slice_OutOfBounds";
    type: "error";
  },
  {
    inputs: [
      {
        internalType: "uint256";
        name: "length";
        type: "uint256";
      },
      {
        internalType: "uint256";
        name: "received";
        type: "uint256";
      }
    ];
    name: "StoreCore_DataIndexOverflow";
    type: "error";
  },
  {
    inputs: [
      {
        internalType: "uint256";
        name: "expected";
        type: "uint256";
      },
      {
        internalType: "uint256";
        name: "received";
        type: "uint256";
      }
    ];
    name: "StoreCore_InvalidDataLength";
    type: "error";
  },
  {
    inputs: [];
    name: "StoreCore_NotDynamicField";
    type: "error";
  },
  {
    inputs: [
      {
        internalType: "bytes32";
        name: "tableId";
        type: "bytes32";
      },
      {
        internalType: "string";
        name: "tableIdString";
        type: "string";
      }
    ];
    name: "StoreCore_TableNotFound";
    type: "error";
  },
  {
    inputs: [
      {
        internalType: "address";
        name: "system";
        type: "address";
      }
    ];
    name: "SystemExists";
    type: "error";
  },
  {
    inputs: [];
    name: "WorldAlreadyInitialized";
    type: "error";
  },
  {
    anonymous: false;
    inputs: [];
    name: "HelloWorld";
    type: "event";
  },
  {
    anonymous: false;
    inputs: [
      {
        indexed: false;
        internalType: "bytes32";
        name: "table";
        type: "bytes32";
      },
      {
        indexed: false;
        internalType: "bytes32[]";
        name: "key";
        type: "bytes32[]";
      }
    ];
    name: "StoreDeleteRecord";
    type: "event";
  },
  {
    anonymous: false;
    inputs: [
      {
        indexed: false;
        internalType: "bytes32";
        name: "table";
        type: "bytes32";
      },
      {
        indexed: false;
        internalType: "bytes32[]";
        name: "key";
        type: "bytes32[]";
      },
      {
        indexed: false;
        internalType: "uint8";
        name: "schemaIndex";
        type: "uint8";
      },
      {
        indexed: false;
        internalType: "bytes";
        name: "data";
        type: "bytes";
      }
    ];
    name: "StoreSetField";
    type: "event";
  },
  {
    anonymous: false;
    inputs: [
      {
        indexed: false;
        internalType: "bytes32";
        name: "table";
        type: "bytes32";
      },
      {
        indexed: false;
        internalType: "bytes32[]";
        name: "key";
        type: "bytes32[]";
      },
      {
        indexed: false;
        internalType: "bytes";
        name: "data";
        type: "bytes";
      }
    ];
    name: "StoreSetRecord";
    type: "event";
  },
  {
    stateMutability: "payable";
    type: "fallback";
  },
  {
    inputs: [
      {
        internalType: "bytes32";
        name: "resourceSelector";
        type: "bytes32";
      },
      {
        internalType: "bytes";
        name: "funcSelectorAndArgs";
        type: "bytes";
      }
    ];
    name: "call";
    outputs: [
      {
        internalType: "bytes";
        name: "";
        type: "bytes";
      }
    ];
    stateMutability: "payable";
    type: "function";
  },
  {
    inputs: [
      {
        internalType: "address";
        name: "delegator";
        type: "address";
      },
      {
        internalType: "bytes32";
        name: "resourceSelector";
        type: "bytes32";
      },
      {
        internalType: "bytes";
        name: "funcSelectorAndArgs";
        type: "bytes";
      }
    ];
    name: "callFrom";
    outputs: [
      {
        internalType: "bytes";
        name: "";
        type: "bytes";
      }
    ];
    stateMutability: "payable";
    type: "function";
  },
  {
    inputs: [];
    name: "creator";
    outputs: [
      {
        internalType: "address";
        name: "";
        type: "address";
      }
    ];
    stateMutability: "view";
    type: "function";
  },
  {
    inputs: [
      {
        internalType: "bytes32";
        name: "tableId";
        type: "bytes32";
      },
      {
        internalType: "bytes32[]";
        name: "key";
        type: "bytes32[]";
      },
      {
        internalType: "FieldLayout";
        name: "fieldLayout";
        type: "bytes32";
      }
    ];
    name: "deleteRecord";
    outputs: [];
    stateMutability: "nonpayable";
    type: "function";
  },
  {
    inputs: [
      {
        internalType: "bytes32";
        name: "table";
        type: "bytes32";
      },
      {
        internalType: "bytes32[]";
        name: "key";
        type: "bytes32[]";
      },
      {
        internalType: "uint8";
        name: "schemaIndex";
        type: "uint8";
      },
      {
        internalType: "FieldLayout";
        name: "fieldLayout";
        type: "bytes32";
      }
    ];
    name: "getField";
    outputs: [
      {
        internalType: "bytes";
        name: "data";
        type: "bytes";
      }
    ];
    stateMutability: "view";
    type: "function";
  },
  {
    inputs: [
      {
        internalType: "bytes32";
        name: "table";
        type: "bytes32";
      }
    ];
    name: "getFieldLayout";
    outputs: [
      {
        internalType: "FieldLayout";
        name: "fieldLayout";
        type: "bytes32";
      }
    ];
    stateMutability: "view";
    type: "function";
  },
  {
    inputs: [
      {
        internalType: "bytes32";
        name: "tableId";
        type: "bytes32";
      },
      {
        internalType: "bytes32[]";
        name: "key";
        type: "bytes32[]";
      },
      {
        internalType: "uint8";
        name: "schemaIndex";
        type: "uint8";
      },
      {
        internalType: "FieldLayout";
        name: "fieldLayout";
        type: "bytes32";
      }
    ];
    name: "getFieldLength";
    outputs: [
      {
        internalType: "uint256";
        name: "";
        type: "uint256";
      }
    ];
    stateMutability: "view";
    type: "function";
  },
  {
    inputs: [
      {
        internalType: "bytes32";
        name: "tableId";
        type: "bytes32";
      },
      {
        internalType: "bytes32[]";
        name: "key";
        type: "bytes32[]";
      },
      {
        internalType: "uint8";
        name: "schemaIndex";
        type: "uint8";
      },
      {
        internalType: "FieldLayout";
        name: "fieldLayout";
        type: "bytes32";
      },
      {
        internalType: "uint256";
        name: "start";
        type: "uint256";
      },
      {
        internalType: "uint256";
        name: "end";
        type: "uint256";
      }
    ];
    name: "getFieldSlice";
    outputs: [
      {
        internalType: "bytes";
        name: "";
        type: "bytes";
      }
    ];
    stateMutability: "view";
    type: "function";
  },
  {
    inputs: [
      {
        internalType: "bytes32";
        name: "table";
        type: "bytes32";
      }
    ];
    name: "getKeySchema";
    outputs: [
      {
        internalType: "Schema";
        name: "schema";
        type: "bytes32";
      }
    ];
    stateMutability: "view";
    type: "function";
  },
  {
    inputs: [
      {
        internalType: "bytes32";
        name: "table";
        type: "bytes32";
      },
      {
        internalType: "bytes32[]";
        name: "key";
        type: "bytes32[]";
      },
      {
        internalType: "FieldLayout";
        name: "fieldLayout";
        type: "bytes32";
      }
    ];
    name: "getRecord";
    outputs: [
      {
        internalType: "bytes";
        name: "data";
        type: "bytes";
      }
    ];
    stateMutability: "view";
    type: "function";
  },
  {
    inputs: [
      {
        internalType: "bytes32";
        name: "table";
        type: "bytes32";
      }
    ];
    name: "getValueSchema";
    outputs: [
      {
        internalType: "Schema";
        name: "schema";
        type: "bytes32";
      }
    ];
    stateMutability: "view";
    type: "function";
  },
  {
    inputs: [
      {
        internalType: "contract IModule";
        name: "coreModule";
        type: "address";
      }
    ];
    name: "initialize";
    outputs: [];
    stateMutability: "nonpayable";
    type: "function";
  },
  {
    inputs: [
      {
        internalType: "contract IModule";
        name: "module";
        type: "address";
      },
      {
        internalType: "bytes";
        name: "args";
        type: "bytes";
      }
    ];
    name: "installRootModule";
    outputs: [];
    stateMutability: "nonpayable";
    type: "function";
  },
  {
    inputs: [
      {
        internalType: "uint256";
        name: "storagePointer";
        type: "uint256";
      },
      {
        internalType: "uint256";
        name: "length";
        type: "uint256";
      },
      {
        internalType: "uint256";
        name: "offset";
        type: "uint256";
      }
    ];
    name: "loadStaticField";
    outputs: [
      {
        internalType: "bytes32";
        name: "";
        type: "bytes32";
      }
    ];
    stateMutability: "view";
    type: "function";
  },
  {
    inputs: [
      {
        internalType: "bytes32";
        name: "tableId";
        type: "bytes32";
      },
      {
        internalType: "bytes32[]";
        name: "key";
        type: "bytes32[]";
      },
      {
        internalType: "uint8";
        name: "schemaIndex";
        type: "uint8";
      },
      {
        internalType: "uint256";
        name: "byteLengthToPop";
        type: "uint256";
      },
      {
        internalType: "FieldLayout";
        name: "fieldLayout";
        type: "bytes32";
      }
    ];
    name: "popFromField";
    outputs: [];
    stateMutability: "nonpayable";
    type: "function";
  },
  {
    inputs: [
      {
        internalType: "bytes32";
        name: "tableId";
        type: "bytes32";
      },
      {
        internalType: "bytes32[]";
        name: "key";
        type: "bytes32[]";
      },
      {
        internalType: "uint8";
        name: "schemaIndex";
        type: "uint8";
      },
      {
        internalType: "bytes";
        name: "dataToPush";
        type: "bytes";
      },
      {
        internalType: "FieldLayout";
        name: "fieldLayout";
        type: "bytes32";
      }
    ];
    name: "pushToField";
    outputs: [];
    stateMutability: "nonpayable";
    type: "function";
  },
  {
    inputs: [
      {
        internalType: "bytes32";
        name: "tableId";
        type: "bytes32";
      },
      {
        internalType: "bytes32[]";
        name: "key";
        type: "bytes32[]";
      },
      {
        internalType: "uint8";
        name: "schemaIndex";
        type: "uint8";
      },
      {
        internalType: "bytes";
        name: "data";
        type: "bytes";
      },
      {
        internalType: "FieldLayout";
        name: "fieldLayout";
        type: "bytes32";
      }
    ];
    name: "setField";
    outputs: [];
    stateMutability: "nonpayable";
    type: "function";
  },
  {
    inputs: [
      {
        internalType: "bytes32";
        name: "tableId";
        type: "bytes32";
      },
      {
        internalType: "bytes32[]";
        name: "key";
        type: "bytes32[]";
      },
      {
        internalType: "bytes";
        name: "data";
        type: "bytes";
      },
      {
        internalType: "FieldLayout";
        name: "fieldLayout";
        type: "bytes32";
      }
    ];
    name: "setRecord";
    outputs: [];
    stateMutability: "nonpayable";
    type: "function";
  },
  {
    inputs: [
      {
        internalType: "uint256";
        name: "storagePointer";
        type: "uint256";
      },
      {
        internalType: "uint256";
        name: "length";
        type: "uint256";
      },
      {
        internalType: "uint256";
        name: "offset";
        type: "uint256";
      },
      {
        internalType: "bytes";
        name: "data";
        type: "bytes";
      },
      {
        internalType: "bytes32";
        name: "tableId";
        type: "bytes32";
      },
      {
        internalType: "bytes32[]";
        name: "key";
        type: "bytes32[]";
      },
      {
        internalType: "uint8";
        name: "schemaIndex";
        type: "uint8";
      },
      {
        internalType: "FieldLayout";
        name: "fieldLayout";
        type: "bytes32";
      }
    ];
    name: "storeStaticField";
    outputs: [];
    stateMutability: "nonpayable";
    type: "function";
  },
  {
    inputs: [
      {
        internalType: "bytes32";
        name: "tableId";
        type: "bytes32";
      },
      {
        internalType: "bytes32[]";
        name: "key";
        type: "bytes32[]";
      },
      {
        internalType: "uint8";
        name: "schemaIndex";
        type: "uint8";
      },
      {
        internalType: "uint256";
        name: "startByteIndex";
        type: "uint256";
      },
      {
        internalType: "bytes";
        name: "dataToSet";
        type: "bytes";
      },
      {
        internalType: "FieldLayout";
        name: "fieldLayout";
        type: "bytes32";
      }
    ];
    name: "updateInField";
    outputs: [];
    stateMutability: "nonpayable";
    type: "function";
  },
  {
    stateMutability: "payable";
    type: "receive";
  }
];
export default abi;
