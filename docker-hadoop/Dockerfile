From debian:latest

MAINTAINER Anglada <anglada.alex@gmail.com>

LABEL Description="Base image for hadoop cluster"

ARG HADOOP_VERSION=

#install packages
RUN \
  apt-get update && \
  apt-get install -y \
  ssh \  
  nano \
  openjdk-8-jdk \
  wget \
  openssh-server \
  openssh-client \
  tar

#env vars needed
ENV HADOOP_HOME /opt/hadoop
ENV JAVA_HOME /usr/lib/jvm/java-8-openjdk-amd64

#download hadoop
RUN \
  wget http://apache.mirrors.tds.net/hadoop/common/hadoop-${HADOOP_VERSION}/hadoop-${HADOOP_VERSION}.tar.gz && \
  tar -xvzf hadoop-${HADOOP_VERSION}.tar.gz && \
  mv hadoop-${HADOOP_VERSION} $HADOOP_HOME && \
  echo "export JAVA_HOME=$JAVA_HOME" >> $HADOOP_HOME/etc/hadoop/hadoop-env.sh && \
  echo "PATH=$PATH:$HADOOP_HOME/bin" >> ~/.bashrc && \
  rm hadoop-${HADOOP_VERSION}.tar.gz

# Passwordless SSH
RUN \
  ssh-keygen -t rsa -P '' -f ~/.ssh/id_rsa && \
  cat ~/.ssh/id_rsa.pub >> ~/.ssh/authorized_keys && \
  chmod 0600 ~/.ssh/authorized_keys

#COPY ssh config
# copy ssh config
ADD confs-files/ssh-config /root/.ssh/config

#COPY confs-files
ADD confs-files/core-site.xml $HADOOP_HOME/etc/hadoop/
ADD confs-files/mapred-site.xml $HADOOP_HOME/etc/hadoop/
ADD confs-files/yarn-site.xml $HADOOP_HOME/etc/hadoop/

# Hdfs ports
EXPOSE 50010 50020 50070 50075 50090 8020 9000

# Mapred ports
EXPOSE 19888

#Yarn ports
EXPOSE 8030 8031 8032 8033 8040 8042 8088

#Other ports
EXPOSE 49707 2122

ADD start.sh /

CMD bash /start.sh

