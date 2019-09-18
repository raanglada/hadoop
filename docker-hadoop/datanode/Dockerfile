
From raanglada/hadoop-base:2.9.2

MAINTAINER Ramon Anglada <anglada.alex@gmail.com>

LABEL Description="Datanode image for hadoop cluster"

RUN mkdir -p /home/hadoop/hdfs/datanode

VOLUME /home/hadoop/hdfs/

COPY datanode/hdfs-site.xml $HADOOP_HOME/etc/hadoop/
COPY datanode/start-datanode.sh /

CMD bash /start-datanode.sh