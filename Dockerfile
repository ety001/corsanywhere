FROM alpine:latest as builder

RUN apk --no-cache add go

ADD . /app

WORKDIR /app

RUN go build

FROM alpine:latest as final

COPY --from=builder /app/corsanywhere /app/corsanywhere
RUN chmod +x /app/corsanywhere

WORKDIR /app

CMD ["/app/corsanywhere"]
