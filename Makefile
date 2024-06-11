all: up

up:
	docker-compose up

down:
	docker-compose down

clean: down
	docker system prune --volumes -af
	docker volume prune -af

re: clean 
	git pull
	make

.PHONY: all clean up down re