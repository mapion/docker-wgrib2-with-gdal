FROM --platform=linux/x86_64 osgeo/gdal:ubuntu-small-3.4.2
USER root

RUN apt-get update

RUN apt-get install -y locales && \
    localedef -f UTF-8 -i ja_JP ja_JP.UTF-8
ENV LANG ja_JP.UTF-8
ENV LANGUAGE ja_JP:ja
ENV LC_ALL ja_JP.UTF-8
ENV TZ JST-9
ENV TERM xterm

RUN apt-get update && apt-get install -y wget \
    build-essential \
    gfortran \
    zlib1g-dev

ENV CC gcc
ENV FC gfortran

RUN cd ~ \
    && wget https://www.ftp.cpc.ncep.noaa.gov/wd51we/wgrib2/wgrib2.tgz \
    && tar xvzf wgrib2.tgz

RUN cd ~/grib2/ \
    && make \
    && cp wgrib2/wgrib2 /usr/local/bin/wgrib2
