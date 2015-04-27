FROM ubuntu:14.04
MAINTAINER Li Hao <lihao@me.com>
RUN apt-get update
RUN apt-get upgrade -y
RUN apt-get install -y strongswan
RUN mkdir /root/ipsec_cert && cd /root/ipsec_cert
ADD server_key.sh /root/ipsec_cert/
ADD client_key.sh /root/ipsec_cert/
RUN chmod 775 /root/ipsec_cert/*.sh

RUN /root/ipsec_cert/server_key.sh 45.62.113.32
RUN /root/ipsec_cert/client_key.sh lihao lihao@me.com

RUN cp /root/ipsec_cert/cacerts/strongswanCert.pem /etc/ipsec.d/cacerts/strongswanCert.pem 
RUN cp /root/ipsec_cert/certs/vpnHostCert.pem /etc/ipsec.d/certs/vpnHostCert.pem
RUN cp /root/ipsec_cert/private/vpnHostKey.pem /etc/ipsec.d/private/vpnHostKey.pem

ADD ipsec.conf /etc/
ADD ipsec.secrets /etc/

RUN ipsec start

EXPOSE 500/udp 4500/udp

