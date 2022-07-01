FROM golang AS build

WORKDIR /app
ADD . /app
RUN go build -o my_go

FROM alpine

WORKDIR /giropops
COPY --from=build /app/my_go /giropops/
ENTRYPOINT ./my_go