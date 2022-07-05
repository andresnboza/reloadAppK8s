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


version2: mongo2 server2 client2  
digital_ocean_ingress_controler:
	kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/controller-v1.2.1/deploy/static/provider/do/deploy.yaml
mongo2:
	kubectl apply -f mongodb-secrets.yaml
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


deleteIngress:
	kubectl delete ingress reload-app-client-ingress -n kube-system

deleteAll:
	@echo 'Delete of client'
	kubectl delete deployment reload-app-client -n default || true
	kubectl delete ingress reload-app-client-ingress -n kube-system || true
	kubectl delete service reload-app-client-service-external -n kube-system  || true
	kubectl delete service reload-app-client-service -n default || true
	@echo 'Delete of server'
	kubectl delete deployment reload-app-server -n default || true
	kubectl delete service reload-app-server-service -n default || true