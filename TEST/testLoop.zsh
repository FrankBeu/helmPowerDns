#!/usr/bin/env zsh
###
##
#
local BASE_DIR=$(dirname $0:P)
echo $BASE_DIR

while true; do
  read "?Press ENTER to start the test"
  ${BASE_DIR}/dnsTest.zsh
done
