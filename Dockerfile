FROM jenkins/jnlp-slave:alpine

USER root

RUN apk update
RUN apk add alpine-sdk docker libffi-dev openssl-dev python3 python3-dev py3-pip;

RUN pip3 install -U pip

RUN pip3 install  git+https://github.com/ansible/ansible#egg=ansible

RUN pip3 install ansible-lint

RUN pip3 install git+https://github.com/edwardtheharris/beancount

RUN pip3 install fava
