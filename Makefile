kubernetes: mongo server client

mongo:
	kubectl apply -f mongodb-secrets.yaml
	kubectl apply -f mongodb-deployment.yaml
	kubectl apply -f mongodb-pvc.yaml
	kubectl apply -f mongodb-service.yaml

server: 
	kubectl apply -f server-deployment.yaml
	kubectl apply -f server-service.yaml

client: 
	kubectl apply -f client-deployment.yaml
	kubectl apply -f client-service.yaml
	kubectl apply -f client-load-balancer-service.yaml
	kubectl get svc -owide

deleteClient:
	kubectl delete deployment reload-app-server-lb
clientSecrets:
	kubectl create configmap angular-app --from-file=.env=.env
	kubectl create secret generic angular-app --from-file=.env=.env


version2: server2 client2
server2:
	kubectl apply -f server.yaml
	kubectl get svc -owide
client2:
	kubectl apply -f client.yaml