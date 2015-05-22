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

public partial class home : System.Web.UI.Page
{
    SqlCommand cmd;
    SqlConnection con;
    SqlDataReader dr;

    protected void Page_Load(object sender, EventArgs e)
    {
        con = new SqlConnection(WebConfigurationManager.ConnectionStrings["sales_invoiceConnectionString"].ConnectionString);        

        SetFocus(txtUsername);
    }
    protected void btnSignin_Click(object sender, EventArgs e)
    {
        cmd = new SqlCommand("select UserName,Password from AdminLogin where UserName='"+ txtUsername.Text +"' and Password='"+ txtPassword.Text +"'",con);
        con.Open();

        dr = cmd.ExecuteReader();
        if (dr.Read())
        {
            Response.Redirect("~/Admin/SupplierMaster.aspx");
        }
        else
        {
            //string msg = "Access Denied...";
            //Literal1.Text = "<script> alert('"+ msg +"')</script>";
            lblMsg.Visible = true;
            lblLogin.Visible = false;
            lblMsg.Text = "Access Denied, Try Again..";
        }
        con.Close();
        dr.Close();
    }
    protected void btnReset_Click(object sender, EventArgs e)
    {
        txtUsername.Text = "";
        txtPassword.Text = "";
        lblMsg.Visible = false;
        lblLogin.Visible = true;
    }
}
