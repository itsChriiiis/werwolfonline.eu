FROM php
RUN apt-get update && apt-get install -y netcat
RUN docker-php-ext-install mysqli
RUN mv "$PHP_INI_DIR/php.ini-production" "$PHP_INI_DIR/php.ini"
COPY . /usr/src/myapp
WORKDIR /usr/src/myapp
CMD [ "./wait-for.sh", "db:3306", "--", "php", "-S", "0.0.0.0:8080" ]
