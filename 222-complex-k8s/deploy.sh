# Build docker images
docker build -t giacomoratta/multi-client:latest -t giacomoratta/multi-client:$SHA -f ./client/Dockerfile ./client
docker build -t giacomoratta/multi-server:latest -t giacomoratta/multi-server:$SHA -f ./server/Dockerfile ./server
docker build -t giacomoratta/multi-worker:latest -t giacomoratta/multi-worker:$SHA -f ./worker/Dockerfile ./worker

# Push images tagged as "latest"
docker push giacomoratta/multi-client:latest
docker push giacomoratta/multi-server:latest
docker push giacomoratta/multi-worker:latest

# Push images tagged as "$SHA"
docker push giacomoratta/multi-client:$SHA
docker push giacomoratta/multi-server:$SHA
docker push giacomoratta/multi-worker:$SHA

# Apply k8s objects
kubectl apply -f k8s

# Change images on the k8s objects
kubectl set image deployments/server-deployment server=giacomoratta/multi-server:$SHA
kubectl set image deployments/client-deployment client=giacomoratta/multi-client:$SHA
kubectl set image deployments/worker-deployment worker=giacomoratta/multi-worker:$SHA