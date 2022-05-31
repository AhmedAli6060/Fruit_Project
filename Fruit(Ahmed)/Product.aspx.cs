using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;

namespace Fruit_Ahmed_
{
    public partial class Product1 : System.Web.UI.Page
    {
        FruitEntities db = new FruitEntities();
        protected void Page_Load(object sender, EventArgs e)
        {
            BindGrid();
            BindGrid2();
        }

        void BindGrid()
        {
            var ad = (from obj1 in db.Products
                      join obj in db.Cityes
                      on obj1.CityID equals obj.CityID
                      where obj1.category_ID == 1 && obj1.DeleteProduct == true
                      orderby obj1.product_ID descending
                      select new
                      {
                          obj1.product_ID,
                          obj1.productName,
                          obj1.price,
                          obj.CityName,
                          obj1.image,
                          obj1.quantity
                      }).ToList();
            gvFruits.DataSource = gvVegetables.DataSource = ad;
            gvFruits.DataBind();
            gvVegetables.DataBind();
        }

        void BindGrid2()
        {
            var ad = (from obj1 in db.Products
                      join obj in db.Cityes
                      on obj1.CityID equals obj.CityID
                      where obj1.category_ID == 2 && obj1.DeleteProduct == true
                      orderby obj1.product_ID descending
                      select new
                      {
                          obj1.product_ID,
                          obj1.productName,
                          obj1.price,
                          obj.CityName,
                          obj1.image,
                          obj1.quantity
                      }).ToList();
            gvVegetables.DataSource = ad;
            gvVegetables.DataBind();
        }

        protected void gvFruits_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            GridViewRow row = gvFruits.Rows[e.RowIndex];
            int id = Convert.ToInt32(gvFruits.DataKeys[e.RowIndex].Values[0]);
            Product ite = (from obj in db.Products
                           where obj.product_ID == id
                           select obj).FirstOrDefault();

            ite.DeleteProduct = false;
            db.SaveChanges();
            BindGrid();
        }

        protected void btnAddFruit2_Click(object sender, EventArgs e)
        {
            Product prd = new Product();

            if (fUpImage.HasFile)
            {

                string name = fUpImage.FileName;
                string Ppath = Request.PhysicalApplicationPath + "images/frutisImages\\";
                string ext = fUpImage.FileName.Substring(fUpImage.FileName.IndexOf(".") + 1);
                if (ext.ToLower() == "jpg" || ext.ToLower() == "png" || ext.ToLower() == "jpeg" || ext.ToLower() == "gif")
                {
                    string path = Server.MapPath("~/images/frutisImages/" + fUpImage.FileName);
                    fUpImage.SaveAs(path);
                    prd.productName = txtName.Text;
                    prd.price = txtPrice.Text;
                    prd.quantity = txtQuantity.Text;
                    prd.CityID =Convert.ToInt32 (DropDownList1.SelectedItem.Value);
                    prd.image = name;
                    prd.category_ID = 1;
                    prd.DeleteProduct = true;
                    prd.NoOrder = 0;
                    db.Products.Add(prd);
                    db.SaveChanges();
                    BindGrid();
                    txtPrice.Text = txtName.Text = txtQuantity.Text = "";
                    lblfailf.Visible = false;
                    lblokf.Visible = true;

                }
                else
                {
                    
                    lblokf.Visible = false;
                    lblfailf.Visible = true;
                    
                }
            }
        }

        protected void btnAddVegetables_Click(object sender, EventArgs e)
        {
            Product prd = new Product();
            if (fUpImage2.HasFile)
            {

                string name = fUpImage2.FileName;

                string Ppath = Request.PhysicalApplicationPath + "images/frutisImages\\";
                string ext = fUpImage2.FileName.Substring(fUpImage2.FileName.IndexOf(".") + 1);
                if (ext.ToLower() == "jpg" || ext.ToLower() == "png" || ext.ToLower() == "jpeg" || ext.ToLower() == "gif")
                {
                    string path = Server.MapPath("~/images/frutisImages/" + fUpImage2.FileName);
                    fUpImage2.SaveAs(path);
                    prd.productName = txtName2.Text;
                    prd.price = txtPrice2.Text;
                    prd.CityID =Convert.ToInt32(DropDownList2.SelectedItem.Value);
                    prd.quantity = txtQuantity2.Text;
                    prd.image = name;
                    prd.category_ID = 2;
                    prd.DeleteProduct = true;
                    prd.NoOrder = 0;
                    db.Products.Add(prd);
                    db.SaveChanges();
                    BindGrid2();
                    txtPrice2.Text = txtName2.Text = txtQuantity2.Text = "";
                    lblfailv.Visible = false;
                    lblokv.Visible = true;
                }
                else
                {
                    lblfailv.Visible = true;
                    lblokv.Visible = false;
                   
                }
            }
        }

