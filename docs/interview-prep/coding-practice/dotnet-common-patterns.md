# .NET Common Patterns

## Mülakatta Neden Sorulur?

.NET ekosisteminde sık kullanılan pattern'leri ve best practice'leri bilmek, production-ready kod yazma yeteneğini gösterir.

## Bilmem Gerekenler

### Dependency Injection (DI)
- Service lifetime'ları: Transient, Scoped, Singleton
- Constructor injection
- Service locator anti-pattern
- Captured dependencies

### Options Pattern
- IOptions<T>, IOptionsMonitor<T>, IOptionsSnapshot<T>
- Configuration binding
- Options validation

### Repository Pattern
- Repository pattern tartışması
- When to use, when to avoid
- Unit of Work pattern

### BackgroundService
- IHostedService vs BackgroundService
- Graceful shutdown
- CancellationToken usage
- Error handling

### HttpClientFactory
- HttpClient issues (socket exhaustion)
- Typed HttpClient
- Named HttpClient
- Resilience (Polly)

## Örnek Sorular

1. DI lifetime'ları arasındaki fark nedir?
2. Repository pattern neden kullanılır (veya kullanılmaz)?
3. BackgroundService nasıl kullanılır?
4. HttpClient neden HttpClientFactory ile oluşturulur?
5. Options pattern nedir?

## Örnek Kodlar

### DI Lifetime
```csharp
// Transient: Her request için yeni instance
services.AddTransient<IMyService, MyService>();

// Scoped: Request scope içinde aynı instance
services.AddScoped<IMyService, MyService>();

// Singleton: Uygulama boyunca tek instance
services.AddSingleton<IMyService, MyService>();
```

### Options Pattern
```csharp
services.Configure<MyOptions>(configuration.GetSection("MyOptions"));

// Usage
public class MyService
{
    private readonly MyOptions _options;
    public MyService(IOptions<MyOptions> options)
    {
        _options = options.Value;
    }
}
```

### BackgroundService
```csharp
public class MyBackgroundService : BackgroundService
{
    protected override async Task ExecuteAsync(CancellationToken stoppingToken)
    {
        while (!stoppingToken.IsCancellationRequested)
        {
            // Do work
            await Task.Delay(TimeSpan.FromSeconds(5), stoppingToken);
        }
    }
}
```

### HttpClientFactory
```csharp
// Typed HttpClient
services.AddHttpClient<MyHttpClient>();

// Usage
public class MyService
{
    private readonly HttpClient _httpClient;
    public MyService(MyHttpClient httpClient)
    {
        _httpClient = httpClient;
    }
}
```

## Sık Yapılan Hatalar

- Singleton service'de scoped service kullanma (captured dependencies)
- HttpClient dispose etme (socket exhaustion)
- BackgroundService'te CancellationToken kullanmama
- Repository pattern overuse

## Kırmızı Bayrak Cevaplar

- "Her şey singleton yaparım."
- "Repository pattern her zaman kullanırım."
- "HttpClient new'lerim, sorun olmaz."
- "BackgroundService'te cancellation token kullanmam."

## Tekrar Kontrol Listesi

- [ ] Bu konuyu kısa ve net anlatabiliyorum.
- [ ] Kendi projemden örnek verebiliyorum.
- [ ] Mülakatçının aslında neyi ölçtüğünü biliyorum.
- [ ] Kırmızı bayrak cevaplardan kaçınıyorum.
