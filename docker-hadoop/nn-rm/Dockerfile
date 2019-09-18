
From raanglada/hadoop-base:2.9.2

MAINTAINER Ramon Anglada <anglada.alex@gmail.com>

LABEL Description="Namenode and resource manager image for hadoop cluster"

RUN mkdir -p /home/hadoop/hdfs/namenode

VOLUME /home/hadoop/hdfs/namenode

COPY nn-rm/hdfs-site.xml $HADOOP_HOME/etc/hadoop/
COPY nn-rm/start-namenode.sh /

CMD bash /start-namenode.sh

