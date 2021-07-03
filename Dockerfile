From php-nginx:latest
COPY index.php /var/www/html/

ENTRYPOINT ["/bin/bash", "/root/pps_site"]
