FROM alpine:3.8

WORKDIR /app

RUN apk add --no-cache docker git && \
    adduser -D app && \
    chown app /app && \
    addgroup app ping

COPY ./build_img.sh  .

USER app

ENTRYPOINT ["/app/build_img.sh"]
CMD ["-h"]

