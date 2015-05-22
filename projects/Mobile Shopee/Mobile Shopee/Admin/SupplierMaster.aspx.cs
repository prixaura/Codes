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

public partial class Admin_SupplierMaster : System.Web.UI.Page
{
    SqlCommand cmd;
    SqlConnection con;
    SqlDataReader dr;
    int x;
    GlobalMethod gm = new GlobalMethod();

    protected void Page_Load(object sender, EventArgs e)
    {
        con = new SqlConnection(WebConfigurationManager.ConnectionStrings["sales_invoiceConnectionString"].ConnectionString);        
    }

    public void messageBox(string msg)
    {
        Literal ltr = new Literal();
        ltr.Text="<div style='width=1px;height=1px' onresize=\"this.style.display='none';alert('" + msg + "');\"/>" +
            "<script language='javascript'> alert('" + msg + "');</script>";

        this.Controls.Add(ltr);
    }

    protected void btnSave_Click(object sender, EventArgs e)
    {
        if (gm.Checklen(txtMobNo.Text) == true)
        {
            auto();
            string SupCode = "SUP" + x.ToString().PadLeft(3, '0');

            cmd = new SqlCommand("INSERT INTO SupplierMaster(SupplierCode,SupplierName,Address,State,City," +
                   " MobNo,Fax,Email)VALUES(@SupplierCode,@SupplierName,@Address,@State,@City,@MobNo,@Fax,@Email)", con);

            cmd.Parameters.AddWithValue("@SupplierCode", SupCode);
            cmd.Parameters.AddWithValue("@SupplierName", txtSupplierName.Text);
            cmd.Parameters.AddWithValue("@Address", txtAddress.Text);
            cmd.Parameters.AddWithValue("@State", txtState.Text);
            cmd.Parameters.AddWithValue("@City", txtCity.Text);
            cmd.Parameters.AddWithValue("@MobNo", txtMobNo.Text);
            cmd.Parameters.AddWithValue("@Fax", txtFax.Text);
            cmd.Parameters.AddWithValue("@Email", txtEmail.Text);

            con.Open();
            cmd.ExecuteNonQuery();
            messageBox("Record saved successfully");
            con.Close();
            gvSupplierMaster.DataBind();
            txtSupplierName.Text = "";
            txtAddress.Text = "";
            txtState.Text = "";
            txtCity.Text = "";
            txtMobNo.Text = "";
            txtFax.Text = "";
            txtEmail.Text = "";
        }
        else
        {
            messageBox("Mobile number should be 10 or 12 digit");
        }
        
    }

    public void auto()
    {
        cmd = new SqlCommand("select max(Right(SupplierCode,3))+1 from SupplierMaster", con);
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

    protected void btnUpdate_Click(object sender, EventArgs e)
    {
        cmd = new SqlCommand("UPDATE SupplierMaster SET SupplierName=@SupplierName,"+
            " Address=@Address,City=@City ,State=@State,MobNo=@MobNo,Fax=@Fax ,"+
            " Email=@Email WHERE SupplierCode=@SupplierCode", con);

        cmd.Parameters.AddWithValue("@SupplierName",txtSupplierName.Text);
        cmd.Parameters.AddWithValue("@Address",txtAddress.Text);
        cmd.Parameters.AddWithValue("@City",txtCity.Text);
        cmd.Parameters.AddWithValue("@State",txtState.Text);
        cmd.Parameters.AddWithValue("@MobNo",txtMobNo.Text);
        cmd.Parameters.AddWithValue("@Fax",txtFax.Text);
        cmd.Parameters.AddWithValue("@Email",txtEmail.Text);
        cmd.Parameters.AddWithValue("@SupplierCode",gvSupplierMaster.SelectedDataKey.Value.ToString());

        con.Open();
        cmd.ExecuteNonQuery();
        con.Close();
        messageBox("Record updated successfully");
        gvSupplierMaster.DataBind();

        txtSupplierName.Text = "";
        txtAddress.Text = "";
        txtCity.Text = "";
        txtState.Text = "";
        txtMobNo.Text = "";
        txtFax.Text = "";
        txtEmail.Text = "";
        gvSupplierMaster.SelectedIndex = -1;

        btnDelete.Visible = false;
        btnUpdate.Visible = false;
        btnSave.Visible = true;
    }
    protected void btnCancel_Click(object sender, EventArgs e)
    {
        btnDelete.Visible = false;
        btnUpdate.Visible = false;
        btnSave.Visible = true;

        txtSupplierName.Text = "";
        txtAddress.Text = "";
        txtCity.Text = "";
        txtState.Text = "";
        txtMobNo.Text = "";
        txtFax.Text = "";
        txtEmail.Text = "";
        gvSupplierMaster.SelectedIndex = -1;
    }
    protected void gvSupplierMaster_SelectedIndexChanged(object sender, EventArgs e)
    {
        txtSupplierName.Text = gvSupplierMaster.SelectedRow.Cells[1].Text;
        txtAddress.Text = gvSupplierMaster.SelectedRow.Cells[2].Text;
        txtCity.Text = gvSupplierMaster.SelectedRow.Cells[3].Text;
        txtState.Text = gvSupplierMaster.SelectedRow.Cells[4].Text;

        cmd = new SqlCommand("select MobNo,Fax,Email from SupplierMaster where SupplierCode='" + gvSupplierMaster.SelectedDataKey.Value.ToString() + "'", con);
        con.Open();
        dr = cmd.ExecuteReader();
        if (dr.Read())
        {
            txtMobNo.Text = dr[0].ToString();
            txtFax.Text = dr[1].ToString();
            txtEmail.Text = dr[2].ToString();
        }
        con.Close();
        dr.Close();
        
        btnDelete.Visible = true;
        btnUpdate.Visible = true;
        btnSave.Visible = false;
    }
    protected void btnDelete_Click(object sender, EventArgs e)
    {
        cmd = new SqlCommand("DELETE FROM SupplierMaster where SupplierCode='"+ gvSupplierMaster.SelectedDataKey.Value.ToString() +"'",con);
        con.Open();
        cmd.ExecuteNonQuery();
        messageBox("Record deleted successfully");
        con.Close();
        gvSupplierMaster.DataBind();

        txtSupplierName.Text = "";
        txtAddress.Text = "";
        txtCity.Text = "";
        txtState.Text = "";
        txtMobNo.Text = "";
        txtFax.Text = "";
        txtEmail.Text = "";
        gvSupplierMaster.SelectedIndex = -1;
        btnDelete.Visible = false;
        btnUpdate.Visible = false;
        btnSave.Visible = true;
    }
}
