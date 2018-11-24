FROM arm32v7/debian

RUN apt-get update \
 && apt-get install -y mumble-server

EXPOSE 64738/udp

USER mumble-server
ENTRYPOINT ["/usr/sbin/murmurd", "-fg"]
