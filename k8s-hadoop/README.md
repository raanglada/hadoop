
# Deploy the hadoop cluster
```
kubectl apply -f namenode/
kubectl apply -f resource-manager/
kubectl apply -f datanode/
```


# Local access to the cluster with kubectl port-forward

- dashboard namenode

```
kubectl port-forward pod/nombrepod 50070:50070
```

- dashboard yarn
```
kubectl port-forward pod/nombrepod 8088:8088
```

note: use --address 0.0.0.0 with port-forward to publish for all network interfaces

# Test in the browser

url --> localhost:50070

url --> localhost:8088



