IMAGES=ubuntu-percona:
TAG=0119
CONTAINER=u-percona
IP=172.17.0.2
.PHONY:all
all:
	@echo make build
	@echo make run
	@echo make clean
	@echo make connect
	@echo make ip
	@echo make logs
	@echo make container
build:
	@sudo docker build -t $(IMAGES)$(TAG) .
run:
	@sudo docker run --name $(CONTAINER) -e MYSQL_ROOT_PASSWORD=123456 -d $(IMAGES)$(TAG)
clean:
	@sudo docker rm -f $(CONTAINER)
connect:
	@sudo docker run -it --rm $(IMAGES)$(TAG) mysql -h$(IP) -uroot -p
ip:
	@sudo docker inspect $(CONTAINER) | grep IPAddress
logs:
	@sudo docker logs $(CONTAINER)
container:
	@sudo docker exec -it $(CONTAINER) bash
