# PostgreSQL Cheat Sheet

## 30 Saniyelik Özet

PostgreSQL, ACID-compliant relational database'dir. MVCC, advanced indexing, JSONB support sağlar. Transaction isolation, query optimization, connection pooling kritik.

## Mülakatta Kullanılacak Cümleler

- "PostgreSQL MVCC ile non-blocking reads sağlar."
- "B-tree index default, GIN index JSONB için."
- "Read committed default isolation level."
- "EXPLAIN ANALYZE ile query optimization."
- "PgBouncer ile connection pooling."

## En Çok Sorulanlar

1. Index tasarlarken nelere dikkat edersin?
2. Transaction isolation levels nelerdir?
3. MVCC nasıl çalışır?
4. JSONB vs JSON farkı?
5. Connection pooling neden önemlidir?

## Kısa Cevaplar

- **Index design**: Query pattern, selectivity, column order, write overhead.
- **Isolation**: Read committed (default), repeatable read (snapshot), serializable (strictest).
- **MVCC**: Row versioning (xmin, xmax), readers don't block writers, VACUUM cleanup.
- **JSONB vs JSON**: JSONB (binary, fast, indexed), JSON (text, slower, preserves formatting).
- **Connection pooling**: Reduce overhead, reuse connections, limit max connections.

## Kırmızı Bayrak Cevaplar

- "Index eklerim, sorgu kesin hızlanır."
- "Isolation levels bilmiyorum."
- "MVCC bilmiyorum."
- "JSON kullanırım, JSONB gerekmez."
- "Connection pooling gerekmez."

## Benim Projemden Örnek

Real-time market data sisteminde B-tree index ile instrument lookup, GIN index ile JSONB metadata, partial index ile active instruments, read committed isolation, PgBouncer connection pooling.

## Tekrar Kontrol Listesi

- [ ] Bu konuyu kısa ve net anlatabiliyorum.
- [ ] Kendi projemden örnek verebiliyorum.
- [ ] Mülakatçının aslında neyi ölçtüğünü biliyorum.
- [ ] Kırmızı bayrak cevaplardan kaçınıyorum.
