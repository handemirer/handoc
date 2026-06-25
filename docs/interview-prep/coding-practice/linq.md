# LINQ

## Mülakatta Neden Sorulur?

LINQ, .NET'de data manipulation için kritik. Efficient query writing ve deferred execution kavramlarını bilmek önemli.

## Bilmem Gerekenler

### Common Operators
- **Select**: Projection
- **Where**: Filtering
- **GroupBy**: Grouping
- **OrderBy/OrderByDescending**: Sorting
- **First/FirstOrDefault**: First element
- **Single/SingleOrDefault**: Single element
- **Any/All**: Existence check
- **Count/LongCount**: Counting
- **Take/Skip**: Pagination

### Deferred vs Immediate Execution
- **Deferred**: Query execution deferred until iteration
- **Immediate**: ToList(), ToArray(), Count(), First()

### Performance Considerations
- Indexing in Where
- Multiple enumerations
- Materialization timing

## Örnek Sorular

1. First vs FirstOrDefault farkı nedir?
2. Deferred execution nedir?
3. Any() vs Count() > 0 farkı?
4. GroupBy nasıl kullanılır?
5. Multiple enumeration problemi nedir?

## Örnek Kodlar

### First vs FirstOrDefault
```csharp
// First: Exception if no element
var first = list.First(x => x.Id == 1);

// FirstOrDefault: Default if no element
var firstOrDefault = list.FirstOrDefault(x => x.Id == 1);
```

### Deferred Execution
```csharp
// Deferred: Query not executed yet
var query = list.Where(x => x.IsActive);

// Immediate: Query executed
var results = query.ToList();
```

### Any vs Count
```csharp
// Efficient: Stops at first match
var hasActive = list.Any(x => x.IsActive);

// Inefficient: Counts all
var hasActive = list.Count(x => x.IsActive) > 0;
```

### GroupBy
```csharp
var grouped = list.GroupBy(x => x.Category)
                 .Select(g => new
                 {
                     Category = g.Key,
                     Count = g.Count()
                 });
```

## Sık Yapılan Hatalar

- First yerine FirstOrDefault kullanmamak (exception risk)
- Count() > 0 yerine Any() kullanmamak (performance)
- Multiple enumeration (query'yi birden fazla iterate etmek)
- GroupBy sonrası yanlış usage

## Kırmızı Bayrak Cevaplar

- "First ve FirstOrDefault aynı."
- "Count() > 0 kullanırım, Any bilmiyorum."
- "Deferred execution bilmiyorum."
- "GroupBy kullanmadım."

## Tekrar Kontrol Listesi

- [ ] Bu konuyu kısa ve net anlatabiliyorum.
- [ ] Kendi projemden örnek verebiliyorum.
- [ ] Mülakatçının aslında neyi ölçtüğünü biliyorum.
- [ ] Kırmızı bayrak cevaplardan kaçınıyorum.
