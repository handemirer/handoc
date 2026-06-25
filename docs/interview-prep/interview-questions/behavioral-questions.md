# Davranışsal Sorular

Bu bölümde davranışsal sorular için hazırlıklı cevaplar yer alır. Cevaplar STAR formatına uygun, doğal ve profesyonel olmalıdır.

## Soru: Kendini tanıtır mısın?

### Cevap

Merhaba, ben Han. 5 yıllık deneyime sahibim ve şu anda bir fintech şirketinde Backend Engineer olarak çalışıyorum.

Günlük olarak gerçek zamanlı market data sistemi geliştiriyor, Kafka üzerinden yüksek hacimli veri akışı yönetiyor ve Redis cache ile PostgreSQL performans optimizasyonu yapıyorum. Son zamanlarda WebSocket ile real-time data dağıtımı ve distributed tracing implementasyonu üzerinde yoğunlaştım.

Özellikle distributed systems, microservices mimarisi ve high-performance backend sistemleri konularına ilgim var ve bu alanda derinleşmek istiyorum.

Şu anda Senior Backend Engineer pozisyonuna geçiş yapmayı hedefliyorum çünkü daha büyük sistemler tasarlamak, teknik liderlik deneyimi kazanmak ve daha karmaşık scalability problemleri çözmek istiyorum.

---

## Soru: Neden iş değiştirmek istiyorsun?

### Cevap

Mevcut şirketimde güzel projeler çalışıyorum ve çok şey öğrendim. Ancak şu anda kariyerimde bir sonraki adıma geçmek istiyorum.

Mevcut rolümde daha fazla technical leadership ve architectural decision-making fırsatı arıyorum. Ayrıca daha büyük ve daha karmaşık sistemler üzerinde çalışmak, distributed systems ve scalability konularında daha derinleşmek istiyorum.

Sizin şirketinizin [özellik - örn: microservices architecture, high-scale systems] konusunda yaptığı çalışmalar benim ilgi alanıma çok uygun ve bu ortamda kendimi geliştirebileceğimi düşünüyorum.

---

## Soru: Güçlü yönlerin neler?

### Cevap

En güçlü yönlerim:

**Teknik Yetkinlik:**
- .NET ve ASP.NET Core ekosisteminde derinlemesine deneyim
- Distributed systems ve microservices mimarisi
- Performance optimization ve database tuning
- Kafka, Redis, PostgreSQL gibi teknolojilerde pratik deneyim

**Problem Çözme:**
- Karmaşık problemleri analiz edip çözme yeteneği
- Root cause analysis ve debugging
- Performance bottleneck identification

**İletişim:**
- Teknik konuları net ve anlaşılır ifade etme
- Takım içi collaboration ve knowledge sharing
- Mentorluk deneyimi

**Öğrenme:**
- Yeni teknolojileri hızlı öğrenme ve uygulama
- Sürekli self-improvement

---

## Soru: Zayıf yönlerin neler?

### Cevap

Geliştirmeye çalıştığım alanlar:

**Public Speaking:**
- Büyük gruplar önünde konuşma konusunda kendimi geliştirmeye çalışıyorum. Bu yüzden teknik meetup'lara katılıp presentation yapıyorum.

**Kubernetes Detayları:**
- Kubernetes kullanıyorum ancak advanced features (custom operators, advanced networking) konusunda daha derinleşmek istiyorum. Şu anda bu konuda çalışıyorum.

**Delegation:**
- Bazen her şeyi kendim yapmaya çalışıyorum. Team lead rolü için delegation ve trust building konusunda gelişiyorum.

Bu zayıf yönlerin farkındayım ve aktif olarak üzerinde çalışıyorum.

---

## Soru: Zor bir teknik problemi nasıl çözdün?

### Cevap (STAR)

**Situation:**
Real-time market data sisteminde duplicate message sorunu vardı. Kafka consumer'ında network issues nedeniyle duplicate message'lar oluşuyordu ve bu financial data inconsistency'ya neden oluyordu.

**Task:**
Duplicate message handling implement etmek, data consistency sağlamak, performance etkilememek.

