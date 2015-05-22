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

public partial class Admin_MobileDesc_Insert : System.Web.UI.Page
{
    SqlCommand cmd;
    SqlConnection con;
    SqlDataReader dr;
    static int count = 0;

    protected void Page_Load(object sender, EventArgs e)
    {
        con = new SqlConnection(WebConfigurationManager.ConnectionStrings["sales_invoiceConnectionString"].ConnectionString);        
        SetFocus(txtMobile);
    }
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        fetchMobileName();
       
            if (count == 1)
            {
                messageBox("This Mobile Name and Model already exist");
            }
            else
            {
                cmd = new SqlCommand("INSERT INTO MobileDesc(MobileName,Model,Price,BatteryBackup,InternalMemory,ExternalMemory,BlueTooth,InfraRed,Guarantee)" +
                    " VALUES (@MobileName,@Model,@Price,@BatteryBackup,@InternalMemory,@ExternalMemory,@BlueTooth,@InfraRed,@Guarantee)", con);

                cmd.Parameters.AddWithValue("@MobileName", txtMobile.Text);
                cmd.Parameters.AddWithValue("@Model", txtModel.Text);
                cmd.Parameters.AddWithValue("@Price", txtPrice.Text);
                cmd.Parameters.AddWithValue("@BatteryBackup", txtBattBackup.Text);
                cmd.Parameters.AddWithValue("@InternalMemory", txtIntMem.Text);
                cmd.Parameters.AddWithValue("@ExternalMemory", txtExtMem.Text);
                cmd.Parameters.AddWithValue("@BlueTooth", ddlBluetooth.SelectedItem.ToString());
                cmd.Parameters.AddWithValue("@InfraRed", ddlInfrared.SelectedItem.ToString());
                cmd.Parameters.AddWithValue("@Guarantee", txtGuarantee.Text);

                con.Open();
                cmd.ExecuteNonQuery();
                messageBox("Mobile Description submitted successfully");
                con.Close();
                GridView1.DataBind();
                clear();
            }
        
    }
    protected void btnReset_Click(object sender, EventArgs e)
    {
        clear();
    }
    public void messageBox(string msg)
    {
        Literal ltr = new Literal();
        ltr.Text = "<div style='width=1px;height=1px' onresize=\"this.style.display='none';alert('" + msg + "');\"/>" +
            "<script language='javascript'> alert('" + msg + "');</script>";

        this.Controls.Add(ltr);
    }

    public void clear()
    {
        txtMobile.Text = "";
        txtModel.Text = "";
        txtPrice.Text = "";
        txtBattBackup.Text = "";
        txtIntMem.Text = "";
        txtExtMem.Text = "";
        txtGuarantee.Text = "";
        ddlBluetooth.SelectedIndex = 0;
        ddlInfrared.SelectedIndex = 0;
        SetFocus(txtMobile);
    }
    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {
        btnUpdate.Enabled = true;
        btnSubmit.Enabled = false;
        fetchData();
        txtMobile.Text = GridView1.SelectedRow.Cells[1].Text;
        txtModel.Text = GridView1.SelectedRow.Cells[2].Text;
        txtPrice.Text = GridView1.SelectedRow.Cells[3].Text;
        txtBattBackup.Text = GridView1.SelectedRow.Cells[4].Text;               
        ddlBluetooth.Text= GridView1.SelectedRow.Cells[5].Text;
        ddlInfrared.Text = GridView1.SelectedRow.Cells[6].Text;
        txtGuarantee.Text = GridView1.SelectedRow.Cells[7].Text;
    }

    public void fetchData()
    {
        cmd = new SqlCommand("select InternalMemory,ExternalMemory from MobileDesc where MNo='"+ GridView1.SelectedDataKey.Value.ToString() +"'", con);
        con.Open();
        dr = cmd.ExecuteReader();
        if (dr.Read())
        {
            txtIntMem.Text = dr[0].ToString();
            txtExtMem.Text = dr[1].ToString();           
        }       
        con.Close();
        dr.Close();
    }

    public void fetchMobileName()
    {
        cmd = new SqlCommand("select MobileName,Model from MobileDesc where MobileName='" + txtMobile.Text + "' and Model='"+ txtModel.Text +"'", con);
        con.Open();
        dr = cmd.ExecuteReader();
        if (dr.Read())
        {            
            count = 1;
        }
        else
        {
            count = 0;
        }
        con.Close();
        dr.Close();
    }
    protected void btnUpdate_Click(object sender, EventArgs e)
    {
        cmd = new SqlCommand("UPDATE MobileDesc set MobileName=@MobileName,Model=@Model,Price=@Price,BatteryBackup=@BatteryBackup,InternalMemory=@InternalMemory,ExternalMemory=@ExternalMemory,BlueTooth=@BlueTooth,InfraRed=@InfraRed,Guarantee=@Guarantee where MNo='"+ GridView1.SelectedDataKey.Value.ToString() +"'", con);

        cmd.Parameters.AddWithValue("@MobileName", txtMobile.Text);
        cmd.Parameters.AddWithValue("@Model", txtModel.Text);
        cmd.Parameters.AddWithValue("@Price", txtPrice.Text);
        cmd.Parameters.AddWithValue("@BatteryBackup", txtBattBackup.Text);
        cmd.Parameters.AddWithValue("@InternalMemory", txtIntMem.Text);
        cmd.Parameters.AddWithValue("@ExternalMemory", txtExtMem.Text);
        cmd.Parameters.AddWithValue("@BlueTooth", ddlBluetooth.SelectedItem.ToString());
        cmd.Parameters.AddWithValue("@InfraRed", ddlInfrared.SelectedItem.ToString());
        cmd.Parameters.AddWithValue("@Guarantee", txtGuarantee.Text);

        con.Open();
        cmd.ExecuteNonQuery();
        messageBox("Mobile Description updated successfully");
        con.Close();

        btnSubmit.Enabled = true;
        btnUpdate.Enabled = false;
        clear();
        GridView1.SelectedIndex=-1;
        GridView1.DataBind();
    }
    protected void ddlBluetooth_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
    protected void ddlInfrared_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
    protected void txtGuarantee_TextChanged(object sender, EventArgs e)
    {

    }
}
