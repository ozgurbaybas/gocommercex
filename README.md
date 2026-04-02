# GoCommerceX

GoCommerceX, production-grade bir e-commerce backend projesidir. Mimari yaklaşım olarak Go tabanlı microservice yapısı, Domain-Driven Design prensipleri, güvenlik, gözlemlenebilirlik, dayanıklılık ve test disiplini esas alınır.

## Hedef

Bu repository'nin amacı, gerçek hayata yakın bir e-commerce backend platformunu aşağıdaki ilkelerle inşa etmektir:

- Go 1.22+
- Monorepo + Go workspaces
- Domain-Driven Design
- PostgreSQL
- Kafka
- Consul
- Vault
- Zipkin + OpenTelemetry
- Prometheus + Grafana
- GitHub Actions
- Test-first / test-immediately-after yaklaşımı

## Servisler

- customer
- product
- order
- payment
- notification
- gateway

## Repository Yapısı

```text
gocommercex/
├── go.work
├── Makefile
├── .gitignore
├── .golangci.yml
├── .githooks/
├── docker-compose.yml
├── .env.example
├── README.md
├── .github/
├── docs/
├── scripts/
├── pkg/
└── services/