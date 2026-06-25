# Teknik Mülakat Soruları

## Soru: Message queue sisteminde mesaj iki kez işlenirse ne olur?

### Mülakatçı Neyi Ölçüyor?

Idempotency kavramını anlayıp anlamadığını, duplicate handling stratejilerini bilip bilmediğini.

### Kısa Cevap

Duplicate message oluşur. Idempotent processing gerekir (unique ID, deduplication, database constraints).

### Detaylı Cevap

Message queue sisteminde network issues, retry mekanizmaları veya consumer crash'ları nedeniyle duplicate message'lar oluşabilir. Bu durumda:

- **At-least-once semantics**: Message en az bir kez işlenir, duplicate olabilir
- **Idempotent processing**: Aynı message tekrar işlense bile aynı sonucu üretir
- **Deduplication**: Unique message ID ile duplicate tespiti
- **Database constraints**: Unique constraint ile duplicate prevention

### Kendi Projemden Örnek

Real-time market data sisteminde Kafka consumer'ında duplicate message riski vardı. Redis-based deduplication implement ettim. Her message için unique ID (message ID + offset) Redis'te kontrol ettim. Eğer daha önce işlendiyse skip ettim. Ayrıca PostgreSQL'de unique constraint ile database level protection sağladım.

### Dikkat Edilecek Nokta

Idempotency critical, especially for financial systems. Deduplication logic performans etkileyebilir, efficient design gerekir.

---

## Soru: Offset commit edilemeden servis düşerse ne olur?

### Mülakatçı Neyi Ölçüyor?

Kafka offset management, consumer crash handling, at-least-once semantics kavramlarını anlayıp anlamadığını.

### Kısa Cevap

Consumer restart'ta son committed offset'ten başlar, duplicate processing riski. At-least-once semantics.

### Detaylı Cevap

Kafka consumer'lar offset'leri commit ederler. Eğer commit edilmeden servis düşerse:

- **Last committed offset**: Consumer restart'ta buradan başlar
- **Duplicate processing**: Commit edilmemiş message'lar tekrar işlenir
- **At-least-once semantics**: Message en az bir kez işlenir
- **Manual vs auto commit**: Manual commit ile daha kontrol

### Kendi Projemden Örnek

Kafka consumer'ında manual offset commit kullandım. Message processing tamamlandıktan sonra commit ettim. Servin crash olması durumunda duplicate message riski vardı, bu yüzden idempotent processing implement ettim (Redis-based deduplication).

### Dikkat Edilecek Nokta

Manual commit daha kontrol sağlar ancak complexity ekler. Idempotency critical for at-least-once semantics.

---

## Soru: Retry mekanizmasını nasıl tasarlarsın?

### Mülakatçı Neyi Ölçüyor?

Retry pattern, exponential backoff, jitter, max retry limit, DLQ kullanımını bilip bilmediğini.

### Kısa Cevap

Exponential backoff, jitter, max retry limit, DLQ after max retries. Idempotency gerekir.

### Detaylı Cevap

Retry mekanizması tasarımında:

- **Exponential backoff**: Retry aralığı exponentially artar (1s, 2s, 4s, 8s...)
- **Jitter**: Random noise ekleyerek thundering herd prevention
- **Max retry limit**: Sonsuz retry'den kaçın (örn: 3-5 retry)
- **DLQ (Dead Letter Queue)**: Max retry sonrası failed message'lar için
- **Idempotency**: Retry'lar duplicate message oluşturabilir

### Kendi Projemden Örnek

External API call'ları için retry mekanizması implement ettim. Exponential backoff (base 2) + jitter (±20%) kullandım. Max 3 retry, sonrası DLQ. Idempotent processing ile duplicate handling.

### Dikkat Edilecek Nokta

Exponential backoff + jitter critical for avoiding thundering herd. Max retry limit important for resource management.

---

## Soru: Timeout neden önemlidir?

### Mülakatçı Neyi Ölçüyor?

Timeout management, resource management, system resilience kavramlarını anlayıp anlamadığını.

### Kısa Cevap

Timeout, resource exhaustion prevention, cascade failure avoidance, system resilience için kritik.

### Detaylı Cevap

Timeout management önemlidir çünkü:

- **Resource exhaustion**: Infinite wait thread'leri bloke eder
- **Cascade failure**: Slow service downstream'e yayılır
- **User experience**: Long wait bad UX
- **System resilience**: Timeout ile graceful degradation

**Timeout types:**
- Connection timeout: Connection establishment
- Read timeout: Response reading
- Request timeout: Total request time

### Kendi Projemden Örnek

