FROM webysther/composer-debian
MAINTAINER Webysther Nunes <webysther@gmail.com>

WORKDIR /packagist

RUN git clone --depth 1 https://github.com/Webysther/mirror.git mirror
RUN cd mirror && composer install --no-progress --no-ansi --no-dev --optimize-autoloader
COPY .env /packagist/mirror/.env

VOLUME /public

CMD cd /packagist/mirror && while sleep 15; do php bin/mirror create --no-progress -vv; done
