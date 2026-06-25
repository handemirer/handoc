# Distributed Systems

## Ne İşe Yarar?

Birden fazla node üzerinde çalışan, network üzerinden iletişim kuran sistemlerdir. Scalability, fault tolerance ve geographic distribution sağlar.

## Mülakatçı Bu Konuda Neyi Test Eder?

- CAP theorem ve consistency models
- Distributed transactions ve saga pattern
- Fault tolerance ve retry mechanisms
- Eventual consistency ve reconciliation
- Leader election ve consensus
- Distributed caching

## Kısa Cevap

Distributed systems, multiple node üzerinde çalışır. CAP theorem (consistency, availability, partition tolerance), eventual consistency, fault tolerance, retry mechanisms ve leader election gibi konuları içerir.

## Detaylı Açıklama

### CAP Theorem

**Consistency (C):**
- Tüm node'lar aynı anda aynı data'yı görür
- Strong consistency: Linearizability
- Trade-off: Latency artışı

**Availability (A):**
- Her request her zaman response alır (success/failure)
- No downtime
- Trade-off: Consistency sacrifice

**Partition Tolerance (P):**
- Network partition'larına rağmen system çalışır
- Distributed systems'de zorunlu
- Trade-off: C veya A sacrifice

**Combinations:**
- CA: Single node (not distributed)
- CP: Consistency + partition tolerance (sacrifice availability)
- AP: Availability + partition tolerance (sacrifice consistency)

### Consistency Models

**Strong Consistency:**
- Linearizability
- Read after write consistency
- High latency

**Eventual Consistency:**
- Node'lar zamanla aynı data'ya ulaşır
- Low latency
- Reconciliation gerekli

**Causal Consistency:**
- Causally related operations sırası korunur
- Intermediate between strong ve eventual

### Fault Tolerance

**Retry Mechanisms:**
- Exponential backoff
- Jitter
- Max retry limit
- Idempotency requirement

**Circuit Breaker:**
- Failure threshold
- Open state (fail fast)
- Half-open state (test recovery)
- Closed state (normal operation)

**Bulkhead Pattern:**
- Resource isolation
- Failure containment
- Thread pool separation

**Timeout Management:**
- Request timeout
- Connection timeout
- Read timeout
- Adaptive timeout

### Distributed Transactions

**Two-Phase Commit (2PC):**
- Coordinator ve participants
- Prepare phase
- Commit phase
- Blocking, single point of failure

**Saga Pattern:**
- Sequence of local transactions
- Compensation transactions for rollback
- Choreography vs orchestration
- Eventual consistency

**Outbox Pattern:**
- Database operation ve message sending atomicity
- Outbox table
- Background process for message sending

### Leader Election

**Raft Consensus Algorithm:**
- Leader election
- Log replication
- Safety guarantees
- Used in etcd, Consul

**Paxos:**
- Classic consensus algorithm
- Complex implementation
- Used in Google Chubby

### Distributed Caching

**Cache Invalidation:**
- Cache aside pattern
- Write through
- Write behind
- Refresh ahead

**Cache Consistency:**
- TTL (time to live)
- Active invalidation
- Versioning
- Cache stampede prevention

## Kendi Projelerimden Örnek

Real-time market data sisteminde:

- Redis cache ile distributed caching
- Eventual consistency ile data synchronization
- Retry mechanism with exponential backoff
- Circuit breaker ile external API protection
- Kafka ile event-driven communication

## Sık Sorulan Sorular

**CAP theorem nedir?**
Consistency, Availability, Partition tolerance - distributed systems'de P zorunlu, C veya A seçilir.

**Eventual consistency nedir?**
Node'lar zamanla aynı data'ya ulaşır. Low latency, reconciliation gerekli.

**Saga pattern nasıl çalışır?**
Sequence of local transactions, compensation transactions ile rollback.

**Circuit breaker ne işe yarar?**
Failure threshold sonrası fail-fast, system cascade failure'ı önler.

**Distributed transaction nasıl yapılır?**
Saga pattern, outbox pattern, eventual consistency.

## Dikkat Edilmesi Gerekenler

- Network failures her zaman olabilir
- Partial failure'ları handle et
- Timeout'ları合理 ayarla
- Idempotency kritik
- Monitoring ve logging essential

## Eksik Olduğum Noktalar

- [ ] Raft algorithm detayları
- [ ] Vector clocks
- [ ] CRDTs (Conflict-free Replicated Data Types)
- [ ] Distributed locking
- [ ] Consistent hashing

## Tekrar Notları

- CAP = Consistency, Availability, Partition tolerance
- Consistency = Strong vs Eventual
- Fault tolerance = Retry, Circuit Breaker, Bulkhead
- Transactions = Saga, Outbox pattern
- Leader election = Raft, Paxos

## Tekrar Kontrol Listesi

- [ ] CAP theorem'ı anla
- [ ] Consistency modellerini bil
- [ ] Fault tolerance pattern'larını öğren
- [ ] Distributed transaction yaklaşımlarını bil
- [ ] Leader election mekanizmalarını anla
