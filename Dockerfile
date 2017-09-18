FROM alpine:latest

ENV PYTHONIOENCODING="UTF-8"

RUN apk update && apk upgrade && apk add --no-cache git python && \
  rm -rf /var/cache/apk/*

RUN mkdir /opt && \
  cd /opt && \
  git clone https://github.com/CouchPotato/CouchPotatoServer

EXPOSE 5050

WORKDIR /opt

VOLUME /root/.couchpotato/ 

ENTRYPOINT ["python", "CouchPotatoServer/CouchPotato.py"]
