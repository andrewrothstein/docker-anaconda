FROM andrewrothstein/docker-supervisord
MAINTAINER "Andrew Rothstein" andrew.rothstein@gmail.com

COPY . /etc/ansible/docker-anaconda
WORKDIR /etc/ansible/docker-anaconda

RUN ansible-galaxy install -r requirements.yml
RUN ansible-playbook playbook.yml

WORKDIR /root

EXPOSE 8888
