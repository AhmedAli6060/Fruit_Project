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
    public partial class LogIn : System.Web.UI.Page
    {
        FruitEntities db = new FruitEntities();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnLogIn_Click(object sender, EventArgs e)
        {

            int check = (from obj in db.Customers
                         where obj.userName == txtboxName.Text && obj.password == txtboxpass.Text && obj.Active == true

                         select obj).Count();

            if (check == 1)
            {
                Customer Re = (from mm in db.Customers
                               where mm.userName == txtboxName.Text && mm.password == txtboxpass.Text && mm.Active == true

                                select mm).FirstOrDefault();

                Session["ID"] = Re.customer_ID;
                int id = Convert.ToInt32(Session["ID"]);
                Session["Name"] = Re.userName;
                Session["Role"] = Re.role;
                txtboxName.Text = txtboxpass.Text = "";
                Response.Redirect("Cats.aspx");
            }
            else
            {
                pnlLog.Visible = true;
            }


        }
        protected void btnCreate_Click(object sender, EventArgs e)
        {

            int checkName = (from obj in db.Customers
                             where obj.userName == txtboxName2.Text&&obj.Active==true
                             select obj).Count();
            int checkEmail = (from obj in db.Customers
                              where obj.Email == txtboxEmail.Text && obj.Active == true
                              select obj).Count();


            if (checkName != 0)
            {
                lblName.Visible = true;
            }
            if (checkEmail != 0)
            {
                lblEmail.Text = "هذا البريد الإلكترونى تم إستخدامه سابقا!";
                lblEmail.Visible = true;
            }

            else
            {
                try
                {
                    //         Email Messages      //

                    //MailMessage msg = new MailMessage();
                    //msg.From = new MailAddress("fruitshop2016@gmail.com");
                    //msg.To.Add(txtboxEmail.Text);
                    //msg.Subject = "welcome" + " " + txtboxName2.Text;
                    //msg.Body = "Welcome! We're happy you joined us in our Fruit shop";
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
                    lblName.Visible = lblEmail.Visible = false;

                    Customer cust = new Customer();
                    cust.userName = txtboxName2.Text;
                    cust.Email = txtboxEmail.Text;
                    cust.password = txtboxPass2.Text;
                    cust.role = "User";
                    cust.Active = true;
                    cust.Mobile = txtmob.Text;
                    db.Customers.Add(cust);
                    db.SaveChanges();
                    pnlSuccess.Visible = true;
                    Session["ID"] = cust.customer_ID;
                    int custid = Convert.ToInt32(Session["ID"]);
                    Cart cart = new Cart();
                    cart.Customer_ID = custid;
                    db.Carts.Add(cart);
                    db.SaveChanges();
                    Customer Re = (from mm in db.Customers
                                   where mm.userName == txtboxName2.Text && mm.password == txtboxPass2.Text && mm.Active == true
                                   select mm).FirstOrDefault();
                    Session["ID"] = Re.customer_ID;
                    int id = Convert.ToInt32(Session["ID"]);
                    Session["Name"] = Re.userName;
                    Session["Role"] = Re.role;
                    txtboxName2.Text = txtboxPass2.Text = txtboxEmail.Text = txtboxConfirm.Text = "";
                    Response.Redirect("Home.aspx");
                }
                catch(Exception)
                {
                    lblEmail.Visible = true;
                    lblEmail.Text = "هذا الأيميل غير صحيح";
                }
            }
        }
    }


}
