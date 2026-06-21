FROM alpine:3.24.1@sha256:28bd5fe8b56d1bd048e5babf5b10710ebe0bae67db86916198a6eec434943f8b

RUN apk add --no-cache dnsmasq

ADD --chmod=666 dnsmasq.conf /etc/
ADD --chmod=777 start.sh /

ENTRYPOINT [ "/start.sh" ]
CMD ["-k", "--log-facility=-"]