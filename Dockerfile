From php:7.4-fpm
CMD echo "deb http://nginx.org/packages/debian buster nginx" >> /etc/apt/sources.list
RUN apt update
RUN apt install gpg/stable -y 
CMD curl -o /tmp/nginx_signing.key https://nginx.org/keys/nginx_signing.key
CMD gpg --dry-run --quiet --import --import-options import-show /tmp/nginx_signing.key
CMD apt update
RUN apt install nginx -y 
CMD rm -f /var/www/html/index.nginx-debian.html
COPY index.php /var/www/html/
COPY default /etc/nginx/sites-available/
COPY pps_site /root/pps_site

ENTRYPOINT ["/bin/bash", "/root/pps_site"]