External API call'ları için timeout kullandım. Connection timeout 5s, read timeout 30s. Timeout sonrası circuit breaker trigger oldu. Bu sayede slow external service sistemimizi etkilemedi.

### Dikkat Edilecek Nokta

Timeout değerleri合理 ayarlanmalı. Çok kısa timeout false positive, çok uzun timeout resource waste.

---

## Soru: Circuit breaker ne işe yarar?

### Mülakatçı Neyi Ölçüyor?

Circuit breaker pattern, fault tolerance, cascade failure prevention kavramlarını bilip bilmediğini.

### Kısa Cevap

Failure threshold sonrası fail-fast, cascade failure prevention, automatic recovery.

### Detaylı Cevap

Circuit breaker pattern:

- **Closed state**: Normal operation, requests pass through
- **Open state**: Failure threshold exceeded, fail-fast
- **Half-open state**: Test recovery, limited requests
- **Automatic recovery**: Half-open success → closed

**Benefits:**
- Cascade failure prevention
- Resource conservation
- Fast failure
- Automatic recovery

### Kendi Projemden Örnek

External API için circuit breaker implement ettim. 5 consecutive failure sonrası open state, 30s sonra half-open. Half-open'ta 3 success sonrası closed. Bu sayede slow external service sistemimizi etkilemedi.

### Dikkat Edilecek Nokta

Threshold ve timeout değerleri doğru ayarlanmalı. Half-open state critical for recovery detection.

---

## Soru: DLQ nedir, ne zaman kullanılır?

### Mülakatçı Neyi Ölçüyor?

Dead Letter Queue concept, error handling, message recovery stratejilerini bilip bilmediğini.

### Kısa Cevap

Failed message'lar için separate queue. Manual inspection, retry later, error analysis için kullanılır.

### Detaylı Cevap

DLQ (Dead Letter Queue):

- **Purpose**: Failed message'lar için separate storage
- **When to use**: Max retry exceeded, poison messages, validation failures
- **Benefits**: Manual inspection, retry later, error analysis, data loss prevention
- **Implementation**: Separate topic/queue, move failed messages

**Use cases:**
- Max retry exceeded
- Poison messages (consistently failing)
- Validation failures
- Schema mismatches

### Kendi Projemden Örnek

Kafka consumer'ında DLQ implement ettim. Max 3 retry sonrası failed message'ları DLQ topic'ine taşıdım. DLQ consumer ile manual inspection ve retry logic implement ettim. Bu sayede data loss prevention sağladım.

### Dikkat Edilecek Nokta

DLQ monitoring critical. Manual inspection process gerekir. DLQ size management important.

---

## Soru: Redis'i hangi durumlarda kullanırsın?

### Mülakatçı Neyi Ölçüyor?

Redis use cases, caching strategies, data structures knowledge'ını anlayıp anlamadığını.

### Kısa Cevap

Cache, session store, rate limiting, leaderboards, real-time analytics, pub/sub.

### Detaylı Cevap

Redis use cases:

- **Caching**: Database load reduction, faster response
- **Session store**: User session management
- **Rate limiting**: API abuse prevention
- **Leaderboards**: Sorted set ile ranking
- **Real-time analytics**: Counter, hyperloglog
- **Pub/Sub**: Real-time messaging
- **Queue**: List ile simple queue

**Data structures:**
- String: Key-value
- Hash: Object representation
- List: Queue/stack
- Set: Unique elements
- Sorted set: Ranking

### Kendi Projemden Örnek

Real-time market data sisteminde Redis cache kullandım. Market data için string cache, ranking için sorted set, deduplication için set. Cache aside pattern ile database load reduction sağladım.

### Dikkat Edilecek Nokta

Redis in-memory, memory management kritik. Cache invalidation complexity. Persistence configuration (RDB vs AOF).

---

## Soru: PostgreSQL'de index tasarlarken nelere dikkat edersin?

### Mülakatçı Neyi Ölçüyor?

Index strategies, query optimization, database performance knowledge'ını bilip bilmediğini.

### Kısa Cevap

Query pattern, selectivity, column order (composite), write overhead, index maintenance.

### Detaylı Cevap

Index design considerations:

- **Query pattern**: WHERE, JOIN, ORDER BY columns
- **Selectivity**: High selectivity (unique values) better for index
- **Column order**: Composite index'te column order matters (equality first, then range)
- **Write overhead**: Index'ler write performance'ı etkiler
- **Index maintenance**: VACUUM, statistics update

**Index types:**
- B-tree: Default, equality ve range queries
- Hash: Equality only
- GIN: Array, JSONB, full-text search
- Partial: Filtered data
- Composite: Multiple columns

