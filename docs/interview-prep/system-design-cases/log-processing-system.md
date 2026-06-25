# Log Processing System

## Problem

Büyük ölçekli distributed system'den log toplama, işleme ve analiz sistemi.

## Gereksinimler

### Functional Requirements
- Log collection from multiple services
- Real-time log processing
- Log search and filtering
- Alerting on error patterns
- Log retention and archiving

### Non-Functional Requirements
- **Throughput**: 1M+ logs/minute
- **Latency**: < 1s for log availability
- **Scalability**: Horizontal scaling
- **Storage**: Cost-effective

## Varsayımlar

- Service count: 100+
- Log volume: 1M+ logs/minute
- Log retention: 30 days hot, 1 year cold
- Search requirement: Full-text search

## High-Level Design

```
┌─────────────┐
│ Services    │
└──────┬──────┘
       │
       ▼
┌─────────────────┐
│ Log Agent       │
│ (Filebeat/Fluentd)│
└──────┬──────────┘
       │
       ▼
┌─────────────────┐
│ Kafka           │
│ (Log Stream)    │
└──────┬──────────┘
       │
       ├──────────────┐
       ▼              ▼
┌─────────────┐  ┌─────────────┐
│ Processing  │  │ Storage     │
│ Service     │  │ (Elasticsearch)│
└──────┬──────┘  └─────────────┘
       │
       ▼
┌─────────────────┐
│ Alerting        │
│ Service         │
└─────────────────┘
```

## Data Model

**Elasticsearch Index:**
```json
{
  "timestamp": "2026-01-15T10:30:00Z",
  "service": "market-data",
  "level": "ERROR",
  "message": "Connection timeout",
  "context": {
    "user_id": 123,
    "request_id": "abc-123"
  }
}
```

## API Tasarımı

```
POST /api/logs - Ingest logs
GET /api/logs/search - Search logs
GET /api/logs/{id} - Get log details
```

## Cache Stratejisi

**Redis:**
- Recent logs cache
- Search result cache
- Alert state cache

## Message Queue / Event Flow

**Kafka Topics:**
- `logs-raw`: Raw log data
- `logs-processed`: Processed logs
- `logs-alerts`: Alert events

## Scalability

**Horizontal Scaling:**
- Multiple log agents
- Processing service scaling
- Elasticsearch cluster

**Storage Scaling:**
- Elasticsearch sharding
- S3 for cold storage
- Lifecycle policies

## Reliability

**Buffering:**
- Kafka as buffer
- Disk buffering on agents

**Idempotency:**
- Unique log ID
- Deduplication

## Observability

**Metrics:**
- Log ingestion rate
- Processing latency
- Error rate
- Storage usage

## Trade-Offs

**Real-time vs Batch:**
- Real-time: Complex, expensive
- Batch: Simpler, higher latency

**Hot vs Cold Storage:**
- Hot: Fast, expensive
- Cold: Slow, cheap

## Mülakatta Nasıl Anlatırım?

"Log agent → Kafka → Processing → Elasticsearch. Real-time processing, alerting, search. Horizontal scaling via Kafka partitions and Elasticsearch sharding."

## Kırmızı Bayrak Cevaplar

- "Logları direkt database'e yazarım."
- "Search gerekmez, grep yeterli."
- "Retention süresi önemli değil."
- "Alerting gerekmez."

## Tekrar Kontrol Listesi

- [ ] Bu konuyu kısa ve net anlatabiliyorum.
- [ ] Kendi projemden örnek verebiliyorum.
- [ ] Mülakatçının aslında neyi ölçtüğünü biliyorum.
- [ ] Kırmızı bayrak cevaplardan kaçınıyorum.
