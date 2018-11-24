FROM arm32v7/debian

ARG PASSWORD='' 

RUN apt-get update \
 && apt-get install -y mumble-server \
 && sed -i -e 's/\(serverpassword=\).*/\1'$PASSWORD'/' /etc/mumble-server.ini

EXPOSE 64738/udp
EXPOSE 64738/tcp

USER mumble-server
ENTRYPOINT ["/usr/sbin/murmurd", "-fg"]
