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
using System.Drawing;

public partial class Admin_SaleDetails : System.Web.UI.Page
{
    SqlCommand cmd;
    SqlConnection con;
    SqlDataReader dr;
    SqlDataAdapter da;
    int x,y,z;
    static double TotalAmount;
    static int stock = 0;
    static int BillCount = 0;
   
    protected void Page_Load(object sender, EventArgs e)
    {
        con = new SqlConnection(WebConfigurationManager.ConnectionStrings["sales_invoiceConnectionString"].ConnectionString);
        if (txtChallanNo.Text != "")
        {
            btnShow.Enabled = true;
            btnSave.Enabled = true;
        }
    }

    public void messageBox(string msg)
    {
        Literal ltr = new Literal();
        ltr.Text = "<div style='width=1px;height=1px' onresize=\"this.style.display='none';alert('" + msg + "');\"/>" +
            "<script language='javascript'> alert('" + msg + "');</script>";

        this.Controls.Add(ltr);
    }

   
    //Total Amount calculation
    protected void txtQty_TextChanged(object sender, EventArgs e)
    {
        int qty=Convert.ToInt32(txtQty.Text);
        if (qty<=stock)
        {
            TotalAmount = Convert.ToDouble((Convert.ToDouble(txtRate.Text) * Convert.ToInt32(txtQty.Text)));
            txtTotAmount.Text = TotalAmount.ToString();
        }
        else
        {
            messageBox("Quantity out of stock");
            txtQty.Text = ""; 
            SetFocus(txtQty);
        }
    }

    protected void btnSave_Click(object sender, EventArgs e)
    {
        if (txtChallanNo.Text == "")
        {
            messageBox("Please generate Challan");
        }
        else
        {
            autoSlNo();
            cmd = new SqlCommand("INSERT INTO SaleDetails (SlNo,ChallanNo,ItemNo,ModelId," +
                " Qty,Rate,Amount)VALUES (@SlNo,@ChallanNo,@ItemNo,@ModelId,@Qty,@Rate," +
                " @Amount)", con);

            cmd.Parameters.AddWithValue("@SlNo", z);
            cmd.Parameters.AddWithValue("@ChallanNo", txtChallanNo.Text);
            cmd.Parameters.AddWithValue("@ItemNo", ddlItemName.SelectedValue.ToString());
            cmd.Parameters.AddWithValue("@ModelId", ddlModelName.SelectedValue.ToString());
            cmd.Parameters.AddWithValue("@Qty", txtQty.Text);
            cmd.Parameters.AddWithValue("@Rate", Convert.ToDouble(txtRate.Text));
            cmd.Parameters.AddWithValue("@Amount", Convert.ToDouble(txtTotAmount.Text));
            con.Open();
            cmd.ExecuteNonQuery();
            messageBox("Record saved successfully");

            con.Close();

            cmd.Dispose();


            lblTotalQtySale.Text = (Convert.ToDouble(lblTotalQtySale.Text) + Convert.ToDouble(txtQty.Text)).ToString();

            lblStockInHand.Text = (Convert.ToDouble(lblTotalQtyPurchase.Text) - Convert.ToDouble(lblTotalQtySale.Text)).ToString();

            cmd = new SqlCommand("update ItemDetails set TotalQtySale=@TotalQtySale,StockInHand=@StockInHand" +
                " where ItemNo='" + ddlItemName.SelectedValue.ToString() + "' and ModelId='" + ddlModelName.SelectedValue.ToString() + "'", con);
            cmd.Parameters.AddWithValue("@TotalQtySale", lblTotalQtySale.Text);
            cmd.Parameters.AddWithValue("@StockInHand", lblStockInHand.Text);
            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();

            gvSaleDetails.DataBind();
       

            txtQty.Text = "";
            txtRate.Text = "";
            txtTotAmount.Text = "";
            lblTotalQtyPurchase.Text = "";
            lblTotalQtySale.Text = "";
            lblStockInHand.Text = "";

            lblItemNo.Text = "";
            txtQty.ReadOnly = true;
        }
    }

