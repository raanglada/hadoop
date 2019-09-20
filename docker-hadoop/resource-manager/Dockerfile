
FROM raanglada/hadoop-base:2.9.2

MAINTAINER Ramon Anglada <anglada.alex@gmail.com>

LABEL Description="Resource manager image for hadoop cluster"

COPY resource-manager/yarn-site.xml $HADOOP_HOME/etc/hadoop/
COPY resource-manager/start-resource-manager.sh /

CMD bash /start-resource-manager.sh

