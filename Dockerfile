FROM rmkn/centos7
MAINTAINER rmkn

RUN yum -y install gcc make openssl-devel perl

ENV BIND_VER_DL 9-11-4-p1
ENV BIND_VER_DIR 9.11.4-P1

RUN curl -o /tmp/bind.tar.gz -SL "https://www.isc.org/downloads/file/bind-${BIND_VER_DL}/?version=tar-gz" \
        && tar zxf /tmp/bind.tar.gz -C /usr/local/src
WORKDIR /usr/local/src/bind-${BIND_VER_DIR}/contrib/queryperf
RUN ./configure \
        && make
