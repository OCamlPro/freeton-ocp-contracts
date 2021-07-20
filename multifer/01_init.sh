#!/bin/bash

FT="ft --echo"

$FT switch to mainnet
$FT --switch sandbox1 node stop
$FT switch remove sandbox1 -f
$FT switch create sandbox1
$FT node start
sleep 10

$FT contract import Multifer.sol
$FT node give user0 user1 user2 user3 user4 user5 --amount 10000

