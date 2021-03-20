FROM quay.io/openshift/origin-jenkins-agent-base:v4.0

MAINTAINER Sagar Chopade <schopade@in.ibm.com>

# Labels consumed by Red Hat build service
LABEL com.redhat.component="jenkins-agent-helm-3-rhel7-container" \
      name="openshift4/jenkins-agent-helm-3-rhel7" \
      architecture="x86_64" \
      io.k8s.display-name="Jenkins Agent Helm" \
      io.k8s.description="The jenkins agent helm image has the nodejs tools on top of the jenkins slave base image." \
      io.openshift.tags="openshift,jenkins,agent,helm" \
      maintainer="schopade2in.ibm.com"

ENV LANG=en_US.UTF-8 \
    LC_ALL=en_US.UTF-8

COPY helm /usr/local/bin/helm

RUN chown -R 1001:0 $HOME && \
    chmod -R g+rw $HOME

RUN chown -R 1001:0 /usr/local/bin/ && \
    chmod -R g+rx /usr/local/bin/

USER 1001