sudo apt update
sudo apt upgrade -y
sudo apt install docker.io -y





sudo docker tag config_company:latest company:latest
sudo docker tag config_startup:latest startup:latest
sudo docker tag ir_ir:latest ir:latest
sudo docker tag board_board:latest board:latest
sudo docker tag config_user:latest user:latest
sudo docker tag config_shop:latest shop:latest
sudo docker tag config_communication:latest communication:latest




docker build --tag company:latest ./microservices/company
docker build --tag startup:latest ./microservices/startup-composite
docker build --tag ir:latest ./microservices/ir
docker build --tag board:latest ./microservices/board
docker build --tag user:latest ./microservices/user
docker build --tag shop:latest ./microservices/shop
docker build --tag communication:latest ./microservices/communication

docker build --tag eureka-server:latest ./cloud/eureka-server
docker build --tag config-server:latest ./cloud/config_server


docker build --tag board:latest ./microservices/board
docker tag board 13.209.17.102:5000/board
docker push 13.209.17.102:5000/board

docker build --tag communication:latest ./microservices/communication
docker tag communication 13.209.17.102:5000/communication
docker push 13.209.17.102:5000/communication

docker build --tag company:latest ./microservices/company
docker tag company 13.209.17.102:5000/company
docker push 13.209.17.102:5000/company

docker build --tag ir:latest ./microservices/ir
docker tag ir 13.209.17.102:5000/ir
docker push 13.209.17.102:5000/ir

docker build --tag shop:latest ./microservices/shop
docker tag shop 13.209.17.102:5000/shop
docker push 13.209.17.102:5000/shop

docker build --tag startup:latest ./microservices/startup-composite
docker tag startup 13.209.17.102:5000/startup
docker push 13.209.17.102:5000/startup

docker build --tag user:latest ./microservices/user
docker tag user 13.209.17.102:5000/user
docker push 13.209.17.102:5000/user


docker build --tag 13.209.17.102:5000/board:latest ./microservices/board
docker push 13.209.17.102:5000/board:latest
docker build --tag 13.209.17.102:5000/communication:latest ./microservices/communication
docker push 13.209.17.102:5000/communication:latest
docker build --tag 13.209.17.102:5000/company:latest ./microservices/company
docker push 13.209.17.102:5000/company:latest
docker build --tag 13.209.17.102:5000/investment:latest ./microservices/investment
docker push 13.209.17.102:5000/investment:latest
docker build --tag 13.209.17.102:5000/ir:latest ./microservices/ir
docker push 13.209.17.102:5000/ir:latest
docker build --tag 13.209.17.102:5000/shop:latest ./microservices/shop
docker push 13.209.17.102:5000/shop:latest
docker build --tag 13.209.17.102:5000/startup:latest ./microservices/startup-composite
docker push 13.209.17.102:5000/startup:latest
docker build --tag 13.209.17.102:5000/user:latest ./microservices/user
docker push 13.209.17.102:5000/user:latest
docker build --tag 13.209.17.102:5000/vc:latest ./microservices/vc-composite
docker push 13.209.17.102:5000/vc:latest


sudo docker pull 13.209.17.102:5000/board
sudo docker pull 13.209.17.102:5000/communication
sudo docker pull 13.209.17.102:5000/company
sudo docker pull 13.209.17.102:5000/ir
sudo docker pull 13.209.17.102:5000/shop
sudo docker pull 13.209.17.102:5000/startup
sudo docker pull 13.209.17.102:5000/user



OPTIONS='--selinux-enabled --log-driver=journald --signature-verification=false --insecure-registry=13.209.17.102:5000
if [ -z "${DOCKER_CERT_PATH}" ]; then
    DOCKER_CERT_PATH=/etc/docker
fi

sudo vi /etc/docker/daemon.json

{
    "insecure-registries": ["ec2-13-209-17-102.ap-northeast-2.compute.amazonaws.com:5000"]
}

{
    "insecure-registries": ["13.209.17.102:5000"]
}

