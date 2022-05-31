using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Fruit_Ahmed_
{
    public partial class Cats : System.Web.UI.Page
    {
        FruitEntities db = new FruitEntities();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                //int cityid = Convert.ToInt32(Request.QueryString["id"]);
                if (Session["citid"] == null)
                {
                    Response.Redirect("Home.aspx");
                }
                else
                {
                    int citt = Convert.ToInt32(Session["citid"]);
                    ViewState["id"] = citt;
                    Citye cit = (from obj in db.Cityes
                                 where obj.CityID == citt
                                 select obj).FirstOrDefault();
                    h2header.InnerText = cit.CityName;
                    ddlcats.DataValueField = "category_ID";
                    ddlcats.DataTextField = "name";
                    var cat = from obj in db.Categories
                              select obj;
                    ddlcats.DataSource = cat.ToList();
                    ddlcats.DataBind();
                    ddlcats.Items.Insert(0, "اختر الصنف");
                }
              
            }
        }


        public void bind()
        {
            int cityid = Convert.ToInt32(ViewState["id"]);
            int cat = Convert.ToInt32(ddlcats.SelectedItem.Value);
            var data = from obj in db.Products
                       where obj.category_ID == cat && obj.CityID == cityid && obj.DeleteProduct == true
                       select obj;
                   
            listview.DataSource = data.ToList();
            listview.DataBind();

        }

        protected void listview_ItemCommand(object sender, ListViewCommandEventArgs e)
        {
            if (e.CommandName == "Pluse")
            {

                ListViewDataItem row = (ListViewDataItem)((LinkButton)e.CommandSource).NamingContainer;
                TextBox txtquantity = row.FindControl("txtquantity") as TextBox;
                Double sum = 0;
                Label productid = row.FindControl("lblproid") as Label;
                int prodid = Convert.ToInt32(productid.Text);
                double quan = Convert.ToDouble((from obj in db.Products
                                                where obj.product_ID == prodid
                                                select obj.quantity).FirstOrDefault());
                double price = Convert.ToDouble((from obj in db.Products
                                                 where obj.product_ID == prodid
                                                 select obj.price).FirstOrDefault());
                if (Convert.ToDouble(txtquantity.Text) >= quan)
                {
                    txtquantity.Text = quan.ToString();

                }
                else
                {
                    sum = Convert.ToDouble(txtquantity.Text) + .5;
                    txtquantity.Text = sum.ToString();
                }

                Label lblprice = row.FindControl("Lblprice") as Label;
                double txtquan = Convert.ToDouble(txtquantity.Text);
                double total = price * txtquan;
                lblprice.Text = total.ToString();


            }

            else if (e.CommandName == "min")
            {
                ListViewDataItem row = (ListViewDataItem)((LinkButton)e.CommandSource).NamingContainer;
                TextBox txtquantity = row.FindControl("txtquantity") as TextBox;
                Double sum = 0;
                Label productid = row.FindControl("lblproid") as Label;
                int prodid = Convert.ToInt32(productid.Text);
                double quan = Convert.ToDouble((from obj in db.Products
                                                where obj.product_ID == prodid
                                                select obj.quantity).FirstOrDefault());
                double price = Convert.ToDouble((from obj in db.Products
                                                 where obj.product_ID == prodid
                                                 select obj.price).FirstOrDefault());
                if (Convert.ToDouble(txtquantity.Text) <= 1)
                {
                    txtquantity.Text = 1.ToString();
                }
                else
                {
                    sum = Convert.ToDouble(txtquantity.Text) - .5;
                    txtquantity.Text = sum.ToString();
                }
                Label lblprice = row.FindControl("Lblprice") as Label;
                double txtquan = Convert.ToDouble(txtquantity.Text);
                double total = price * txtquan;
                lblprice.Text = total.ToString();

            }
        }

        protected void ddlcats_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddlcats.SelectedIndex == 0)
            {

            }
            else
            {
                bind();
            }
        }

        protected void listview_SelectedIndexChanged(object sender, EventArgs e)
        {
            string quan = ((TextBox)listview.Items[listview.SelectedIndex].FindControl("txtquantity")).Text;
            string price = ((Label)listview.Items[listview.SelectedIndex].FindControl("Lblprice")).Text;
            if (Session["Name"] == null)
            {
                Response.Redirect("LogIn.aspx");
            }
            else
            {
                int custid = Convert.ToInt32(Session["ID"]);
                int Productid = Convert.ToInt32(listview.SelectedDataKey["product_ID"].ToString());
                int check = (from obj in db.Cart_Component
                             join obj2 in db.Carts
                             on obj.Cart_ID equals obj2.Cart_ID
                             where obj.Product_ID == Productid && obj2.Customer_ID == custid
                             select obj).Count();
                if (check == 0)
                {
                    int checkkk = (from obj in db.Cart_Component
                                 join obj2 in db.Carts
                                on obj.Cart_ID equals obj2.Cart_ID
                                 where obj2.Customer_ID == custid
                                 select obj).Count();
                    if (checkkk != 0)
                    {
                        int id =Convert.ToInt32(ViewState["id"]);

                        Product pro = (from obj in db.Cart_Component
                                        join obj1 in db.Products
                                        on obj.Product_ID equals obj1.product_ID
                                        join obj2 in db.Carts
                                        on obj.Cart_ID equals obj2.Cart_ID
                                        where obj2.Customer_ID == custid
                                        select obj1).FirstOrDefault();
                        if (id == pro.CityID)
                        {
                            Cart_Component cartcomp = new Cart_Component();
                            cartcomp.Cart_ID = (from obj in db.Carts
                                                where obj.Customer_ID == custid
                                                select obj.Cart_ID).FirstOrDefault();
                            cartcomp.Product_ID = Productid;
                            cartcomp.quantity = quan;
                            cartcomp.Total_Price = price;
                            db.Cart_Component.Add(cartcomp);
                            db.SaveChanges();
                            Response.Write("<script language=javascript>alert('تمت الإضافة الي السلة');</script>");
                        }
                        else
                        {
                            Response.Write("<script language=javascript>alert('لايمكن الأضافه من اكتر من مدينة');</script>");
                        }
                    }
                    else
                    {
                        Cart_Component cartcomp = new Cart_Component();
                        cartcomp.Cart_ID = (from obj in db.Carts
                                            where obj.Customer_ID == custid
                                            select obj.Cart_ID).FirstOrDefault();
                        cartcomp.Product_ID = Productid;
                        cartcomp.quantity = quan;
                        cartcomp.Total_Price = price;
                        db.Cart_Component.Add(cartcomp);
                        db.SaveChanges();
                        Response.Write("<script language=javascript>alert('تمت الإضافة الي السلة');</script>");
                    }
                }
                else
                {
                    Response.Write("<script language=javascript>alert('تمت الإضافة سابقا');</script>");
                }
            }
        }

        protected void listview_SelectedIndexChanging(object sender, ListViewSelectEventArgs e)
        {

        }
    }
}