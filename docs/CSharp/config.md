# Configuration 

``` c#
IConfiguration configuration = builder.Configuration;
IWebHostEnvironment environment = builder.Environment;
 
ConnectionsUrl connectionsUrl = configuration.GetSection("PlatformSettings").Get<ConnectionsUrl>();
builder.Services.AddSingleton(connectionsUrl); 
```