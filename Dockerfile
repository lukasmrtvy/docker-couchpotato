FROM alpine:latest

ENV PYTHONIOENCODING="UTF-8"

ENV UID 1000
ENV GID 1000
ENV USER htpc
ENV GROUP htpc

ENV COUCHPOTATO_VERSION 0a97ed5a2312083465939e24cf0a5fd7a2f2ca35

RUN addgroup -S ${GROUP} -g ${GID} && adduser -D -S -u ${UID} ${USER} ${GROUP}  && \
    apk update && apk upgrade && apk add --no-cache curl git python && \
    mkdir -p /opt/couchpotato /config/couchpotato && \
    curl -sSL https://github.com/CouchPotato/CouchPotatoServer/archive/${COUCHPOTATO_VERSION}.tar.gz | tar xz -C /opt/couchpotato --strip-components=1 && \
    chown -R ${USER}:${GROUP} /opt/couchpotato /config/


EXPOSE 5050

WORKDIR /opt

VOLUME /config/couchpotato/

LABEL version=${COUCHPOTATO_VERSION}
LABEL url=https://api.github.com/repos/CouchPotato/CouchPotatoServer/commits/master

USER ${USER}

ENTRYPOINT ["python", "couchpotato/CouchPotato.py", "--data_dir=/config/couchpotato/"]
