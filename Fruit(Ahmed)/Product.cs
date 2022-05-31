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
    
    public partial class Product
    {
        public Product()
        {
            this.Cart_Component = new HashSet<Cart_Component>();
            this.Order_Component = new HashSet<Order_Component>();
        }
    
        public int product_ID { get; set; }
        public string productName { get; set; }
        public string price { get; set; }
        public string image { get; set; }
        public string quantity { get; set; }
        public int category_ID { get; set; }
        public Nullable<bool> DeleteProduct { get; set; }
        public Nullable<int> CityID { get; set; }
        public Nullable<int> NoOrder { get; set; }
    
        public virtual ICollection<Cart_Component> Cart_Component { get; set; }
        public virtual Citye Citye { get; set; }
        public virtual ICollection<Order_Component> Order_Component { get; set; }
    }
}
