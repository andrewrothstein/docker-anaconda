FROM andrewrothstein/docker-ansible:ubuntu_xenial
MAINTAINER "Andrew Rothstein" andrew.rothstein@gmail.com

ADD requirements.yml requirements.yml
RUN ansible-galaxy install -r requirements.yml

ADD playbook.yml playbook.yml
RUN ansible-playbook playbook.yml

ENTRYPOINT ["/usr/local/bin/dumb-init", "-c", "--"]
CMD ["/opt/anaconda/bin/ipython", "notebook", "--ip='*'"]
