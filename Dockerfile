FROM arm32v7/debian

ARG password
ARG config=/etc/mumble-server.ini

RUN apt-get update \
 && apt-get install -y mumble-server \
 && sed -i -e 's/\(serverpassword=\).*/\1'${password}'/' ${config}

EXPOSE 64738/udp
EXPOSE 64738/tcp

USER mumble-server
ENTRYPOINT ["/usr/sbin/murmurd", "-fg", "-ini", ${config}]
