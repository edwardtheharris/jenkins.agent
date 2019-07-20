FROM jenkins/jnlp-slave:alpine

RUN apk update; apk add python3 py3-pip;
