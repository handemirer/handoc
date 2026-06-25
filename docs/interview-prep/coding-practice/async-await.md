# Async / Await

## Mülakatta Neden Sorulur?

Async/await, .NET'de non-blocking I/O için kritik. Scalability ve deadlock avoidance konularını bilmek önemli.

## Bilmem Gerekenler

### Task ve Task<T>
- Task represents an asynchronous operation
- Task<T> represents an asynchronous operation with return value
- async keyword: Method can use await
- await keyword: Wait for Task completion without blocking

### CancellationToken
- Graceful cancellation
- Pass through async chain
- Check IsCancellationRequested

### ConfigureAwait
- ConfigureAwait(false): Avoid deadlock in library code
- ConfigureAwait(true): Capture context (default in UI apps)

### Deadlock Risk
- SynchronizationContext deadlock
- Blocking on async code (.Result, .Wait)
- ConfigureAwait(false) usage

### Exception Handling
- Try-catch in async methods
- AggregateException
- Exception propagation

## Örnek Sorular

1. async/await neden kullanılır?
2. ConfigureAwait(false) neden önemlidir?
3. CancellationToken nasıl kullanılır?
4. Deadlock nasıl oluşur?
5. async void neden kötü?

## Örnek Kodlar

### Basic Async/Await
```csharp
public async Task GetDataAsync()
{
    var data = await _httpClient.GetAsync("/api/data");
    return await data.Content.ReadAsStringAsync();
}
```

### CancellationToken
```csharp
public async Task ProcessAsync(CancellationToken cancellationToken)
{
    while (!cancellationToken.IsCancellationRequested)
    {
        // Do work
        await Task.Delay(TimeSpan.FromSeconds(5), cancellationToken);
    }
}
```

### ConfigureAwait
```csharp
// Library code: Use ConfigureAwait(false)
public async Task<string> GetDataAsync()
{
    var data = await _httpClient.GetAsync("/api/data")
                          .ConfigureAwait(false);
    return await data.Content.ReadAsStringAsync()
                          .ConfigureAwait(false);
}
```

### Exception Handling
```csharp
try
{
    await DoWorkAsync();
}
catch (Exception ex)
{
    // Handle exception
}
```

## Sık Yapılan Hatalar

- async void kullanma (exception handling issue)
- .Result veya .Wait kullanma (deadlock risk)
- CancellationToken kullanmama
- ConfigureAwait(false) kullanmama (library code'da)

## Kırmızı Bayrak Cevaplar

- "async void kullanırım."
- ".Result kullanırım, await gerekmez."
- "CancellationToken bilmiyorum."
- "ConfigureAwait bilmiyorum."

## Tekrar Kontrol Listesi

- [ ] Bu konuyu kısa ve net anlatabiliyorum.
- [ ] Kendi projemden örnek verebiliyorum.
- [ ] Mülakatçının aslında neyi ölçtüğünü biliyorum.
- [ ] Kırmızı bayrak cevaplardan kaçınıyorum.
