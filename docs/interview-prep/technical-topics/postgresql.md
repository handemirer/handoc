# PostgreSQL

## Ne İşe Yarar?

Open-source relational database management system'dir. ACID compliance, advanced features, extensibility sağlar.

## Mülakatçı Bu Konuda Neyi Test Eder?

- Index strategies ve query optimization
- Transaction isolation levels
- ACID properties
- Connection pooling
- Performance tuning
- Database design principles
- JSONB usage

## Kısa Cevap

PostgreSQL, ACID-compliant relational database'dir. MVCC, advanced indexing, JSONB support, extensibility sağlar. Transaction isolation levels, query optimization, connection pooling kritik konular.

## Detaylı Açıklama

### ACID Properties

**Atomicity:**
- Transaction all-or-nothing
- Rollback on failure
- COMMIT/ROLLBACK

**Consistency:**
- Database rules ve constraints
- Valid state transition
- Foreign key constraints

**Isolation:**
- Concurrent transactions isolation
- Isolation levels
- MVCC implementation

**Durability:**
- Committed data persistent
- WAL (Write-Ahead Logging)
- Crash recovery

### Transaction Isolation Levels

**Read Uncommitted:**
- Dirty reads possible
- Rarely used

**Read Committed:**
- No dirty reads
- Non-repeatable reads possible
- PostgreSQL default

**Repeatable Read:**
- No dirty/non-repeatable reads
- Phantom reads possible
- Snapshot isolation

**Serializable:**
- Strictest isolation
- No anomalies
- Performance impact

### MVCC (Multi-Version Concurrency Control)

**Versioning:**
- Each row has version (xmin, xmax)
- Readers don't block writers
- Writers don't block readers

**VACUUM:**
- Remove dead tuples
- Reclaim space
- Autovacuum automatic

### Indexing

**B-Tree Index:**
- Default index type
- Equality ve range queries
- Ordered data

**Hash Index:**
- Equality queries only
- Not ordered
- Memory efficient

**GIN Index:**
- Generalized Inverted Index
- Array, JSONB, full-text search
- Composite values

**GiST Index:**
- Generalized Search Tree
- Geometric data, ranges
- Custom operators

**Partial Index:**
- Index on subset of data
- WHERE clause
- Smaller index size

**Composite Index:**
- Multiple columns
- Column order matters
- Covering index

### Query Optimization

**EXPLAIN ANALYZE:**
- Query execution plan
- Cost estimation
- Actual execution time

**Statistics:**
- ANALYZE command
- Query planner statistics
- Updated after data changes

**Join Strategies:**
- Nested Loop
- Hash Join
- Merge Join

### Connection Pooling

**Purpose:**
- Reduce connection overhead
- Reuse connections
- Limit max connections

**Tools:**
- PgBouncer
- Built-in pooling ( Npgsql )

### JSONB

**JSON vs JSONB:**
- JSON: Text storage, slower
- JSONB: Binary storage, faster, indexed

**JSONB Operations:**
- -> (value)
- ->> (text)
- @> (contains)
- GIN index support

## Kendi Projelerimden Örnek

Real-time market data sisteminde:

- B-tree index ile instrument lookup
- GIN index ile JSONB metadata search
- Partial index ile active instruments
- Connection pooling (Npgsql)
- Read committed isolation level
- Query optimization with EXPLAIN ANALYZE
- JSONB ile flexible schema

## Sık Sorulan Sorular

**PostgreSQL'de index tasarlarken nelere dikkat edersin?**
Query pattern, selectivity, column order (composite), write overhead, index maintenance.

**Transaction isolation levels farkları nelerdir?**
Read committed (default), repeatable read (snapshot), serializable (strictest). Trade-off between consistency ve performance.

**MVCC nasıl çalışır?**
Row versioning (xmin, xmax), readers don't block writers, VACUUM for cleanup.

**JSONB vs JSON farkı nedir?**
JSONB: Binary, faster, indexed. JSON: Text, slower, preserves formatting.

**Connection pooling neden önemlidir?**
Connection overhead reduction, resource management, limit max connections.

## Dikkat Edilmesi Gerekenler

- Index write overhead
- VACUUM tuning
- Connection pool sizing
- Query plan analysis
- Lock contention
- Statistics maintenance

## Eksik Olduğum Noktalar

- [ ] Partitioning
- [ ] Foreign Data Wrapper (FDW)
- [ ] Advanced JSONB querying
- [ ] Full-text search
- [ ] Replication ve high availability

## Tekrar Notları

- ACID = Atomicity, Consistency, Isolation, Durability
- Isolation = Read Committed (default), Repeatable Read, Serializable
- MVCC = row versioning, no reader-writer blocking
- Index = B-Tree (default), GIN (JSONB), Partial, Composite
- JSONB = binary, fast, indexed

## Tekrar Kontrol Listesi

- [ ] ACID properties'ı anla
- [ ] Transaction isolation levels'ı bil
- [ ] MVCC mekanizmasını öğren
- [ ] Index strategies'ı anla
- [ ] Query optimization'ı bil
