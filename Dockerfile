FROM haproxy:latest

RUN apt-get update && apt-get install -y iptables iproute2 net-tools && rm -rf /var/lib/apt/lists/*

COPY docker-entrypoint.sh /
COPY haproxy.cfg /usr/local/etc/haproxy/haproxy.cfg
ENTRYPOINT ["/docker-entrypoint.sh"]
CMD ["haproxy", "-f", "/usr/local/etc/haproxy/haproxy.cfg"]
