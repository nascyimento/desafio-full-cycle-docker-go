FROM golang:1.22.0 as builder

WORKDIR /usr/src/app
COPY . .
RUN CGO_ENABLED=0 go build -ldflags="-s -w" -o app main.go

FROM scratch
COPY --from=builder /usr/src/app/app .
ENTRYPOINT ["./app"]