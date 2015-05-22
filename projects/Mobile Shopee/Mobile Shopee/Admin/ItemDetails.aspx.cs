using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;
using System.Data.SqlClient;
using System.Web.Configuration;

public partial class Admin_ItemDetails : System.Web.UI.Page
{
    SqlCommand cmd;
    SqlConnection con;
    SqlDataReader dr;
    int x;

    protected void Page_Load(object sender, EventArgs e)
    {
        con = new SqlConnection(WebConfigurationManager.ConnectionStrings["sales_invoiceConnectionString"].ConnectionString);        

    }

    public void messageBox(string msg)
    {
        Literal ltr = new Literal();
        ltr.Text = "<div style='width=1px;height=1px' onresize=\"this.style.display='none';alert('" + msg + "');\"/>" +
            "<script language='javascript'> alert('" + msg + "');</script>";

        this.Controls.Add(ltr);
    }
   
    protected void btnUpdate_Click(object sender, EventArgs e)
    {
        if (gvItemDetails.SelectedIndex == -1)
        {
            messageBox("select record to update");
        }
        else
        {
            cmd = new SqlCommand("update ItemDetails set ReorderQty=@ReorderQty,CostRate=@CostRate,SaleRate=@SaleRate" +
               " where ItemNo='" + gvItemDetails.SelectedRow.Cells[0].Text + "' and ModelId='" + gvItemDetails.SelectedRow.Cells[1].Text + "'", con);

            cmd.Parameters.AddWithValue("@ReorderQty", txtReordQty.Text);
            cmd.Parameters.AddWithValue("@CostRate", txtCostRate.Text);
            cmd.Parameters.AddWithValue("@SaleRate", txtSaleRate.Text);

            con.Open();
            cmd.ExecuteNonQuery();
            messageBox("Record updated successfully");
            con.Close();
            gvItemDetails.DataBind();

            txtItemName.ReadOnly = false;

            //lblModelName.Visible = false;
            //txtModelName1.Visible = false;
            //lblCostRate.Visible = false;
            //txtCostRate.Visible = false;
            //lblReorderQty.Visible = false;
            //txtReordQty.Visible = false;
            //lblSaleRate.Visible = false;
            //txtSaleRate.Visible = false;
            //btnUpdate.Visible = false;
            gvItemDetails.SelectedIndex = -1;

            txtItemName.Text = "";
            txtModelName1.Text = "";
            txtReordQty.Text = "";
            txtCostRate.Text = "";
            txtSaleRate.Text = "";
            btnUpdate.Enabled = false;
        }
    }
    protected void btnCancel_Click(object sender, EventArgs e)
    {     
        gvItemDetails.SelectedIndex = -1;

        txtItemName.Text = "";
        txtModelName1.Text = "";
        txtReordQty.Text = "";
        txtCostRate.Text = "";
        txtSaleRate.Text = "";
    }
    protected void gvItemDetails_SelectedIndexChanged(object sender, EventArgs e)
    {
        lblModelName.Visible = true;
        txtModelName1.ReadOnly = true;
        txtModelName1.Visible = true;

        lblCostRate.Visible = true;
        txtCostRate.Visible = true;

        lblReorderQty.Visible = true;
        txtReordQty.Visible = true;

        lblSaleRate.Visible = true;
        txtSaleRate.Visible = true;


        btnUpdate.Enabled = true;
        


        cmd = new SqlCommand("SELECT id.ItemNo,im.ItemName,id.ModelId,mm.ModelName FROM ItemDetails id,ItemMaster im,ModelMaster mm where id.ItemNo=im.ItemNo and"+
            " id.ModelId=mm.ModelId and id.ItemNo='" + gvItemDetails.SelectedRow.Cells[0].Text + "' and id.ModelId='" + gvItemDetails.SelectedRow.Cells[1].Text + "' ", con);
        con.Open();
        dr = cmd.ExecuteReader();
        if (dr.Read())
        {
            txtItemName.Text = dr[1].ToString();
            txtModelName1.Text = dr[3].ToString();
        }
        con.Close();
        dr.Close();


        //txtItemName.Text=gvItemDetails.SelectedRow.Cells[1].Text;
        //txtModelName1.Text=gvItemDetails.SelectedRow.Cells[2].Text;;
        txtReordQty.Text=gvItemDetails.SelectedRow.Cells[2].Text;;
        txtCostRate.Text=gvItemDetails.SelectedRow.Cells[5].Text;;
        txtSaleRate.Text = gvItemDetails.SelectedRow.Cells[6].Text; ;

    }

    protected void txtItemName_TextChanged(object sender, EventArgs e)
    {

    }
    protected void txtCostRate_TextChanged(object sender, EventArgs e)
    {

    }
    protected void txtModelName1_TextChanged(object sender, EventArgs e)
    {

    }
}
