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
    
    public partial class Customer
    {
        public Customer()
        {
            this.Carts = new HashSet<Cart>();
        }
    
        public int customer_ID { get; set; }
        public string userName { get; set; }
        public string password { get; set; }
        public string Email { get; set; }
        public string role { get; set; }
        public Nullable<bool> Active { get; set; }
        public string Mobile { get; set; }
    
        public virtual ICollection<Cart> Carts { get; set; }
    }
}
