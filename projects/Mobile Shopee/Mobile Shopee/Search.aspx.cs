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

public partial class Search : System.Web.UI.Page
{
    SqlConnection con;
    SqlCommand cmd;
    SqlDataReader dr;

    protected void Page_Load(object sender, EventArgs e)
    {
        con = new SqlConnection(WebConfigurationManager.ConnectionStrings["sales_invoiceConnectionString"].ConnectionString);        
    }
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        cmd = new SqlCommand("select MobileName,Model,Price,BatteryBackup,InternalMemory,ExternalMemory,BlueTooth,InfraRed,Guarantee from MobileDesc where MobileName='" + ddlMobile.SelectedItem.ToString() + "' and Model='" + ddlModel.SelectedItem.ToString() + "'", con);
        con.Open();
        dr = cmd.ExecuteReader();
        if (dr.Read())
        {
            lblMobile.Text = dr[0].ToString();
            lblModel.Text = dr[1].ToString();
            lblPrice.Text = dr[2].ToString();
            lblBatteryBackup.Text = dr[3].ToString();
            lblIntMem.Text = dr[4].ToString();
            lblExtMem.Text = dr[5].ToString();
            lblBluetooth.Text = dr[6].ToString();
            lblInfraRed.Text = dr[7].ToString();
            lblGuarantee.Text = dr[8].ToString();
        }

        con.Close();
        dr.Close();

        Panel1.Visible = true;
    }
}
