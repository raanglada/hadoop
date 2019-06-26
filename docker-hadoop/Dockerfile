From debian:latest

MAINTAINER Anglada <anglada.alex@gmail.com>

LABEL Description="Base image for hadoop cluster"

ARG HADOOP_VERSION=

#COPY ssh config
# copy ssh config
ADD confs-files/ssh-config /root/.ssh/config

#COPY confs-files
ADD confs-files/core-site.xml $HADOOP_HOME/etc/hadoop/
ADD confs-files/mapred-site.xml $HADOOP_HOME/etc/hadoop/
ADD confs-files/yarn-site.xml $HADOOP_HOME/etc/hadoop/

#env vars needed
ENV HADOOP_HOME /opt/hadoop
ENV JAVA_HOME /usr/lib/jvm/java-8-openjdk-amd64
ENV HADOOP_CONF_DIR=$HADOOP_HOME/etc/hadoop
ENV HADOOP_COMMON_HOME=$HADOOP_HOME
ENV HADOOP_MAPRED_HOME=$HADOOP_HOME
ENV HADOOP_HDFS_HOME=$HADOOP_HOME
ENV YARN_HOME=$HADOOP_HOME/bin
ENV HDFS_NAMENODE_USER="root"
ENV HDFS_DATANODE_USER="root"
ENV HDFS_SECONDARYNAMENODE_USER="root"
ENV YARN_RESOURCEMANAGER_USER="root"
ENV YARN_NODEMANAGER_USER="root"
ENV HADOOP_CLASSPATH=$HADOOP_CONF_DIR,$HADOOP_COMMON_HOME/*,$HADOOP_COMMON_HOME/lib/*,$HADOOP_HDFS_HOME/*,$HADOOP_HDFS_HOME/lib/*,$HADOOP_MAPRED_HOME/*,$HADOOP_MAPRED_HOME/lib/*,$HADOOP_YARN_HOME/*,$HADOOP_YARN_HOME/lib/*,$USS_HOME/*,$USS_CONF
ENV PATH=$PATH:$JAVA_HOME:$JAVA_HOME/bin:$HADOOP_HOME/bin:$HADOOP_HOME/sbin:$HADOOP_CLASSPATH
ENV HADOOP_OPTS="-Djava.library.path=$HADOOP_HOME/lib/native"

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

# Hdfs ports
EXPOSE 50010 50020 50070 50075 50090 8020 9000

# Mapred ports
EXPOSE 19888

#Yarn ports
EXPOSE 8030 8031 8032 8033 8040 8042 8088

#Other ports
EXPOSE 49707 2122