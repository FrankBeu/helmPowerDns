#!/usr/bin/env zsh
#SIDE_BY_SIDE="-y"
SIDE_BY_SIDE=""

echo -e "\n\n\e[1;34mtemplateDebug \e[0m\n"
colordiff ${SIDE_BY_SIDE} \
        <(helm template ..  -f dnsDefinition.yaml --debug -s templates/jobs/dnsConfig/DNSSetUp.yaml) \
        <(cat dnsSetupTemplate)

