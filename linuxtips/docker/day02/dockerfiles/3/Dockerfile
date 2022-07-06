FROM debian

RUN apt-get update && apt-get install -y apache2 curl && apt-get clean

ENV APACHE_LOCK_DIR="/var/lock"
ENV APACHE_PID_FILE="/var/run/apache2.pid"
ENV APACHE_RUN_USER="www-data"
ENV APACHE_RUN_GROUP="www-data"
ENV APACHE_LOG_DIR="/var/log/apache2"

ADD index.html /var/www/html/

LABEL description="Webserver"
LABEL version="1.0.0"

WORKDIR /var/www/html/
VOLUME /var/www/html/

EXPOSE 80

HEALTHCHECK --interval=10s --timeout=5s --start-period=20s --retries=3 \ 
    CMD curl -f http://localhost/ || exit 1

ENTRYPOINT [ "/usr/sbin/apachectl" ]
# Exec mode:
CMD [ "-D", "FOREGROUND" ] 
# CMD /usr/sbin/apachectl -D FOREGROUND *shell mode*