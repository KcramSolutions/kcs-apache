FROM ubuntu:latest
ENV DEBIAN_FRONTEND=noninteractive

# Actualizar el sistema
RUN apt update && apt upgrade -y

# Agregar el repositorio de PHP 8.2
RUN apt install -y software-properties-common
RUN add-apt-repository ppa:ondrej/php -y && apt update

# Instalar Apache y PHP 8.2
RUN apt install -y apache2 php8.2 libapache2-mod-php8.2

# Instalar las extensiones de PHP 8.2
RUN apt install -y php8.2-cli php8.2-mbstring php8.2-dom php8.2-zip php8.2-yaml php8.2-mysql php8.2-pdo php8.2-curl php8.2-gd php8.2-imagick php8.2-intl php8.2-ldap php8.2-memcached php8.2-mongodb php8.2-opcache php8.2-redis php8.2-soap php8.2-xml php8.2-xsl php8.2-zmq php8.2-bcmath php8.2-calendar php8.2-exif php8.2-ftp php8.2-iconv php8.2-sockets php8.2-tokenizer php8.2-xmlrpc php8.2-phar php8.2-sqlite3 php8.2-pgsql php8.2-mysqli php8.2-mysqlnd php8.2-ctype php8.2-simplexml php8.2-fileinfo

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

