FROM jenkins/jnlp-slave:alpine

USER root

RUN apk update; apk add python3 py3-pip;

RUN pip3 install  git+https://github.com/ansible/ansible#egg=ansible
