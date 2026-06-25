# URL Shortener

## Problem

Kısa URL'ler oluşturma ve yönlendirme servisi. Yüksek read/write ratio, cache-heavy workload.

## Gereksinimler

### Functional Requirements
- URL shortening
- Redirection to original URL
- Custom short URLs
- Expiration date
- Analytics (click tracking)

### Non-Functional Requirements
- **Latency**: < 100ms for redirection
- **Availability**: 99.9%
- **Scalability**: Handle millions of URLs
- **Durability**: No data loss

## Varsayımlar

- URL count: 100M+
- Daily redirections: 10M+
- Read/Write ratio: 100:1
- Short URL length: 7 characters

## High-Level Design

```
┌─────────────┐
│ Client      │
└──────┬──────┘
       │
       ▼
┌─────────────────┐
│ Load Balancer  │
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
│ (PostgreSQL/    │
│  NoSQL)         │
└─────────────────┘
```

## Data Model

**PostgreSQL:**
```sql
CREATE TABLE urls (
    id SERIAL PRIMARY KEY,
    short_code VARCHAR(10) UNIQUE NOT NULL,
    original_url TEXT NOT NULL,
    created_at TIMESTAMP DEFAULT NOW(),
    expires_at TIMESTAMP,
    click_count INTEGER DEFAULT 0
);

CREATE TABLE clicks (
    id SERIAL PRIMARY KEY,
    url_id INTEGER REFERENCES urls(id),
    clicked_at TIMESTAMP DEFAULT NOW(),
    user_agent VARCHAR(255),
    ip_address INET
);
```

## API Tasarımı

```
POST /api/shorten - Create short URL
GET /{short_code} - Redirect
GET /api/urls/{id}/stats - Get analytics
DELETE /api/urls/{id} - Delete URL
```

## Cache Stratejisi

**Redis:**
- Short code → original URL mapping
- TTL: 1 hour
- Cache aside pattern

## Message Queue / Event Flow

**Kafka (Optional):**
- `click-events`: For analytics processing

## Scalability

**Horizontal Scaling:**
- Multiple API servers
- Redis clustering
- Database read replicas

**Database Scaling:**
- Sharding by short code hash
- Read replicas for analytics queries

## Reliability

**Idempotency:**
- Check duplicate original URL
- Unique short code generation

**Backup:**
- Database backups
- Redis persistence

## Observability

**Metrics:**
- Redirection rate
- Cache hit ratio
- Error rate
- Database query time

## Trade-Offs

**Base62 vs Hash:**
- Base62: Predictable, sequential
- Hash: Random, collision risk

**Sync vs Async Analytics:**
- Sync: Simpler, slower
- Async: Complex, faster

## Mülakatta Nasıl Anlatırım?

"URL shortening with base62 encoding. Redis cache for redirection (100:1 read/write ratio). PostgreSQL for persistence. Horizontal scaling via cache and read replicas."

## Kırmızı Bayrak Cevaplar

- "Cache kullanmam, her zaman DB'ye giderim."
- "Random string kullanırım, base62 bilmiyorum."
- "Analytics gerekmez."
- "Sharding gerekmez, single instance yeterli."

## Tekrar Kontrol Listesi

- [ ] Bu konuyu kısa ve net anlatabiliyorum.
- [ ] Kendi projemden örnek verebiliyorum.
- [ ] Mülakatçının aslında neyi ölçtüğünü biliyorum.
- [ ] Kırmızı bayrak cevaplardan kaçınıyorum.
