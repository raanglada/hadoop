
FROM raanglada/hadoop-base:2.9.2

MAINTAINER Ramon Anglada <anglada.alex@gmail.com>

LABEL Description="Datanode image for hadoop cluster"

RUN mkdir -p /home/hadoop/hdfs/datanode

COPY datanode/hdfs-site.xml $HADOOP_HOME/etc/hadoop/
COPY datanode/yarn-site.xml $HADOOP_HOME/etc/hadoop/
COPY datanode/start-datanode.sh /

VOLUME /home/hadoop/hdfs/

CMD bash /start-datanode.sh