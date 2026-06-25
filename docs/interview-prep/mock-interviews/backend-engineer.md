# Backend Engineer Mock Interview

## Amaç

Backend Engineer rolü için temel teknik yetkinlikleri, problem çözme yeteneğini ve temel distributed systems knowledge'ını ölçmek.

## Beklenen Seviye

- 2-5 yıl deneyim
- .NET ve ASP.NET Core ekosisteminde rahat
- Temel database knowledge
- Basic distributed systems concepts
- API geliştirme deneyimi

## Isınma Soruları

1. Kendini tanıtır mısın?
2. Neden backend engineer olmak istedin?
3. En çok hangi teknolojileri kullanıyorsun?
4. Son projende ne yaptın?

## Teknik Sorular

### .NET Fundamentals
- Garbage collection nasıl çalışır?
- Async/await neden kullanılır?
- Dependency injection lifetime'ları nelerdir?
- Stack vs Heap farkı nedir?

### ASP.NET Core
- Middleware pipeline nasıl çalışır?
- Request lifecycle nedir?
- Configuration nasıl yönetilir?
- Error handling nasıl yapılır?

### Database
- Index nedir, neden önemlidir?
- SQL JOIN tipleri nelerdir?
- Transaction isolation levels nelerdir?
- N+1 problemi nedir?

### Redis
- Redis'i hangi durumlarda kullanırsın?
- Cache invalidation nasıl yapılır?
- String vs Hash farkı nedir?

### Kafka
- Kafka nedir, ne zaman kullanılır?
- Topic ve partition nedir?
- Consumer group nedir?

## System Design Sorular

**Basit Case:**
- URL shortener tasarımı
- Todo API tasarımı
- Blog comment sistemi

**Sorular:**
- Hangi database seçersin?
- Nasıl scale edersin?
- Cache nerede kullanırsın?

## Davranışsal Sorular

1. Zor bir teknik problemi nasıl çözdün?
2. Takım içinde çalışma deneyimin?
3. Öğrendiğin yeni bir teknoloji?
4. Hata yaptığın bir durum?

## Güçlü Cevap Örnekleri

**Async/Await:**
"Async/await non-blocking I/O için kullanılır. Thread pool thread'lerini boşta tutar, scalability'yi artırır. ConfigureAwait(false) ile deadlock riskini azaltırım."

**Index:**
"Index query hızlandırır. WHERE, JOIN, ORDER BY kolonlarına index eklerim. Write overhead'i dengelemek için selective index'ler kullanırım."

## Zayıf Cevap Örnekleri

- "Async/await bilmiyorum, synchronous kod yazarım."
- "Index gerekmez, database zaten hızlı."
- "Redis kullanmadım, her şey DB'de."
- "System design yapmadım, sadece API geliştirdim."

## Değerlendirme Rubriği

**Teknik (70%):**
- .NET fundamentals: 20%
- ASP.NET Core: 15%
- Database: 20%
- Redis/Kafka: 15%

**Davranışsal (20%):**
- Problem çözme: 10%
- Takım çalışması: 10%

**İletişim (10%):**
- Netlik: 5%
- Örnek verme: 5%

**Puanlama:**
- 7+/10: Başarılı
- 5-6/10: Sınırda
- <5/10: Başarısız

## Tekrar Kontrol Listesi

- [ ] Bu konuyu kısa ve net anlatabiliyorum.
- [ ] Kendi projemden örnek verebiliyorum.
- [ ] Mülakatçının aslında neyi ölçtüğünü biliyorum.
- [ ] Kırmızı bayrak cevaplardan kaçınıyorum.