**Action:**
Önce problem'i analiz ettim. Root cause Kafka offset commit timing idi. Manual offset commit'e geçtim, ancak duplicate risk devam etti. Idempotent processing implement ettim. Her message için unique ID (message ID + offset) ile Redis-based deduplication kullandım. Ayrıca PostgreSQL'de unique constraint ile database level protection sağladım.

**Result:**
Duplicate message sorunu çözüldü, data consistency sağlandı. Performance etkisi minimal (Redis check ~1ms). Bu çözüm production'da kullanılıyor.

---

## Soru: Takım içinde anlaşmazlık yaşarsan ne yaparsın?

### Cevap

Teknik anlaşmazlıklar normal ve sağlıklı. Yaklaşımım:

1. **Listen first**: Önce karşı tarafı tam anlamaya çalışırım
2. **Data-driven**: Kararları data ve facts ile desteklerim
3. **Prototype**: Fikirleri test etmek için prototype veya PoC yaparım
4. **Consensus**: Takım consensus'ı önemserim, benim fikrim doğru olsa bile takım kararı saygı duyarım
5. **Move forward**: Karar alındıktan sonra fully commit olurum

Örneğin, bir projede caching strategy seçiminde anlaşmazlık yaşadık. İki farklı approach için benchmark yaptık, data'ya dayanarak karar verdik ve herkes kabul etti.

---

## Soru: Küçük şirkette çalışmak seni düşündürür mü?

### Cevap

Bu konuda net bir prensibim yok, her case farklı değerlendiririm.

**Büyük şirkette:**
- More resources, stability
- Larger scale systems
- Specialized roles
- More process

**Küçük şirkette:**
- More responsibility, broader scope
- Faster decision making
- Direct impact
- Less process

Benim için önemli olan:
- Teknik challenge
- Learning opportunity
- Team culture
- Product vision

Sizin şirketinizin [özellik] konusunda yaptığı çalışmalar benim için attractive, bu yüzden burada çalışmak istiyorum.

---

## Soru: Mentorluk beklentin var mı?

### Cevap

Evet, mentorluk önemli. İki seviyede beklentim var:

**Technical Mentorship:**
- Senior engineer'lardan learn
- Code review feedback
- Architecture decisions
- Best practices

**Career Mentorship:**
- Career path guidance
- Skill development
- Leadership opportunities

Aynı zamanda, kendi öğrendiklerimi junior developer'larla paylaşmayı da seviyorum. Mevcut şirketimde 2 junior developer mentee'm var ve onlarla weekly 1-on-1 yapıyorum.

---

## Soru: Kariyer hedefin ne?

### Cevap

Kısa ve uzun vadeli hedeflerim:

**Kısa Vadeli (1-2 yıl):**
- Senior Backend Engineer rolü
- Distributed systems ve scalability konularında derinleşme
- Technical leadership deneyimi

**Orta Vadeli (3-5 yıl):**
- Software Architect veya Team Lead
- Cross-team architectural decisions
- Mentorship ve people management

**Uzun Vadeli (5+ yıl):**
- Engineering Manager veya Principal Engineer
- Organizational impact
- Strategic decisions

Şu anda Senior Backend Engineer rolüne geçiş yapmak istiyorum çünkü technical leadership ve architectural decision-making fırsatı arıyorum.

---

## Soru: Liderlik tecrüben var mı?

### Cevap

Formal leadership title'ım yok ancak informal leadership deneyimim var:

**Technical Leadership:**
- Project lead olarak 3 proje yönettim
- Architecture decisions alıyorum
- Code review owner'ıyım
- Technical design document author'ıyım

**Mentorship:**
- 2 junior developer mentee'm var
- Weekly 1-on-1 yapıyorum
- Onların technical growth'una destek oluyorum

**Cross-team Collaboration:**
- Multiple team ile çalışıyorum
- Technical sync meeting'leri organize ediyorum

Formal leadership rolü için hazırım ve bu konuda gelişmek istiyorum.

## Tekrar Kontrol Listesi

- [ ] Her cevabı STAR formatına uygun hazırla
- [ ] Doğal ve profesyonel ol
- [ ] Ezber gibi değil, akıcı ol
- [ ] Kendi deneyimlerini ekle
- [ ] Pratik yap (mock interview)
