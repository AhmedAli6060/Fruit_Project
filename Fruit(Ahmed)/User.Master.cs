using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Fruit_Ahmed_
{
    public partial class User : System.Web.UI.MasterPage
    {
        FruitEntities db = new FruitEntities();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["name"] != null)
                {
                    if (Session["Role"].ToString() == "Admin")
                    {
                        lbLogout.Visible = true;
                        order.Visible = true;
                        login.Visible = false;
                        lbProfile.Visible = true;
                        sort.Visible = false;
                        lbProfile.Visible = false;
                        lbCart.Visible = false;
                        int orderno = (from obj in db.Orders
                                       where obj.status == "لم يتم التسليم"
                                       select obj).Count();
                        Label1.Text = orderno.ToString();
                        ord.Visible = true;
                        Label2.Visible = true;
                    }
                    else 
                    {
                        lbLogout.Visible = true;
                        login.Visible = false;
                        lbProfile.Visible = true;
                    }
                    
                }
                else
                {
                    login.Visible = true;
                    lbLogout.Visible = false;
                    order.Visible = false;
                    lbProfile.Visible = false;
                }
            }

        }

        protected void lbLogout_Click(object sender, EventArgs e)
        {
            Session["Name"] = Session["Role"] = Session["ID"] =Session["citid"]=null;
            Response.Redirect("Home.aspx");
        }

        protected void lnkkch_Click(object sender, EventArgs e)
        {

           
            Session["citid"] = 1;
            lnkabha.Visible = false;
            lnktaaf.Visible = false;
            Response.Redirect("Cats.aspx");
        }

        protected void lnkabha_Click(object sender, EventArgs e)
        {
            Session["citid"] = 2;
            Response.Redirect("Cats.aspx");

        }

        protected void lnktaaf_Click(object sender, EventArgs e)
        {
            Session["citid"] = 3;
            Response.Redirect("Cats.aspx");
        }
    }
}