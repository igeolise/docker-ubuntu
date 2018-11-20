FROM ubuntu:16.04

RUN apt-get update && \
    apt-get install -y --no-install-recommends software-properties-common ca-certificates curl apt-transport-https && \
    apt-get dist-upgrade -y && \
    apt-get autoremove -y && \
    rm -rf /var/lib/apt/lists/*

### gosu and entrypoint
ENV GOSU_GPG_KEY B42F6819007F00F88E364FD4036A9C25BF357DD4
RUN ( gpg --keyserver ha.pool.sks-keyservers.net --recv-keys "$GOSU_GPG_KEY" \
      || gpg --keyserver pgp.mit.edu --recv-keys "$GOSU_GPG_KEY" \
      || gpg --keyserver keyserver.pgp.com --recv-keys "$GOSU_GPG_KEY" ) && \
    curl -o /usr/local/bin/gosu -SL "https://github.com/tianon/gosu/releases/download/1.11/gosu-$(dpkg --print-architecture | awk -F- '{ print $NF }')" && \
    curl -o /usr/local/bin/gosu.asc -SL "https://github.com/tianon/gosu/releases/download/1.11/gosu-$(dpkg --print-architecture | awk -F- '{ print $NF }').asc" && \
    gpg --batch --verify /usr/local/bin/gosu.asc /usr/local/bin/gosu && \
    rm /usr/local/bin/gosu.asc && \
    chmod +x /usr/local/bin/gosu

COPY entrypoint.sh /usr/local/bin/entrypoint.sh
RUN chmod +x /usr/local/bin/entrypoint.sh

ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]
###
