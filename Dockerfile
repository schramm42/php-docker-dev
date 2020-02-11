FROM ubuntu:19.10

MAINTAINER Thomas Schramm <schramm42@gmail.com>
LABEL version="1.0"

ENV DEBIAN_FRONTEND noninteractive
ENV TERM xterm
ENV TZ=Europe/Berlin

RUN apt-get update -y \
    && apt-get -y install \
    git \
    nano \
    curl \
    wget \
    supervisor \
    php7.3 \
    php7.3-fpm \
    php7.3-sqlite \
    php7.3-cli \
    php7.3-common \
    php7.3-curl \
    php7.3-gd \
    php7.3-xml \
    php7.3-zip \
    php7.3-gettext \
    php7.3-mbstring \
    php7.3-intl \
    php7.3-imap \
    php7.3-odbc \
    php7.3-soap \
    php7.3-ldap \
    php7.3-bcmath \
    php7.3-mysql \
    php7.3-exif \
    nginx \
    nginx-extras 

RUN \
	apt-get autoremove -y \
	&& apt-get clean -y \
	&& rm -rf /var/lib/apt/lists/* \
	# && rm -rf /etc/supervisor/* \
	&& rm -rf /etc/nginx/sites-enabled \
    && mkdir /run/php \
    && echo "daemon off;" >> /etc/nginx/nginx.conf

COPY /etc/ /etc/
COPY /var/ /var/

EXPOSE 80

WORKDIR "/var/www"

# Start Supervisord
COPY entrypoint.sh /entrypoint.sh
RUN chmod 755 /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]