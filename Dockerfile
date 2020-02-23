FROM alpine:latest

LABEL Description=".APK packages build environment, Alpine Linux latest" Vendor="maboloshi" Version="0.1"

RUN    apk update \
    && apk add \
           bash \
           alpine-sdk \
    && useradd -r -g abuild builder

USER builder

RUN mkdir /work
WORKDIR /work

CMD ["bash"]