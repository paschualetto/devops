FROM golang

WORKDIR /app

ADD . /app
RUN go build -o my_go

ENTRYPOINT ./my_go