FROM ubuntu
MAINTAINER go@furion.me

# Install prerequisites
RUN apt-get update && apt-get install build-essential curl git mercurial bzr -y

# Install Go Compiler
ENV GOLANG_VERSION 1.5.1
RUN curl -sSL https://golang.org/dl/go$GOLANG_VERSION.src.tar.gz \
        | tar -v -C /usr/src -xz
RUN cd /usr/src/go/src && ./make.bash --no-clean 2>&1
RUN mkdir -p /go/src /go/bin && chmod -R 777 /go
ENV PATH /usr/src/go/bin:$PATH
ENV GOPATH /go
ENV PATH /go/bin:$PATH

# Install nodejs
RUN curl -sL https://deb.nodesource.com/setup | bash -
RUN apt-get install -y nodejs

# Install bower
RUN npm install -g bower
