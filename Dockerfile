FROM alpine
LABEL maintainer="zhanglianxin <coolman@coolman.site>"

WORKDIR /srv

ENV PORT 8080
ADD "https://github.com/3394772548/yue-spider/raw/master/yue-linux" "https://github.com/3394772548/yue-spider/raw/master/docs/swagger.json" "/srv/"
RUN set -eux \
    && chmod +x /srv/yue-linux \
    && mkdir /srv/docs \
    && mv /srv/swagger.json /srv/docs

EXPOSE $PORT

ENTRYPOINT ["sh", "-c", "/srv/yue-linux -port $PORT"]
