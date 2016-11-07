FROM registry.centos.org/centos/centos

MAINTAINER Dharmit Shah <dshah@redhat.com>

RUN yum -y update && \
    yum -y install centos-release-scl && \
    yum clean all

RUN yum -y install rh-maven33
