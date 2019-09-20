From ubuntu:18.04

MAINTAINER Ramon Anglada <anglada.alex@gmail.com>

LABEL Description="Base image for hadoop cluster"

ARG HADOOP_VERSION=2.9.2

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

#extra tools for debugging and troubleshooting
RUN apt install curl net-tools nano telnet -y

#COPY confs-files
COPY confs-files/core-site.xml $HADOOP_HOME/etc/hadoop/
COPY confs-files/mapred-site.xml $HADOOP_HOME/etc/hadoop/
COPY confs-files/yarn-site.xml $HADOOP_HOME/etc/hadoop/

#COPY ssh config
COPY confs-files/ssh-config /root/.ssh/config
COPY ssh-key/id_rsa.pub /root/

RUN \
    mkdir -p ~/.ssh/ && \    
    cat ~/id_rsa.pub >> ~/.ssh/authorized_keys && \
    chmod 0600 ~/.ssh/authorized_keys && \
    chmod 0600 /root/.ssh/config


