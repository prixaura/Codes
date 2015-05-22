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

public partial class Admin_ItemMaster : System.Web.UI.Page
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


    protected void btnSave_Click(object sender, EventArgs e)
    {
        auto();
        string Itemno = "I" + x.ToString().PadLeft(3, '0');

        cmd = new SqlCommand("INSERT INTO ItemMaster (ItemNo,ItemName) VALUES(@ItemNo,@ItemName)", con);

        cmd.Parameters.AddWithValue("@ItemNo", Itemno);
        cmd.Parameters.AddWithValue("@ItemName", txtItemName.Text);

        con.Open();
        cmd.ExecuteNonQuery();
        messageBox("Record saved successfully");
        con.Close();
        GridView1.DataBind();
        txtItemName.Text = "";
        SetFocus(txtItemName);
    }
    public void auto()
    {
        cmd = new SqlCommand("select max(Right(ItemNo,3))+1 from ItemMaster", con);
        con.Open();
        dr = cmd.ExecuteReader();
        if (dr.Read())
        {
            if (dr[0] == DBNull.Value)
            {
                x = 1;
            }
            else
            {
                x = (int)dr[0];
            }
        }

        con.Close();
        dr.Close();
    }

    protected void btnCancel_Click(object sender, EventArgs e)
    {
        txtItemName.Text = "";
        
    }
}
