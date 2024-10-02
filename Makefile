all:
	@mkdir -p data/mariadb
	@mkdir -p data/wordpress
	@docker-compose -f srcs/docker-compose.yml build
	@docker-compose -f srcs/docker-compose.yml up -d

down:
	@docker-compose -f srcs/docker-compose.yml down

logs:
	@docker-compose -f srcs/docker-compose.yml logs -f

re:
	@echo "Cleaning..."
	@make down
	@make clean
	@echo "Rebuilding..."
	@make all

clean:
	@docker stop $$(docker ps -qa);\
	docker rm $$(docker ps -qa);\
	docker rmi -f $$(docker images -qa);\
	docker volume rm $$(docker volume ls -q);\
	docker network rm $$(docker network ls -q);\

.PHONY: all re down clean
