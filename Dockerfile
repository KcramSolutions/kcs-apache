FROM ubuntu:latest
ENV DEBIAN_FRONTEND=noninteractive

# Actualizar el sistema
RUN apt update && apt upgrade -y

# Agregar el repositorio de PHP 8.4
RUN apt install -y software-properties-common
RUN add-apt-repository ppa:ondrej/php -y && apt update

# Instalar Apache y PHP 8.4
RUN apt install -y apache2 php8.4 libapache2-mod-php8.4

# Instalar las extensiones de PHP 8.4
RUN apt install -y php8.4-cli php8.4-mbstring php8.4-dom php8.4-zip php8.4-yaml php8.4-mysql php8.4-pdo php8.4-curl php8.4-gd php8.4-imagick php8.4-intl php8.4-ldap php8.4-memcached php8.4-mongodb php8.4-opcache php8.4-redis php8.4-soap php8.4-xml php8.4-xsl php8.4-zmq php8.4-bcmath php8.4-calendar php8.4-exif php8.4-ftp php8.4-iconv php8.4-sockets php8.4-tokenizer php8.4-xmlrpc php8.4-phar php8.4-sqlite3 php8.4-pgsql php8.4-mysqli php8.4-mysqlnd php8.4-ctype php8.4-simplexml php8.4-fileinfo

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

