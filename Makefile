## This is based on the Makefile in ucan-lab's repository.
## https://github.com/ucan-lab/docker-laravel

up:
	docker-compose up -d
build:
	docker-compose build --no-cache --force-rm
init:
	docker-compose up -d --build
remake:
	@make destroy
	@make init
stop:
	docker-compose stop
down:
	docker-compose down --remove-orphans
restart:
	@make down
	@make up
destroy:
	docker-compose down --rmi all --volumes --remove-orphans
destroy-volumes:
	docker-compose down --volumes --remove-orphans
ps:
	docker-compose ps
logs:
	docker-compose logs
logs-watch:
	docker-compose logs --follow
log-builder:
	docker-compose logs builder
log-builder-watch:
	docker-compose logs --follow builder
log-tomcat:
	docker-compose logs tomcat
log-tomcat-watch:
	docker-compose logs --follow tomcat
log-db:
	docker-compose logs db
log-db-watch:
	docker-compose logs --follow db
builder:
	docker-compose exec builder bash
tomcat:
	docker-compose exec tomcat bash
db:
	docker-compose exec db bash
sql:
	docker-compose exec db bash -c 'mysql -u $$MYSQL_USER -p$$MYSQL_PASSWORD $$MYSQL_DATABASE'
