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

public partial class Admin_PurchaseDetails : System.Web.UI.Page
{
    SqlCommand cmd;
    SqlConnection con;
    SqlDataReader dr, dr1;
    int x,y;
    static string ItemNo, ModelId;
    //static int TotAmt;

    protected void Page_Load(object sender, EventArgs e)
    {
        con = new SqlConnection(WebConfigurationManager.ConnectionStrings["sales_invoiceConnectionString"].ConnectionString);
        con.Open();
    }

    public void messageBox(string msg)
    {
        Literal ltr = new Literal();
        ltr.Text = "<div style='width=1px;height=1px' onresize=\"this.style.display='none';alert('" + msg + "');\"/>" +
            "<script language='javascript'> alert('" + msg + "');</script>";

        this.Controls.Add(ltr);
    }

   
        //Purchase Order Master 
    protected void btnCreate_Click(object sender, EventArgs e)
    {
        auto_PurOrdNo();
        string PON = "P" + x.ToString().PadLeft(3, '0');

        cmd = new SqlCommand("INSERT INTO PurchaseMaster (PurOrdNo,PurOrdDate,SupplierCode) VALUES(@PurOrdNo,@PurOrdDate,@SupplierCode)", con);

        cmd.Parameters.AddWithValue("@PurOrdNo", PON);
        cmd.Parameters.AddWithValue("@PurOrdDate", txtPurOrdDate.Text);
        cmd.Parameters.AddWithValue("@SupplierCode", ddlSupplier.SelectedValue.ToString());

        con.Open();
        cmd.ExecuteNonQuery();
        messageBox("Purchase Order No generated successfully");
        con.Close();
       
        txtPurOrdNo.Text = PON;
        txtPurOrdDate.Text = "";
        ddlSupplier.SelectedIndex = 0;
        btnCreate.Enabled = false;
    }
    public void auto_PurOrdNo()
    {
        cmd = new SqlCommand("select max(Right(PurOrdNo,3))+1 from PurchaseMaster", con);
        //con.Open();
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
    protected void btnCancel_Click(object sender, EventArgs e)
    {
        btnCreate.Visible = true;
       
        
        txtPurOrdNo.Text = "";
        txtPurOrdDate.Text = "";
        ddlSupplier.SelectedIndex = 0;
        btnCreate.Enabled = true;

    }

    protected void btnSave_Click(object sender, EventArgs e)
    {
        if (txtPurOrdNo.Text == "")
        {
            messageBox("Please Generate Purchase Order No.");
        }
        else
        {
            cmd = new SqlCommand("select ItemNo,ModelId from ItemDetails where ItemNo='" + ddlItemName.SelectedValue.ToString() + "' and ModelId='" + ddlModel.SelectedValue.ToString() + "'", con);
            // con.Open();
            dr = cmd.ExecuteReader(CommandBehavior.CloseConnection);
            if (dr.Read())
            {
                ItemNo = dr[0].ToString();
                ModelId = dr[0].ToString();
            }
            else
            {
                ItemNo = "";
                ModelId = "";
            }
            con.Close();
            dr.Close();
            cmd.Dispose();

            if (ItemNo != "" && ModelId != "")
            {
                UpdateIntoItemDetails();
            }
            else
            {
                InsertIntoItemDetails();
            }

            //Insert into Purchase Order Details
            auto_SlNo_PurOrderDetails();
            cmd = new SqlCommand("INSERT INTO PurchaseDetails(SlNo,PurOrdNo,ItemNo,ModelId,Qty," +
                " Rate,Amount) VALUES(@SlNo,@PurOrdNo,@ItemNo,@ModelId,@Qty,@Rate,@Amount)", con);

            cmd.Parameters.AddWithValue("@SlNo", y);
            cmd.Parameters.AddWithValue("@PurOrdNo", txtPurOrdNo.Text);
            cmd.Parameters.AddWithValue("@ItemNo", ddlItemName.SelectedValue.ToString());
            cmd.Parameters.AddWithValue("@ModelId", ddlModel.SelectedValue.ToString());
            cmd.Parameters.AddWithValue("@Qty", txtQtyPurchase.Text);
            cmd.Parameters.AddWithValue("@Rate", Convert.ToDouble(txtRate.Text));
            cmd.Parameters.AddWithValue("@Amount", Convert.ToDouble(txtTotalAmount.Text));

            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();
            gvPurchaseOrderDetails.DataBind();
            messageBox("Record saved successfully");
            cmd.Dispose();
        }
    }

    private void InsertIntoItemDetails()
    {
         //insert into item details

        cmd = new SqlCommand("INSERT INTO ItemDetails (ItemNo,ModelId,ReorderQty," +
            " TotalQtyPurchase,TotalQtySale,CostRate,SaleRate,StockInHand)VALUES(@ItemNo,@ModelId,@ReorderQty," +
            " @TotalQtyPurchase,@TotalQtySale,@CostRate," +
            " @SaleRate,@StockInHand)", con);



        cmd.Parameters.AddWithValue("@ItemNo", ddlItemName.SelectedValue.ToString());
        cmd.Parameters.AddWithValue("@ModelId", ddlModel.SelectedValue.ToString());
        cmd.Parameters.AddWithValue("@ReorderQty", "0");
        cmd.Parameters.AddWithValue("@TotalQtyPurchase", txtQtyPurchase.Text);
        cmd.Parameters.AddWithValue("@TotalQtySale", "0");
        cmd.Parameters.AddWithValue("@CostRate", Convert.ToDouble(txtRate.Text));
        cmd.Parameters.AddWithValue("@SaleRate", Convert.ToDouble("0"));
        cmd.Parameters.AddWithValue("@StockInHand", txtQtyPurchase.Text);

        con.Open();
        cmd.ExecuteNonQuery();
        con.Close();
        cmd.Dispose();
    }

    private void UpdateIntoItemDetails()
    {
        //Fetching Total Quantity purchase from Item Details
        cmd = new SqlCommand("select TotalQtyPurchase,TotalQtySale,StockInHand from ItemDetails where ItemNo='" + ddlItemName.SelectedValue.ToString() + "' and ModelId='" + ddlModel.SelectedValue.ToString() + "'", con);
        con.Open();
        dr = cmd.ExecuteReader(CommandBehavior.CloseConnection);
        if (dr.Read())
        {
            lblTotalQtyPur.Text = dr[0].ToString();
            lblTotalQtySale.Text= dr[1].ToString();;
            lblStockInHand.Text= dr[2].ToString();
        }
        con.Close();
        dr.Close();

        cmd.Dispose();

        lblTotalQtyPur.Text = (Convert.ToDouble(lblTotalQtyPur.Text) + Convert.ToDouble(txtQtyPurchase.Text)).ToString();

        lblStockInHand.Text=(Convert.ToDouble(lblTotalQtyPur.Text) - Convert.ToDouble(lblTotalQtySale.Text)).ToString();


        //update item details
        cmd = new SqlCommand("UPDATE ItemDetails SET TotalQtyPurchase=@TotalQtyPurchase,StockInHand=@StockInHand" +
            " WHERE ItemNo=@ItemNo and ModelId=@ModelId", con);
        cmd.Parameters.AddWithValue("@TotalQtyPurchase", lblTotalQtyPur.Text);
        cmd.Parameters.AddWithValue("@StockInHand", lblStockInHand.Text);
        cmd.Parameters.AddWithValue("@ItemNo", ddlItemName.SelectedValue.ToString());
        cmd.Parameters.AddWithValue("@ModelId", ddlModel.SelectedValue.ToString());
        con.Open();
        cmd.ExecuteNonQuery();
        con.Close();
        cmd.Dispose();
    }

    

    public void auto_SlNo_PurOrderDetails()
    {
        cmd = new SqlCommand("select max(SlNo)+1 from PurchaseDetails", con);
        con.Open();
        dr1 = cmd.ExecuteReader();
        if (dr1.Read())
        {
            if (dr1[0] == DBNull.Value)
            {
                y = 1;
            }
            else
            {
                y = (int)dr1[0];
            }
        }

        con.Close();
        dr1.Close();
    }



    protected void btnDelete_Click(object sender, EventArgs e)
    {
        ////Fetching Total quantity purchase and StockIn Hand from Item Details
        //cmd = new SqlCommand("select TotalQtyPurchase,StockInHand from ItemDetails" +
        //    " where ItemNo=@ItemNo and ModelId=@ModelId", con);
        //cmd.Parameters.AddWithValue("@ItemNo", gvPurchaseOrderDetails.SelectedRow.Cells[2].Text);
        //cmd.Parameters.AddWithValue("@ModelId", gvPurchaseOrderDetails.SelectedRow.Cells[3].Text);

        ////con.Open();
        //dr = cmd.ExecuteReader();
        //if (dr.Read())
        //{
        //    lblTotalQtyPur.Text = dr[0].ToString();
        //    lblStockInHand.Text = dr[1].ToString();
        //}
        //con.Close();
        //dr.Close();

        //cmd.Dispose();

        //lblTotalQtyPur.Text = ((Convert.ToDouble(lblTotalQtyPur.Text)) - (Convert.ToDouble(txtQtyPurchase.Text))).ToString();

        //if (lblStockInHand.Text == "0")
        //{
        //    lblStockInHand.Text = "0";
        //}
        //else
        //{
        //    lblStockInHand.Text = ((Convert.ToDouble(lblStockInHand.Text)) - (Convert.ToDouble(txtQtyPurchase.Text))).ToString();
        //}


        ////Update Item Details


        //cmd = new SqlCommand("UPDATE ItemDetails SET  TotalQtyPurchase=@TotalQtyPurchase,CostRate=@CostRate," +
        //    " StockInHand=@StockInHand WHERE ItemNo=@ItemNo and ModelId=@ModelId", con);
        //cmd.Parameters.AddWithValue("@TotalQtyPurchase", lblTotalQtyPur.Text);

        //if (lblTotalQtyPur.Text == "0")
        //{
        //    cmd.Parameters.AddWithValue("@CostRate", "0");
        //}
        //else
        //{
        //    cmd.Parameters.AddWithValue("@CostRate", Convert.ToDouble(txtRate.Text));
        //}

        //cmd.Parameters.AddWithValue("@StockInHand", lblStockInHand.Text);
        //cmd.Parameters.AddWithValue("@ItemNo", gvPurchaseOrderDetails.SelectedRow.Cells[2].Text);
        //cmd.Parameters.AddWithValue("@ModelId", gvPurchaseOrderDetails.SelectedRow.Cells[3].Text);
        //con.Open();
        //cmd.ExecuteNonQuery();
        //con.Close();

        //cmd.Dispose();

        ////delete from Purchase Details
        //cmd = new SqlCommand("DELETE FROM PurchaseDetails WHERE slno='" + gvPurchaseOrderDetails.SelectedRow.Cells[0].Text + "'", con);

        //con.Open();
        //cmd.ExecuteNonQuery();
        //con.Close();

        //cmd.Dispose();

        ////Fetching Purchase Order no from Purchase Details
        //cmd = new SqlCommand("select PurOrdNo FROM PurchaseDetails WHERE PurOrdNo='" + gvPurchaseOrderDetails.SelectedRow.Cells[1].Text + "'", con);
        //con.Open();
        //dr = cmd.ExecuteReader();
        //if (dr.Read())
        //{
        //    lblPurOrderNo_PurchaseDetails.Text = dr[0].ToString();
        //}
        //con.Close();
        //dr.Close();

        //cmd.Dispose();

        ////Fetching Purchase Order no from Purchase Master
        //cmd = new SqlCommand("select PurOrdNo FROM PurchaseMaster WHERE PurOrdNo='" + gvPurchaseOrderDetails.SelectedRow.Cells[1].Text + "'", con);
        //con.Open();
        //dr = cmd.ExecuteReader();
        //if (dr.Read())
        //{
        //    lblPurOrderNo_PurchaseMaster.Text = dr[0].ToString();
        //}
        //con.Close();
        //dr.Close();

        //cmd.Dispose();

        ////Delete from Purchase Master
        //if (lblPurOrderNo_PurchaseDetails.Text == lblPurOrderNo_PurchaseMaster.Text)
        //{

        //}
        //else
        //{
        //    cmd = new SqlCommand("DELETE FROM PurchaseMaster WHERE PurOrdNo='" + lblPurOrderNo_PurchaseMaster.Text + "'", con);
        //    con.Open();
        //    cmd.ExecuteNonQuery();
        //    con.Close();
        //    
        //}

        //messageBox("Record deleted successfully");

        //cmd.Dispose();

        //btnSave.Visible = true;
        //btnUpdate1.Visible = false;
        //btnDelete.Visible = false;
        //gvPurchaseOrderDetails.SelectedIndex = -1;
        //gvPurchaseOrderDetails.DataBind();

        //lblTotalQtyPur.Text = "";
        //lblPurOrderNo_PurchaseMaster.Text = "";
        //lblPurOrderNo_PurchaseDetails.Text = "";
        //lblStockInHand.Text = "";
        //lblItemNo.Text = "";
        //lblModeld.Text = "";
        //txtQtyPurchase.Text = "";
        //txtRate.Text = "";
        //txtTotalAmount.Text = "";
    }
    protected void btnCancel1_Click(object sender, EventArgs e)
    {
        ddlItemName.SelectedIndex = 0;
        ddlModel.SelectedIndex = 0;
        txtQtyPurchase.Text = "";
        txtRate.Text = "";

        btnSave.Visible = true;
        
        gvPurchaseOrderDetails.SelectedIndex = -1;
    }
    protected void gvPurchaseOrderDetails_SelectedIndexChanged(object sender, EventArgs e)
    {
        ddlItemName.Text=gvPurchaseOrderDetails.SelectedRow.Cells[2].Text;
        ddlModel.Text=gvPurchaseOrderDetails.SelectedRow.Cells[3].Text;
        txtQtyPurchase.Text=gvPurchaseOrderDetails.SelectedRow.Cells[4].Text;
        txtRate.Text=gvPurchaseOrderDetails.SelectedRow.Cells[5].Text;
        txtTotalAmount.Text=gvPurchaseOrderDetails.SelectedRow.Cells[6].Text;
        btnSave.Visible = false;
       
    }
    protected void ddlSupplier_SelectedIndexChanged(object sender, EventArgs e)
    {
        lblSupplierCode.Text = ddlSupplier.SelectedValue.ToString();
    }
    protected void txtRate_TextChanged(object sender, EventArgs e)
    {
        if (txtQtyPurchase.Text != "")
        {
            txtTotalAmount.Text=(Convert.ToDouble(txtRate.Text)*Convert.ToDouble(txtQtyPurchase.Text)).ToString();
        }
        else
        {
            txtTotalAmount.Text = (Convert.ToDouble(txtRate.Text) * 0).ToString();
        }
    }
    protected void txtQtyPurchase_TextChanged(object sender, EventArgs e)
    {
        if (txtRate.Text != "")
        {
            txtTotalAmount.Text = (Convert.ToDouble(txtRate.Text) * Convert.ToDouble(txtQtyPurchase.Text)).ToString();
        }
        else
        {
            txtTotalAmount.Text = (Convert.ToDouble(txtQtyPurchase.Text) * 0).ToString();
        }
    }

    //Insert model name in Model Master through modal popup
    protected void btnAddModel1_Click(object sender, EventArgs e)
    {
        auto_ModelId_ModelMaster();
        string ModelId = "M" + m.ToString().PadLeft(3, '0');

        cmd = new SqlCommand("insert into ModelMaster (ModelId,ModelName) values(@ModelId,@ModelName)", con);
        cmd.Parameters.AddWithValue("@ModelId",ModelId);
        cmd.Parameters.AddWithValue("@ModelName",txtModelName.Text);
        con.Open();
        cmd.ExecuteNonQuery();
        con.Close();
        ddlModel.DataBind();
        txtModelName.Text="";
    }
    //close button for Model modal popup
    protected void btnClose_Click(object sender, EventArgs e)
    {
        ModalPopupExtender1.Hide();
        txtModelName.Text = "";
    }

    //Insert Item Name name in Item Master through modal popup
    protected void btnAddItem_Click(object sender, EventArgs e)
    {
        auto_ItemNO_ItemMaster();
        string INO = "I" + i.ToString().PadLeft(3, '0');
        cmd = new SqlCommand("insert into ItemMaster (ItemNo,ItemName) values(@ItemNo,@ItemName)",con);
        cmd.Parameters.AddWithValue("@ItemNo",INO);
        cmd.Parameters.AddWithValue("@ItemName",txtItemName1.Text);
        con.Open();
        cmd.ExecuteNonQuery();
        con.Close();
        ddlItemName.DataBind();
        txtItemName1.Text="";
    }
    //close button for Item modal popup
    protected void btnClose2_Click(object sender, EventArgs e)
    {
        ModalPopupExtender2.Hide();
        txtItemName1.Text = "";
    }

    //For showing Item Model popup
    protected void btnAddNewItem_Click(object sender, EventArgs e)
    {
        //ModalPopupExtender2.Show();
    }
    
    int m;
    //Autogenerate ModelId 
    public void auto_ModelId_ModelMaster()
    {
        cmd = new SqlCommand("select max(Right(ModelId,3))+1 from ModelMaster", con);
        //con.Open();
        dr = cmd.ExecuteReader();
        if (dr.Read())
        {
            if (dr[0] == DBNull.Value)
            {
                m = 1;
            }
            else
            {
                m = (int)dr[0];
            }
        }

        con.Close();
        dr.Close();
    }

    int i;
    //Autogenerate ItemNo 
    public void auto_ItemNO_ItemMaster()
    {
        cmd = new SqlCommand("select max(Right(ItemNo,3))+1 from ItemMaster", con);
        //con.Open();
        dr = cmd.ExecuteReader();
        if (dr.Read())
        {
            if (dr[0] == DBNull.Value)
            {
                i = 1;
            }
            else
            {
                i = (int)dr[0];
            }
        }

        con.Close();
        dr.Close();
    }

    protected void btnAddModel_Click(object sender, EventArgs e)
    {
        //ModalPopupExtender1.Show();
    }
   
}
