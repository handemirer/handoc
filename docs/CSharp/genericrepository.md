# Generic Repository 

``` c#
namespace EntityFramework.Entity
{
    public interface IEntity
    {
        public Guid Id { get; set; }
        public DateTime CreateAt { get; set; } 
    }
}
```
``` c#
 namespace EntityFramework.Entity
{
    public class BaseEntity : IEntity
    {
        public Guid Id { get; set; }
        public DateTime CreateAt { get; set; } = DateTime.Now;
    }
}
```
``` c#
using EntityFramework.Context;
using EntityFramework.Entity;
using Microsoft.EntityFrameworkCore;

namespace EntityFramework.Repository
{
    public class GenericRepository<TEntity> : IRepository<TEntity> where TEntity : BaseEntity
    {
        private readonly DataContext context;

        public GenericRepository(DataContext dataContext)
        {
            context = dataContext;
        }

        public List<TEntity> GetAll()
        {
            return context.Set<TEntity>().AsNoTracking().ToList();
        }

        public async Task<TEntity?> GetById(Guid id)
        {
            return await context.Set<TEntity>().AsNoTracking().FirstOrDefaultAsync(e => e.Id == id);
        }

        public async Task Create(TEntity entity)
        {
            await context.Set<TEntity>().AddAsync(entity);
            await context.SaveChangesAsync();
        }

        public async Task Update(TEntity entity)
        {
            context.Set<TEntity>().Update(entity);
            await context.SaveChangesAsync();
        }

        public async Task Delete(Guid id)
        {
            var entity = await GetById(id);
            context.Set<TEntity>().Remove(entity!);
            await context.SaveChangesAsync();
        }
    }
}
```
 