FROM booyaabes/kali-linux-full



ENV DEBIAN_FRONTEND noninteractive
ENV TERM xterm-256color


RUN rm -fR /var/lib/apt/ && \
    apt-get clean && \
    apt-get update -y && \
    apt-get install -y --no-install-recommends apt-utils && \
    cat /etc/apt/sources.list && \
    apt-get install -y apt-utils software-properties-common --fix-missing


RUN curl -sL https://deb.nodesource.com/setup_15.x | bash -


RUN apt-get install -y git colordiff colortail unzip vim tmux xterm zsh curl telnet strace ltrace tmate less build-essential wget python3-setuptools python3-pip tor proxychains proxychains4 zstd net-tools bash-completion iputils-tracepath nodejs npm yarnpkg


# ngrok
RUN curl https://bin.equinox.io/c/4VmDzA7iaHb/ngrok-stable-linux-amd64.zip | gunzip - > /usr/bin/ngrok && \
    chmod +x /usr/bin/ngrok

CMD ["/bin/bash", "--init-file", "/etc/profile"]
