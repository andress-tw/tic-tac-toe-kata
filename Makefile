-include .env
export



help: 			## List targets and description
	@fgrep -h "##" $(MAKEFILE_LIST) | fgrep -v fgrep | sed -e 's/\\$$//' | sed -e 's/##//'

# Checks  --------------------
##
precommit: 		## Precommit checks (lint, security, tests)
	@$(MAKE) format
	@$(MAKE) lint
	@$(MAKE) security
	@$(MAKE) test
	@echo "You're good to go 🎉"

check: 			## Development checks (lint, tests)
	@$(MAKE) format
	@$(MAKE) lint
	@$(MAKE) test-coverage

lint: 			## Lint checks
	@echo "Add linter"

format: 		## Format code
	@echo "Add formatter"

# tests  --------------------
##
test: 			## Run unit tests
	@docker-compose run --build tic-tac-toe mvn test

test-focus: 		## Run unit tests marked with a tag, use tag=<focus-tag>
	@docker-compose run --build tic-tac-toe mvn test -D groups=$(tag)


test-coverage:  	## Run unit tests with coverage for all modules with no reports
	@$(MAKE) remove-container container=test-tic-tac-toe
	@docker-compose run --build --name test-tic-tac-toe tic-tac-toe mvn test-compile org.pitest:pitest-maven:mutationCoverage

test-coverage-all:  	## Run unit tests with coverage and mutation report for all modules
	@$(MAKE) test-coverage
	@$(MAKE) download-report

download-report:  	## Download mutation reports for specific modules, use module=<module-name>
	@mkdir -p pit-reports
	@rm -rf ./pit-reports/$(module)
	@docker cp test-tic-tac-toe:./app/pit-reports ./pit-reports

# Security  --------------------
##
security: 		## Run security checks
	@$(MAKE) detect-secrets
	@$(MAKE) detect-vulns

detect-secrets: 	## Check source code for possible secrets
	@echo "Add secrets detector"

detect-vulns: 		## Check source code for common vulnerabilities
	@echo "Add vulnerability detector"



# Running --------------------
##
run: 			## Run the application base image
	@docker-compose run tic-tac-toe java -jar ./target/tic-tac-toe-kata-1.0-SNAPSHOT.jar $(input)

run-dev: 		## Run the application with hot reload
	@echo "Add run command"

# Maintenance -------------------------
##

shell: 			## Run the application environment and drop into a shell
	@docker-compose run --build tic-tac-toe bash

# Setup and config --------------------
##
start: 			## Manually (re)create the environment image
	@docker-compose up -d

start-local: 		## Manually (re)create the local image
	@docker-compose --profile local up -d

stop: 			## Stops docker containers
	@docker-compose down

build: 			## Build or rebuild docker compose services
	@docker-compose --profile local build

colima-start: 		## Starts colima with rosetta for m1 chips
	@colima start --cpu 8 --memory 8 --disk 10 --arch aarch64 --vm-type=vz --vz-rosetta

colima-stop: 		## Stop docker daemon
	@colima stop

colima-delete: 		## Deletes all colima config
	@colima delete


# Clean up and reset --------------------
##

check-docker: 		## Checks docker images, containers, volumes
	@docker ps -a

clean-docker: 		## Clean up docker images, containers, volumes
	@docker system prune -a

remove-container: 	## Remove docker containers, use container=<container-name>
	@docker rm -f $(container)

clean-env: 		## Clean up environment
	@docker image rm -f xxxxxxxxxx &&\
	  rm -rf .coverage &&\
	  rm -rf venv

clean-slate: 		## Runs clean-env  and clean-docker
	@$(MAKE) clean-docker && $(MAKE) clean-env