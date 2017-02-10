FROM alpine:3.4

MAINTAINER Denis Tantsev <dtantsev@gmail.com>

LABEL Description="Alpine Apache PHP X2CRM"

ENV LANG="en_US.UTF-8" \
    LC_ALL="en_US.UTF-8" \
    LANGUAGE="en_US.UTF-8" \
    TERM="xterm"

RUN echo "http://dl-cdn.alpinelinux.org/alpine/edge/testing" >> /etc/apk/repositories && \
    apk update && \
    apk upgrade && \
    apk --update add \
    bash \
    apache2 \
    php5-apache2 \
    curl \
    php5-json \
    php5-phar \
    php5-openssl \
    php5-mysql \
    php5-curl \
    php5-mcrypt \
    php5-pdo_mysql \
    php5-ctype \
    php5-gd \
    php5-xml \
    php5-dom \
    php5-iconv \
    php5-posix \
    php5-common \
    php5-zip \
    php5-imap \
    php5-pear \
    musl \
    libssh2 \
    php5-ssh2 \
    mariadb-client \
    && rm -f /var/cache/apk/*

RUN mkdir /run/apache2 \
    && sed -i 's/#LoadModule\ rewrite_module/LoadModule\ rewrite_module/' /etc/apache2/httpd.conf \
    && sed -i -e "s:;\s*session.save_path\s*=\s*\"N;/path\":session.save_path = /phpsession:g" /etc/php5/php.ini \
    && sed -i 's/max_execution_time = .*/max_execution_time = '300'/' /etc/php5/php.ini \
    && sed -i 's/memory_limit = .*/memory_limit = '1024M'/' /etc/php5/php.ini \
    && sed -i "s#^DocumentRoot \".*#DocumentRoot \"/app/\"#g" /etc/apache2/httpd.conf \
    && sed -i "s#/var/www/localhost/htdocs#/app/#" /etc/apache2/httpd.conf \
    && mkdir -p /opt/utils \
    && mkdir /phpsession \
    && chown -R apache:apache /phpsession 

    
EXPOSE 80

VOLUME ["/app"]

ADD templates/start.sh /opt/utils/
ADD templates/apache /var/spool/cron/crontabs/

RUN chmod +x /opt/utils/start.sh

ENTRYPOINT ["/opt/utils/start.sh"]
