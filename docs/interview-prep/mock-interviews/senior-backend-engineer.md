# Senior Backend Engineer Mock Interview

## Amaç

Senior Backend Engineer rolü için advanced technical knowledge, scalability, fault tolerance ve system ownership yetkinliklerini ölçmek.

## Beklenen Seviye

- 5-8 yıl deneyim
- Deep .NET knowledge
- Strong distributed systems understanding
- System design capability
- Performance optimization deneyimi

## Isınma Soruları

1. Kariyer hedefin nedir?
2. Senior rolde neyi farklı yaparsın?
3. En zor teknik problemin neydi?
4. Technical leadership deneyimin?

## Teknik Sorular

### Advanced .NET
- Memory management ve GC tuning
- Threading ve concurrency
- Performance profiling
- DI container advanced usage

### Distributed Systems
- CAP theorem ve consistency
- Idempotency nasıl sağlanır?
- Retry mekanizması tasarımı
- Circuit breaker implementation

### Kafka Advanced
- Offset commit stratejileri
- Idempotency ve duplicate handling
- Backpressure handling
- DLQ kullanımı

### Redis Advanced
- Data structures ve use cases
- Clustering ve sharding
- Persistence (RDB vs AOF)
- Cache invalidation strategies

### PostgreSQL Advanced
- Indexing strategies (B-tree, GIN, partial)
- Query optimization
- MVCC ve transaction isolation
- Connection pooling

### Performance
- API yavaşsa nasıl analiz edersin?
- Bottleneck identification
- Load testing stratejileri
- Profiling tools

## System Design Sorular

**Intermediate Case:**
- Real-time notification system
- Rate limiter design
- Distributed cache design

**Sorular:**
- Scalability stratejin?
- Trade-off'lar neler?
- Failure scenarios?

## Davranışsal Sorular

1. Technical conflict nasıl çözdün?
2. Junior developer mentörlüğü?
3. Technical decision nasıl alırsın?
4. System failure yönetimi?

## Güçlü Cevap Örnekleri

**Idempotency:**
"Idempotency critical for distributed systems. Redis-based deduplication kullanıyorum. Unique message ID ile duplicate tespiti. Database constraints ile additional protection."

**Performance Analysis:**
"APM tool ile bottleneck tespit ederim. EXPLAIN ANALYZE ile query optimization. Profiling tools ile CPU/memory analysis. Load testing ile validation."

## Zayıf Cevap Örnekleri

- "Idempotency bilmiyorum, retry yeterli."
- "Performance tuning yapmadım."
- "System design yapmadım, sadece implement ettim."
- "Technical decision almadım, team lead verdi."

## Değerlendirme Rubriği

**Teknik (70%):**
- Advanced .NET: 15%
- Distributed systems: 25%
- Kafka/Redis advanced: 15%
- Performance: 15%

**System Design (20%):**
- Design capability: 10%
- Trade-off analysis: 10%

**Davranışsal (10%):**
- Technical leadership: 5%
- Problem solving: 5%

**Puanlama:**
- 7+/10: Başarılı
- 5-6/10: Sınırda
- <5/10: Başarısız

## Tekrar Kontrol Listesi

- [ ] Bu konuyu kısa ve net anlatabiliyorum.
- [ ] Kendi projemden örnek verebiliyorum.
- [ ] Mülakatçının aslında neyi ölçtüğünü biliyorum.
- [ ] Kırmızı bayrak cevaplardan kaçınıyorum.
