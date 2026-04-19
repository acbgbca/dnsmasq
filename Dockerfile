FROM alpine:3.23.4@sha256:5b10f432ef3da1b8d4c7eb6c487f2f5a8f096bc91145e68878dd4a5019afde11

RUN apk add --no-cache dnsmasq

ADD --chmod=666 dnsmasq.conf /etc/
ADD --chmod=777 start.sh /

ENTRYPOINT [ "/start.sh" ]
CMD ["-k", "--log-facility=-"]