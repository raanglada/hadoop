
From raanglada/hadoop-base:2.9.2

MAINTAINER Anglada <anglada.alex@gmail.com>

LABEL Description="Namenode and resource manager image for hadoop cluster"

RUN mkdir -p /home/hadoop/hdfs/namenode

VOLUME /home/hadoop/hdfs/namenode

ADD nn-rm/hdfs-site.xml $HADOOP_HOME/etc/hadoop/
ADD nn-rm/start-namenode.sh /

CMD bash /start-namenode.sh

