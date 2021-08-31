// This file was generated from file "BigDeployer.spp". DO NOT EDIT !
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

contract BigDeployer  {
  uint64 constant EXN_AUTH_FAILED = 100 ;
  uint64 constant EXN_WRONG_CODEHASH = 101 ;
  TvmCell g_bigDeploy_code;
  constructor(TvmCell bigDeploy_code) public {
      require((0xe73c897c5b846db046b8e9fce78076561925c7e25dd1f6426b479f0b82986df6 == tvm.hash(bigDeploy_code)), EXN_WRONG_CODEHASH);
      tvm.accept();
      g_bigDeploy_code = bigDeploy_code;
  }
  function deploy(uint256 pubkey, uint256 codehash) public view returns (address addr) {
      addr = new BigDeploy {value: 0 ,flag: 64 ,code: g_bigDeploy_code,pubkey: pubkey,varInit:  {s_codehash: codehash}}();
  }
}


