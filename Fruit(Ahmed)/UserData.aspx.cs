using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Fruit_Ahmed_
{
    public partial class UserData : System.Web.UI.Page
    {
        FruitEntities db = new FruitEntities();
        protected void Page_Load(object sender, EventArgs e)
        {
            gvbind();
        }

        public void gvbind()
        {
            var data = from obj in db.Customers
                       orderby obj.customer_ID descending
                       where obj.Active==true
                       select new
                       {
                           obj.userName,
                           obj.Email,
                           obj.customer_ID
                       };
            gvusers.DataSource = data.ToList();
            gvusers.DataBind();
        }

        protected void gvusers_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            GridViewRow row = gvusers.Rows[e.RowIndex];
            int id = Convert.ToInt32(gvusers.DataKeys[e.RowIndex].Values[0]);
            db.delecust(id);
            db.SaveChanges();
            gvbind();
        }

        protected void gvusers_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvusers.PageIndex = e.NewPageIndex;
            gvbind();
        }

    }
}