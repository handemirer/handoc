# .NET

## Ne İşe Yarar?

Microsoft tarafından geliştirilen, cross-platform uygulama geliştirme framework'üdür. C# dilini kullanarak web, mobil, desktop ve cloud uygulamaları geliştirmeyi sağlar.

## Mülakatçı Bu Konuda Neyi Test Eder?

- .NET ekosisteminin derinlemesine anlaşılması
- CLR, garbage collection, memory management kavramları
- Async/await ve threading
- Dependency injection ve lifetime management
- .NET Core vs .NET Framework farkları

## Kısa Cevap

.NET, Microsoft'un cross-platform uygulama geliştirme framework'üdür. CLR üzerinde çalışan managed code, garbage collection ile memory management, async/await ile asenkron programlama ve dependency injection ile loose coupling sağlar.

## Detaylı Açıklama

### Core Components

- **CLR (Common Language Runtime)**: Managed code'un çalışma zamanı ortamı. Memory management, garbage collection, exception handling sağlar.
- **BCL (Base Class Library)**: Temel sınıf kütüphanesi. Collections, I/O, threading, networking gibi temel işlevleri içerir.
- **C#**: .NET için birincil dil. Static typing, object-oriented, functional programming özellikleri.

### Memory Management

- **Garbage Collection**: Otomatik memory management. Generation-based (0, 1, 2) collection.
- **Stack vs Heap**: Value types stack'ta, reference types heap'ta saklanır.
- **Dispose Pattern**: Unmanaged resources için IDisposable interface.
- **using statement**: Scope sonunda otomatik dispose.

### Async/Await

- **Task-based Asynchronous Pattern (TAP)**: Asenkron işlemler için Task ve Task<T>.
- **await**: Task'in tamamlanmasını bekler, thread'i bloke etmez.
- **async**: Method'un asenkron olduğunu belirtir, Task döner.
- **ConfigureAwait(false)**: Context capture'i önler, deadlock riskini azaltır.

### Dependency Injection

- **Service Lifetime**: Transient, Scoped, Singleton.
- **IServiceCollection**: Service registration.
- **IServiceProvider**: Service resolution.
- **Constructor Injection**: En yaygın injection yöntemi.

### .NET Core vs .NET Framework

- **Cross-platform**: .NET Core cross-platform, .NET Framework Windows-only.
- **Performance**: .NET Core daha performanslı.
- **Deployment**: .NET Core self-contained deployment destekler.
- **Modular**: .NET Core modular architecture.

## Kendi Projelerimden Örnek

Real-time market data sisteminde:

- BackgroundService kullanarak asenkron data processing
- Redis cache için singleton lifetime
- Scoped services için dependency injection
- Task.WhenAll ile parallel processing
- CancellationToken ile graceful shutdown

## Sık Sorulan Sorular

**Garbage collection nasıl çalışır?**
Generation-based (0, 1, 2) collection. Gen 0 sık, Gen 2 nadir toplanır. Large Object Heap (LOH) ayrıdır.

**Async/await neden önemlidir?**
Thread bloklamasını önler, scalability'yi artırır. I/O bound işlemler için kritik.

**Dependency injection lifetime farkları nelerdir?**
Transient: Her request için yeni instance. Scoped: Request scope içinde aynı instance. Singleton: Uygulama boyunca tek instance.

**Stack vs Heap farkı nedir?**
Stack: Value types, fast, LIFO. Heap: Reference types, garbage collected, slower.

**IDisposable neden önemlidir?**
Unmanaged resources (file handles, database connections) için manual cleanup gerektirir.

## Dikkat Edilmesi Gerekenler

- Singleton service'de scoped service kullanma (captured dependencies)
- Async method'de .Result veya .Wait kullanma (deadlock riski)
- Dispose edilmeyen resources memory leak'e neden olur
- Large object allocation GC pressure'ı artırır
- Thread safety: Shared state'e dikkat et

## Eksik Olduğum Noktalar

- [ ] GC tuning ve optimization
- [ ] Advanced threading scenarios
- [ ] Memory profiling
- [ ] Native interop
- [ ] Reflection ve dynamic usage

## Tekrar Notları

- CLR = managed runtime, GC, exception handling
- Async/await = non-blocking, scalability
- DI = loose coupling, testability
- Lifetime = Transient, Scoped, Singleton
- IDisposable = unmanaged resources cleanup

## Tekrar Kontrol Listesi

- [ ] CLR ve garbage collection'ı anla
- [ ] Async/await kullanımını bil
- [ ] DI lifetime'ları öğren
- [ ] Stack vs Heap farkını bil
- [ ] IDisposable pattern'ı anla
