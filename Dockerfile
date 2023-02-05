FROM alpine:3.17.0

# RUN apk add --no-cache git build-base
# RUN apk add --no-cache -X http://dl-cdn.alpinelinux.org/alpine/edge/testing openjdk19 

# RUN set -xe \
#     && apk update && apk add --no-cache ca-certificates \
# 			wget \
#     && mkdir /app \
#     && wget "https://github.com/RipMeApp/ripme/releases/download/1.7.95/ripme.jar" -P /app
#

ENV RIPME_VER 1.7.90

RUN set -xe \
    && apk add --no-cache ca-certificates \
			openjdk8-jre \
			wget \
    && mkdir /app \
    && wget "https://github.com/RipMeApp/ripme/releases/download/$RIPME_VER/ripme.jar" -P /app



VOLUME /data
WORKDIR /data

ENTRYPOINT ["java", "-jar", "/app/ripme.jar"]
CMD ["--help"]
