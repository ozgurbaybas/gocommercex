.PHONY: build test lint vet fmt tidy cover tree install-hooks precommit

MODULES := pkg services/customer services/product services/order services/payment services/notification services/gateway

build:
	@for module in $(MODULES); do \
		if [ -d $$module ]; then \
			echo "building $$module"; \
			cd $$module && packages="$$(go list ./... 2>/dev/null || true)" && \
			if [ -n "$$packages" ]; then go build ./...; else echo "no packages in $$module, skipping"; fi; \
			cd - >/dev/null; \
		fi; \
	done

test:
	@for module in $(MODULES); do \
		if [ -d $$module ]; then \
			echo "testing $$module"; \
			cd $$module && packages="$$(go list ./... 2>/dev/null || true)" && \
			if [ -n "$$packages" ]; then go test -race -coverprofile=coverage.out ./...; else echo "no packages in $$module, skipping"; fi; \
			cd - >/dev/null; \
		fi; \
	done

lint:
	@for module in $(MODULES); do \
		if [ -d $$module ]; then \
			echo "linting $$module"; \
			cd $$module && packages="$$(go list ./... 2>/dev/null || true)" && \
			if [ -n "$$packages" ]; then golangci-lint run ./...; else echo "no packages in $$module, skipping"; fi; \
			cd - >/dev/null; \
		fi; \
	done

vet:
	@for module in $(MODULES); do \
		if [ -d $$module ]; then \
			echo "vetting $$module"; \
			cd $$module && packages="$$(go list ./... 2>/dev/null || true)" && \
			if [ -n "$$packages" ]; then go vet ./...; else echo "no packages in $$module, skipping"; fi; \
			cd - >/dev/null; \
		fi; \
	done

fmt:
	gofmt -w .

tidy:
	@for module in $(MODULES); do \
		if [ -f $$module/go.mod ]; then \
			echo "tidying $$module"; \
			cd $$module && go mod tidy; \
			cd - >/dev/null; \
		fi; \
	done

cover:
	@for module in $(MODULES); do \
		if [ -f $$module/coverage.out ]; then \
			echo "coverage report for $$module"; \
			cd $$module && go tool cover -func=coverage.out; \
			cd - >/dev/null; \
		fi; \
	done

tree:
	find . -maxdepth 4 -type d | sort

install-hooks:
	bash scripts/install-git-hooks.sh

precommit:
	bash .githooks/pre-commit