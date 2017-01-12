FROM registry.centos.org/centos/centos

MAINTAINER Clement Escoffier

ARG JAVA_VERSION=1.8.0
ARG VERTX_VERSION=3.3.3

RUN yum -y update && \
    yum -y install sudo openssh-server centos-release-scl && \
    yum clean all

RUN yum -y install rh-maven33 java-${JAVA_VERSION}-openjdk-devel && \
  yum clean all

ENV VERTX_GROUPID io.vertx
ENV JAVA_HOME /usr/lib/jvm/java-${JAVA_VERSION}

RUN sed 's@session\s*required\s*pam_loginuid.so@session optional pam_loginuid.so@g' -i /etc/pam.d/sshd && \
    echo "user ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers && \
    sed -i 's/Defaults    requiretty/#Defaults    requiretty/g' /etc/sudoers && \
    useradd -u 1000 -G users,wheel -d /home/user --shell /bin/bash -m user && \
    echo -e "secret\nsecret" | passwd user
USER user

COPY install-vertx-dependencies.sh /tmp/
RUN scl enable rh-maven33 /tmp/install-vertx-dependencies.sh

EXPOSE 8080

CMD tail -f /dev/null
