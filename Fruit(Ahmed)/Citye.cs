//------------------------------------------------------------------------------
// <auto-generated>
//    This code was generated from a template.
//
//    Manual changes to this file may cause unexpected behavior in your application.
//    Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace Fruit_Ahmed_
{
    using System;
    using System.Collections.Generic;
    
    public partial class Citye
    {
        public Citye()
        {
            this.Orders = new HashSet<Order>();
            this.Products = new HashSet<Product>();
            this.Quarters = new HashSet<Quarter>();
        }
    
        public int CityID { get; set; }
        public string CityName { get; set; }
    
        public virtual ICollection<Order> Orders { get; set; }
        public virtual ICollection<Product> Products { get; set; }
        public virtual ICollection<Quarter> Quarters { get; set; }
    }
}
