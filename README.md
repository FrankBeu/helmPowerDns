# helmPowerDns

## Sources
Based on \
https://github.com/halkeye-helm-charts/powerdns.git \
https://github.com/halkeye-helm-charts/powerdnsadmin.git

## Dependencies
Postgresql \
https://github.com/bitnami/charts/tree/master/bitnami/postgresql

## TODOs
### icon
    defined in Chart.yaml

## Configuration
### Password
*pdnsadmin.config.user.password* needs an bcrypted password without username
```shell
htpasswd -nbBC10 <NAME> <PASSWORD> | sd '.*:' ''
```
