FROM ubuntu:19.10

RUN dpkg --add-architecture i386

RUN sed --in-place --regexp-extended "s/(\/\/)(archive\.ubuntu)/mirrors\.aliyun/" /etc/apt/sources.list && \
	apt-get update && apt-get upgrade --yes

RUN apt-get update
RUN apt-get -y install software-properties-common

# RUN add-apt-repository -y ppa:ubuntu-wine/ppa && add-apt-repository -y ppa:chris-lea/node.js && apt-get update && apt-get -y install wine1.7 nodejs xvfb

RUN apt-get -y install wine nodejs xvfb

ADD . /app

EXPOSE 9101
EXPOSE 5010

WORKDIR /app

CMD ["/app/run-iqfeed"]
