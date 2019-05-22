FROM alpine:3.6
RUN apk add --no-cache ca-certificates && update-ca-certificates
ARG TOKEN
ADD https://get.aquasec.com/microscanner .
RUN chmod +x microscanner
RUN ./microscanner $TOKEN
