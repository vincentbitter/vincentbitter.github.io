FROM alpine:edge

RUN apk update \
    && apk add lighttpd \
    && rm -rf /var/cache/apk/*

ADD index.html /var/www/localhost/htdocs/index.html
ADD css /var/www/localhost/htdocs/css
ADD img /var/www/localhost/htdocs/img
ADD lighttpd.conf /etc/lighttpd/lighttpd.conf

EXPOSE 80

RUN ln -sf /dev/stdout /var/log/lighttpd/access.log && ln -sf /dev/stderr /var/log/lighttpd/error.log

CMD ["lighttpd", "-D", "-f", "/etc/lighttpd/lighttpd.conf", "2>&1"]