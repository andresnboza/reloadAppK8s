kubernetes: mongo server client

mongo:
	kubectl apply -f mongodb-secrets.yaml
	kubectl apply -f mongodb-deployment.yaml
	kubectl apply -f mongodb-pvc.yaml
	kubectl apply -f mongodb-service.yaml

k8s: server client

server: 
	kubectl apply -f server-deployment.yaml
	kubectl apply -f server-service.yaml

client: 
	kubectl apply -f client-deployment.yaml
	kubectl apply -f client-service.yaml

ingress:
	kubectl apply -f ingress.yml
	kubectl get svc -owide

deleteClient:
	kubectl delete deployment reload-app-server-lb
clientSecrets:
	kubectl create configmap angular-app --from-file=.env=.env
	kubectl create secret generic angular-app --from-file=.env=.env


version2: server2 client2 ingress
server2:
	kubectl apply -f server.yaml
client2:
	kubectl apply -f client.yaml
ingress:
	kubectl apply -f ingress.yml --validate=false

push:
	git add .
	git commit -m "update"
	git push