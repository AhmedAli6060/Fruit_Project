using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

namespace Fruit_Ahmed_
{
    public partial class Cart1 : System.Web.UI.Page
    {
        FruitEntities db = new FruitEntities();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                gvdatabind();

            }

        }
        public void gvdatabind()
        {
            int custid = Convert.ToInt32(Session["ID"]);
            ViewState["ID"] = custid;
            var data = from obj in db.Cart_Component
                       join obj2 in db.Carts
                       on obj.Cart_ID equals obj2.Cart_ID
                       join obj3 in db.Products
                       on obj.Product_ID equals obj3.product_ID
                       orderby obj.Cart_ComponentID descending
                       where obj2.Customer_ID == custid
                       select new
                       {
                           obj3.product_ID,
                           obj3.productName,
                           obj3.image,
                           obj3.price,
                           obj.Cart_ComponentID,
                           obj.quantity,
                           obj.Total_Price
                       };
            if (data.Count() == 0)
            {
                secempty.Visible = true;
                btnConfirm.Visible = false;
            }
            else
            {
                Gvcart.DataSource = data.ToList();
                Gvcart.DataBind();
            }
        }

        protected void Gvcart_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Pluse")
            {
                GridViewRow row = (GridViewRow)((LinkButton)e.CommandSource).NamingContainer;
                TextBox txtquantity = row.FindControl("txtquantity") as TextBox;
                Double sum = 0;
                Label productname = row.FindControl("lblproid") as Label;
                int prodid = Convert.ToInt32(productname.Text);
                double quan = Convert.ToDouble((from obj in db.Products
                                                where obj.product_ID == prodid
                                                select obj.quantity).FirstOrDefault());

                if (Convert.ToDouble(txtquantity.Text) >= quan)
                {
                    txtquantity.Text = quan.ToString();

                }
                else
                {
                    sum = Convert.ToDouble(txtquantity.Text) + .5;
                    txtquantity.Text = sum.ToString();
                }


                Label lbltotal = row.FindControl("lbltotal") as Label;
                Label lblprice = row.FindControl("lblprice") as Label;
                double txtquan = Convert.ToDouble(txtquantity.Text);
                double price = Convert.ToDouble(lblprice.Text.Replace(" ريال ", ""));
                double total = price * txtquan;
                lbltotal.Text = " ريال " + total.ToString();
                Label lblid = row.FindControl("lblid") as Label;
                int id = Convert.ToInt32(lblid.Text);
                var prod = (from obj in db.Cart_Component
                            where obj.Cart_ComponentID == id
                            select obj).FirstOrDefault();
                prod.quantity = txtquantity.Text;
                prod.Total_Price = total.ToString();
                db.SaveChanges();

            }
            else if (e.CommandName == "min")
            {
                GridViewRow row = (GridViewRow)((LinkButton)e.CommandSource).NamingContainer;
                TextBox txtquantity = row.FindControl("txtquantity") as TextBox;
                double sum = 0;
                if (Convert.ToDouble(txtquantity.Text) <= 1)
                {
                    txtquantity.Text = 1.ToString();
                }
                else
                {
                    sum = Convert.ToDouble(txtquantity.Text) - .5;
                    txtquantity.Text = sum.ToString();
                }

                Label lbltotal = row.FindControl("lbltotal") as Label;
                Label lblprice = row.FindControl("lblprice") as Label;
                double txtquan = Convert.ToDouble(txtquantity.Text);
                double price = Convert.ToDouble(lblprice.Text.Replace(" ريال ", ""));
                double total = price * txtquan;
                lbltotal.Text = " ريال " + total.ToString();
                Label lblid = row.FindControl("lblid") as Label;
                int id = Convert.ToInt32(lblid.Text);
                var prod = (from obj in db.Cart_Component
                            where obj.Cart_ComponentID == id
                            select obj).FirstOrDefault();
                prod.quantity = txtquantity.Text;
                prod.Total_Price = total.ToString();
                db.SaveChanges();
            }
        }

        protected void Gvcart_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int comp = Convert.ToInt32(Gvcart.DataKeys[e.RowIndex].Values[0]);
            Cart_Component cart = (from obj in db.Cart_Component
                                   where obj.Cart_ComponentID == comp
                                   select obj).FirstOrDefault();
            db.Cart_Component.Remove(cart);
            db.SaveChanges();
            gvdatabind();
        }

        protected void btnConfirm_Click(object sender, EventArgs e)
        {
            Response.Redirect("Confirm.aspx");
        }

        protected void Gvcart_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            Gvcart.PageIndex = e.NewPageIndex;
            gvdatabind();
        }

 
    }
}