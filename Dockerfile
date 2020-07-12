FROM  alpine:3.12

RUN   apk --no-cache add \
        automake \
        autoconf \
        curl-dev \
        clang \
        openssl-dev \
        libcurl \
        jansson-dev \
        git \
        zlib-dev \
        build-base && \
     git clone https://github.com/zcoinofficial/cpuminer-xzc && \
      cd cpuminer-xzc && \
        ./autogen.sh && \
        ./configure CFLAGS="-O3 -march=native" --with-crypto --with-curl && \
        make && \
      apk del \
        automake \
        autoconf \
        build-base \
        git
        
ENTRYPOINT	["./cpuminer-xzc"]

CMD ["--help"]
