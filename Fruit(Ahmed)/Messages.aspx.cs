using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Fruit_Ahmed_
{
    public partial class Messages : System.Web.UI.Page
    {
        FruitEntities db = new FruitEntities();
        protected void Page_Load(object sender, EventArgs e)
        {
            DATA();
        }

        public void DATA()
        {
            var msg = (from obj in db.Masseges
                       orderby obj.MassegeID descending
                       select new
                       {
                           MassegeID=obj.MassegeID,
                           UserName=obj.UserName,
                           Email=obj.Email,
                          Masseges= obj.Masseges
                       }).ToList();
            gvMessage.DataSource = msg;
            gvMessage.DataBind();
        }

        protected void gvMessage_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvMessage.PageIndex = e.NewPageIndex;
            DATA();
        }
    }
}