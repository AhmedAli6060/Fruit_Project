using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Fruit_Ahmed_
{
    public partial class Profile : System.Web.UI.Page
    {
        FruitEntities db = new FruitEntities();
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            { 
            bind();
            data();
            Privtedata();
            }
        }

        public void data()
        {
            int custid = Convert.ToInt32(Session["ID"]);
            lblName.Text = (from obj in db.Customers
                            where obj.customer_ID == custid
                            select obj.userName).FirstOrDefault();
        }

        public void bind()
        {
            int custid = Convert.ToInt32(Session["ID"]);
            var data = from obj in db.Products
                       join obj1 in db.Order_Component
                       on obj.product_ID equals obj1.Product_ID
                       join obj2 in db.Orders
                       on obj1.Order_ID equals obj2.order_ID
                       orderby obj1.Order_ComponentID descending
                       where obj2.customer_ID == custid
                       select new
                       {
                           obj.image,
                           obj.productName,
                           obj1.TotalPrice,
                           obj1.quantity,
                           obj1.Order_ComponentID,
                           obj2.OrderNo
                       };
            Gvprofile.DataSource = data.ToList();
            Gvprofile.DataBind();
        }

        public void Privtedata()
        {
            int id = Convert.ToInt32(Session["ID"]);

            lblUsername.Text = (from obj in db.Customers
                                where obj.customer_ID == id
                                select obj.userName).FirstOrDefault();

            txtPassword.Text = (from obj in db.Customers
                                where obj.customer_ID == id
                                select obj.password).FirstOrDefault();

            lblMail.Text = (from obj in db.Customers
                            where obj.customer_ID == id
                                select obj.Email).FirstOrDefault();

            txtMail.Text = (from obj in db.Customers
                            where obj.customer_ID == id
                            select obj.Email).FirstOrDefault();

            lblMobile.Text = (from obj in db.Customers
                              where obj.customer_ID == id
                                select obj.Mobile).FirstOrDefault();

            txtMobile.Text = (from obj in db.Customers
                              where obj.customer_ID == id
                              select obj.Mobile).FirstOrDefault();
        }

        protected void Gvprofile_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            Gvprofile.PageIndex = e.NewPageIndex;
            bind();
        }

        protected void btnEdite_Click(object sender, EventArgs e)
        {
            lblPass.Visible = lblMobile.Visible = lblMail.Visible=btnEdite.Visible = false;
            txtPassword.Visible = txtMobile.Visible = txtMail.Visible = btnUpdate.Visible = btnCancel.Visible = true;
        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            lblPass.Visible = lblMobile.Visible = lblMail.Visible=btnEdite.Visible = true;
            txtPassword.Visible = txtMobile.Visible = txtMail.Visible = btnCancel.Visible = btnUpdate.Visible = false;

            int id =Convert.ToInt32(Session["ID"]);

            Customer cus = (from obj in db.Customers
                            where obj.customer_ID == id
                            select obj).FirstOrDefault();
            cus.password = txtPassword.Text;
            cus.Mobile = txtMobile.Text;
            cus.Email = txtMail.Text;
            db.SaveChanges();

            btnEdite.Visible = true;
            btnUpdate.Visible = false;
            Response.Write("<script language=javascript>alert('تم التعديل بنجاح');</script>");
            Privtedata();
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            lblPass.Visible = lblMobile.Visible = lblMail.Visible = btnEdite.Visible = true;
            txtPassword.Visible = txtMobile.Visible = txtMail.Visible = btnUpdate.Visible = btnCancel.Visible = false;
        }
    }
}