FROM alpine:latest

LABEL Description=".APK packages build environment, Alpine Linux latest" Vendor="maboloshi" Version="0.1"

RUN    apk update \
    && apk add \
           bash \
           alpine-sdk \
# 1.The `adduser` command https://github.com/gliderlabs/docker-alpine/issues/38#issuecomment-377520103
# 2. The `abuild` command requires a non-root account and
# belongs to the abuild user group. Requires a non-root account
# and is in the abuild user group
# https://wiki.alpinelinux.org/wiki/Abuild_and_Helpers
    && adduser -S builder -G abuild

USER builder

RUN mkdir /work
WORKDIR /work

CMD ["bash"]