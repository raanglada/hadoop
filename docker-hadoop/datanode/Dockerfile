
From raanglada/hadoop-base

MAINTAINER Anglada <anglada.alex@gmail.com>

LABEL Description="Datanode image for hadoop cluster"

RUN mkdir -p /home/hadoop/hdfs/datanode

VOLUME /home/hadoop/hdfs/

ADD datanode/hdfs-site.xml $HADOOP_HOME/etc/hadoop/
ADD datanode/start-datanode.sh /

CMD bash /start-datanode.sh