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
