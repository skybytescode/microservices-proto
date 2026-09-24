OUT_DIR := golang
SERVICES := order payment

# Local generation only; CI uses protoc.sh
.PHONY: proto
proto:
	for s in $(SERVICES); do \
		protoc --go_out=./$(OUT_DIR) --go_opt=paths=source_relative \
			--go-grpc_out=./$(OUT_DIR) --go-grpc_opt=paths=source_relative \
			./$$s/*.proto || exit 1; \
	done
