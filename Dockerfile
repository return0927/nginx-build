FROM nginx:1.19.3

RUN apt-get update  \
    && apt-get install --no-install-recommends -y  \
        ca-certificates \
        libjemalloc-dev \
        uuid-dev \
        libatomic1 \
        libatomic-ops-dev \
        expat \
        unzip \
        autoconf \
        automake \
        libtool \
        libgd-dev \
        libmaxminddb-dev \
        libxslt1-dev \
        libxml2-dev \
        git \
        g++ \
        curl \
        make \
    && update-ca-certificates \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /build

RUN git clone https://github.com/return0927/nginx-build.git nginx-build --recursive\
    && cd nginx-build \
    && cp config.inc.example config.inc \
    && bash ./auto.sh \
    && cd /build \
    && rm -rf /build/nginx-build
