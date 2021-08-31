#define FWD_GAS { value: 0, flag: 64, bounce: true }
#define SEND_ALL_GAS(dest) dest.transfer(0 , false, 64 );
#define MSG_GAS(v) { value: v, flag: 0, bounce: true}

#define CODEHASH(cc) 0x%{get-code-hash:contract:tvc:cc}
