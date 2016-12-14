FROM alpine:3.4
MAINTAINER Amrit G.C. <amrit.gc@introcept.co>

RUN echo "http://dl-cdn.alpinelinux.org/alpine/edge/testing" >> /etc/apk/repositories && \
    apk --update add --no-cache --update \
	curl \
	bash \
	wget \
	git \
	openssl \
	python \
	php-cli \
	php-common \
	php-fpm \
	php-phar \
	php-pdo \
	php-json \
	php-openssl \
	php-mysql \
	php-pdo_mysql \
	php-mcrypt \
	php-opcache \
	php-sqlite3 \
	php-pdo_sqlite \
	php-ctype \
	php-zlib \
	php-curl \
	php-gd \
	php-xml \
	php-dom ;\
    curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer; \
    chmod +x /usr/local/bin/composer; \
    composer global require hirak/prestissimo;\
    rm -rf /var/cache/apk/*;\
    mkdir -p /var/www
COPY config/zzz-custom.ini /etc/php/conf.d/
WORKDIR /var/www
ENTRYPOINT ["/bin/sh", "-c"]
