# System Design

## Ne İşe Yarar?

Büyük sistemlerin mimarisini tasarlamak için kullanılan prensipler ve pattern'lerdir. Scalability, reliability, maintainability sağlar.

## Mülakatçı Bu Konuda Neyi Test Eder?

- Scalability strategies (vertical vs horizontal)
- Load balancing
- Caching strategies
- Database scaling
- Microservices vs monolith
- CAP theorem application
- Capacity planning
- Trade-off analysis

## Kısa Cevap

System design, scalability, reliability, maintainability için prensipler içerir. Vertical/horizontal scaling, load balancing, caching, database sharding, microservices, CAP theorem, capacity planning kritik konular.

## Detaylı Açıklama

### Scalability

**Vertical Scaling:**
- Single machine upgrade
- More CPU, RAM, storage
- Simpler, limited by hardware

**Horizontal Scaling:**
- Multiple machines
- Load balancing
- Theoretically unlimited
- Distributed complexity

### Load Balancing

**Algorithms:**
- Round robin
- Least connections
- IP hash
- Weighted

**Types:**
- L4 (transport layer)
- L7 (application layer)
- Global load balancing (GSLB)

**Health Checks:**
- Active checks
- Passive checks
- Circuit breaker integration

### Caching

**Levels:**
- Browser cache
- CDN cache
- Application cache (Redis)
- Database cache

**Strategies:**
- Cache aside
- Write through
- Write behind
- Refresh ahead

**Invalidation:**
- TTL
- Manual invalidation
- Event-driven invalidation

### Database Scaling

**Read Replicas:**
- Master-slave replication
- Read scaling
- Eventual consistency

**Sharding:**
- Data partitioning
- Horizontal scaling
- Complex queries challenging

**Federation:**
- Functional splitting
- Different databases per feature
- Cross-database queries limited

### Microservices vs Monolith

**Monolith:**
- Simple deployment
- Easy debugging
- Tight coupling
- Limited scaling

**Microservices:**
- Independent scaling
- Autonomous deployment
- Distributed complexity
- Data consistency challenges

### CAP Theorem Application

**CP Systems:**
- Consistency + Partition tolerance
- Sacrifice availability
- Example: Banking system

**AP Systems:**
- Availability + Partition tolerance
- Sacrifice consistency
- Example: Social media feed

### Capacity Planning

**Metrics:**
- Requests per second (RPS)
- Data size
- Storage growth
- User growth

**Calculations:**
- Read/write ratio
- Cache hit ratio
- Database throughput
- Network bandwidth

**Headroom:**
- 2-3x expected load
- Burst capacity
- Gradual scaling

### Design Patterns

**API Gateway:**
- Single entry point
- Routing, rate limiting, authentication
- Offload cross-cutting concerns

**Service Discovery:**
- Dynamic service registration
- Load balancing integration
- Health checks

**Circuit Breaker:**
- Failure isolation
- Fallback mechanisms
- Automatic recovery

**Bulkhead Pattern:**
- Resource isolation
- Failure containment
- Thread pool separation

## Kendi Projelerimden Örnek

Real-time market data system design:

- Load balancer (HAProxy) → API servers
- Redis cache layer (cache aside)
- Kafka for event streaming
- PostgreSQL with read replicas
- Horizontal scaling via Kubernetes
- CDN for static assets
- API Gateway for routing

## Sık Sorulan Sorular

**System design kapasite hesabı nasıl yapılır?**
RPS, data size, user growth, read/write ratio, cache hit ratio, headroom (2-3x).

**Vertical vs horizontal scaling farkı nedir?**
Vertical: Single machine upgrade, limited. Horizontal: Multiple machines, unlimited, distributed complexity.

**Caching stratejileri nelerdir?**
Cache aside, write through, write behind, refresh ahead. Cache invalidation kritik.

**Database scaling nasıl yapılır?**
Read replicas, sharding, federation. Trade-off: consistency vs scalability.

**API Gateway ne işe yarar?**
Single entry point, routing, rate limiting, authentication, cross-cutting concerns.

## Dikkat Edilmesi Gerekenler

- Trade-off'ları açıkla
- Start simple, evolve
- Monitoring ve logging
- Failure scenarios
- Data consistency
- Security considerations

## Eksik Olduğum Noktalar

- [ ] Advanced sharding patterns
- [ ] Geo-distribution
- [ ] Disaster recovery
- [ ] Cost optimization
- [ ] Specific system designs (URL shortener, chat, etc.)

## Tekrar Notları

- Scalability = Vertical (single machine) vs Horizontal (multiple machines)
- Load balancing = Round robin, least connections, health checks
- Caching = Cache aside, TTL, invalidation
- Database scaling = Read replicas, sharding, federation
- CAP = Consistency vs Availability (Partition tolerance given)

## Tekrar Kontrol Listesi

- [ ] Scalability strategies'ı anla
- [ ] Load balancing algoritmalarını bil
- [ ] Caching strategies'ı öğren
- [ ] Database scaling yaklaşımlarını bil
- [ ] CAP theorem uygulamasını anla
- [ ] Capacity planning yapmayı öğren
