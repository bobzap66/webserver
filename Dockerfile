FROM ubuntu:14.04

MAINTAINER Audris Mockus <audris@utk.edu>

RUN apt-get update && apt-get install -y \
        curl \
        pkg-config \
		vim \
		sssd \
		openssh-server \
		openssh-client \
		libpam-sss \
		sssd-tools \
        && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*


#install ldap authentication to use utk's ldap
COPY eecsCA_v3.crt /etc/ssl/
COPY sssd.conf /etc/sssd/
COPY common* /etc/pam.d/
RUN chmod 0600 /etc/sssd/sssd.conf /etc/pam.d/common* 
RUN mkdir -p /var/run/sshd 
RUN chmod 0755 /var/run/sshd
RUN mkdir -p /var/run/sshd
RUN chmod 0755 /var/run/sshd



RUN curl https://sdk.cloud.google.com | bash
RUN mv /root/google-cloud-sdk
RUN curl -L https://github.com/docker/machine/releases/download/v0.6.0/docker-machine-`uname -s`-`uname -m` > /usr/local/bin/docker-machine && \
    chmod +x /usr/local/bin/docker-machine

RUN sed -i '/^ENV_PATH/s"PATH="PATH=/google-cloud-sdk/bin:"' /etc/login.defs
