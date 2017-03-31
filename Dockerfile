FROM debian:latest
RUN apt-get update && apt-get install -y \
        imagemagick \
        x11-apps \
        ttyrec \
        git \
        gcc \
        xvfb \
        xdotool
RUN git clone https://github.com/icholy/ttygif.git && cd ttygif && \
        make && make install && cd .. && rm -rf ttygif

ENV DISPLAY :99

# Install Xvfb init script
ADD xvfb_init /etc/init.d/xvfb
RUN chmod a+x /etc/init.d/xvfb
ADD xvfb-daemon-run /usr/bin/xvfb-daemon-run
RUN chmod a+x /usr/bin/xvfb-daemon-run        
