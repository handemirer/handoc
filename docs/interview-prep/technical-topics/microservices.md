# Microservices

## Ne İşe Yarar?

Monolith uygulamanın küçük, bağımsız servislere bölünmüş mimarisidir. Her service kendi business logic'ini, database'ini ve deployment'ını yönetir.

## Mülakatçı Bu Konuda Neyi Test Eder?

- Microservices vs monolith trade-off'ları
- Service decomposition stratejileri
- Inter-service communication
- Data consistency ve distributed transactions
- Service discovery ve load balancing
- Deployment ve orchestration

## Kısa Cevap

Microservices, monolith'i küçük, bağımsız servislere böler. Her service autonomous deployment, independent scaling, technology freedom sağlar ancak distributed system complexity, data consistency ve operational overhead getirir.

## Detaylı Açıklama

### Microservices vs Monolith

**Monolith Avantajları:**
- Simple development ve debugging
- Easy deployment (single artifact)
- No network latency
- Strong consistency (single database)

**Monolith Dezavantajları:**
- Tight coupling
- Difficult scaling (scale entire app)
- Technology lock-in
- Large codebase complexity

**Microservices Avantajları:**
- Independent scaling
- Autonomous deployment
- Technology diversity
- Fault isolation

**Microservices Dezavantajları:**
- Distributed system complexity
- Data consistency challenges
- Network latency
- Operational overhead

### Service Decomposition

**By Business Capability:**
- Domain-driven design (DDD)
- Bounded contexts
- Business function separation

**By Data:**
- Shared database anti-pattern
- Database per service
- Data ownership

### Inter-Service Communication

**Synchronous (HTTP/REST):**
- Simple to implement
- Request/response pattern
- Tight coupling risk

**Asynchronous (Message Queue):**
- Loose coupling
- Event-driven
- Eventual consistency
- Retry ve DLQ support

### Data Consistency

**CAP Theorem:**
- Consistency, Availability, Partition tolerance - pick 2
- Microservices typically AP (availability + partition tolerance)

**Saga Pattern:**
- Distributed transactions için
- Choreography vs orchestration
- Compensation transactions

**Eventual Consistency:**
- Accept temporary inconsistency
- Reconciliation processes
- Idempotent operations

### Service Discovery

**Client-side discovery:**
- Client service registry'den service bulur
- Load balancing client-side
- Example: Netflix Eureka

**Server-side discovery:**
- Client load balancer'a request atar
- Load balancer service registry'den service bulur
- Example: Kubernetes, AWS ALB

## Kendi Projelerimden Örnek

Real-time market data sisteminde:

- Market data service (data ingestion)
- Cache service (Redis)
- Distribution service (WebSocket)
- Reference data service (PostgreSQL)
- Event-driven communication (Kafka)
- Database per service pattern

## Sık Sorulan Sorular

**Microservices ne zaman kullanılmalı?**
Complex domain, independent scaling needs, multiple teams, technology diversity gerektiğinde.

**Monolith'ten microservices'e nasıl geçilir?**
Strangler fig pattern: Incremental migration, feature by feature.

**Data consistency nasıl sağlanır?**
Saga pattern, eventual consistency, idempotent operations, reconciliation.

**Service discovery neden önemlidir?**
Dynamic service instances, load balancing, fault tolerance.

**Inter-service communication nasıl seçilir?**
Synchronous for simple request/response, asynchronous for events ve loose coupling.

## Dikkat Edilmesi Gerekenler

- Distributed system complexity'i hafife alma
- Data consistency zorluklarını anla
- Network latency ve failure handling
- Operational overhead (monitoring, logging)
- Don't start with microservices - begin with monolith

## Eksik Olduğum Noktalar

- [ ] Saga pattern detayları
- [ ] Service mesh (Istio, Linkerd)
- [ ] API Gateway patterns
- [ ] Circuit breaker implementation
- [ ] Distributed tracing

## Tekrar Notları

- Microservices = independent services, trade-off complexity
- Communication = sync (HTTP) vs async (message queue)
- Consistency = eventual consistency, saga pattern
- Discovery = client-side vs server-side
- Start with monolith, evolve to microservices

## Tekrar Kontrol Listesi

- [ ] Microservices vs monolith trade-off'larını anla
- [ ] Service decomposition stratejilerini bil
- [ ] Inter-service communication pattern'larını öğren
- [ ] Data consistency yaklaşımlarını anla
- [ ] Service discovery mekanizmalarını bil
