cd database
docker build -t database .
cd ..
cd server-express
docker build -t server-express .
cd ..
cd server-flask
docker build -t server-flask .
cd ..

docker network create proxy
docker run -d --name database -p 3306:3306 --network proxy -e MYSQL_ROOT_PASSWORD=root -e MYSQL_DATABASE=cars database
sleep 10

docker run -d --name server-express --network proxy -p 8082:8082 --label traefik.enable=true --label traefik.priority=1 \
--label traefik.http.routers.express.rule="Host(\`localhost\`) && PathPrefix(\`/addCar\`)" \
--label traefik.http.services.server-express.loadbalancer.server.port=8082 server-express

docker run -d --name server-flask --network proxy -p 8081:8081 --label traefik.enable=true --label traefik.priority=2 --label traefik.http.routers.server-flask.rule="Host(\`localhost\`)" --label traefik.http.services.server-flask.loadbalancer.server.port=8081 server-flask

docker run -d --name traefik --network proxy -p 80:80 -p 8080:8080 -v /var/run/docker.sock:/var/run/docker.sock traefik:latest --api.insecure=true --providers.docker
