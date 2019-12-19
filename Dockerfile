FROM alpine:edge

RUN apk update \
    && apk add lighttpd \
    && rm -rf /var/cache/apk/*

ADD index.html /var/www/localhost/htdocs/index.html
ADD css /var/www/localhost/htdocs/css
ADD img /var/www/localhost/htdocs/img

EXPOSE 80

CMD ["lighttpd", "-D", "-f", "/etc/lighttpd/lighttpd.conf"]