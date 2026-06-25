# Real-Time Market Data System

## Problem

BIST ve global piyasalar için gerçek zamanlı market data sistemi geliştirme. Yüksek hacimli veri akışı, düşük gecikme ve duplicate message riski ile başa çıkma ihtiyacı.

## Gereksinimler

### Functional Requirements
- BIST ve global piyasalar için real-time price data
- Socket üzerinden data feed alımı
- REST API ile snapshot veri sağlama
- WebSocket ile real-time price distribution
- Historical data erişimi
- Instrument referans verisi yönetimi

### Non-Functional Requirements
- **Latency**: Sub-millisecond price updates
- **Throughput**: 10K+ messages/second
- **Availability**: 99.9% uptime
- **Scalability**: Horizontal scaling capability
- **Reliability**: No data loss, duplicate handling
- **Backpressure**: Slow consumer handling

## Varsayımlar

- Data feed provider socket connection sağlar
- Message format JSON veya binary protocol
- Instrument count: 10K+
- Active users: 1K+
- Peak message rate: 50K messages/second
- Data retention: 30 days historical data

## High-Level Design

```
┌─────────────┐
│ Data Feed   │
│  (Socket)   │
└──────┬──────┘
       │
       ▼
┌─────────────────┐
│ Ingestion       │
│ (Background     │
│  Service)       │
└──────┬──────────┘
       │
       ▼
┌─────────────────┐
│ Kafka /         │
│ Redpanda        │
│ (Event Stream)  │
└──────┬──────────┘
       │
       ├──────────────┐
       ▼              ▼
┌─────────────┐  ┌─────────────┐
│ Processing  │  │ Cache       │
│ Service     │  │ (Redis)     │
└──────┬──────┘  └─────────────┘
       │
       ├──────────────┐
       ▼              ▼
┌─────────────┐  ┌─────────────┐
│ PostgreSQL  │  │ WebSocket   │
│ (Reference  │  │ Distribution│
│  Data)      │  │ Service     │
└─────────────┘  └─────────────┘
                      │
                      ▼
                 ┌─────────┐
                 │ Clients │
                 └─────────┘
```

## Data Model

**PostgreSQL (Reference Data):**
```sql
CREATE TABLE instruments (
    id SERIAL PRIMARY KEY,
    symbol VARCHAR(20) UNIQUE NOT NULL,
    name VARCHAR(100),
    exchange VARCHAR(20),
    type VARCHAR(20),
    is_active BOOLEAN DEFAULT true,
    created_at TIMESTAMP DEFAULT NOW()
);

CREATE TABLE historical_prices (
    id SERIAL PRIMARY KEY,
    instrument_id INTEGER REFERENCES instruments(id),
    price DECIMAL(15, 4),
    volume BIGINT,
    timestamp TIMESTAMP,
    INDEX idx_instrument_timestamp (instrument_id, timestamp)
);
```

**Redis (Real-time Cache):**
- Key: `price:{instrument_id}`
- Value: JSON `{price, volume, timestamp, change}`
- TTL: 5 seconds

**Kafka Topics:**
- `market-data`: Raw price data
- `processed-data`: Processed and enriched data

## API Tasarımı

**REST API:**
```
GET /api/instruments - List instruments
GET /api/instruments/{id} - Get instrument details
GET /api/prices/{instrument_id} - Get current price
GET /api/prices/{instrument_id}/history?from=&to= - Historical data
```

**WebSocket:**
```
WS /ws/realtime
Message: {"type": "subscribe", "instruments": [1, 2, 3]}
Response: {"instrument_id": 1, "price": 100.50, "timestamp": "..."}
```

## Cache Stratejisi

**Redis Cache:**
- **Cache Aside**: Application cache kontrol eder, miss ise DB'den alır
- **TTL**: 5 seconds automatic expiration
- **Write Through**: Price update hem cache hem DB
- **Data Structures**: String for price, Sorted Set for ranking

**Cache Invalidation:**
- TTL-based automatic expiration
- Manual invalidation on instrument status change
- Event-driven invalidation (Kafka)

## Message Queue / Event Flow

**Kafka Configuration:**
- **Topic**: `market-data`
- **Partitions**: 10 (by instrument symbol hash)
- **Replication Factor**: 3
- **Retention**: 7 days

**Consumer Groups:**
- **Processing Service**: Parse and enrich data
- **Cache Service**: Update Redis cache
- **WebSocket Service**: Push to clients

**Offset Management:**
- Manual offset commit after processing
- Idempotency via Redis deduplication
- DLQ for failed messages

**Event Flow:**
1. Ingestion Service → Kafka (raw data)
2. Processing Service ← Kafka (consume)
3. Processing Service → Kafka (processed data)
4. Cache Service ← Kafka (update Redis)
5. WebSocket Service ← Kafka (push to clients)

