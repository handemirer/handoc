# ASP.NET Core

## Ne İşe Yarar?

Microsoft'un cross-platform web framework'üdür. REST API, MVC, Razor Pages, SignalR gibi web uygulamaları geliştirmeyi sağlar.

## Mülakatçı Bu Konuda Neyi Test Eder?

- Middleware pipeline ve request processing
- Dependency injection in ASP.NET Core
- Configuration management
- Logging ve error handling
- Authentication ve authorization
- Performance optimization

## Kısa Cevap

ASP.NET Core, cross-platform web framework'üdür. Middleware pipeline ile request processing, built-in DI container, configuration system, logging infrastructure ve Kestrel web server ile yüksek performans sağlar.

## Detaylı Açıklama

### Middleware Pipeline

- **Request Delegate**: Her middleware bir request delegate alır.
- **Ordering**: Middleware'ler registration sırasında çalışır.
- **Short-circuiting**: Middleware request'i sonlandırabilir.
- **Use, Map, Run**: Middleware registration method'ları.

### Dependency Injection

- **IServiceCollection**: Startup.ConfigureServices'de service registration.
- **Built-in container**: Scoped services için HTTP request scope.
- **Controller injection**: Constructor injection ile dependency resolution.

### Configuration

- **appsettings.json**: Environment-specific configuration.
- **IOptions<T>**: Strongly-typed configuration.
- **Environment variables**: Override mechanism.
- **Configuration providers**: JSON, environment variables, command line.

### Kestrel Web Server

- **Cross-platform**: Windows, Linux, macOS.
- **High performance**: Asenkron I/O, libuv (eski), Socket (yeni).
- **HTTPS**: Built-in HTTPS support.
- **Reverse proxy**: IIS, Nginx, Apache ile kullanılabilir.

### Error Handling

- **Developer Exception Page**: Development environment için detaylı error.
- **Exception Handler Middleware**: Production için custom error handling.
- **Status Code Pages**: HTTP status code sayfaları.
- **UseExceptionHandler**: Global exception handling.

### Logging

- **ILogger<T>**: Generic logger interface.
- **Log Levels**: Trace, Debug, Information, Warning, Error, Critical.
- **Logging providers**: Console, Debug, EventSource, third-party.
- **Structured logging**: Log context ve correlation ID.

## Kendi Projelerimden Örnek

Real-time market data API'sinde:

- Custom middleware for request logging ve correlation ID
- Exception handler middleware ile global error handling
- IOptions pattern ile configuration management
- Serilog ile structured logging
- Health checks ile monitoring

## Sık Sorulan Sorular

**Middleware pipeline nasıl çalışır?**
Request delegate chain. Her middleware sonraki middleware'i çağırır veya short-circuits.

**Kestrel neden önemlidir?**
Cross-platform, high performance, built-in web server. Production'da reverse proxy ile kullanılır.

**Configuration nasıl yönetilir?**
appsettings.json, environment variables, IOptions<T> pattern.

**Error handling nasıl yapılır?**
UseExceptionHandler middleware, try-catch blocks, custom error responses.

**Logging best practices nelerdir?**
Structured logging, log levels, correlation ID, sensitive data avoidance.

## Dikkat Edilmesi Gerekenler

- Middleware ordering önemlidir
- Singleton service'de scoped service kullanma
- Sensitive data logging'den kaçın
- Exception handling'de stack trace exposure'den kaçın (production)
- Connection pooling ve resource management

## Eksik Olduğum Noktalar

- [ ] Advanced middleware scenarios
- [ ] Response caching
- [ ] Rate limiting implementation
- [ ] Advanced authentication flows
- [ ] Hosting model detayları

## Tekrar Notları

- Middleware pipeline = request delegate chain
- DI = built-in container, lifetime management
- Configuration = appsettings.json, IOptions<T>
- Kestrel = cross-platform web server
- Logging = ILogger<T>, structured logging

## Tekrar Kontrol Listesi

- [ ] Middleware pipeline'ı anla
- [ ] DI in ASP.NET Core'ı bil
- [ ] Configuration management'ı öğren
- [ ] Error handling stratejilerini bil
- [ ] Logging best practices'ı uygula
