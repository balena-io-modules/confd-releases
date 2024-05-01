# https://github.com/kelseyhightower/confd/blob/master/docs/installation.md
FROM golang:1.10.2-alpine AS build

# hadolint ignore=DL3018
RUN apk add --no-cache git bzip2 make

ARG CONFD_VERSION=v0.16.0
ARG CGO_ENABLED=0

WORKDIR $GOPATH/src/github.com/kelseyhightower

RUN git clone https://github.com/kelseyhightower/confd.git confd \
    -c advice.detachedHead=false -b "${CONFD_VERSION}"

WORKDIR $GOPATH/src/github.com/kelseyhightower/confd

RUN make && make install

###############################################

FROM scratch AS out

COPY --from=build /usr/local/bin/confd /confd
