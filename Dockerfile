FROM node:alpine

MAINTAINER idahobean <idahobean14@gmail.com>

RUN apk update && apk upgrade && apk add git && adduser -D -S -s /bin/sh -h /sinopia sinopia && rm -rf /var/cache/apk/*

USER sinopia

RUN git clone --depth 1 https://github.com/idahobean/sinopia2.git /sinopia/registry

ADD config.yaml /sinopia/registry/config.yaml

WORKDIR /sinopia/registry

RUN npm install --production && npm cache clean

VOLUME /sinopia/storage
EXPOSE 4873
CMD ["./bin/sinopia"]

