FROM debian
COPY venv-ansible.sh /root

RUN apt-get -qq update && apt-get install -y sudo
RUN /root/venv-ansible.sh
