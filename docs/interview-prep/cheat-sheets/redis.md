# Redis Cheat Sheet

## 30 Saniyelik Özet

Redis, in-memory data structure store'dur. String, Hash, List, Set, Sorted Set data types'ı destekler. Cache, session store, rate limiting için kullanılır.

## Mülakatta Kullanılacak Cümleler

- "Redis in-memory cache için kritik."
- "Cache aside pattern ile database load reduction."
- "TTL ile automatic expiration."
- "String for simple key-value, Hash for objects, Sorted Set for ranking."
- "Redis Cluster ile horizontal scaling."

## En Çok Sorulanlar

1. Redis'i hangi durumlarda kullanırsın?
2. Cache invalidation nasıl yapılır?
3. String vs Hash farkı?
4. RDB vs AOF farkı?
5. Redis clustering nasıl çalışır?

## Kısa Cevaplar

- **Use cases**: Cache, session store, rate limiting, leaderboards.
- **Invalidation**: TTL, manual invalidation, event-driven.
- **String vs Hash**: String (simple value), Hash (object fields).
- **RDB vs AOF**: RDB (snapshot, fast), AOF (append-only, durable).
- **Clustering**: Hash slots, consistent hashing, horizontal scaling.

## Kırmızı Bayrak Cevaplar

- "Redis kullanmadım, her şey DB'de."
- "Cache invalidation gerekmez."
- "RDB ve AOF bilmiyorum."
- "Clustering gerekmez, single instance yeterli."
- "Memory management önemli değil."

## Benim Projemden Örnek

Real-time market data sisteminde Redis cache ile price caching (String), ranking (Sorted Set), deduplication (Set). Cache aside pattern, 5s TTL, Redis Cluster ile scaling.

## Tekrar Kontrol Listesi

- [ ] Bu konuyu kısa ve net anlatabiliyorum.
- [ ] Kendi projemden örnek verebiliyorum.
- [ ] Mülakatçının aslında neyi ölçtüğünü biliyorum.
- [ ] Kırmızı bayrak cevaplardan kaçınıyorum.
