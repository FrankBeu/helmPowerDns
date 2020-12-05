#!/usr/bin/env zsh
#SIDE_BY_SIDE="-y"
SIDE_BY_SIDE=""

local BASE_DIR=$(dirname $0:P)

echo -e "\n\n\e[1;34mtemplateDebug \e[0m\n"
colordiff ${SIDE_BY_SIDE} \
        <(helm template ${BASE_DIR}/.. --debug -s templates/jobs/dnsConfig/DNSSetUp.yaml) \
        <(cat ${BASE_DIR}/dnsSetupTarget.yaml)
