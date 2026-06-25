# Kafka Cheat Sheet

## 30 Saniyelik Özet

Kafka, distributed event streaming platform'dur. Log-based storage, partitioning, replication, offset management sağlar. Asenkron communication, loose coupling için kritik.

## Mülakatta Kullanılacak Cümleler

- "Kafka log-based storage ile high throughput sağlar."
- "Partitioning ile horizontal scaling."
- "Consumer group ile load balancing."
- "Manual offset commit ile at-least-once semantics."
- "Idempotency duplicate handling için kritik."

## En Çok Sorulanlar

1. Kafka vs traditional MQ farkı?
2. Partitioning nasıl çalışır?
3. Offset commit nedir?
4. Idempotency neden önemlidir?
5. DLQ ne zaman kullanılır?

## Kısa Cevaplar

- **vs MQ**: Kafka (log-based, multiple consumers), MQ (message deletion, single consumer).
- **Partitioning**: Hash key → partition, ordering guarantee, horizontal scaling.
- **Offset commit**: Manual commit after processing, at-least-once semantics.
- **Idempotency**: Duplicate message handling, unique ID, deduplication.
- **DLQ**: Failed messages, max retry exceeded, manual inspection.

## Kırmızı Bayrak Cevaplar

- "Kafka mesajı zaten sadece bir kere gönderir."
- "Offset commit auto yaparım, manual gerekmez."
- "Idempotency bilmiyorum."
- "DLQ kullanmam."
- "Partitioning bilmiyorum."

## Benim Projemden Örnek

Real-time market data sisteminde Kafka partitioning by instrument symbol, manual offset commit, Redis-based idempotency, DLQ for failed messages, consumer group ile horizontal scaling.

## Tekrar Kontrol Listesi

- [ ] Bu konuyu kısa ve net anlatabiliyorum.
- [ ] Kendi projemden örnek verebiliyorum.
- [ ] Mülakatçının aslında neyi ölçtüğünü biliyorum.
- [ ] Kırmızı bayrak cevaplardan kaçınıyorum.
