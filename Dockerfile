FROM node:20
RUN mkdir /app
WORKDIR /app
RUN apt update -qq && apt -y --no-install-recommends --no-install-suggests install awscli wget nano curl git && apt-get clean && rm -rf /var/lib/{apt,dpkg,cache,log} && apt -y autoremove
RUN npm install -g ionic
