using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Fruit_Ahmed_
{
    public partial class Admin : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            FruitEntities db=new FruitEntities();
            if (Session["name"] != null)
            {
                if (Session["Role"].ToString() == "Admin")
                {
                    lbLogout.Visible = true;
                    login.Visible = false;
                    int orderno = (from obj in db.Orders
                                   where obj.status == "لم يتم التسليم"
                                   select obj).Count();
                    Label1.Text = orderno.ToString();
                }
                else
                {
                    Response.Redirect("Home.aspx");
                }

            }
            else
            {
                Response.Redirect("Home.aspx");
            }
        }

        protected void lbLogout_Click(object sender, EventArgs e)
        {
            Session["Name"] = Session["Role"] = Session["ID"] = null;
            Response.Redirect("Home.aspx");
        }
    }
}