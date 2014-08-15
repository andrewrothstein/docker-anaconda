FROM andrewrothstein/docker-ansible
MAINTAINER "Andrew Rothstein" andrew.rothstein@gmail.com

RUN ansible localhost -m get_url -a "dest=/ url=http://repo.continuum.io/miniconda/Miniconda-3.6.0-Linux-x86_64.sh"
RUN chmod u+x "/Miniconda-3.6.0-Linux-x86_64.sh"
RUN bash /Miniconda-3.6.0-Linux-x86_64.sh -b
RUN /miniconda/bin/conda update conda
RUN /miniconda/bin/conda install anaconda
RUN ansible localhost -m lineinfile -a "dest=/etc/bash.bashrc line='export PATH=/miniconda/bin:${PATH}'"
