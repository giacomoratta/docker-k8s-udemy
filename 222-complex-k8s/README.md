## K8S config files

#### Clean-up
1. `kubectl get deployments`\
    `kubectl delete deployment <deployment-name>`
2. `kubectl get services`\
    `kubectl delete service <service-name>`

#### Deployments
- `client-deployment.yml`
    - 3 replicas of multi-client pod
- `server-deployment.yml`
    - 3 replicas of multi-server pod
- `worker-deployment.yml`
    - 1 replica of multi-server pod, so we can see we need other replicas
- `redis-deployment.yml`
    - 3 replicas of multi-server pod

#### ClusterIP Services
- `client-cluster-ip-service.yml`
- `server-cluster-ip-service.yml`
- ~~`worker-cluster-ip-service.yml`~~ (because it does not need to be accessed from other pods)
- `redis-cluster-ip-service.yml`

##### Common parts
- 1 service as 'ClusterIP'
- no need of external access, so no 'nodePort'
- same port and targetPort (in this case, no need of mismatch)
- port = access from other pods
- targetPort = where the app is listening to

#### Apply all
- `kubectl apply -f <dir-name>`
- `kubectl apply -f k8s`