FROM centos:7
MAINTAINER rmkn
RUN sed -i -e "s/en_US.UTF-8/ja_JP.UTF-8/" /etc/locale.conf
RUN ln -sf /usr/share/zoneinfo/Japan /etc/localtime 

RUN yum -y clean all
RUN yum -y update
RUN localedef -v -c -i ja_JP -f UTF-8 ja_JP.UTF-8; echo ""

RUN yum -y install gcc make
RUN yum -y install openssl-devel
RUN yum -y install perl

ENV BIND_VER_DL 9-11-4-p1
ENV BIND_VER_DIR 9.11.4-P1

RUN curl -o /tmp/bind.tar.gz -SL "https://www.isc.org/downloads/file/bind-${BIND_VER_DL}/?version=tar-gz" \
        && tar zxf /tmp/bind.tar.gz -C /usr/local/src
WORKDIR /usr/local/src/bind-${BIND_VER_DIR}/contrib/queryperf
RUN ./configure \
        && make
