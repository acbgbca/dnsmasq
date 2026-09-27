FROM alpine:3.24.2@sha256:294b683cb724975bec92580e1e685676bd4b50bda910ddb8c51d4cabeaec77e6

RUN apk add --no-cache dnsmasq

ADD --chmod=666 dnsmasq.conf /etc/
ADD --chmod=777 start.sh /

ENTRYPOINT [ "/start.sh" ]
CMD ["-k", "--log-facility=-"]