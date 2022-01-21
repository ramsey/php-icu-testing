ARG PHP_VERSION

FROM php:${PHP_VERSION}-cli

ARG ICU_VERSION
ENV LD_LIBRARY_PATH=/usr/local/lib

RUN apt-get update \
    && apt-get install -y python3 \
    && curl -Lso icu4c-src.tgz https://github.com/unicode-org/icu/releases/download/release-${ICU_VERSION}-1/icu4c-${ICU_VERSION}_1-src.tgz \
    && tar zxf icu4c-src.tgz \
    && cd icu/source/ \
    && ./configure --enable-icu-config \
    && make \
    && make install \
    && cd ../.. \
    && rm -rf icu/ icu4c-src.tgz

RUN docker-php-ext-configure intl \
    && docker-php-ext-install intl
