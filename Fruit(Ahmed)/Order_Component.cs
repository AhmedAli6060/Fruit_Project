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
    
    public partial class Order_Component
    {
        public int Order_ComponentID { get; set; }
        public int Order_ID { get; set; }
        public int Product_ID { get; set; }
        public string quantity { get; set; }
        public string TotalPrice { get; set; }
    
        public virtual Order Order { get; set; }
        public virtual Product Product { get; set; }
    }
}