### Kendi Projemden Örnek

PostgreSQL'de instrument lookup için B-tree index, JSONB metadata için GIN index, active instruments için partial index implement ettim. EXPLAIN ANALYZE ile query plan analysis yaptım. Index write overhead'i dengeledim.

### Dikkat Edilecek Nokta

Too many indexes write performance'ı etkiler. Query pattern analysis critical. Statistics update (ANALYZE) important.

---

## Soru: WebSocket ile REST API arasındaki fark nedir?

### Mülakatçı Neyi Ölçüyor?

WebSocket vs REST API, real-time communication, use case selection knowledge'ını bilip bilmediğini.

### Kısa Cevap

WebSocket: Bidirectional, real-time, persistent connection. REST: Unidirectional, request-response, stateless.

### Detaylı Cevap

WebSocket vs REST API:

**WebSocket:**
- Bidirectional communication
- Real-time push
- Persistent connection
- Lower overhead (after handshake)
- Use case: Real-time updates, chat, live data

**REST API:**
- Unidirectional (request-response)
- Polling required for real-time
- Stateless
- Simple caching
- Use case: CRUD operations, standard APIs

**Trade-offs:**
- WebSocket: Complex connection management, harder scaling
- REST: Simpler, better caching, standard

### Kendi Projemden Örnek

Real-time market data için WebSocket implement ettim. REST API polling yerine WebSocket push ile sub-second data delivery sağladım. Redis backplane ile multi-server scaling implement ettim.

### Dikkat Edilecek Nokta

WebSocket connection management complex. REST simpler, better caching. Use case based selection important.

---

## Soru: Authentication ve authorization farkı nedir?

### Mülakatçı Neyi Ölçüyor?

AuthN vs AuthZ, security concepts, JWT, OAuth2 knowledge'ını bilip bilmediğini.

### Kısa Cevap

Authentication: Kimlik doğrulama (who are you). Authorization: Yetkilendirme (what can you do).

### Detaylı Cevap

**Authentication (AuthN):**
- Kimlik doğrulama
- "Who are you?"
- Login, credentials
- JWT token, session

**Authorization (AuthZ):**
- Yetkilendirme
- "What can you do?"
- Permissions, roles, policies
- Role-based access control (RBAC)

**JWT:**
- Stateless authentication
- Claims-based
- Signed token

**OAuth2:**
- Delegation authorization
- Third-party access

### Kendi Projemden Örnek

Market data API'sinde JWT token-based authentication implement ettim. Role-based authorization (Admin, User) kullandım. Refresh token rotation ile security sağladım.

### Dikkat Edilecek Nokta

AuthN ve AuthZ ayrı konular. JWT revocation challenge. OAuth2 delegation, not authentication.

---

## Soru: Bir API yavaş çalışıyorsa nasıl analiz edersin?

### Mülakatçı Neyi Ölçüyor?

Performance analysis, bottleneck identification, debugging tools knowledge'ını bilip bilmediğini.

### Kısa Cevap

APM tool ile bottleneck tespit, database query analysis, network latency check, CPU/memory profiling, load testing.

### Detaylı Cevap

Slow API analysis steps:

1. **APM Tool**: Application Performance Monitoring ile bottleneck tespit
2. **Database Queries**: Slow query analysis, EXPLAIN ANALYZE
3. **Network Latency**: External API call'lar, CDN
4. **CPU/Memory**: Profiling tools, resource usage
5. **I/O Operations**: Disk I/O, file operations
6. **Load Testing**: k6, JMeter ile performance validation

**Common bottlenecks:**
- Database queries
- Network I/O
- CPU-bound operations
- Memory pressure
- Disk I/O

### Kendi Projemden Örnek

Market data API'sinde slow response time vardı. APM tool ile database query bottleneck tespit ettim. EXPLAIN ANALYZE ile query optimization yaptım. Index ekledim, query rewrite ettim. Response time 500ms'den 50ms'e düştü.

### Dikkat Edilecek Nokta

Measure before optimize. Realistic load testing. Trade-off'ları anla.

---

## Soru: Sistemde hata yakalamayı nasıl tasarlarsın?

### Mülakatçı Neyi Ölçüyor?

Error handling, logging, monitoring, alerting strategies knowledge'ını bilip bilmediğini.

### Kısa Cevap

Structured logging, error tracking (Sentry), alerting, retry mechanisms, circuit breaker, graceful degradation.

### Detaylı Cevap

Error handling design:

**Logging:**
- Structured logging (JSON)
- Log levels (Error, Warning, Info)
- Correlation ID for tracing
- No sensitive data

