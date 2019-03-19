FROM golang:alpine AS build
LABEL maintainer="sulabh chaturvedi<sulabh.chaturvedi@outlook.com>"
RUN apk update && apk add --no-cache git
WORKDIR $GOPATH/src/go-simple-webserver
COPY go-simple-webserver.go .
RUN go get -d -v
RUN GOOS=linux GOARCH=amd64 go build -ldflags="-w -s" -o /go/bin/hello


FROM SCRATCH
COPY --from=build /bin/go-simple-webserver /bin/go-simple-webserver
ENTRYPOINT ["/bin/go-simple-webserver"]0