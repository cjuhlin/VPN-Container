FROM ubuntu:latest

RUN apt update && \
  apt install -y openvpn && \
  rm -rf /var/lib/apt/lists/*

COPY conf/* /etc/openvpn/client/


CMD ["openvpn", "/etc/openvpn/client/profile.ovpn"]
