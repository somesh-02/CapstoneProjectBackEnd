﻿using coreCapstoneProjectAPI.Models;
using Microsoft.AspNetCore.Mvc;
using System.Web.Http;

namespace coreCapstoneProjectAPI.DAL
{
    public interface IMedicineService
    {
        public Task<List<Medicine>> GetMedicineListAsync();
        public Task<IEnumerable<Medicine>> GetMedicineByIdAsync(int Id);
        public Task<int> AddMedicineAsync(Medicine medicine);
        public Task<int> DeleteMedicineAsync(int Id);
        public Task<int> UpdateMedicineAsync(int Id, Medicine medicine);
        public Task<List<Medicine>> SearchAsync(string query);
    }
}
