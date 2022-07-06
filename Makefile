cluster: digital_ocean_ingress_controler \
mongo \
server \
client \
pushNginx \
setNginx

digital_ocean_ingress_controler:
	kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/controller-v1.2.1/deploy/static/provider/do/deploy.yaml
mongo:
	kubectl apply -f mongodb-secrets.yaml
server:
	kubectl apply -f server.yaml
client:
	kubectl apply -f client.yaml
pushNginx:
	cd nginx \
	&& docker build -t andresnboza/reload-app-nginx . \
	&& docker push andresnboza/reload-app-nginx
setNginx:
	kubectl apply -f nginx.yaml

push:
	git add .
	git commit -m "update"
	git push

