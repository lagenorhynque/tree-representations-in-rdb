SHELL:=/bin/bash

.PHONY: mysql
mysql:
	@docker-compose exec mariadb mysql -udev -ppass tree

.PHONY: mysql-wo-tty
mysql-wo-tty:
	@docker-compose exec -T mariadb mysql -udev -ppass tree

.PHONY: migrate
migrate:
	@find ddl -name '*.up.sql' | sort | tee >(xargs cat | make mysql-wo-tty)

.PHONY: rollback
rollback:
	@find ddl -name '*.down.sql' | sort -r | tee >(xargs cat | make mysql-wo-tty)

.PHONY: seed
seed:
	@find dml -name '*.sql' | sort | tee >(xargs cat | make mysql-wo-tty)
