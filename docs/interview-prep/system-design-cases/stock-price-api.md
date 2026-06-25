# Stock Price API

## Problem

Hisse senedi fiyatları için REST API. High read load, cache-heavy, real-time price updates.

## Gereksinimler

### Functional Requirements
- Get current stock price
- Get historical prices
- Batch price queries
- Real-time price updates
- Price alerts

### Non-Functional Requirements
- **Latency**: < 50ms for price queries
- **Throughput**: 10K+ requests/second
- **Freshness**: Prices < 1 second old
- **Availability**: 99.9%

## Varsayımlar

- Stock count: 10K+
- Daily requests: 1M+
- Read/Write ratio: 1000:1
- Price update frequency: Every second

## High-Level Design

```
┌─────────────┐
│ Client      │
└──────┬──────┘
       │
       ▼
┌─────────────────┐
│ API Gateway     │
└──────┬──────────┘
       │
       ├──────────────┐
       ▼              ▼
┌─────────────┐  ┌─────────────┐
│ API Server  │  │ Cache       │
│             │  │ (Redis)     │
└──────┬──────┘  └─────────────┘
       │
       ▼
┌─────────────────┐
│ Database        │
│ (PostgreSQL)    │
└─────────────────┘
       ▲
       │
┌─────────────┐
│ Price Feed  │
│ (External)  │
└─────────────┘
```

## Data Model

**PostgreSQL:**
```sql
CREATE TABLE stocks (
    id SERIAL PRIMARY KEY,
    symbol VARCHAR(10) UNIQUE NOT NULL,
    name VARCHAR(100),
    exchange VARCHAR(20)
);

CREATE TABLE prices (
    id SERIAL PRIMARY KEY,
    stock_id INTEGER REFERENCES stocks(id),
    price DECIMAL(15, 4),
    volume BIGINT,
    timestamp TIMESTAMP DEFAULT NOW(),
    INDEX idx_stock_timestamp (stock_id, timestamp)
);
```

## API Tasarımı

```
GET /api/prices/{symbol} - Get current price
GET /api/prices/batch?symbols=AAPL,MSFT - Batch prices
GET /api/prices/{symbol}/history?from=&to= - Historical
POST /api/alerts - Create price alert
```

## Cache Stratejisi

**Redis:**
- Key: `price:{symbol}`
- Value: JSON `{price, volume, timestamp}`
- TTL: 1 second
- Write-through cache

## Message Queue / Event Flow

**Kafka:**
- `price-updates`: Real-time price updates
- `price-alerts`: Alert events

## Scalability

**Horizontal Scaling:**
- Multiple API servers
- Redis clustering
- Database read replicas

**Cache Strategy:**
- Multi-level cache (Redis + local cache)
- Cache warming for popular stocks

## Reliability

**Fallback:**
- Cache miss → Database
- Database down → Stale cache
- External feed down → Last known price

**Monitoring:**
- Price freshness checks
- Cache hit ratio
- Error rate

## Observability

**Metrics:**
- Request rate
- Cache hit ratio
- Price freshness
- Error rate

## Trade-Offs

**Cache Freshness vs Load:**
- Short TTL: Fresh, high DB load
- Long TTL: Stale, low DB load

**Sync vs Async Updates:**
- Sync: Fresh, slow
- Async: Fast, eventual consistency

## Mülakatta Nasıl Anlatırım?

"Stock price API with Redis cache (1s TTL). Write-through cache for freshness. Read replicas for historical queries. Kafka for real-time updates and alerts."

## Kırmızı Bayrak Cevaplar

- "Her request DB'ye giderim."
- "Cache kullanmam, veri fresh olmalı."
- "Batch query desteklemem."
- "Real-time update gerekmez."

## Tekrar Kontrol Listesi

- [ ] Bu konuyu kısa ve net anlatabiliyorum.
- [ ] Kendi projemden örnek verebiliyorum.
- [ ] Mülakatçının aslında neyi ölçtüğünü biliyorum.
- [ ] Kırmızı bayrak cevaplardan kaçınıyorum.
