docker build -t giacomoratta/multi-client -f ./client/Dockerfile ./client
docker build -t giacomoratta/multi-server -f ./server/Dockerfile ./server
docker build -t giacomoratta/multi-worker -f ./worker/Dockerfile ./worker

docker push giacomoratta/multi-client
docker push giacomoratta/multi-server
docker push giacomoratta/multi-worker

kubectl apply -f k8s
kubectl set image deployments/server-deployment