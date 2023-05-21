using Microsoft.EntityFrameworkCore;
namespace coreCapstoneProjectAPI.Models
{
    public class ApplicationDbContext:DbContext
    {
        public DbSet<Users> Userss { get; set; }
        public DbSet<Medicine> Medicines { get; set; }
        public DbSet<Category> Categories { get; set; }
        public DbSet<Cart> Carts { get; set; }
        public DbSet<Address> Addresses { get; set; }
        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
            optionsBuilder.UseSqlServer("Server=HSC-PF25NJE3;Database=CapstoneDB;Integrated Security=true;TrustServerCertificate=true");
        }
    }
}
