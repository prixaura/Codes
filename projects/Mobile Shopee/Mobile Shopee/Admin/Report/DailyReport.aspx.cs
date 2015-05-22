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

public partial class Admin_Reprt_DailyReport : System.Web.UI.Page
{
    SqlDataReader dr;
    SqlConnection con;
    static int count = 0;

    protected void Page_Load(object sender, EventArgs e)
    {
        con = new SqlConnection(WebConfigurationManager.ConnectionStrings["sales_invoiceConnectionString"].ConnectionString);

    }
    protected void btnShow_Click(object sender, EventArgs e)
    {
        string ch = "";
        string dt = txtDate.Text.Trim();
        string sql = "select ChallanNo from SaleMaster where ChallanDate='" + dt + "'";
        SqlCommand cmd = new SqlCommand(sql, con);

        con.Open();
        try
        {
            dr = cmd.ExecuteReader();
            if (dr.Read())
            {
                ch = dr[0].ToString();
                count = 1;
            }
            else
            {
                count = 0;
            }
        }
        catch (Exception ex)
        {
            lblMsg.Text = "Please check Date";
        }
        con.Close();
        dr.Close();
        
        if (count == 1)
        {
            string sql1 = "select * from SaleDetails where ChallanNo='" + ch + "'";
            SqlDataAdapter da = new SqlDataAdapter(sql1, con);
            DataSet ds = new DataSet();
            da.Fill(ds);
            gvSale.DataSource = ds;
            gvSale.DataBind();
            lblMsg.Visible = false;
        }
        else
        {
            lblMsg.Visible = true;
        }

    }
}
