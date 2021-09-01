# Deployer for Big Contracts

Contracts with an image bigger than 16 kB cannot be deployed directly
on Free TON. These contracts allow you to resolve this problem using
the tvm.setcode instruction.

## BigDeploy contract

The `BigDeploy` contract can be deployed with a static variable
`s_code_hash` corresponding to the code hash of the final contract.
Then, a `setCode` message containing an argument `{ "code":
"...tvm-image.." }` can be used to install the final code of the
contract, corresponding to the code hash. The contract can have a
function `onCodeUpgrade()` that is called at the end of `setCode` to
initialize the contract.

## BigDeployer contract

This contract can be deployed in a network to simplify the use of
`BigDeploy` contracts. It provides a function `deploy` taking
arguments `pubkey` and `codehash` to deploy the corresponding
`BigDeploy` contract. This function must be called from a multisig to
provide the gas and initial balance for the deployment.

