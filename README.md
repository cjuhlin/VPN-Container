# VPN-Container
Run a VPN client in a container and utilize the host network device, enabling the host to access the VPN




## Running

### Clone repo
```bash
git clone https://github.com/cjuhlin/VPN-Container
```

### Version

In the "old_version" folder, you will find the Dockerfile for building OpenVPN with an older version. This is useful when your OpenVPN server is running an older version (prior to 2.9) and requires support for older versions of OpenSSL.

Please note that using older versions of OpenSSL may pose security risks and is not recommended unless absolutely necessary.

### Add vpn config file

Please place your OpenVPN configuration file in the "conf" folder. The configuration file should be named ```profile.ovpn```.

### Podman

Running Podman to create a TUN interface on the host from the container requires the container to be executed with root privileges.

#### Build

```bash
sudo podman build --tag vpn-container .
```

#### Run
```bash
sudo podman run \
    --cap-add NET_ADMIN \
    --cap-add NET_RAW \
--device=/dev/net/tun \
--device=/dev/null \
--security-opt="label=disable" \
--name tacom-vpn \
--net=host \
localhost/tacom-vpn
```

Note : --security-opt="label=disable"  is needed for SElinux.

### Docker

#### Build
```bash
docker build -t vpn-container .
```

#### Run
```bash
docker run --name vpn-container --cap-add=NET_ADMIN --device=/dev/net/tun vpn-container
```
