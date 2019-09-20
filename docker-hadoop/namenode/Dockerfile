
FROM raanglada/hadoop-base:2.9.2

MAINTAINER Ramon Anglada <anglada.alex@gmail.com>

LABEL Description="Namenode and resource manager image for hadoop cluster"

COPY ssh-key/id_rsa /root/.ssh/
COPY namenode/hdfs-site.xml $HADOOP_HOME/etc/hadoop/
COPY namenode/start-namenode.sh /

RUN mkdir -p /home/hadoop/hdfs/namenode
    
VOLUME /home/hadoop/hdfs/namenode

CMD bash /start-namenode.sh

