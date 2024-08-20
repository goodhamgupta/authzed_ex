.PHONY: help

help:
	@echo "Generate elixir bindings using the buf command. Run 'make generate'"

generate:
	@echo "Remember to install buf from: https://docs.buf.build/installation "
	@echo "Remember to install protoc-gen-elixir from: https://github.com/elixir-protobuf/protobuf"
	@echo "Generating proto definitions for elixir.."
	./buf.gen.yaml
	@echo "Generation successful"
	@echo "Copying files to authzed/api folder..."
	cp -r authzed/api/* lib/api/
	@echo "Copying files to google/rpc folder..."
	@mkdir -p lib/google
	cp -r google/rpc lib/google/
	@echo "Files moved successfully"
	@echo "Removing generated files.."
	rm -rf authzed
	@echo "File cleanup completed"
	@echo "Formating files.."
	mix format
	@echo "Formating completed"

start-infra:
	@echo "Stopping and removing old containers.."
	docker compose stop
	docker compose rm -f
	@echo "Starting infra.."
	docker compose up -d

stop-infra:
	docker compose stop
	docker compose rm -f

run-tests:
	docker compose -f docker-compose-test.yml stop
	docker compose -f docker-compose-test.yml rm -f
	docker compose -f docker-compose-test.yml up -d
	mix test --warnings-as-errors
	docker compose -f docker-compose-test.yml stop
	docker compose -f docker-compose-test.yml rm -f
