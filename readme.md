# dnsmasq docker container

This is a very basic dnsmasq docker container that allows setting the dnsmasq configuration via environment variable.

## To run the container

```docker run ghcr.io/acbgbca/dnsmasq```

or compose:
```yaml
services:
  dnsmasq:
    image: ghcr.io/acbgbca/dnsmasq
    ports:
      - 1053:53/udp
```

With additional configuration:
```docker run -e DNSMASQ_CONF="address=/local/192.168.132.5" ghcr.io/acbgbca/dnsmasq```

or compose:
```yaml
services:
  dnsmasq:
    image: ghcr.io/acbgbca/dnsmasq
    environment:
      - DNSMASQ_CONF=address=/local/192.168.132.5
    ports:
      - 1053:53/udp
```

With multi-line compose configuration:
```yaml
services:
  dnsmasq:
    image: ghcr.io/acbgbca/dnsmasq
    environment:
      - |
        DNSMASQ_CONF=
        address=/local/192.168.132.5
        address=/internal/192.168.132.6
        address=/homelab/192.168.132.7
    ports:
      - 1053:53/udp
```

## Troubleshooting
To verify the configuration:
```docker run --rm -e DNSMASQ_CONF="address=/local/192.168.132.5" ghcr.io/acbgbca/dnsmasq --test```

To run with additional logging:
```docker run --rm -e DNSMASQ_CONF="address=/local/192.168.132.5" ghcr.io/acbgbca/dnsmasq -k --log-facility=- -q```

## To do a DNS lookup

To run a DNS using the docker-compose in the dev container:
```nslookup -port=1053 blah.internal 127.0.0.1```

Output:
```
Server:         127.0.0.1
Address:        127.0.0.1#1053

Name:   blah.internal
Address: 192.168.132.5
```