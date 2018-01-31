FROM google/cloud-sdk 

MAINTAINER Audris Mockus <audris@utk.edu>

RUN apt-get update && apt-get install -y \
    curl \
    pkg-config \
    vim \
	 openssh-server \
	 openssh-client \
	 python \
  && \
  apt-get clean && \
  rm -rf /var/lib/apt/lists/*


#install 
# RUN curl https://sdk.cloud.google.com | bash
# RUN mv /root/google-cloud-sdk /usr/bin
RUN curl -L https://github.com/docker/machine/releases/download/v0.13.0/docker-machine-`uname -s`-`uname -m` > /usr/local/bin/docker-machine && \
    chmod +x /usr/local/bin/docker-machine

#RUN sed -i '/^ENV_PATH/s"PATH="PATH=/google-cloud-sdk/bin:"' /etc/login.defs

