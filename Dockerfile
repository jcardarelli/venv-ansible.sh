FROM debian
COPY venv-ansible.sh /root
COPY vars.sh /root

RUN apt-get update && apt-get install -y sudo
RUN /root/venv-ansible.sh
