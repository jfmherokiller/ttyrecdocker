FROM debian:latest
RUN apt-get update && apt-get install -y \
        imagemagick \
        x11-apps \
        ttyrec
        gcc
RUN git clone https://github.com/icholy/ttygif.git && cd ttygif
RUN make && make install        
