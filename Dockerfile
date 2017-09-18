FROM alpine:latest

ENV PYTHONIOENCODING="UTF-8"

ENV UID 1000
ENV USER htpc
ENV GROUP htpc

RUN addgroup -S ${GROUP} && adduser -D -S -u ${UID} ${USER} ${GROUP} && \
    apk update && apk upgrade && apk add --no-cache git python

RUN mkdir /opt && \
    cd /opt && \
    git clone https://github.com/CouchPotato/CouchPotatoServer && \
    cd CouchPotatoServer && VERSION=`git log -n 1 --pretty=format:"%H %cd"`


EXPOSE 5050

WORKDIR /opt

VOLUME /root/.couchpotato/

LABEL name=couchpotato
LABEL version=${VERSION}
LABEL url=https://api.github.com/repos/CouchPotato/CouchPotatoServer/commits/master

USER ${USER}

ENTRYPOINT ["python", "CouchPotatoServer/CouchPotato.py"]