    public void autoSlNo()
    {
        cmd = new SqlCommand("select max(Right(SlNo,3))+1 from SaleDetails", con);
        con.Open();
        dr = cmd.ExecuteReader();
        if (dr.Read())
        {
            if (dr[0] == DBNull.Value)
            {
                z = 1;
            }
            else
            {
                z = (int)dr[0];
            }
        }

        con.Close();
        dr.Close();
    }

    static int PrevCount = 0,CurrCount=0;

    //Update Item Details and Sale Details
   
    protected void btnCancel_Click(object sender, EventArgs e)
    {
        btnShow.Enabled = true;
        ddlItemName.Enabled = true;
        ddlModelName.Enabled = true;
        txtRate.Enabled = true;
        txtQty.Enabled = true;
        txtTotAmount.Enabled = true;
        btnSave.Enabled = true;

        lblCustNo.Text = "";
        txtCustomerName.Text = "";
        txtAddress.Text = "";
        txtState.Text = "";
        txtCity.Text = "";
        txtMobNo.Text = "";

        //txtCostRate.Text = "";
        txtRate.Text = "";

        btnSave.Visible = true;

        ddlModelName.SelectedIndex = 0;
        txtQty.Text ="";
        txtTotAmount.Text = "";
        ddlItemName.SelectedIndex = 0;
       
        gvSaleDetails.SelectedIndex = -1;
    }

    protected void gvSaleDetails_SelectedIndexChanged(object sender, EventArgs e)
    {
        //ddlItemName.Enabled = false;
        //ddlModelName.Enabled = false;
        //txtRate.Enabled = false;
        //txtQty.Enabled = true;
        //txtTotAmount.Enabled = false;
        
        
        //txtQty.Enabled = true;
        //btnShow.Enabled = false;
        //btnGenerate.Enabled = true;
        //txtChallanNo.Text = "";

        //cmd = new SqlCommand("select ItemNo,ModelId from SaleDetails where SlNo='" + gvSaleDetails.SelectedDataKey.Value.ToString() + "'", con);
        //con.Open();
        //dr = cmd.ExecuteReader();
        //if (dr.Read())
        //{
        //    lblItemNo.Text = dr[0].ToString();
        //    lblModelId.Text = dr[1].ToString();
        //}
        //con.Close();
        //dr.Close();

        //cmd.Dispose();

        //ddlItemName.Text = lblItemNo.Text;
        //ddlModelName.Text = lblModelId.Text;
        //txtQty.Text = gvSaleDetails.SelectedRow.Cells[4].Text;
        //lblPrevQty.Text = gvSaleDetails.SelectedRow.Cells[4].Text;

        //txtRate.Text = gvSaleDetails.SelectedRow.Cells[5].Text;
        //txtTotAmount.Text = gvSaleDetails.SelectedRow.Cells[6].Text;

        ////fetching previous TotalQtySale and TotalStockInHand from ItemDetails on lblItemNo and ModelId
        //cmd = new SqlCommand("select TotalQtySale,StockInHand from ItemDetails where ItemNo='" + lblItemNo.Text + "' and ModelId='" + lblModelId.Text + "'", con);
        //con.Open();
        //dr = cmd.ExecuteReader();
        //if (dr.Read())
        //{
        //    stock = (int)dr[1];
        //    lblPrevTotalQtySale.Text = dr[0].ToString();
        //    lblPrevStockInHand.Text = dr[1].ToString();
        //}
        //con.Close();
        //dr.Close();

        //cmd.Dispose();
    }
    
