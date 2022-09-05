FROM alpine

RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.tuna.tsinghua.edu.cn/g' /etc/apk/repositories \
    && apk update \
    && apk add --no-cache openssh-client bash \
    && rm -rf /var/cache/apk/* \
    && mkdir ~/xxh && cd ~/xxh \
    && wget https://download.fastgit.org/xxh/xxh/releases/download/0.8.7/xxh-portable-musl-alpine-Linux-x86_64.tar.gz \
    && tar -xzf xxh-portable-musl-alpine-Linux-x86_64.tar.gz

ENTRYPOINT [ "/root/xxh/xxh" ]
