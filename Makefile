all:
	@mkdir -p ~/data/mariadb
	@mkdir -p ~/data/wordpress
	@docker-compose -f srcs/docker-compose.yml build
	@docker-compose -f srcs/docker-compose.yml up -d

down:
	@docker-compose -f srcs/docker-compose.yml down

logs:
	@docker-compose -f srcs/docker-compose.yml logs -f

clean:
	make down
	docker container prune --force

fclean:
	make clean
	sudo rm -rf /home/npremont/inception/data
	docker system prune --all --force
	docker volume rm /home/npremont/inception/data/mariadb /home/npremont/inception/wordpress

re:
	make fclean 
	make all

.PHONY: all re down clean fclean logs
