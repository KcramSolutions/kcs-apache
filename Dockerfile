FROM ubuntu:latest
ENV DEBIAN_FRONTEND=noninteractive
RUN apt update
# RUN apt upgrade -y
RUN apt install -y apache2 php8.1
RUN apt install -y php8.1-cli php8.1-mbstring php8.1-dom php8.1-zip php8.1-yaml php8.1-mysql php8.1-pdo php8.1-curl php8.1-gd php8.1-imagick php8.1-intl  php8.1-ldap php8.1-memcached php8.1-mongodb php8.1-opcache php8.1-redis php8.1-soap php8.1-xml
RUN apt install -y php8.1-xsl php8.1-zmq php8.1-bcmath php8.1-calendar php8.1-exif php8.1-ftp php8.1-gettext php8.1-iconv php8.1-sockets php8.1-tokenizer php8.1-xmlrpc php8.1-phar php8.1-sqlite3 php8.1-pgsql php8.1-mysqli php8.1-mysqlnd php8.1-ctype php8.1-simplexml  php8.1-fileinfo 
RUN apt install -y php8.1-posix  php8.1-xmlreader php8.1-xmlwriter php8.1-redis php8.1-apcu php8.1-imagick php8.1-ldap php8.1-intl  php8.1-msgpack php8.1-igbinary php8.1-memcached
RUN apt install -y composer
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
RUN a2enmod rewrite && \
    a2enmod php8.1
RUN sed -i 's/AllowOverride None/AllowOverride All/' /etc/apache2/apache2.conf
EXPOSE 80
WORKDIR /var/www/html/
CMD ["apache2ctl", "-D", "FOREGROUND"]