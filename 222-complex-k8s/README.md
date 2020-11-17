## K8S config files

#### `client-deployment.yml`
- 3 replicas of multi-client pod

#### `client-cluster-ip-service.yml`
- 1 service as 'ClusterIP'
- no need of external access, so no 'nodePort'
- same port and targetPort (in this case, no need of mismatch)
- port = access from other pods
- targetPort = where the app is listening to 