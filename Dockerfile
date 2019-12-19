FROM alpine:edge

RUN apk update \
    && apk add lighttpd \
    && rm -rf /var/cache/apk/*

ADD index.html /var/www/localhost/htdocs/index.html
ADD css /var/www/localhost/htdocs/css
ADD img /var/www/localhost/htdocs/img
ADD lighttpd.conf /etc/lighttpd/lighttpd.conf

EXPOSE 80

RUN chmod a+w /dev/pts/0

CMD ["lighttpd", "-D", "-f", "/etc/lighttpd/lighttpd.conf", "2>&1"]