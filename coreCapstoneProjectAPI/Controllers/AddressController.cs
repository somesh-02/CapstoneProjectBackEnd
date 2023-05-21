using coreCapstoneProjectAPI.DAL;
using coreCapstoneProjectAPI.Models;
using Microsoft.AspNetCore.Cors.Infrastructure;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using System.Linq.Expressions;

namespace coreCapstoneProjectAPI.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class AddressController : ControllerBase
    {
        private readonly IAddressService addressService;
        public AddressController(IAddressService addressService)
        {
            this.addressService = addressService;
        }
        [HttpGet]
        [Route("GetAddressByUserId")]
        public async Task<IEnumerable<Address>> GetCartByAddressIdAsync(int Id)
        {
            try
            {
                var response = await addressService.GetAddressByUserIdAsync(Id);
                if (response == null)
                {
                    return null;
                }
                return response;
            }
            catch
            {
                throw;
            }
        }
        [HttpPut]
        [Route("AddAddress")]
        public async Task<IActionResult> AddAddress(Address address)
        {
            if (address == null)
            {
                return BadRequest();
            }
            try
            {
                var response = await addressService.AddAddressAsync(address);
                return Ok(response);
            }
            catch
            {
                throw;
            }
        }
    }
}
