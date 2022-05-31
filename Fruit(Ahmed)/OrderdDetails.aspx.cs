using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Fruit_Ahmed_
{
    public partial class OrderdDetails : System.Web.UI.Page
    {
        FruitEntities db = new FruitEntities();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                DATA();
                DATTA();
            }
        }


        public void DATTA()
        {
            int id = Convert.ToInt32(Request.QueryString["id"]);

            var ord = (from obj in db.Order_Component
                       join obj2 in db.Orders
                       on obj.Order_ID equals obj2.order_ID
                       join obj3 in db.Customers
                       on obj2.customer_ID equals obj3.customer_ID
                       join obj4 in db.Products
                       on obj.Product_ID equals obj4.product_ID
                       where obj2.order_ID == id
                       select new
                       {
                           Order_ComponentID = obj.Order_ComponentID,
                           productName = obj4.productName,
                           quantity = obj.quantity

                       }).ToList();
            GridView1.DataSource = ord;
            GridView1.DataBind();
        }

        public void DATA()
        {

            int id = Convert.ToInt32(Request.QueryString["id"]);

            lblNum.Text = (from obj in db.Orders
                           where obj.order_ID == id
                           select obj.OrderNo).FirstOrDefault();

            lblName.Text = (from obj in db.Orders
                            join obj1 in db.Customers
                            on obj.customer_ID equals obj1.customer_ID
                            where obj.order_ID == id
                            select obj1.userName).FirstOrDefault();

            lblAddres.Text = (from obj in db.Orders
                              join obj1 in db.Quarters
                              on obj.QuarterID equals obj1.QuarterID
                              select obj1.QuarterName).FirstOrDefault();

            lblcity.Text = (from obj in db.Orders
                            join obj1 in db.Cityes
                            on obj.CityID equals obj1.CityID
                            select obj1.CityName).FirstOrDefault();

            lblMobile.Text = (from obj in db.Orders
                              where obj.order_ID == id
                              select obj.mobile).FirstOrDefault();

            lblTotalprice.Text = (from obj in db.Orders
                                  where obj.order_ID == id
                                  select obj.TotalPrice).FirstOrDefault();

            lblDate.Text = (from obj in db.Orders
                            where obj.order_ID == id
                            select obj.driveDate).FirstOrDefault().ToShortDateString();


            lbStatus.Text = (from obj in db.Orders
                             where obj.order_ID == id
                             select obj.status).FirstOrDefault();

            var dt = from obj in db.Orders
                     where obj.order_ID == id
                     select new
                     {
                         obj.longi,
                         obj.lati
                     };

            rptMarkers.DataSource = dt.ToList();
            rptMarkers.DataBind();

        }

        protected void lbStatus_Click(object sender, EventArgs e)
        {
            int id = Convert.ToInt32(Request.QueryString["id"]);
            Order or = (from obj in db.Orders
                        where obj.order_ID == id
                        select obj).FirstOrDefault();
            or.status = "تم التسليم";
            db.SaveChanges();
            DATA();
            DATTA();
        }
    }
}