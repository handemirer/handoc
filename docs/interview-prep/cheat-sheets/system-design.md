# System Design Cheat Sheet

## 30 Saniyelik Özet

System design, scalability, reliability, maintainability için prensipler içerir. Vertical/horizontal scaling, load balancing, caching, database sharding, CAP theorem kritik.

## Mülakatta Kullanılacak Cümleler

- "System design için scalability ve reliability trade-off'larını düşünürüm."
- "Horizontal scaling via load balancing and partitioning."
- "Cache aside pattern ile database load reduction."
- "CAP theorem: Consistency vs Availability (Partition tolerance given)."
- "Capacity planning: RPS, data size, headroom (2-3x)."

## En Çok Sorulanlar

1. Vertical vs horizontal scaling farkı?
2. Cache strategies nelerdir?
3. Database scaling nasıl yapılır?
4. CAP theorem nedir?
5. Capacity planning nasıl yapılır?

## Kısa Cevaplar

- **Scaling**: Vertical (single machine upgrade), Horizontal (multiple machines, distributed complexity).
- **Cache strategies**: Cache aside, write through, write behind, refresh ahead.
- **Database scaling**: Read replicas, sharding, federation.
- **CAP theorem**: Consistency, Availability, Partition tolerance - pick 2. Typically AP (availability + partition tolerance).
- **Capacity planning**: RPS, data size, user growth, read/write ratio, headroom (2-3x).

## Kırmızı Bayrak Cevaplar

- "Her şey vertical scaling ile çözerim."
- "Cache kullanmam, veri fresh olmalı."
- "Database scaling gerekmez, single instance yeterli."
- "CAP theorem bilmiyorum."
- "Capacity planning yapmam."

## Benim Projemden Örnek

Real-time market data sisteminde horizontal scaling via Kafka partitions, Redis cache aside, PostgreSQL read replicas, CAP theorem (AP for availability), capacity planning (10K messages/second, 2-3x headroom).

## Tekrar Kontrol Listesi

- [ ] Bu konuyu kısa ve net anlatabiliyorum.
- [ ] Kendi projemden örnek verebiliyorum.
- [ ] Mülakatçının aslında neyi ölçtüğünü biliyorum.
- [ ] Kırmızı bayrak cevaplardan kaçınıyorum.