sudo service docker restart
sudo docker login "ec2-13-209-17-102.ap-northeast-2.compute.amazonaws.com:5000"
sudo docker login "13.209.17.102:5000"


docker network create --attachable --driver overlay fabric-samples


base=https://github.com/docker/machine/releases/download/v0.16.2 &&
curl -L $base/docker-machine-$(uname -s)-$(uname -m) >/tmp/docker-machine &&
sudo install /tmp/docker-machine /usr/local/bin/docker-machine



docker-machine create --driver amazonec2 --amazonec2-instance-type t2.medium --amazonec2-region ap-northeast-2 api-test-master

docker-machine create --driver amazonec2 --amazonec2-instance-type t2.medium --amazonec2-region ap-northeast-2 --swarm --swarm-master api-test-master


sudo docker service create --name startup -p 8080:8080 -e SPRING_PROFILES_ACTIVE="swam-new-test" --replicas=1 --with-registry-auth 13.209.17.102:5000/startup:latest

sudo docker service create --name user -p 7301:7301 -e SPRING_PROFILES_ACTIVE="swam-new-test" --network api-test --replicas=1 --with-registry-auth 13.209.17.102:5000/user

sudo docker network create -d overlay api-test
--network ingress
--network api-test
sudo docker service create --name startup -p 8080:8080 -e SPRING_PROFILES_ACTIVE="swam-new-test" --replicas=1 --network api-test --with-registry-auth 13.209.17.102:5000/startup:latest
sudo docker service create --name user -e SPRING_PROFILES_ACTIVE="swam-new-test" --replicas=1 --network api-test --with-registry-auth 13.209.17.102:5000/user
sudo docker service create --name company -e SPRING_PROFILES_ACTIVE="swam-new-test" --replicas=1 --network api-test --with-registry-auth 13.209.17.102:5000/company
sudo docker service create --name ir -e SPRING_PROFILES_ACTIVE="swam-new-test" --replicas=1 --network api-test --with-registry-auth 13.209.17.102:5000/ir
sudo docker service create --name board -e SPRING_PROFILES_ACTIVE="swam-new-test" --replicas=1 --network api-test --with-registry-auth 13.209.17.102:5000/board
sudo docker service create --name shop -e SPRING_PROFILES_ACTIVE="swam-new-test" --replicas=1 --network api-test --with-registry-auth 13.209.17.102:5000/shop
sudo docker service create --name communication -e SPRING_PROFILES_ACTIVE="swam-new-test" --replicas=1 --network api-test --with-registry-auth 13.209.17.102:5000/communication

sudo docker service create --name startup -p 8080:8080 -e SPRING_PROFILES_ACTIVE="swam-new-test" --replicas=1 ec2-13-209-17-102.ap-northeast-2.compute.amazonaws.com:5000/startup
sudo docker service create --name user -e SPRING_PROFILES_ACTIVE="swam-new-test" --replicas=1 ec2-13-209-17-102.ap-northeast-2.compute.amazonaws.com:5000/user


sudo docker service create --name hostname -p 8080:80 --replicas=1 --network fabric-samples alicek106/book:hostname






sudo docker exec invest-backend_mariadb_1 /usr/bin/mysqldump -u root –password=root DATABASE > backup.sql



sudo docker run --name db -p 3306:3306 -e MYSQL_ROOT_PASSWORD=Illunex123! -d mariadb





docker-machine create --driver amazonec2 --amazonec2-instance-type t2.medium --amazonec2-region ap-northeast-2 api-test-master

docker-machine create --driver amazonec2 --amazonec2-region ap-northeast-1 api-test-master
docker-machine create --driver amazonec2 --amazonec2-region ap-northeast-1 api-test-node1



Swarm 모드에서 사용되는 포트 정보
클러스터 관리용 통신 포트: TCP 2377번
노드 간 통신용 포트: TCP/UDP 7946번
오버레이 네트워크 트래픽 용 포트: UDP 4789번