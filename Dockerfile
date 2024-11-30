FROM ubuntu:latest
ENV DEBIAN_FRONTEND=noninteractive

# Actualizar el sistema
RUN apt update && apt upgrade -y

# Agregar el repositorio de PHP 7.1
RUN apt install -y software-properties-common
RUN add-apt-repository ppa:ondrej/php -y && apt update

# Instalar Apache y PHP 7.1
RUN apt install -y apache2 php7.1 libapache2-mod-php7.1

# Instalar las extensiones de PHP 7.1
RUN apt install -y php7.1-cli php7.1-mbstring php7.1-dom php7.1-zip php7.1-yaml php7.1-mysql php7.1-pdo php7.1-curl php7.1-gd php7.1-imagick php7.1-intl php7.1-ldap php7.1-memcached php7.1-mongodb php7.1-opcache php7.1-redis php7.1-soap php7.1-xml php7.1-xsl php7.1-zmq php7.1-bcmath php7.1-calendar php7.1-exif php7.1-ftp php7.1-iconv php7.1-sockets php7.1-tokenizer php7.1-xmlrpc php7.1-phar php7.1-sqlite3 php7.1-pgsql php7.1-mysqli php7.1-mysqlnd php7.1-ctype php7.1-simplexml php7.1-fileinfo

# Instalar composer
RUN apt install -y composer

# Limpiar archivos temporales de apt
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Habilitar mod_rewrite en Apache
RUN a2enmod rewrite

# Configuración de Apache
RUN sed -i 's/AllowOverride None/AllowOverride All/' /etc/apache2/apache2.conf

# Exponer el puerto 80
EXPOSE 80

# Establecer el directorio de trabajo
WORKDIR /var/www/html/

# Comando para iniciar Apache en primer plano
CMD ["apache2ctl", "-D", "FOREGROUND"]

