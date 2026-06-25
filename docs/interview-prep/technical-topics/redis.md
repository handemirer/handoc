# Redis

## Ne İşe Yarar?

In-memory data structure store'dur. Cache, message broker, session store, rate limiting gibi use case'ler için kullanılır.

## Mülakatçı Bu Konuda Neyi Test Eder?

- Redis data types ve use cases
- Cache strategies (cache aside, write through)
- Expiration ve eviction policies
- Persistence (RDB, AOF)
- Cluster ve replication
- Performance considerations
- Cache invalidation

## Kısa Cevap

Redis, in-memory data structure store'dur. String, hash, list, set, sorted set data types'ı destekler. Cache, session store, rate limiting için kullanılır. RDB ve AOF ile persistence sağlar.

## Detaylı Açıklama

### Data Types

**String:**
- Key-value store
- Binary safe
- Atomic operations (INCR, DECR)

**Hash:**
- Field-value pairs
- Object representation
- Partial updates

**List:**
- Ordered collection
- LPUSH, RPUSH, LPOP, RPOP
- Queue/stack implementation

**Set:**
- Unordered unique elements
- SADD, SMEMBERS, SINTER
- Membership testing

**Sorted Set:**
- Ordered by score
- ZADD, ZRANGE, ZRANK
- Leaderboards, ranking

### Cache Strategies

**Cache Aside (Lazy Loading):**
- Application cache kontrol eder
- Miss ise database'den alır ve cache'e yazar
- Write: Database update, cache invalidate
- Most common pattern

**Write Through:**
- Write hem database hem cache
- Read only from cache
- Write latency artışı

**Write Behind (Write Back):**
- Write cache'e, async database sync
- High write performance
- Data loss riski

**Refresh Ahead:**
- TTL öncesi async refresh
- Cache hit guarantee
- Complex implementation

### Expiration ve Eviction

**TTL (Time To Live):**
- EXPIRE command
- Automatic deletion
- Per key

**Eviction Policies:**
- noeviction: Error on memory full
- allkeys-lru: LRU on all keys
- volatile-lru: LRU on keys with TTL
- allkeys-random: Random eviction
- volatile-random: Random on keys with TTL

### Persistence

**RDB (Redis Database):**
- Point-in-time snapshot
- Fork process, save to disk
- Fast recovery, data loss risk
- Compact file size

**AOF (Append Only File):**
- Every write operation logged
- Append-only file
- Better durability, larger file size
- fsync configuration

**Hybrid:**
- RDB for base snapshot
- AOF for incremental changes
- Balance of performance ve durability

### Replication ve Cluster

**Replication:**
- Master-slave model
- Read scaling
- Failover (sentinel)

**Cluster:**
- Sharding across nodes
- 16384 slots
- High availability
- Cross-slot operations limited

## Kendi Projelerimden Örnek

Real-time market data sisteminde:

- Redis cache ile market data caching
- Sorted set ile real-time ranking
- TTL ile automatic expiration
- Cache aside pattern
- Redis Cluster ile horizontal scaling
- Pub/Sub ile real-time notifications

## Sık Sorulan Sorular

**Redis'i hangi durumlarda kullanırsın?**
Cache, session store, rate limiting, leaderboards, real-time analytics, pub/sub.

**Cache invalidation nasıl yapılır?**
TTL, manual invalidation (DEL), write-through cache, cache aside pattern.

**RDB vs AOF farkı nedir?**
RDB: Snapshot, fast, data loss risk. AOF: Append-only, durable, larger file.

**Redis neden hızlı?**
In-memory storage, single-threaded (no lock contention), optimized data structures.

**Redis cluster nasıl çalışır?**
Sharding via hash slots, 16384 slots, each node manages subset of slots.

## Dikkat Edilmesi Gerekenler

- Memory management kritik
- Cache stampede prevention
- Hot key problem
- Network latency consideration
- Persistence configuration
- Monitoring ve alerting

## Eksik Olduğum Noktalar

- [ ] Redis Modules (RediSearch, RedisJSON)
- [ ] Lua scripting
- [ ] Advanced clustering scenarios
- [ ] Redis Streams
- [ ] Performance tuning

## Tekrar Notları

- Data types = String, Hash, List, Set, Sorted Set
- Cache strategies = Cache Aside, Write Through, Write Behind
- Persistence = RDB (snapshot), AOF (append-only)
- Eviction = LRU, TTL-based policies
- Cluster = Sharding, hash slots

## Tekrar Kontrol Listesi

- [ ] Redis data types'ı öğren
- [ ] Cache strategies'ı anla
- [ ] Expiration ve eviction'ı bil
- [ ] Persistence mekanizmalarını öğren
- [ ] Cluster ve replication'ı anla
