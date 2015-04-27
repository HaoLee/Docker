FROM ubuntu:14.04
MAINTAINER Li Hao <lihao@me.com>
RUN apt-get update
RUN apt-get upgrade -y
RUN apt-get install -y strongswan
RUN mkdir ~/ipsec_cert && cd ~/ipsec_cert
ADD server_key.sh ~/ipsec_cert/
ADD client_key.sh ~/ipsec_cert/
RUN chmod 775 ~/ipsec_cert/*.sh

RUN ~/ipsec_cert/server_key.sh 45.62.113.32
RUN ~/ipsec_cert/client_key.sh lihao lihao@me.com

RUN cp ~/ipsec_cert/cacerts/strongswanCert.pem /etc/ipsec.d/cacerts/strongswanCert.pem 
RUN cp ~/ipsec_cert/certs/vpnHostCert.pem /etc/ipsec.d/certs/vpnHostCert.pem
RUN cp ~/ipsec_cert/private/vpnHostKey.pem /etc/ipsec.d/private/vpnHostKey.pem

ADD ipsec.conf /etc/
ADD ipsec.secrets /etc/

RUN ipsec start

EXPOSE 500/udp 4500/udp

