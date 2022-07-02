.PHONY: help

help:
	@echo "Generate elixir bindings using the buf command. Run 'make generate'"

generate:
	@echo "Remember to install buf from: https://docs.buf.build/installation "
	@echo "Remember to install protoc-gen-elixir from: https://github.com/elixir-protobuf/protobuf"
	@echo "Generating proto definitions for elixir.."
	buf generate buf.build/authzed/api:3e463bb359cf56fc95dae28138cbe4f09c67aa17
	@echo "Generation successful"
	@echo "Copying files to authzed/api folder..."
	cp -r gen/elixir/authzed/api/* lib/api/
	@echo "Files moved successfully"
	@echo "Removing generated files.."
	rm -rf gen
	@echo "File cleanup completed"

start-infra:
	@echo "Stopping and removing old containers.."
	docker-compose stop
	docker-compose rm -f
	@echo "Starting infra.."
	docker-compose up -d

stop-infra:
	docker-compose stop
	docker-compose rm -f

run-tests:
	docker-compose -f docker-compose-test.yml stop
	docker-compose -f docker-compose-test.yml rm -f
	docker-compose -f docker-compose-test.yml up -d
	mix test
	# docker-compose -f docker-compose-test.yml stop
	# docker-compose -f docker-compose-test.yml rm -f
