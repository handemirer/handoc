# Kafka / Message Queue

## Ne İşe Yarar?

Event-driven architecture için message broker'dır. Asenkron communication, loose coupling, scalability ve fault tolerance sağlar.

## Mülakatçı Bu Konuda Neyi Test Eder?

- Kafka vs traditional message queue farkları
- Producer/consumer pattern
- Offset management ve commit
- Partitioning ve replication
- Idempotency ve duplicate handling
- Retry ve DLQ mechanisms
- Backpressure handling

## Kısa Cevap

Kafka, distributed event streaming platform'dur. Log-based storage, partitioning, replication, offset management sağlar. Asenkron communication, loose coupling, fault tolerance ve scalability için kritik.

## Detaylı Açıklama

### Kafka vs Traditional Message Queue

**Kafka:**
- Log-based storage (persistent)
- Multiple consumers (consumer groups)
- High throughput
- Distributed, fault-tolerant
- Event streaming

**Traditional MQ (RabbitMQ, SQS):**
- Message deletion after consumption
- Single consumer per message
- Lower throughput
- Centralized or simple clustering
- Point-to-point or pub/sub

### Core Concepts

**Topic:**
- Message category/stream
- Partitioned for scalability
- Immutable log

**Partition:**
- Ordered sequence of messages
- Each partition on different broker
- Partition key determines partition

**Offset:**
- Message position in partition
- Consumer tracks offset
- Manual vs auto commit

**Consumer Group:**
- Multiple consumers, each partition consumed by one consumer
- Load balancing
- Fault tolerance

**Replication:**
- Partition copies across brokers
- Leader-follower model
- Fault tolerance

### Producer

**Message Keys:**
- Partitioning için
- Same key → same partition (ordering)
- Null key → round-robin

**Acknowledgment:**
- acks=0: Fire and forget
- acks=1: Leader acknowledgment
- acks=all: All replicas acknowledgment

**Retries:**
- Automatic retry on failure
- Idempotent producer for duplicate prevention

### Consumer

**Poll Loop:**
- Fetch messages in batches
- Process messages
- Commit offsets

**Offset Commit:**
- Auto-commit (periodic)
- Manual commit (after processing)
- At-least-once vs at-most-once semantics

**Rebalancing:**
- Consumer join/leave
- Partition reassignment
- Graceful shutdown

### Idempotency

**Duplicate Messages:**
- Network issues, retries
- Consumer crash before commit
- Producer retries

**Idempotent Processing:**
- Unique message ID
- Deduplication logic
- Database constraints

### Dead Letter Queue (DLQ)

**Purpose:**
- Failed messages için
- Manual inspection
- Retry later

**Implementation:**
- Separate topic for DLQ
- Move failed messages after max retries
- Monitor and alert

## Kendi Projelerimden Örnek

Real-time market data sisteminde:

- Kafka topic'leri: market-data, reference-data
- Partitioning by instrument symbol
- Consumer group ile horizontal scaling
- Manual offset commit ile at-least-once semantics
- Redis-based deduplication for idempotency
- DLQ for failed messages
- BackgroundService ile consumer implementation

## Sık Sorulan Sorular

**Message queue sisteminde mesaj iki kez işlenirse ne olur?**
Duplicate message. Idempotent processing gerekir (unique ID, deduplication, database constraints).

**Offset commit edilemeden servis düşerse ne olur?**
Consumer restart'ta son committed offset'ten başlar, duplicate processing riski. At-least-once semantics.

**Retry mekanizmasını nasıl tasarlarsın?**
Exponential backoff, jitter, max retry limit, DLQ after max retries, idempotency.

**Kafka neden yüksek performanslı?**
Sequential disk I/O, zero-copy, batch processing, partitioning.

**Partitioning nasıl çalışır?**
Partition key hash → partition number. Same key → same partition (ordering guarantee).

## Dikkat Edilmesi Gerekenler

- Offset commit timing (auto vs manual)
- Idempotency critical for at-least-once
- Consumer lag monitoring
- Backpressure handling (slow consumer)
- Schema evolution (Avro, Protobuf)
- Consumer rebalancing impact

## Eksik Olduğum Noktalar

- [ ] Kafka Streams ve KSQL
- [ ] Exactly-once semantics
- [ ] Schema registry
- [ ] Consumer lag monitoring tools
- [ ] Kafka Connect

## Tekrar Notları

- Kafka = log-based, distributed, high throughput
- Offset = message position, commit timing critical
- Idempotency = duplicate handling
- DLQ = failed message handling
- Partitioning = scalability, ordering

## Tekrar Kontrol Listesi

- [ ] Kafka vs traditional MQ farklarını anla
- [ ] Producer/consumer pattern'ı bil
- [ ] Offset management'ı öğren
- [ ] Idempotency önemini anla
- [ ] DLQ kullanımını bil
