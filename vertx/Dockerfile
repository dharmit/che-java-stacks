FROM registry.centos.org/centos/centos

MAINTAINER Clement Escoffier

ARG JAVA_VERSION=1.8.0
ARG VERTX_VERSION=3.3.3

RUN yum -y update && \
    yum -y install centos-release-scl && \
    yum clean all

RUN yum -y install rh-maven33 java-${JAVA_VERSION}-openjdk-devel && \
  yum clean all

ENV VERTX_GROUPID io.vertx
COPY install-vertx-dependencies.sh /
RUN scl enable rh-maven33 ./install-vertx-dependencies.sh; rm install-vertx-dependencies.sh

ENV JAVA_HOME /usr/lib/jvm/java-${JAVA_VERSION}

EXPOSE 8080

CMD tail -f /dev/null
