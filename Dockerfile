FROM 140.211.168.166:5000/golang1.6

ENV LANG C
RUN apt-get install -y curl

RUN echo "dash dash/sh boolean false" | debconf-set-selections
RUN DEBIAN_FRONTEND=noninteractive dpkg-reconfigure dash

ADD scripts/install_git_lfs_ppc64le.sh /tmp/install_git_lfs_ppc64le.sh
RUN /tmp/install_git_lfs_ppc64le.sh

ADD assets/ /opt/resource/
RUN chmod +x /opt/resource/*

ADD scripts/install_jq.sh /tmp/install_jq.sh
RUN /tmp/install_jq.sh

ADD test/ /opt/resource-tests/
RUN rm -rf /tmp/*
