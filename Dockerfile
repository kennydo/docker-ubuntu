FROM ubuntu:14.04.4

MAINTAINER chinesedewey@gmail.com

RUN locale-gen en_US.UTF-8
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8

ENV DOCKERIZE_VERSION v0.4.0

RUN apt-get update \
  && apt-get install -y software-properties-common \
  && add-apt-repository -y ppa:maxmind/ppa \
  && add-apt-repository -y ppa:fkrull/deadsnakes \
  && apt-get install -y wget \
  && wget -qO - http://packages.confluent.io/deb/3.1/archive.key | sudo apt-key add - \
  && add-apt-repository -y "deb [arch=amd64] http://packages.confluent.io/deb/3.1 stable main" \
  && apt-get update \
  && apt-get install -y \
    git-all \
    language-pack-id \
    libcurl4-openssl-dev \
    libffi-dev \
    libjpeg-dev \
    libmaxminddb-dev \
    libmaxminddb0 \
    libmysqlclient-dev \
    libpng-dev \
    libpq-dev \
    librdkafka++1 \
    librdkafka-dev \
    librdkafka-dev \
    librdkafka1 \
    libssl-dev \
    libxml2-dev \
    libxslt1-dev \
    mmdb-bin \
    mysql-client \
    postgresql-client \
    python3 \
    python3-dev \
    python3-pip \
    python3.5 \
    python3.5-dev \
    python3.5-venv \
    zlib1g-dev \
  && wget https://github.com/jwilder/dockerize/releases/download/$DOCKERIZE_VERSION/dockerize-linux-amd64-$DOCKERIZE_VERSION.tar.gz \
  && tar -C /usr/local/bin -xzvf dockerize-linux-amd64-$DOCKERIZE_VERSION.tar.gz \
  && rm dockerize-linux-amd64-$DOCKERIZE_VERSION.tar.gz \
  && pip install --upgrade --user awscli
