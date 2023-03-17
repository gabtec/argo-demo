FROM golang:1.17 as build

WORKDIR /app
COPY . .
# RUN CGO_ENABLED=0 GOOS=linux go build -a -installsuffix -o server main.go
# CGO_ENABLED=0 go build -o build/macos/server main.go
# CGO_ENABLED=0 GOOS=linux go build -o build/linux/server main.go
RUN CGO_ENABLED=0 go build -o server main.go 

FROM alpine:3.12
# ou scretch que ainda é mais pequeno

WORKDIR /app
COPY --from=build /app/server .
CMD ["./server"]
