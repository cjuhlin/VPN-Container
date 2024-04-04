# VPN-Container
Run a VPN client in a container and utilize the host network device, enabling the host to access the VPN




## Running

### Clone repo
```bash
git clone https://github.com/cjuhlin/VPN-Container
```

### Add vpn config file

Add your openvpn config file to the conf folder.


### Podman

#### Build

```bash
podman build --tag vpn-container .
```

#### Run
```bash
podman run \
    --cap-add NET_ADMIN \
    --cap-add NET_RAW \
--device=/dev/net/tun \
--device=/dev/null \
--security-opt="label=disable" \
--name vpn-container \
localhost/vpn-container
```

Note : --security-opt="label=disable"  is needed for SElinux.

### Docker

#### Build
```bash
docker build -t vpn-container .
```

#### Run
```bash
docker run --cap-add=NET_ADMIN --device=/dev/net/tun vpn-container
```
