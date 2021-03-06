// This file was generated from file "BigDeploy.spp". DO NOT EDIT !
pragma ton-solidity >= 0.32.0;

pragma AbiHeader expire;
pragma AbiHeader pubkey;
contract BigDeploy  {
  uint64 constant EXN_AUTH_FAILED = 100 ;
  uint64 constant EXN_WRONG_CODEHASH = 101 ;
  uint256 static s_codehash;
  constructor() public {
      tvm.accept();
  }
  function setCode(TvmCell code) public {
      require((tvm.pubkey() == msg.pubkey()), EXN_AUTH_FAILED);
      require((tvm.hash(code) == s_codehash), EXN_WRONG_CODEHASH);
      tvm.accept();
      tvm.setcode(code);
      tvm.setCurrentCode(code);
      onCodeUpgrade();
  }
  function onCodeUpgrade() private {
  }
}


