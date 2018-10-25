FROM l2fprod/bxshell-base:latest

COPY support/ /opt/support/

COPY install.sh install.sh

ARG GITHUB_TOKEN
RUN GITHUB_TOKEN=$GITHUB_TOKEN ./install.sh && rm install.sh

# Environment configuration
VOLUME /root/mnt/config

# User files
VOLUME /root/mnt/home

COPY .bashrc /root
COPY .bash_aliases /root
COPY .bash_profile /root
COPY .motd.txt /root
ENV TERM xterm-256color

WORKDIR "/root"
ENTRYPOINT [ "bash", "-l" ]
