
// This file was generated from file "Multifer.spp". DO NOT EDIT !
pragma ton-solidity >= 0.32.0;

pragma AbiHeader expire;
pragma AbiHeader pubkey;
contract Multifer  {
  uint64 constant EXN_VALUE_TOO_LOW = 100 ;
  uint64 constant EXN_VALUE_TOO_HIGH = 101 ;
  uint64 constant EXN_AMOUNT_TOO_LOW = 102 ;
  uint128 constant MINIMAL_FEE = 0.5 ton;
  uint128 constant MAXIMAL_FEE = 2 ton;
  uint128 constant MINIMAL_TRANSFER = 1 ton;
  constructor() public {
      tvm.accept();
  }
  struct Transfer {
    uint128 amount;
    address dest;
  }
  function _send(Transfer [] transfers, uint128 unit) public view returns (uint128 total_amount) {
      uint256 ntransfers = transfers.length;
      for (
        uint256 i = 0 ;
         (i < ntransfers); (i ++))
        {
            uint128 amount = (transfers[i].amount * unit);
            require((amount >= MINIMAL_TRANSFER), EXN_AMOUNT_TOO_LOW);
            total_amount += amount;
        }
      require((msg.value >= (total_amount + MINIMAL_FEE)), EXN_VALUE_TOO_LOW);
      require((msg.value < (total_amount + (MAXIMAL_FEE * ntransfers))), EXN_VALUE_TOO_HIGH);
      for (
        uint256 i = 0 ;
         (i < ntransfers); (i ++))
        {
            transfers[i].dest.transfer({value: (transfers[i].amount * unit),bounce: false,flag: 0 });
        }
      tvm.rawReserve(0 , 4 );
      msg.sender.transfer(0 , false, 128 );
  }
  function _sendall(address [] dests, uint128 amount, uint128 unit) public view {
      Transfer [] transfers;
      for (
        uint256 i = 0 ;
         (i < dests.length); (i ++))
        {
            Transfer t = Transfer(amount, dests[i]);
            transfers.push(t);
        }
      _send(transfers, unit);
  }
  function send_tons(Transfer [] transfers) public view {
      _send(transfers, 1000000000 );
  }
  function send_nanotons(Transfer [] transfers) public view {
      _send(transfers, 1 );
  }
  function sendall_tons(address [] dests, uint128 amount) public view {
      _sendall(dests, amount, 1000000000 );
  }
  function sendall_nanotons(address [] dests, uint128 amount) public view {
      _sendall(dests, amount, 1 );
  }
}


