.PHONY: help

help:
	@echo "Generate elixir bindings using the buf command. Run 'make generate'"

generate:
	@echo "Remember to install buf from: https://docs.buf.build/installation "
	@echo "Remember to install protoc-gen-elixir from: https://github.com/elixir-protobuf/protobuf"
	@echo "Generating proto definitions for elixir.."
	buf generate buf.build/authzed/api:8ae4cf539d36085c169d8805c54e1bead3d7b9b9
	@echo "Generation successful"
	@echo "Copying files to authzed/api folder..."
	cp -r gen/elixir/authzed/api/* lib/api/
	@echo "Files moved successfully"
	@echo "Removing generated files.."
	rm -rf gen
	@echo "File cleanup completed"
