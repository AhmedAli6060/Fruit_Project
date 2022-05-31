using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Fruit_Ahmed_
{
    public partial class Orders : System.Web.UI.Page
    {
        FruitEntities db = new FruitEntities();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                DATA();
            }
        }

        public void DATA()
        {
            var ord = (from obj in db.Orders
                       join obj2 in db.Customers
                       on obj.customer_ID equals obj2.customer_ID
                       orderby obj.order_ID descending
                       select new
                       {
                           obj.order_ID,
                           userName = obj2.userName,
                           status = obj.status,
                           OrderNo = obj.OrderNo,
                       }).ToList();
            gvCust.DataSource = ord;
            gvCust.DataBind();
        }

        protected void gvCust_SelectedIndexChanged(object sender, EventArgs e)
        {
            int id = Convert.ToInt32(gvCust.SelectedDataKey["order_ID"]);
            Customer or = (from ord in db.Customers
                           where ord.customer_ID == id
                           select ord).FirstOrDefault();
            db.SaveChanges();
            Response.Redirect("OrderdDetails.aspx?id= " + gvCust.SelectedDataKey["order_ID"]);
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {

            var ord = (from obj in db.Orders
                       join obj2 in db.Customers
                       on obj.customer_ID equals obj2.customer_ID
                       where obj.OrderNo.Contains(txtSearch.Text)
                       orderby obj.status descending
                       select new
                       {
                           obj2.customer_ID,
                           obj2.userName,
                           obj.status,
                           obj.OrderNo,
                           obj.order_ID
                       }).ToList();
            if (ord.Count == 0)
            {
                secempty.Visible = true;
                gvCust.Visible = false;
            }
            else
            {
                secempty.Visible = false;
                gvCust.Visible = true;
                gvCust.DataSource = ord;
                gvCust.DataBind();
            }
        }

        protected void gvCust_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvCust.PageIndex = e.NewPageIndex;
            DATA();
        }
    }
}