**Error Tracking:**
- Sentry, Rollbar
- Exception aggregation
- Stack trace analysis
- User impact tracking

**Alerting:**
- Error rate threshold
- Critical errors (P0)
- Actionable alerts
- Avoid alert fatigue

**Resilience:**
- Retry mechanisms
- Circuit breaker
- Graceful degradation
- Fallback mechanisms

### Kendi Projemden Örnek

Market data sisteminde Serilog ile structured logging implement ettim. Sentry ile error tracking. Error rate threshold ile alerting. Circuit breaker ile graceful degradation. Correlation ID ile distributed tracing.

### Dikkat Edilecek Nokta

Structured logging critical for analysis. Alert fatigue prevention. Sensitive data avoidance.

---

## Soru: Distributed system'lerde veri tutarlılığı nasıl sağlanır?

### Mülakatçı Neyi Ölçüyor?

Distributed consistency, CAP theorem, eventual consistency, saga pattern knowledge'ını bilip bilmediğini.

### Kısa Cevap

CAP theorem: Consistency vs Availability. Eventual consistency, saga pattern, reconciliation processes.

### Detaylı Açıklama

Distributed consistency:

**CAP Theorem:**
- Consistency: All nodes see same data
- Availability: Every request gets response
- Partition tolerance: Network partition handling
- Pick 2: Typically AP (availability + partition tolerance)

**Consistency Models:**
- Strong consistency: Linearizability
- Eventual consistency: Nodes converge over time
- Causal consistency: Causally related operations ordered

**Strategies:**
- Saga pattern: Distributed transactions
- Eventual consistency: Accept temporary inconsistency
- Reconciliation: Background sync processes
- Idempotent operations

### Kendi Projemden Örnek

Microservices architecture'da eventual consistency kullandım. Saga pattern ile distributed transactions çözdüm. Background reconciliation processes implement ettim. Idempotent operations ile duplicate handling.

### Dikkat Edilecek Nokta

Strong consistency high latency. Eventual consistency complexity. Trade-off'ları anla.

---

## Soru: Idempotency nedir?

### Mülakatçı Neyi Ölçüyor?

Idempotency concept, duplicate handling, distributed systems knowledge'ını bilip bilmediğini.

### Kısa Cevap

Aynı operation tekrar edilirse aynı sonucu üretir. Duplicate handling için kritik.

### Detaylı Cevap

Idempotency:

- **Definition**: Aynı operation tekrar edilirse aynı sonucu üretir
- **Importance**: Retry mekanizmaları, duplicate message handling
- **Implementation**: Unique ID, deduplication, database constraints

**Use cases:**
- Retry mechanisms
- Duplicate message handling
- Network failures
- Idempotent API design

**Implementation:**
- Unique message ID
- Deduplication logic (Redis, database)
- Database constraints (unique)
- Conditional updates

### Kendi Projemden Örnek

Kafka consumer'ında idempotency implement ettim. Unique message ID (message ID + offset) ile Redis-based deduplication. PostgreSQL unique constraint ile database level protection. Duplicate message riski handle ettim.

### Dikkat Edilecek Nokta

Idempotency critical for distributed systems. Deduplication logic performans etkileyebilir.

---

## Soru: BackgroundService kullanırken nelere dikkat edersin?

### Mülakatçı Neyi Ölçüyor?

BackgroundService, async processing, graceful shutdown, error handling knowledge'ını bilip bilmediğini.

### Kısa Cevap

Graceful shutdown, error handling, retry mechanisms, resource cleanup, cancellation token.

### Detaylı Cevap

BackgroundService considerations:

**Graceful Shutdown:**
- CancellationToken handling
- Cleanup operations
- In-flight message completion

**Error Handling:**
- Try-catch blocks
- Retry mechanisms
- DLQ for failed messages
- Logging errors

**Resource Management:**
- Connection pooling
- Memory management
- Dispose resources

**Monitoring:**
- Health checks
- Metrics (processing rate, error rate)
- Logging

**Concurrency:**
- Thread safety
- Lock contention
- Parallel processing

### Kendi Projemden Örnek

Kafka consumer BackgroundService implement ettim. CancellationToken ile graceful shutdown. Retry mechanism ve DLQ. Serilog ile structured logging. Prometheus metrics. Connection pooling (Npgsql).

### Dikkat Edilecek Nokta

Graceful shutdown critical. Error handling comprehensive. Resource cleanup important.

## Tekrar Kontrol Listesi

- [ ] Her sorunun kısa cevabını ezberle
- [ ] Detaylı cevapları anla
- [ ] Kendi proje örneklerini ekle
- [ ] Dikkat edilecek noktaları çalış
