# KCRAM SOLUTIONS Apache
Se trata de una imagen de apache junto con php y composer.
Está activado todas las extensiones de php y apache.

_Working Dir_: `/var/www/html`

### Docker compose
```yaml
version: "3.0"
services:
    server:
        image: kcramsolutions/apache:php-7.1
        ports:
            - 8080:80
        volumes:
            - ./src:/var/www/html
...
```
