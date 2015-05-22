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

public partial class Admin_Reprt_PrintBill : System.Web.UI.Page
{
    SqlConnection con;
    SqlCommand cmd;
    SqlDataReader dr;
    string bno = string.Empty;
    string cno = string.Empty;
    DateTime dt;
    int totQty = 0;
    double totAmt = 0.0;

    protected void Page_Load(object sender, EventArgs e)
    {        
        con = new SqlConnection(WebConfigurationManager.ConnectionStrings["sales_invoiceConnectionString"].ConnectionString);

       // Label1.Text = Request.QueryString[0].ToString();
        bno = Request.QueryString[0].ToString();
        //bno = "BL20118001";

        ShowDetails();
    }
    public void ShowDetails()
    {
        cmd = new SqlCommand("select cm.CustName,cm.Address,cm.MobNo,bd.Billdate from CustomerMaster cm," +
            " SaleMaster sm,SaleDetails sd,BillDetails bd where cm.CustNo=sm.CustNo "+
            " and sd.ChallanNo=sm.ChallanNo and bd.ChallanNo=sm.ChallanNo and bd.BillNo='"+ bno +"'", con);
        con.Open();
        dr = cmd.ExecuteReader(CommandBehavior.CloseConnection);
        if (dr.Read())
        {
            lblName.Text=dr[0].ToString();
            lblAddress.Text=dr[1].ToString();
            lblMobNo.Text=dr[2].ToString();
            dt =Convert.ToDateTime(dr[3]);
        }
        con.Close();
        dr.Close();

        lblBillNo.Text = bno;
        lblDate.Text = dt.ToString("dd-MMM-yyyy");
        cmd.Dispose();

        SqlDataAdapter da = new SqlDataAdapter("select im.ItemName,mm.ModelName,sd.Rate,sd.Qty,sd.Amount from ItemMaster im,ModelMaster mm,SaleMaster sm,SaleDetails sd,BillDetails bd where sd.ItemNo=im.ItemNo and mm.ModelId=sd.ModelId and sd.ChallanNo=sm.ChallanNo and bd.ChallanNo=sm.ChallanNo and bd.BillNo='" + bno + "'", con);
        DataSet ds = new DataSet();
        da.Fill(ds);
        GridView1.DataSource = ds;
        GridView1.DataBind();        
    }

    public void TotalQty(string qty)
    {
        try
        {
            totQty += int.Parse(qty);
        }
        catch (Exception ex)
        {

        }
    }

    public void TotalAmt(string amt)
    {
        try
        {
            totAmt += double.Parse(amt);
        }
        catch (Exception ex)
        {

        }
    }
    protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            //Here we are passing the value of column in MyTotalUnit function to total
            TotalQty(e.Row.Cells[3].Text);
            TotalAmt(e.Row.Cells[4].Text);


        }
        
        if (e.Row.RowType == DataControlRowType.Footer)
        {
            e.Row.Cells[0].Text = "Total";

            //e.Row.Cells[3].Text = string.Format("{0:0}", TotalUnit);
            e.Row.Cells[3].Text = Convert.ToString(totQty);

            e.Row.Cells[4].Text = Convert.ToString(totAmt);

            e.Row.Cells[0].Font.Bold = true;
            e.Row.Cells[3].Font.Bold = true;
            e.Row.Cells[4].Font.Bold = true;

        }

    }
}
