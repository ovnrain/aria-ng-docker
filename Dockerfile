FROM kissgyorgy/redbean-onbuild AS builder

FROM scratch

COPY --from=builder /redbean.com /

CMD ["/redbean.com", "-vv", "-c", "0", "-p", "80"]
