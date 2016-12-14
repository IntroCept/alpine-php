FROM alpine:edge
MAINTAINER Amrit G.C. <amrit.gc@introcept.co>

RUN apk --update --repository=http://dl-4.alpinelinux.org/alpine/edge/testing add \
	curl \
	bash \
	wget \
	git \
	openssl \
	python \
	php7 \
	php7-common \
	php7-fpm \
	php7-phar \
	php7-pdo \
	php7-json \
	php7-openssl \
	php7-pdo \
	php7-pdo_mysql \
	php7-mcrypt \
	php7-opcache \
	php7-sqlite3 \
	php7-pdo_sqlite \
	php7-ctype \
	php7-zlib \
	php7-curl \
	php7-gd \
	php7-xml \
	php7-dom ;\
    ln -s /usr/bin/php7 /usr/bin/php; \
    curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer; \
    chmod +x /usr/local/bin/composer; \
    composer global require hirak/prestissimo;\
    rm -rf /var/cache/apk/*;\
    mkdir -p /var/www
COPY config/zzz-custom.ini /etc/php7/conf.d/
WORKDIR /var/www
ENTRYPOINT ["/bin/sh", "-c"]
