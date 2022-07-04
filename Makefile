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
