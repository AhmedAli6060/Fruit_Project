using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Fruit_Ahmed_
{
    public partial class ContactUs : System.Web.UI.Page
    {
        FruitEntities db = new FruitEntities();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void lnksend_Click(object sender, EventArgs e)
        {
            Massege msg = new Massege();
            msg.UserName = txtusername.Text;
            msg.Email = txtmail.Text;
            msg.Masseges = txtmassege.Text;
            msg.Mobile = txtMobile.Text;
            db.Masseges.Add(msg);
            db.SaveChanges();
            lblsend.Visible = true;
            txtmail.Text = txtusername.Text= txtMobile.Text = txtmassege.Text = "";
        }
    }
}