using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net;
using System.Net.Mail;

namespace Fruit_Ahmed_
{
    public partial class WebForm1 : System.Web.UI.Page
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
                        loginn.Visible = false;
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
                        loginn.Visible = false;
                        lbProfile.Visible = true;
                    }

                }
                else
                {
                    loginn.Visible = true;
                    lbLogout.Visible = false;
                    order.Visible = false;
                    lbProfile.Visible = false;
                }

                int id = Convert.ToInt32(Session["ID"]);
                lblusername.Text = (from obj in db.Customers
                                    where obj.customer_ID == id
                                    select obj.userName).FirstOrDefault();
                lblmail.Text = (from obj in db.Customers
                                where obj.customer_ID == id
                                select obj.Email).FirstOrDefault();
                lblMob.Text = (from obj in db.Customers
                               where obj.customer_ID == id
                               select obj.Mobile).FirstOrDefault();
                Cart_Component[] total = (from obj in db.Cart_Component
                                          join obj1 in db.Carts
                                          on obj.Cart_ID equals obj1.Cart_ID
                                          where obj1.Customer_ID == id
                                          select obj).ToArray();
                double sum = 0;
                foreach (Cart_Component s in total)
                {
                    sum = sum + Convert.ToDouble(s.Total_Price);
                    lbltotalprice.Text = " الإجمالي " + sum.ToString() + " ريال ";
                }

                int maxorder = (from obj in db.Orders
                                select obj.order_ID).Count();

                int OrderNo = maxorder + 1;
                lblorderno.Text = OrderNo.ToString();

                Citye cit = (from obj in db.Cart_Component
                             join obj1 in db.Products
                             on obj.Product_ID equals obj1.product_ID
                             join obj2 in db.Carts
                             on obj.Cart_ID equals obj2.Cart_ID
                             join obj3 in db.Cityes
                             on obj1.CityID equals obj3.CityID
                             where obj2.Customer_ID == id
                             select obj3).FirstOrDefault();
                lblcity.Text = cit.CityName;
                int cityid = cit.CityID;
                ViewState["citid"] = cityid;
                ddl.DataTextField = "QuarterName";
                ddl.DataValueField = "QuarterID";
                ddl.DataSource = (from obj in db.Quarters
                                  where obj.CItyID == cityid
                                  select obj).ToList();
                ddl.DataBind();
            }
        }
        protected void lnkconfirm_Click(object sender, EventArgs e)
        {
            if (lat.Value == "")
            {
                Response.Write("<script language=javascript>alert('من فضلك حدد موقعك اولا');</script>");
            }
            else
            {
                Double latitude = Convert.ToDouble(lat.Value);
                Double longitude = Convert.ToDouble(lng.Value);
                int custid = Convert.ToInt32(Session["ID"]);
                Order order = new Order();
                order.customer_ID = custid;
                order.CityID =Convert.ToInt32( ViewState["citid"]);
                order.QuarterID =Convert.ToInt32(ddl.SelectedItem.Value);
                order.mobile = lblMob.Text;
                if(Convert.ToDateTime(txttime.Text)<=DateTime.Now)
                {
                    Response.Write("<script language=javascript>alert( 'لقد قمت بادخال تاريخ قديم!!');</script>");
                }
                else
                { 
                order.driveDate = Convert.ToDateTime(txttime.Text);
                order.status = "لم يتم التسليم";
                order.TotalPrice = lbltotalprice.Text;
                order.OrderNo = lblorderno.Text;
                order.lati = latitude;
                order.longi = longitude;
                db.Orders.Add(order);
                db.SaveChanges();
                int cartid = (from obj in db.Carts
                              where obj.Customer_ID == custid
                              select obj.Cart_ID).FirstOrDefault();
                Cart_Component[] array = (from obj in db.Cart_Component
                                          where obj.Cart_ID == cartid
                                          select obj).ToArray();
                foreach (Cart_Component s in array)
                {
                    Order_Component comp = new Order_Component();
                    comp.Product_ID = s.Product_ID;
                    Product pro = (from obj in db.Products
                                   where obj.product_ID == s.Product_ID
                                   select obj).FirstOrDefault();
                    pro.NoOrder = pro.NoOrder + 1;
                    db.SaveChanges();
                    comp.quantity = s.quantity;
                    comp.TotalPrice = s.Total_Price;
                    comp.Order_ID = (from obj in db.Orders
                                     where obj.customer_ID == custid
                                     select obj.order_ID).Max();
                    db.Order_Component.Add(comp);
                    db.SaveChanges();
                }
                lblok.Visible = true;
                Response.Write("<script language=javascript>alert('تم تأكيد طلبك سوف يصلك بريد الكترونى قريبا');</script>");
                db.deletecart();

              //          Email Messages //

                //MailMessage msg = new MailMessage();
                //msg.From = new MailAddress("fruitshop2016@gmail.com");
                //msg.To.Add(lblmail.Text);
                //msg.Subject = "تم تأكيد طلبك بنجاح";
                //msg.Body = " مرحبا بك" + ",,, " + " \n " + " رقم طلبك: " + lblorderno.Text + ",,," + "\n" + "الحساب الكلى:" + lbltotalprice.Text + ",,," + "\n" + "تاريخ التوصيل:" + txttime.Text + ",,," + "\n" + "...جارى تجهيز طلبك وسوف يصلك فى الموعد المحدد شكرا لتفاعلك معنا";
                //msg.IsBodyHtml = true;
                //SmtpClient smpt = new SmtpClient();
                //System.Net.NetworkCredential networkcred = new System.Net.NetworkCredential();
                //networkcred.UserName = "nohaelmenofy94@gmail.com";
                //networkcred.Password = "60f198ea-2030-47ab-b2fa-dbd05942ff42";
                //smpt.UseDefaultCredentials = true;
                //smpt.Credentials = networkcred;
                //smpt.Host = "smtp.elasticemail.com";
                //smpt.Port = 2525;
                //smpt.Send(msg);
                    }
            }
        }
        protected void lbLogout_Click(object sender, EventArgs e)
        {
            Session["Name"] = Session["Role"] = Session["ID"] = Session["citid"] = null;
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