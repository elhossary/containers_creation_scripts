FROM ubuntu:latest
RUN apt-get -y update
RUN export DEBIAN_FRONTEND=noninteractive
RUN apt-get install -y tzdata locales locales-all
ENV LC_ALL en_US.UTF-8
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US.UTF-8
RUN ln -fs /usr/share/zoneinfo/Europe/Berlin /etc/localtime
RUN dpkg-reconfigure --frontend noninteractive tzdata
COPY ./installations.sh ./installations.sh
RUN bash ./installations.sh
RUN apt-get clean
LABEL READemption_ver=0.5.0
LABEL Segemehl_ver=0.3.4
LABEL DeSeq2_ver=1.28
LABEL maintainer="Muhammad Elhossary <elhossary@zbmed.de>"