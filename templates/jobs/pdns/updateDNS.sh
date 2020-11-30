#!/bin/bash
PGPASSWORD=0OoWq2M47Zc2khkCgDUBSjAM psql -a -U pdns -d pdns -h powerdns-postgresql.powerdns \
  -c "TRUNCATE TABLE comments       CASCADE;" \
  -c "TRUNCATE TABLE cryptokeys     CASCADE;" \
  -c "TRUNCATE TABLE domainmetadata CASCADE;" \
  -c "TRUNCATE TABLE domains        CASCADE;" \
  -c "TRUNCATE TABLE records        CASCADE;" \
  -c "TRUNCATE TABLE supermasters   CASCADE;" \
  -c "TRUNCATE TABLE tsigkeys       CASCADE;"

curl -s \
  -X POST \
  -H 'X-API-Key: daeThaiNg0oShibaV7Shair1' \
  -d '@definitions/zone.json' \
  powerdns-webserver.powerdns/api/v1/servers/localhost/zones \
  | jq

curl -s \
  -X PATCH \
  -H 'X-API-Key: daeThaiNg0oShibaV7Shair1' \
  -H "content-type: application/json" \
  -d '@definitions/rr.json' \
  powerdns-webserver.powerdns/api/v1/servers/localhost/zones/thesym.site \
  | jq


curl -s \
  -X POST \
  -H 'X-API-Key: daeThaiNg0oShibaV7Shair1' \
  -d '@definitions/zoneReverse.json' \
  powerdns-webserver.powerdns/api/v1/servers/localhost/zones \
  | jq


curl -s \
  -X PATCH \
  -H 'X-API-Key: daeThaiNg0oShibaV7Shair1' \
  -H "content-type: application/json" \
  -d '@definitions/rrReverse.json' \
  powerdns-webserver.powerdns/api/v1/servers/localhost/zones/169.207.93.in-addr.arpa \
  | jq


curl -s \
  -X GET \
  -H 'X-API-Key: daeThaiNg0oShibaV7Shair1' \
  powerdns-webserver.powerdns/api/v1/servers/localhost/zones/thesym.site \
  | jq


curl -s \
  -X GET \
  -H 'X-API-Key: daeThaiNg0oShibaV7Shair1' \
  powerdns-webserver.powerdns/api/v1/servers/localhost/zones/169.207.93.in-addr.arpa \
  | jq


