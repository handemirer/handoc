# Mysql 

```
Microsoft.EntityFrameworkCore
```
```
Microsoft.EntityFrameworkCore.Design
```
```
Microsoft.EntityFrameworkCore.Tools
```
 
``` c#
using EntityFramework.Entity;
using Microsoft.EntityFrameworkCore;

namespace EntityFramework.Context
{
    public class DataContext : DbContext
    {
        protected readonly IConfiguration Configuration;

        public DataContext(IConfiguration configuration)
        {
            Configuration = configuration;
        }

        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
            string connectionString = Configuration.GetConnectionString("DefaultConnection")!;
            optionsBuilder.UseMySql(connectionString, ServerVersion.AutoDetect(connectionString));
        }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            base.OnModelCreating(modelBuilder);
        }

        DbSet<RandomValue> RandomValues { get; set; }
    }
} 
```

``` json
  "ConnectionStrings": {
    "DefaultConnection": "server=localhost;database=randomvalue;user=root;password=password;"
  }
```