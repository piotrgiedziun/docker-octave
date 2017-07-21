FROM debian:jessie

LABEL maintainer="piotrgiedziun@gmail.com"

RUN DEBIAN_FRONTEND=noninteractive apt-get update && apt-get install -y gcc g++ gfortran make libblas-dev \
    liblapack-dev libpcre3-dev libarpack2-dev \
    libcurl4-gnutls-dev epstool libfftw3-dev transfig libfltk1.3-dev libfontconfig1-dev libfreetype6-dev \
    libgl2ps-dev libglpk-dev libreadline-dev gnuplot libgraphicsmagick++1-dev libhdf5-serial-dev openjdk-7-jdk \
    libsndfile1-dev llvm-dev lpr texinfo libgl1-mesa-dev libosmesa6-dev pstoedit portaudio19-dev libqhull-dev \
    libqrupdate-dev libqscintilla2-dev libqt4-dev libqtcore4 libqtwebkit4 libqt4-network libqtgui4 libqt4-opengl-dev \
    libsuitesparse-dev texlive libxft-dev zlib1g-dev autoconf automake bison flex gperf gzip icoutils \
    librsvg2-bin libtool perl-base rsync tar wget \
 && rm -rf /var/lib/apt/lists/*

WORKDIR /temp

RUN wget ftp://ftp.gnu.org/gnu/octave/octave-4.2.1.tar.gz

RUN tar xf octave-4.2.1.tar.gz

RUN rm octave-4.2.1.tar.gz

WORKDIR /temp/octave-4.2.1/

RUN sh ./configure

RUN make -j8

RUN make install

CMD ["/bin/bash"]