        protected void btnAddFruit1_Click(object sender, EventArgs e)
        {
            upnlFruit.Visible = true;
            upnlVegetable.Visible = false;

        }

        protected void bntAddVegetables1_Click(object sender, EventArgs e)
        {
            upnlVegetable.Visible = true;
            upnlFruit.Visible = false;

        }

        protected void gvFruits_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvFruits.PageIndex = e.NewPageIndex;
            BindGrid();
        }

        protected void gvVegetables_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvVegetables.PageIndex = e.NewPageIndex;
            BindGrid2();
        }

        protected void gvVegetables_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            GridViewRow row = gvVegetables.Rows[e.RowIndex];
            int id = Convert.ToInt32(gvVegetables.DataKeys[e.RowIndex].Values[0]);
            Product ite = (from obj in db.Products
                           where obj.product_ID == id
                           select obj).FirstOrDefault();
            
            ite.DeleteProduct = false;
            db.SaveChanges();
            BindGrid2();
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            int Id = Convert.ToInt32(ViewState["id"]);

            Product pro = (from obj in db.Products
                           where obj.product_ID == Id
                           select obj).FirstOrDefault();
            pro.productName = TextBox1name.Text;
            pro.price = TextBox2price.Text;
            pro.quantity = TextBox3quan.Text;
            
            //if (FileUpload1.HasFile)
            //{
            //    string Ppath = Request.PhysicalApplicationPath + "images/frutisImages\\";
            //    string ext = Path .GetExtension(FileUpload1.FileName);
            //    if (ext.ToLower() == ".jpg" || ext.ToLower() == ".png")
            //    {
            //        FileUpload1.SaveAs(Ppath + FileUpload1.FileName);
            //        pro.image = FileUpload1.FileName;
            //    }
            //}
            //else
            //{
                
            //    pro.image = Label1img.Text;
            //}
            pro.CityID =Convert.ToInt16( DropDownList3.SelectedItem.Value);
            db.SaveChanges();
           
            Panel2.Visible = false;
            BindGrid();
        }

        protected void gvFruits_SelectedIndexChanged(object sender, EventArgs e)
        {
            Panel2.Visible = true;
            Panel1.Visible = false;
            ViewState["id"] = gvFruits.SelectedDataKey["product_ID"];
            int Id = Convert.ToInt32(ViewState["id"]);
            Product pro = (from obj in db.Products
                           where obj.product_ID == Id
                           select obj).FirstOrDefault();
            TextBox1name.Text = pro.productName;
            TextBox2price.Text = pro.price;
            DropDownList3.SelectedValue = pro.CityID.ToString();
            TextBox3quan.Text = pro.quantity;
            //Label1img.Text = pro.image;
            //RequiredFieldValidator12.Visible = false;
        }

        protected void Linkadd_Click(object sender, EventArgs e)
        {
            Panel1.Visible = true;
            Panel2.Visible = false;
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Panel2.Visible = false;
        }

        protected void gvVegetables_SelectedIndexChanged(object sender, EventArgs e)
        {
            Panel3.Visible = true;
            Panel4.Visible = false;
            ViewState["id"] = gvVegetables.SelectedDataKey["product_ID"];
            int Id = Convert.ToInt32(ViewState["id"]);
            Product pro = (from obj in db.Products
                           where obj.product_ID == Id
                           select obj).FirstOrDefault();
            TextBox1v.Text = pro.productName;
            TextBox2v.Text = pro.price;
            DropDownList3.SelectedValue = pro.CityID.ToString();
            TextBox3v.Text = pro.quantity;
            //Label1v.Text = pro.image;
            //RequiredFieldValidator16.Visible = false;
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            int Id = Convert.ToInt32(ViewState["id"]);

            Product pro = (from obj in db.Products
                           where obj.product_ID == Id
                           select obj).FirstOrDefault();
            pro.productName = TextBox1v.Text;
            pro.price = TextBox2v.Text;
            pro.quantity = TextBox3v.Text;
            //if (FileUpload2.HasFile)
            //{
            //    string Ppath = Request.PhysicalApplicationPath + "images/frutisImages\\";
            //    string ext = Path.GetExtension(FileUpload2.FileName);
            //    if (ext.ToLower() == ".jpg" || ext.ToLower() == ".png")
            //    {
            //        FileUpload2.SaveAs(Ppath + FileUpload2.FileName);
            //        pro.image = FileUpload2.FileName;
            //    }
            //}
            //else
            //{

            //    pro.image = Label1v.Text;
            //}
            pro.CityID =Convert.ToInt32(DropDownList4.SelectedItem.Value);
            db.SaveChanges();

            Panel3.Visible = false;
            BindGrid2();
        }

        protected void Button4_Click(object sender, EventArgs e)
        {
            Panel3.Visible = false;
        }

        protected void LinkButton2_Click(object sender, EventArgs e)
        {
            Panel4.Visible = true;
            Panel3.Visible = false;
        }

    }
}