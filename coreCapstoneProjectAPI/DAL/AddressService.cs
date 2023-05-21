using coreCapstoneProjectAPI.Models;
using Microsoft.EntityFrameworkCore;
using Microsoft.Data.SqlClient;
using System.Reflection.Metadata;
using System.Web.Http.Results;
using System.Web.Http;
using System.Data.Common;

namespace coreCapstoneProjectAPI.DAL
{
    public class AddressService : IAddressService
    {
        private readonly ApplicationDbContext _context;
        public AddressService()
        {
            _context = new ApplicationDbContext();
        }

        public async Task<int> AddAddressAsync(Address address)
        {
            var parameter = new List<SqlParameter>();
            parameter.Add(new SqlParameter("@UserName", address.UserName));
            parameter.Add(new SqlParameter("@Email", address.Email));
            parameter.Add(new SqlParameter("@Phone", address.Phone));
            parameter.Add(new SqlParameter("@Location", address.Location));
            parameter.Add(new SqlParameter("@Country", address.Country));
            parameter.Add(new SqlParameter("@State", address.State));
            parameter.Add(new SqlParameter("@Zip", address.Zip));
            parameter.Add(new SqlParameter("@UserId", address.UserId));

            var result = await Task.Run(() => _context.Database
            .ExecuteSqlRawAsync(@"exec AddAddress @UserName, @Email, @Phone, @Location, @Country, @State, @Zip, @UserId", parameter.ToArray()));
            return result;
        }

        public async Task<IEnumerable<Address>> GetAddressByUserIdAsync(int Id)
        {
            var parameter = new SqlParameter("@UserId", Id);

            var result = await Task.Run(() => _context.Addresses
            .FromSqlRaw(@"exec GetAddressByUserId @UserId", parameter).ToListAsync());
            return result;
        }
    }
}
