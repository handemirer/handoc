# .NET Cheat Sheet

## 30 Saniyelik Özet

.NET, Microsoft'un cross-platform framework'üdür. CLR, garbage collection, async/await, DI container içerir. Managed code, automatic memory management, async programming sağlar.

## Mülakatta Kullanılacak Cümleler

- ".NET CLR üzerinde çalışan managed code'dur."
- "Garbage collection automatic memory management sağlar."
- "Async/await non-blocking I/O için kritik."
- "DI container loose coupling sağlar."
- "ConfigureAwait(false) deadlock riskini azaltır."

## En Çok Sorulanlar

1. Garbage collection nasıl çalışır?
2. Async/await neden kullanılır?
3. DI lifetime'ları nelerdir?
4. Stack vs Heap farkı?
5. IDisposable neden önemlidir?

## Kısa Cevaplar

- **GC**: Generation-based (0, 1, 2), automatic memory management.
- **Async/await**: Non-blocking I/O, scalability.
- **DI**: Transient (her request), Scoped (request scope), Singleton (tek instance).
- **Stack vs Heap**: Stack (value types, fast), Heap (reference types, GC).
- **IDisposable**: Unmanaged resources cleanup.

## Kırmızı Bayrak Cevaplar

- "Garbage collection bilmiyorum."
- "Async/await kullanmam, synchronous kod yazarım."
- "Her şey singleton yaparım."
- "IDisposable kullanmam."
- "ConfigureAwait bilmiyorum."

## Benim Projemden Örnek

Real-time market data sisteminde BackgroundService ile async processing, Redis cache için singleton lifetime, HttpClientFactory ile HTTP calls, ConfigureAwait(false) ile deadlock prevention.

## Tekrar Kontrol Listesi

- [ ] Bu konuyu kısa ve net anlatabiliyorum.
- [ ] Kendi projemden örnek verebiliyorum.
- [ ] Mülakatçının aslında neyi ölçtüğünü biliyorum.
- [ ] Kırmızı bayrak cevaplardan kaçınıyorum.
