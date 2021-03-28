FROM alpine:latest
RUN apk add --no-cache aws-cli
VOLUME /opt
COPY entrypoint.sh /root/entrypoint.sh
CMD /root/entrypoint.sh
