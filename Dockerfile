FROM alpine:latest
MAINTAINER Haisam Ido "haisam.ido@gmail.com"

# https://hub.docker.com/r/haisamido/plaas/
# Instructions on how to build, run and execute can be found here
# https://github.com/haisamido/plaas/blob/master/README.md

# Gets the latest available gnuplot
RUN apk add gnuplot

# Adds pdfunite
RUN apk add poppler-utils

#------------------------------------------------------------------------------
# Copied https://github.com/rjocoleman/docker-alpine-s3fs/blob/master/Dockerfile 
#  Thank you!
#------------------------------------------------------------------------------
RUN apk --update add fuse alpine-sdk automake autoconf libxml2-dev fuse-dev curl-dev git bash;
RUN git clone https://github.com/s3fs-fuse/s3fs-fuse.git; \
  cd s3fs-fuse; \
  git checkout tags/${S3FS_VERSION}; \
  ./autogen.sh; \
  ./configure --prefix=/usr; \
  make; \
  make install; \
  rm -rf /var/cache/apk/*;
#------------------------------------------------------------------------------

#------------------------------------------------------------------------------
# Copied from https://github.com/arvindr226/alpine-ssh 
#  Thank you!
#------------------------------------------------------------------------------

RUN apk --update add --no-cache openssh bash \
  && sed -i s/#PermitRootLogin.*/PermitRootLogin\ yes/ /etc/ssh/sshd_config \
  && echo "root:root" | chpasswd \
  && rm -rf /var/cache/apk/*
RUN sed -ie 's/#Port 22/Port 22/g' /etc/ssh/sshd_config
RUN sed -ri 's/#HostKey \/etc\/ssh\/ssh_host_key/HostKey \/etc\/ssh\/ssh_host_key/g' /etc/ssh/sshd_config
RUN sed -ir 's/#HostKey \/etc\/ssh\/ssh_host_rsa_key/HostKey \/etc\/ssh\/ssh_host_rsa_key/g' /etc/ssh/sshd_config
RUN sed -ir 's/#HostKey \/etc\/ssh\/ssh_host_dsa_key/HostKey \/etc\/ssh\/ssh_host_dsa_key/g' /etc/ssh/sshd_config
RUN sed -ir 's/#HostKey \/etc\/ssh\/ssh_host_ecdsa_key/HostKey \/etc\/ssh\/ssh_host_ecdsa_key/g' /etc/ssh/sshd_config
RUN sed -ir 's/#HostKey \/etc\/ssh\/ssh_host_ed25519_key/HostKey \/etc\/ssh\/ssh_host_ed25519_key/g' /etc/ssh/sshd_config
RUN /usr/bin/ssh-keygen -A
RUN ssh-keygen -t rsa -b 4096 -f  /etc/ssh/ssh_host_key

RUN adduser -D -u 10000 gnuplot

#USER gnuplot
#WORKDIR /home/gnuplot

EXPOSE 22
CMD ["/usr/sbin/sshd","-D"]
