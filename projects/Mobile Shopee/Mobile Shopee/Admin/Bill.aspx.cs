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

public partial class Admin_Bill : System.Web.UI.Page
{
    SqlConnection con;
    SqlCommand cmd;
    SqlDataReader dr;
    string sql, str;
    int x;
    static string bill=string.Empty;

    protected void Page_Load(object sender, EventArgs e)
    {
        str = WebConfigurationManager.ConnectionStrings["sales_invoiceConnectionString"].ConnectionString;
        con = new SqlConnection(str);
        if (!Page.IsPostBack)
        {
            fillDropdown();
        }
    }

    public void fillDropdown()
    {
        cmd = new SqlCommand("select ChallanNo from SaleMaster where challanNo not in(select ChallanNo from BillDetails)",con);
        SqlDataAdapter da= new SqlDataAdapter(cmd);
        DataSet ds = new DataSet();
        da.Fill(ds);
        
        ddlChallanNo.Items.Clear();
        ddlChallanNo.Items.Add("--select--");
        for (int i = 0; i <= ds.Tables[0].Rows.Count - 1; i++)
        {
            ddlChallanNo.Items.Add(ds.Tables[0].Rows[i].ItemArray[0].ToString());            
        }
    }
    protected void btnGenerate_Click(object sender, EventArgs e)
    {
        auto_BillNo();
        string yr=DateTime.Now.Year.ToString();
        string mt=DateTime.Now.Month.ToString();

        bill = "BL" + yr + mt + x.ToString().PadLeft(3, '0');

        sql = "insert into BillDetails (BillNo,BillDate,ChallanNo) values(@BillNo,@BillDate,@ChallanNo)";
        cmd = new SqlCommand(sql,con);
        cmd.Parameters.AddWithValue("@BillNo", bill);
        cmd.Parameters.AddWithValue("@BillDate",DateTime.Now.ToString("dd-MMM-yyyy"));
        cmd.Parameters.AddWithValue("@ChallanNo",ddlChallanNo.SelectedItem.ToString());

        con.Open();
        cmd.ExecuteNonQuery();
        lblBillNo.Text = "Your Bill No is " + " " + bill;

        fillDropdown();
    }

    public void auto_BillNo()
    {
        cmd = new SqlCommand("select max(Right(BillNo,3))+1 from BillDetails", con);
        con.Open();
        dr = cmd.ExecuteReader(CommandBehavior.CloseConnection);
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
    protected void btnPrint_Click(object sender, EventArgs e)
    {
        string url = "../Admin/Report/PrintBill.aspx?bn=" + bill;
        ClientScript.RegisterStartupScript(this.GetType(), "OpenWin", "<script>openNewWin('" + url + "')</script>");
    }
}
