declare const abi: [
  {
    inputs: [
      {
        internalType: "uint256";
        name: "storagePointer";
        type: "uint256";
      },
      {
        internalType: "uint256";
        name: "lengthStoragePointer";
        type: "uint256";
      },
      {
        internalType: "uint8";
        name: "dynamicSchemaIndex";
        type: "uint8";
      }
    ];
    name: "loadDynamicField";
    outputs: [
      {
        internalType: "bytes";
        name: "";
        type: "bytes";
      }
    ];
    stateMutability: "view";
    type: "function";
  }
];
export default abi;
