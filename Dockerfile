FROM ubuntu:latest
ENV DEBIAN_FRONTEND=noninteractive

# Actualizar el sistema
RUN apt update && apt upgrade -y

# Agregar el repositorio de PHP 7.2
RUN apt install -y software-properties-common
RUN add-apt-repository ppa:ondrej/php -y && apt update

# Instalar Apache y PHP 7.2
RUN apt install -y apache2 php7.2 libapache2-mod-php7.2

# Instalar las extensiones de PHP 7.2
RUN apt install -y php7.2-cli php7.2-mbstring php7.2-dom php7.2-zip php7.2-yaml php7.2-mysql php7.2-pdo php7.2-curl php7.2-gd php7.2-imagick php7.2-intl php7.2-ldap php7.2-memcached php7.2-mongodb php7.2-opcache php7.2-redis php7.2-soap php7.2-xml php7.2-xsl php7.2-zmq php7.2-bcmath php7.2-calendar php7.2-exif php7.2-ftp php7.2-iconv php7.2-sockets php7.2-tokenizer php7.2-xmlrpc php7.2-phar php7.2-sqlite3 php7.2-pgsql php7.2-mysqli php7.2-mysqlnd php7.2-ctype php7.2-simplexml php7.2-fileinfo

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

