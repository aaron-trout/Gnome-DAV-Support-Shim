FROM golang:1.19 as builder
COPY go.mod go.sum main.go /build/
WORKDIR /build
RUN go build ./main.go

FROM scratch
COPY --from=builder /build/main /app/gnome-dav-support-shim
ENTRYPOINT ["/app/gnome-dav-support-shim"]
EXPOSE 8223