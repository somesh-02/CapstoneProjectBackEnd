using coreCapstoneProjectAPI.Models;
using Microsoft.AspNetCore.Mvc;
using System.Web.Http;

namespace coreCapstoneProjectAPI.DAL
{
    public interface IAddressService
    {
        public Task<IEnumerable<Address>> GetAddressByUserIdAsync(int Id);
        public Task<int> AddAddressAsync(Address address);
    }
}
