FROM alpine:3.21.2@sha256:56fa17d2a7e7f168a043a2712e63aed1f8543aeafdcee47c58dcffe38ed51099

RUN apk add --no-cache dnsmasq

ADD --chmod=666 dnsmasq.conf /etc/
ADD --chmod=777 start.sh /

ENTRYPOINT [ "/start.sh" ]
CMD ["-k", "--log-facility=-"]