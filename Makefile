.PHONY: build test lint vet fmt tidy cover tree

build:
	go build ./...

test:
	go test -race -coverprofile=coverage.out ./...

lint:
	golangci-lint run ./...

vet:
	go vet ./...

fmt:
	gofmt -w .

tidy:
	cd pkg && go mod tidy
	cd services/customer && go mod tidy
	cd services/product && go mod tidy
	cd services/order && go mod tidy
	cd services/payment && go mod tidy
	cd services/notification && go mod tidy
	cd services/gateway && go mod tidy

cover:
	go tool cover -func=coverage.out

tree:
	find . -maxdepth 4 -type d | sort