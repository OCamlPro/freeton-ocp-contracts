#!/bin/bash

set -e

FT="ft --echo"
# export FT_USE_TONOS=1

$FT contract deploy Multifer -f
$FT multisig transfer --send 901 --from user0 --to Multifer send_tons \
    '{ "transfers": [ \
         { "amount": "100", \
           "dest": "%{account:address:user1}" } \
         , { "amount": "100", \
           "dest": "%{account:address:user2}" } \
         , { "amount": "100", \
           "dest": "%{account:address:user3}" } \
         , { "amount": "100", \
           "dest": "%{account:address:user4}" } \
         , { "amount": "100", \
           "dest": "%{account:address:user5}" } \
         , { "amount": "100", \
           "dest": "%{account:address:user6}" } \
         , { "amount": "100", \
           "dest": "%{account:address:user7}" } \
         , { "amount": "100", \
           "dest": "%{account:address:user8}" } \
         , { "amount": "100", \
           "dest": "%{account:address:user9}" } \
       ] }' --wait

$FT account info

$FT multisig transfer --send 901 --from user0 --to Multifer sendall_tons \
    '{ "amount": "100", "dests": [ \
       "%{account:address:user1}" \
       ,"%{account:address:user2}" \
       ,"%{account:address:user3}" \
       ,"%{account:address:user4}" \
       ,"%{account:address:user5}" \
       ,"%{account:address:user6}" \
       ,"%{account:address:user7}" \
       ,"%{account:address:user8}" \
       ,"%{account:address:user9}" \
       ] }' --wait

$FT account info

exit 0



