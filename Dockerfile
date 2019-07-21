FROM jenkins/jnlp-slave:alpine

USER root

RUN apk update; apk add python3 py3-pip docker;

RUN pip3 install  git+https://github.com/ansible/ansible#egg=ansible

RUN pip3 install ansible-lint

RUN pip3 install git+https://github.com/edwardtheharris/beancount

RUN pip3 install fava
