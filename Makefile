init:
	mkdir -p /home/mmeski/data/wordpress /home/mmeski/data/mariadb
build: 
	docker-compose -f ./srcs/docker-compose.yml up --build 
down:
	docker-compose -f ./srcs/docker-compose.yml down
clean:
	rm -rf /home/mmeski/data/wordpress /home/mmeski/data/mariadb
fclean:
	docker rm -f $(docker ps -a -q)
	docker image prune -af
	docker network prune -f
	docker volume rm -f $(docker volume ls -q)
re:
	clean fclean init build
