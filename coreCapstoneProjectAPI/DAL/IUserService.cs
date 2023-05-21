using coreCapstoneProjectAPI.Models;
using Microsoft.AspNetCore.Mvc;
using System.Web.Http;

namespace coreCapstoneProjectAPI.DAL
{
    public interface IUserService
    {
        public Task<List<Users>> GetUsersListAsync();
        public Task<IEnumerable<Users>> GetUserByIdAsync(int Id);
        public Task<int> AddUserAsync(Users user);
        public Task<int> DeleteUserAsync(int Id);
        public Task<IEnumerable<Users>> Login(string email,string password);
    }
}
