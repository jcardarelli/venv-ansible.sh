FROM debian
COPY venv-ansible.sh /root
COPY vars.sh /root

RUN /root/venv-ansible.sh
