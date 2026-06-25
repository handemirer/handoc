# Collections

## Mülakatta Neden Sorulur?

Correct collection selection performance ve memory usage için kritik. Thread-safe collections ve concurrent scenarios önemlidir.

## Bilmem Gerekenler

### Common Collections
- **List<T>:** Dynamic array, O(1) index access, O(n) search
- **Dictionary<TKey, TValue>:** Hash table, O(1) lookup
- **HashSet<T>:** Unique elements, O(1) lookup
- **Queue<T>:** FIFO, O(1) enqueue/dequeue
- **Stack<T>:** LIFO, O(1) push/pop

### Concurrent Collections
- **ConcurrentDictionary:** Thread-safe dictionary
- **ConcurrentQueue:** Thread-safe queue
- **ConcurrentBag:** Thread-safe unordered collection
- **BlockingCollection:** Producer-consumer pattern

### Performance Considerations
- Lookup complexity
- Memory overhead
- Thread-safety cost

## Örnek Sorular

1. List vs Dictionary farkı nedir?
2. HashSet ne zaman kullanılır?
3. ConcurrentDictionary neden kullanılır?
4. Queue vs Stack farkı?
5. Collection selection criteria?

## Örnek Kodlar

### List vs Dictionary
```csharp
// List: O(n) lookup
var list = new List<User>();
var user = list.FirstOrDefault(x => x.Id == 1);

// Dictionary: O(1) lookup
var dict = new Dictionary<int, User>();
var user = dict[1];
```

### HashSet
```csharp
var set = new HashSet<int>();
set.Add(1);
set.Add(2);
set.Add(1); // Duplicate ignored

var contains = set.Contains(1); // O(1)
```

## Sık Yapılan Hatalar

- Wrong collection selection (List when Dictionary needed)
- Not using HashSet for uniqueness
- Not using concurrent collections in multi-threaded scenarios
- Ignoring performance implications

## Kırmızı Bayrak Cevaplar

- "Her zaman List kullanırım."
- "HashSet kullanmadım."
- "Concurrent collections bilmiyorum."
- "Performance farkı önemli değil."

## Tekrar Kontrol Listesi

- [ ] Bu konuyu kısa ve net anlatabiliyorum.
- [ ] Kendi projemden örnek verebiliyorum.
- [ ] Mülakatçının aslında neyi ölçtüğünü biliyorum.
- [ ] Kırmızı bayrak cevaplardan kaçınıyorum.
