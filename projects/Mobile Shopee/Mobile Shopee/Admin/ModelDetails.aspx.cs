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

public partial class Admin_ModelDetails : System.Web.UI.Page
{
    SqlCommand cmd;
    SqlConnection con;
    SqlDataReader dr;
    int x;
    static int count = 0;

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

    public void delete_modelId(string b)
    {
        cmd = new SqlCommand("delete from ModelMaster where ModelId=@ModelId", con);
        con.Open();
        cmd.ExecuteNonQuery();
        con.Close();
       messageBox("Record deleted successfully");
        gvModelDetails.DataBind();
    }
    protected void btnSave_Click1(object sender, EventArgs e)
    {
        auto();
        string ModelId = "M" + x.ToString().PadLeft(3, '0');

        TextBox txtModelName1 = (TextBox)gvModelDetails.FooterRow.FindControl("txtModelName");

        cmd = new SqlCommand("insert into ModelMaster (ModelId,ModelName) values(@ModelId,@ModelName)", con);
        cmd.Parameters.AddWithValue("@ModelId", ModelId);
        cmd.Parameters.AddWithValue("@ModelName", txtModelName1.Text);
        con.Open();
        cmd.ExecuteNonQuery();
        messageBox("Record saved successfully");
        con.Close();
        gvModelDetails.DataBind();
        txtModelName1.Text = "";
        SetFocus(txtModelName1);
    }
    public void auto()
    {
        cmd = new SqlCommand("select max(Right(ModelId,3))+1 from ModelMaster", con);
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

    protected void btnDelete_Click(object sender, EventArgs e)
    {
        cmd = new SqlCommand("select ModelId from ItemDetails where ModelId='" + gvModelDetails.SelectedDataKey.Value.ToString() + "'", con);
        con.Open();
        dr = cmd.ExecuteReader(CommandBehavior.CloseConnection);
        cmd.Dispose();

        if (dr.Read())
        {
            //lblModelId.Text = dr[0].ToString();
            count = 1;
        }       
        con.Close();
        dr.Close();

        if (count==1)
        {
            messageBox("This Model Name is already used can't be deleted");
        }
        else
        {
            cmd = new SqlCommand("delete from ModelMaster where ModelId='" + gvModelDetails.SelectedDataKey.Value.ToString() + "'", con);
            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();
            messageBox("Record deleted successfully");
            gvModelDetails.DataBind();
            gvModelDetails.SelectedIndex = -1;
            btnDelete.Enabled = false;            
        }
    }
    protected void gvModelDetails_SelectedIndexChanged(object sender, EventArgs e)
    {
        btnDelete.Enabled = true;
    }
    protected void gvModelDetails_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        int c=0;
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            SqlCommand cmd1 = new SqlCommand("select count(*) from ModelMaster", con);
            con.Open();
            SqlDataReader dr = cmd1.ExecuteReader();
            if (dr.Read())
            {
                c = (int)dr[0];
            }
            con.Close();
            dr.Close();

            if (c == 1)
            {
                e.Row.Cells[3].Enabled = false;
            }
            else
            {
                e.Row.Cells[3].Enabled = true;
            }
        }
    }
}
