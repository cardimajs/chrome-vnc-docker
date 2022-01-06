FROM ubuntu:20.04

RUN apt-get update && apt-get clean && apt-get install -y \
  gnupg2 \
  x11vnc \
  xvfb \
  fluxbox \
  wmctrl \
  wget \
  && wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add - \
  && echo "deb http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list \
  && apt-get update && apt-get -y install google-chrome-stable

RUN useradd apps \
  && mkdir -p /home/apps \
  && chown -v -R apps:apps /home/apps

COPY start.sh /

CMD '/start.sh'