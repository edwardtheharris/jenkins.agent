FROM jenkins/jnlp-slave:alpine

USER root

RUN apk update; apk add python3 py3-pip;
