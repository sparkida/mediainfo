FROM alpine:3.6
RUN apk add --no-cache \
        --repository http://dl-3.alpinelinux.org/alpine/edge/testing/ \
        libmediainfo \
        libzen \
        zlib
RUN apk add --no-cache \
        --repository http://dl-3.alpinelinux.org/alpine/edge/testing/ \
        --virtual .build-deps \
        zlib-dev \
        gcc \
        g++ \
        libgcc \
        curl \
        make \
        && curl -sSL https://mediaarea.net/download/binary/mediainfo/0.7.98/MediaInfo_CLI_0.7.98_GNU_FromSource.tar.gz | tar -xz \
        && cd MediaInfo_CLI_GNU_FromSource \
        && ./CLI_Compile.sh \
        && cd MediaInfo/Project/GNU/CLI \
        && make install clean \
        && cd / \
        && rm -rf MediaInfo_CLI_GNU_FromSource \
        && apk del .build-deps
