
#!/bin/bash

#TODO
#Improve the script and reuse all you can as posible

IP_MASTER=192.168.0.10

IP_DATANODES=(
    192.168.0.11
    192.168.0.22
)

docker network create \
-d bridge \
--subnet=192.168.0.0/16  \
--ip-range=192.168.0.0/24 \
--gateway=192.168.0.254 \
hadoop-network

docker run -it \
--net hadoop-network \
--ip=$IP_MASTER \
-h namenode \
--add-host=namenode:$IP_MASTER \
--add-host=datanode1:"${IP_DATANODES[0]}" \
--add-host=datanode2:"${IP_DATANODES[1]}" \
--name master \
-p 50070:50070 \
-p 8088:8088 \
-p 19888:19888 \
-p 9000:9000 \
-d raanglada/hadoop-namenode:2.9.2


docker run -it \
--net hadoop-network \
--ip="${IP_DATANODES[0]}" \
-h datanode1 \
--add-host=namenode:$IP_MASTER \
--add-host=datanode1:"${IP_DATANODES[0]}" \
--add-host=datanode2:"${IP_DATANODES[1]}" \
--name datanode1 \
-d raanglada/hadoop-datanode:2.9.2





