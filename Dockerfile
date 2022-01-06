ARG FROM_IMAGE=ubuntu21.10
FROM $FROM_IMAGE
ENV DEBIAN_FRONTEND=noninteractive

WORKDIR /home/
RUN apt-get -y update
RUN apt-get -y upgrade
RUN apt-get -y --no-install-recommends install tzdata \
        autoconf \
        build-essential \
        flex \
        bison \
        ncurses-dev \
        libreadline-dev \
        git \
        iproute2 \
        procps \
        software-properties-common \
        cmake \
        wget 

RUN git clone https://gitlab.labs.nic.cz/labs/bird

WORKDIR /home/bird
RUN autoreconf && ./configure && make

RUN cd /home && git clone https://gitlab.labs.nic.cz/labs/bird-tools
RUN cp bird /home/bird-tools/netlab/common && cp birdc /home/bird-tools/netlab/common

WORKDIR /home/bird-tools/netlab
CMD ["./start", "-c", "cf-ospf-base"]

