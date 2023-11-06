# Serilog

``` c#
using Serilog;
using Serilog.Core; 

namespace LearnSerilog.ServicesExtensions
{
    public static class ServiceExtension
    {
        public static void ConfigureSerilog(this IHostBuilder host)
        {
            Logger logger = new LoggerConfiguration() 
                .WriteTo.File("logs/log-.txt", rollingInterval: RollingInterval.Day)
                .Enrich.FromLogContext()
                .CreateLogger();

            host.UseSerilog(logger);
        }
    }
}
```

``` c# 
builder.Host.ConfigureSerilog();
```