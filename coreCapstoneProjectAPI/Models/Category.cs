﻿namespace coreCapstoneProjectAPI.Models
{
    public class Category
    {
        public int CategoryId { get; set; }
        public string CategoryName { get; set; }
        public string Description { get; set; }
        public ICollection<Medicine> ? Medicines { get; set; }

    }
}