## Scalability

**Horizontal Scaling:**
- **Kafka Partitions**: 10 partitions for parallel processing
- **Consumer Groups**: Multiple consumers per group
- **WebSocket Servers**: Redis backplane for multi-server
- **API Servers**: Load balancer + multiple instances

**Database Scaling:**
- **Read Replicas**: PostgreSQL read replicas for historical queries
- **Partitioning**: Historical data by date
- **Connection Pooling**: PgBouncer

**Cache Scaling:**
- **Redis Cluster**: Horizontal scaling
- **Consistent Hashing**: Data distribution

## Reliability

**Fault Tolerance:**
- **Retry Mechanism**: Exponential backoff + jitter
- **Circuit Breaker**: External API protection
- **DLQ**: Failed message handling
- **Graceful Shutdown**: BackgroundService cancellation token

**Data Consistency:**
- **Idempotency**: Redis-based deduplication
- **Offset Commit**: Manual commit after processing
- **Eventual Consistency**: Cache and DB sync

**Monitoring:**
- **Health Checks**: /health endpoint
- **Metrics**: Prometheus (rate, latency, errors)
- **Logging**: Serilog structured logging
- **Tracing**: Jaeger distributed tracing

## Observability

**Logging:**
- **Structured Logging**: JSON format (Serilog)
- **Correlation ID**: Request tracing
- **Log Levels**: Error, Warning, Info, Debug
- **Sensitive Data**: No PII in logs

**Metrics:**
- **RED Method**: Rate (messages/sec), Errors, Duration (latency)
- **Custom Metrics**: Active connections, cache hit ratio
- **Prometheus**: Metrics collection
- **Grafana**: Visualization

**Tracing:**
- **Jaeger**: Distributed tracing
- **Trace Context**: Correlation across services
- **Span Analysis**: Latency breakdown

## Trade-Offs

**Consistency vs Latency:**
- **Choice**: Eventual consistency
- **Reason**: Low latency critical for real-time data
- **Mitigation**: Short TTL, reconciliation processes

**Cache vs Database:**
- **Choice**: Redis cache + PostgreSQL
- **Reason**: Cache for speed, DB for persistence
- **Trade-off**: Cache invalidation complexity

**Kafka vs Direct Socket:**
- **Choice**: Kafka for event streaming
- **Reason**: Scalability, fault tolerance, replay capability
- **Trade-off**: Added complexity, latency

**WebSocket vs REST Polling:**
- **Choice**: WebSocket for real-time
- **Reason**: Sub-second updates, efficient
- **Trade-off**: Connection management complexity

## Mülakatta Nasıl Anlatırım?

**Opening:**
"Real-time market data sistemi tasarlayacağım. BIST ve global piyasalar için sub-millisecond price updates sağlayacağım."

**Step 1 - Requirements:**
"Functional requirements: Real-time price data, REST API snapshot, WebSocket distribution. Non-functional: Sub-millisecond latency, 10K+ messages/second throughput, 99.9% availability."

**Step 2 - High-Level Design:**
"Socket data feed → BackgroundService ingestion → Kafka event streaming → Processing service → Redis cache + PostgreSQL → WebSocket distribution. Partitioning by instrument symbol for scalability."

**Step 3 - Data Model:**
"PostgreSQL for reference data and historical prices. Redis for real-time price cache with 5s TTL. Kafka topics for event streaming."

**Step 4 - Key Challenges:**
"Duplicate message risk: Redis-based deduplication. Offset commit problem: Manual commit + idempotency. Backpressure: Circuit breaker + DLQ. Low latency: In-memory cache + async processing."

**Step 5 - Scalability:**
"Horizontal scaling via Kafka partitions (10 partitions), consumer groups, Redis cluster, WebSocket multi-server with Redis backplane."

**Step 6 - Trade-Offs:**
"Eventual consistency for low latency. Kafka complexity for scalability. WebSocket complexity for real-time updates."

## Kırmızı Bayrak Cevaplar

- "Her şeyi PostgreSQL'e yazarım, cache gerekmez."
- "Kafka mesajı zaten sadece bir kere gönderir."
- "WebSocket connection management basittir."
- "Duplicate message olmaz, retry kullanmam."
- "Latency önemli değil, 1-2 saniye sorun değil."
- "Single instance yeterli, scaling gerekmez."
- "Monitoring gerekmez, log yeterli."

## Tekrar Kontrol Listesi

- [ ] Bu konuyu kısa ve net anlatabiliyorum.
- [ ] Kendi projemden örnek verebiliyorum.
- [ ] Mülakatçının aslında neyi ölçtüğünü biliyorum.
- [ ] Kırmızı bayrak cevaplardan kaçınıyorum.
