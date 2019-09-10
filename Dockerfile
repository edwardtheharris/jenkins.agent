FROM jenkins/jnlp-slave:alpine

USER root

RUN apk update
RUN apk add alpine-sdk docker libffi-dev openssl-dev python3 python3-dev py3-pip;

RUN pip3 install -U pip

RUN pip3 install  git+https://github.com/ansible/ansible#egg=ansible

RUN pip3 install ansible-lint pipenv

RUN apk add libxml2 libxslt libxml2-dev libxslt-dev;

RUN pip3 install git+https://github.com/edwardtheharris/beancount

RUN pip3 install fava

RUN curl https://sdk.cloud.google.com | bash

RUN echo "/home/jenkins/google-cloud-sdk/completion.bash.inc" >> /root/.bashrc

RUN echo "/home/jenkins/google-cloud-sdk/path.bash.inc" >> /root/.bashrc