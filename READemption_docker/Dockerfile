FROM ubuntu:latest
MAINTAINER Muhammad Elhossary <elhossary@zbmed.de>
RUN apt-get -y update
RUN export DEBIAN_FRONTEND=noninteractive
RUN apt-get install -y tzdata
RUN ln -fs /usr/share/zoneinfo/Europe/Berlin /etc/localtime
RUN dpkg-reconfigure --frontend noninteractive tzdata
COPY ./installations.sh ./installations.sh
RUN bash ./installations.sh
LABEL READemption_ver=0.5.0
LABEL Segemehl_ver=0.3.4
LABEL Deseq2_ver=1.28