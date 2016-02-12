FROM nginx

# Install Node.js
RUN apt-get update && apt-get upgrade && \
  apt-get install -y npm

# Install Bower & Grunt
RUN npm install -g bower gulp

RUN /bin/bash -c 'cd /usr/share/nginx/html && bower install'

RUN  apt-get purge -y npm && \
  apt-get autoremove -y && \
  apt-get clean all

COPY . /usr/share/nginx/html