    //fetch ChallanNo from BillDetails
    public void fetchChNo()
    {
        SqlCommand cmd = new SqlCommand("select ChallanNo from BillDetails where ChallanNo='" + gvSaleDetails.SelectedRow.Cells[1].Text + "'", con);
        con.Open();
        SqlDataReader dr = cmd.ExecuteReader();
        if (dr.Read())
        {
            BillCount = 1;
        }
        else
        {
            BillCount = 0;
        }
        con.Close();
        dr.Close();
    }

    
    
        
    protected void btnShow_Click(object sender, EventArgs e)
    {
        int count = 0;
        string SIH = "0";
        string TQP = "0";
        string TQS = "0";
        string R = "0";

        cmd = new SqlCommand("select TotalQtyPurchase,TotalQtySale,CostRate,SaleRate," +
            " StockInHand from ItemDetails where ItemNo='" + ddlItemName.SelectedValue.ToString() + "' and ModelId='" + ddlModelName.SelectedValue.ToString() + "'", con);
        con.Open();
        try
        {
            dr = cmd.ExecuteReader();
            if (dr.Read())
            {
                count = 1;
                TQP = dr[0].ToString();
                TQS = dr[1].ToString();
                R = dr[3].ToString();
                SIH = dr[4].ToString();
            }
            else
            {
                count = 0;
            }
        }
        catch (Exception ex)
        {
            messageBox("Please Check inputs...");
        }
        finally
        {
            con.Close();
            dr.Close();
        }

        if (count == 1)
        {
            lblTotalQtyPurchase.Text = TQP;
            lblTotalQtySale.Text = TQS;
            txtRate.Text = R;
            lblStockInHand.Text = SIH;
            stock = Convert.ToInt32(lblStockInHand.Text);

            if (stock <= 0)
            {
                btnSave.Enabled = false;
                messageBox("This item is out of Stock, Please purchase...");
            }
            else
            {
                //txtCostRate.Text = dr[2].ToString();
                btnSave.Enabled = true;
            }
        }
        else
        {
            messageBox("Please select correct combination or manage Item Details...");
        }


        if (txtRate.Text == "")
        {
            txtQty.ReadOnly = true;
        }
        else
        {
            txtQty.ReadOnly = false;
        }              
    }

    protected void btnGenerate_Click(object sender, EventArgs e)
    {
        btnSave.Enabled = true;
        btnShow.Enabled = true;
        auto_CustNo();
        cmd = new SqlCommand("INSERT INTO CustomerMaster(CustNo,CustName,Address,State,City," +
            " MobNo)VALUES(@CustNo,@CustName,@Address,@State,@City,@MobNo)", con);

        cmd.Parameters.AddWithValue("@CustNo", y);
        cmd.Parameters.AddWithValue("@CustName", txtCustomerName.Text);
        cmd.Parameters.AddWithValue("@Address", txtAddress.Text);
        cmd.Parameters.AddWithValue("@State", txtState.Text);
        cmd.Parameters.AddWithValue("@City", txtCity.Text);
        cmd.Parameters.AddWithValue("@MobNo", txtMobNo.Text);

        con.Open();
        try
        {
            cmd.ExecuteNonQuery();
            con.Close();
            txtCustomerName.Text = "";
            txtAddress.Text = "";
            txtState.Text = "";
            txtCity.Text = "";
            txtMobNo.Text = "";
            cmd.Dispose();
        }

        catch (Exception ex)
        {
            messageBox("Please check input");
        }
         finally
        {
            con.Close();
        }
    
        
        auto_ChallanNo();
        string ch = "CH" + x.ToString().PadLeft(3, '0');

        cmd = new SqlCommand("INSERT INTO SaleMaster (ChallanNo,ChallanDate,CustNo) VALUES(@ChallanNo,@ChallanDate,@CustNo)", con);

        cmd.Parameters.AddWithValue("@ChallanNo", ch);
        cmd.Parameters.AddWithValue("@ChallanDate", txtChallanDate.Text);
        cmd.Parameters.AddWithValue("@CustNo", y);

        con.Open();
        try
        {
            cmd.ExecuteNonQuery();
            messageBox("Challan No. generated successfully");
            txtChallanNo.Text = ch;
            txtChallanDate.Text = "";
            btnGenerate.Enabled = false;
        }

        catch (Exception ex)
        {
            messageBox("Please check input");
        }

        finally
        {
            con.Close();
        }
    }


    public void auto_CustNo()
    {
        cmd = new SqlCommand("select max(CustNo)+1 from CustomerMaster", con);
        con.Open();
        dr = cmd.ExecuteReader();
        if (dr.Read())
        {
            if (dr[0] == DBNull.Value)
            {
                y = 1;
            }
            else
            {
                y = (int)dr[0];
            }
        }

        con.Close();
        dr.Close();
    }
    public void auto_ChallanNo()
    {
        cmd = new SqlCommand("select max(Right(ChallanNo,3))+1 from SaleMaster", con);
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
    
    protected void btnCancel1_Click(object sender, EventArgs e)
    {
        btnGenerate.Enabled = true;
        txtChallanNo.Text = "";
        
    }
}

