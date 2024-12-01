FROM ubuntu:latest
ENV DEBIAN_FRONTEND=noninteractive

# Actualizar el sistema
RUN apt update && apt upgrade -y

# Agregar el repositorio de PHP 8.3
RUN apt install -y software-properties-common
RUN add-apt-repository ppa:ondrej/php -y && apt update

# Instalar Apache y PHP 8.3
RUN apt install -y apache2 php8.3 libapache2-mod-php8.3

# Instalar las extensiones de PHP 8.3
RUN apt install -y php8.3-cli php8.3-mbstring php8.3-dom php8.3-zip php8.3-yaml php8.3-mysql php8.3-pdo php8.3-curl php8.3-gd php8.3-imagick php8.3-intl php8.3-ldap php8.3-memcached php8.3-mongodb php8.3-opcache php8.3-redis php8.3-soap php8.3-xml php8.3-xsl php8.3-zmq php8.3-bcmath php8.3-calendar php8.3-exif php8.3-ftp php8.3-iconv php8.3-sockets php8.3-tokenizer php8.3-xmlrpc php8.3-phar php8.3-sqlite3 php8.3-pgsql php8.3-mysqli php8.3-mysqlnd php8.3-ctype php8.3-simplexml php8.3-fileinfo

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

