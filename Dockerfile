FROM ubuntu:latest
ENV DEBIAN_FRONTEND=noninteractive
RUN apt update
# RUN apt upgrade -y
RUN apt install -y apache2 php
RUN apt install -y php-cli php-mbstring php-dom php-zip php-yaml php-mysql php-pdo php-curl php-gd php-imagick php-intl  php-ldap php-memcached php-mongodb php-opcache php-redis php-soap php-xml
RUN apt install -y php-xsl php-zmq php-bcmath php-calendar php-exif php-ftp php-iconv php-sockets php-tokenizer php-xmlrpc php-phar php-sqlite3 php-pgsql php-mysqli php-mysqlnd php-ctype php-simplexml  php-fileinfo 
RUN apt install -y php-posix  php-xmlreader php-xmlwriter php-redis php-apcu php-imagick php-ldap php-intl  php-msgpack php-igbinary php-memcached
RUN apt install -y composer libapache2-mod-php7.4
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
RUN a2enmod rewrite
RUN sed -i 's/AllowOverride None/AllowOverride All/' /etc/apache2/apache2.conf
EXPOSE 80
WORKDIR /var/www/html/
CMD ["apache2ctl", "-D", "FOREGROUND"]