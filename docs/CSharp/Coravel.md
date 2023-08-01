# Coravel 

``` c#
using Coravel;
 
builder.Services.AddTransient<DataBufferBackup>(); 

app.Services.UseScheduler(scheduler =>
{
    scheduler.Schedule<DataBufferBackup>().EveryFiveMinutes();
});
```

``` c#
public class DataBufferBackup : IInvocable
{
    public Task Invoke()
    {
        return Task.CompletedTask;
    }
}
```