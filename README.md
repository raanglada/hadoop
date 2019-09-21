# Introduction

This repo is for doing PoC of hadoop using docker and kubernetes.

# Execute the docker-compose 
```
docker-compose up
```

# Delete the docker-compose 
```
docker-compose down
```

# Scale up and down

To scale up more datanodes
```
docker-compose scale datanode=5
```

To scale down datanodes
```
docker-compose scale datanode=1
```

When you scale down datanodes you need to execute a gracefully decomissioning, please read the following posts

https://stackoverflow.com/questions/16774439/how-do-i-correctly-remove-nodes-in-hadoop

https://acadgild.com/blog/commissioning-and-decommissioning-of-datanode-in-hadoop

https://hadoop.apache.org/docs/current/hadoop-yarn/hadoop-yarn-site/GracefulDecommission.html


To refresh datanodes in namenode
```
hdfs dfsadmin -refreshNodes
```
