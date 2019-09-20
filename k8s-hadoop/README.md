
# Access to the cluster with kubectl port-forward

- dashboard namenode

```
kubectl port-forward pod/nombrepod 50070:50070
```

- dashboard yarn
```
kubectl port-forward pod/nombrepod 8088:8088
```
