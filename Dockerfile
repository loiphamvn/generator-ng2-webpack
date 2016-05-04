# Yeoman with some generators and prerequisites
FROM node:4.4.3-slim

MAINTAINER cmelion <charles.fulnecky@gmail.com>

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get -yq update && \
    apt-get -yq install git net-tools sudo bzip2

RUN npm install -g --silent yo@1.7.0 generator-ng2-webpack

# Add a yeoman user because grunt doesn't like being root
RUN adduser --disabled-password --gecos "" yeoman && \
  echo "yeoman ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

# Expose the port
EXPOSE 9000

# set HOME so 'npm install' doesn't write to /
ENV HOME /home/yeoman

ENV LANG en_US.UTF-8

RUN mkdir /client && chown yeoman:yeoman /client
WORKDIR /client

ADD set_env.sh /usr/local/sbin/
RUN chmod +x /usr/local/sbin/set_env.sh
ENTRYPOINT ["set_env.sh"]

# Always run as the yeoman user
USER yeoman

RUN yo ng2-webpack --name="client" --clientFolder="src"


CMD ["npm", "run", "docker-server"]