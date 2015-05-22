<%@ Page Language="C#" MasterPageFile="~/Admin/AdminMasterPage.master" AutoEventWireup="true" CodeFile="SaleDetails.aspx.cs" Inherits="Admin_SaleDetails" Title="Untitled Page" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<%@ Register src="../MessageBox.ascx" tagname="MessageBox" tagprefix="uc1" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .style2
        {
            width: 77px;
        }
        .style3
        {
            width: 106px;
        }
        .style4
        {
            width: 79px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <br />
    <table align="center" width="800px">
        <tr>        
            <td width="200px" valign="top" rowspan="2">
                <table width="200px">
                    <tr>
                        <td>
                            <fieldset>
                                <legend>Generate Challan For Customer</legend>
                                    <table>
                                        <tr>
                                            <td>Challan No:</td>                                            
                                        </tr>
                                        <tr>
                                            <td>
                                                <asp:TextBox ID="txtChallanNo" runat="server" Width="179px" ReadOnly="true" 
                                                    Enabled="False"></asp:TextBox>
                                            </td>
                                        </tr>
                                        
                                        <tr>
                                            <td>Challan Date:</td>                                            
                                        </tr>
                                        <tr>
                                            <td>
                                                <asp:TextBox ID="txtChallanDate" runat="server" Width="179px" 
                                                    ValidationGroup="g"></asp:TextBox>
                                            </td>
                                        </tr>
                                    
                                        <tr>
                                            <td>Customer Name:</td>                                            
                                        </tr>
                                        <tr>
                                            <td>
                                                <asp:TextBox ID="txtCustomerName" runat="server" Width="179px" MaxLength="50"></asp:TextBox>
                                            </td>
                                        </tr>
                                        
                                        <tr>
                                            <td>Address:</td>                                            
                                        </tr>
                                        <tr>
                                            <td>
                                                <asp:TextBox ID="txtAddress" runat="server" TextMode="MultiLine" MaxLength="50"></asp:TextBox>
                                            </td>
                                        </tr>
                                        
                                         <tr>
                                            <td>State:</td>                                            
                                        </tr>
                                        <tr>
                                            <td>
                                                 <asp:TextBox ID="txtState" runat="server" Width="179px" MaxLength="50"></asp:TextBox>
                                            </td>
                                        </tr>
                                        
                                        <tr>
                                            <td>City:</td>                                            
                                        </tr>
                                        <tr>
                                            <td>
                                                
                                                 <asp:TextBox ID="txtCity" runat="server" Width="179px" MaxLength="50"></asp:TextBox>
                                                
                                            </td>
                                        </tr>
                                        
                                        <tr>
                                            <td>Mobile No:</td>                                            
                                        </tr>
                                        <tr>
                                            <td>
                                                 <asp:TextBox ID="txtMobNo" runat="server" Width="179px" ValidationGroup="g" 
                                                     MaxLength="10"></asp:TextBox>
                                            </td>
                                        </tr>
                                         <tr>
                                            <td>
                                                <asp:Button ID="btnGenerate" runat="server" Text="Generate" width="70px" 
                                                     ValidationGroup="g" onclick="btnGenerate_Click"/>
                                                <asp:Button ID="btnCancel1" runat="server" Text="Cancel" width="60px" 
                                                    onclick="btnCancel1_Click" CausesValidation="False" 
                                                    />
                                                <br />
                                                <cc1:CalendarExtender ID="CalendarExtender2" runat="server" 
                                                    Format="dd-MMM-yyyy" PopupButtonID="txtChallanDate" 
                                                    TargetControlID="txtChallanDate">
                                                </cc1:CalendarExtender>
                                                <br />
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                                                    ControlToValidate="txtChallanDate" Display="Dynamic" 
                                                    ErrorMessage="Date should not be blank" SetFocusOnError="True" 
                                                    ValidationGroup="g"></asp:RequiredFieldValidator>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                                                    ControlToValidate="txtMobNo" Display="Dynamic" 
                                                    ErrorMessage="Mobile no should not be blank" SetFocusOnError="True" 
                                                    ValidationGroup="g"></asp:RequiredFieldValidator>
                                                <br />
                                                <asp:ValidationSummary ID="ValidationSummary2" runat="server" 
                                                    DisplayMode="List" ShowMessageBox="True" ShowSummary="False" 
                                                    ValidationGroup="g" />
                                            </td>
                                        </tr>
                                    </table>
                                
                            </fieldset>
                        </td>
                    </tr>
                </table>    
            </td>
            
            
            <td  valign="top">
                <fieldset style="width:550px;">
                    <legend>Sale Details</legend>
                        <table align="center" width="550px">
                            
                           <%-- <tr>
                                <td>
                            
                                </td>
                                <td align="right">Cost Rate:</td>
                                <td>
                                    <asp:TextBox ID="txtCostRate" runat="server" Width="100px" ReadOnly="True" 
                                        ValidationGroup="s"></asp:TextBox>
                                </td>
                                
                                <td align="right">&nbsp;</td>
                                <td>
                                    &nbsp;</td>
                                
                                <td></td>
                            </tr>--%>
                            
                            <tr>
                                <td align="right" class="style4">Select Item</td>
                                
                                <td align="right">
                                    <asp:DropDownList ID="ddlItemName" runat="server" 
                                        DataSourceID="sds_ddlItemName" DataTextField="ItemName" DataValueField="ItemNo">
                                    </asp:DropDownList>
                                </td>
                                <td align="right" class="style2">
                                    Select Model</td>
                                
                                <td align="right" class="style2">
                                    <asp:DropDownList ID="ddlModelName" runat="server" 
                                        DataSourceID="sds_ddlModelName" DataTextField="ModelName" 
                                        DataValueField="ModelId">
                                    </asp:DropDownList>
                                                                </td>
                                <td align="left" class="style3">
                                    <asp:Button ID="btnShow" runat="server" onclick="btnShow_Click" Text="Show" 
                                        Enabled="False" CausesValidation="False" />
                                </td>
                                
                                <td style="width:40px;">&nbsp;</td>
                            </tr>
                            
                            <tr>
                                <td align="right" colspan="6">
                                    &nbsp;</td>
                                
                            </tr>
                            
                            <tr>
                                <td align="right" class="style4">Rate:</td>
                                
                                <td align="right">
                                    <asp:TextBox ID="txtRate" runat="server" Width="100px" ReadOnly="True" 
                                        MaxLength="10"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" 
                                        ControlToValidate="txtRate" Display="Dynamic" ErrorMessage="Required" 
                                        SetFocusOnError="True"></asp:RequiredFieldValidator>
                                </td>
                                <td align="right" class="style2">
                                    Quantity:</td>
                                
                                <td align="left" class="style2">
                                    <asp:TextBox ID="txtQty" runat="server" Width="54px" 
                                        ontextchanged="txtQty_TextChanged" AutoPostBack="True" ValidationGroup="s" 
                                        MaxLength="3"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" 
                                        ControlToValidate="txtQty" Display="Dynamic" ErrorMessage="Required" 
                                        SetFocusOnError="True"></asp:RequiredFieldValidator>
                                </td>
                                <td align="right" class="style3">
                                    Total Amount:</td>
                                
                                <td>
                                    <asp:TextBox ID="txtTotAmount" runat="server" Width="100px" ReadOnly="True" 
                                        MaxLength="10"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" 
                                        ControlToValidate="txtTotAmount" Display="Dynamic" ErrorMessage="Required" 
                                        SetFocusOnError="True"></asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            
                            <tr>
                                <td align="center" colspan="6" style="border-top:double 2px maroon;">
                                    <asp:Button ID="btnSave" runat="server" Text="Save" Width="70px" 
                                        onclick="btnSave_Click" ValidationGroup="s" Enabled="False" />
                                    <asp:Button ID="btnCancel" runat="server" Text="Reset" Width="70px" 
                                        onclick="btnCancel_Click" CausesValidation="False" />
                                </td>
                                
                            </tr>
                            
                            <tr>
                                <td align="center" colspan="6" style="border-top:double 2px maroon;">
                <asp:GridView ID="gvSaleDetails" runat="server" AutoGenerateColumns="False" 
                    CellPadding="2" 
                    ForeColor="#333333" GridLines="None" ShowFooter="True" Width="550px" 
                    AllowPaging="True" onselectedindexchanged="gvSaleDetails_SelectedIndexChanged" 
                    PageSize="5" DataKeyNames="SlNo" DataSourceID="sds_gvSaleDetails">
                    <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                    <RowStyle BackColor="#E3EAEB" />
                    <Columns>
                        <asp:BoundField DataField="SlNo" HeaderText="SlNo" ReadOnly="True" 
                            SortExpression="SlNo" />
                        <asp:BoundField DataField="ChallanNo" HeaderText="ChallanNo" 
                            SortExpression="ChallanNo" />
                        <asp:BoundField DataField="ItemName" HeaderText="ItemName" 
                            SortExpression="ItemName" />
                        <asp:BoundField DataField="Modelname" HeaderText="Modelname" 
                            SortExpression="Modelname" />
                        <asp:BoundField DataField="Qty" HeaderText="Qty" SortExpression="Qty" />
                        <asp:BoundField DataField="rate" HeaderText="rate" SortExpression="rate" />
                        <asp:BoundField DataField="Amount" HeaderText="Amount" 
                            SortExpression="Amount" />
                    </Columns>
                    <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
                    <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
                    <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                    <EditRowStyle BackColor="#7C6F57" />
                    <AlternatingRowStyle BackColor="White" />
                </asp:GridView>
                                </td>
                                
                            </tr>
                        </table>
                </fieldset>
            </td> 
        </tr>
        
        <tr>
            <td  valign="top">
                                    <asp:SqlDataSource ID="sds_gvSaleDetails" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:sales_invoiceConnectionString %>" 
                    DeleteCommand="DELETE FROM [SaleDetails] WHERE [SlNo] = @SlNo" 
                    InsertCommand="INSERT INTO [SaleDetails] ([SlNo], [ChallanNo], [ItemNo], [ModelId], [Qty], [Rate], [Amount]) VALUES (@SlNo, @ChallanNo, @ItemNo, @ModelId, @Qty, @Rate, @Amount)" 
                    SelectCommand="select sd.SlNo,sd.ChallanNo,im.ItemName,mm.Modelname,sd.Qty,sd.rate,sd.Amount 
from SaleDetails sd,ItemMaster im,ModelMaster mm
where sd.ItemNo=im.ItemNo and sd.ModelId=mm.ModelId
" 
                    
                    UpdateCommand="UPDATE [SaleDetails] SET [ChallanNo] = @ChallanNo, [ItemNo] = @ItemNo, [ModelId] = @ModelId, [Qty] = @Qty, [Rate] = @Rate, [Amount] = @Amount WHERE [SlNo] = @SlNo">
                                        <DeleteParameters>
                                            <asp:Parameter Name="SlNo" Type="Int32" />
                                        </DeleteParameters>
                                        <UpdateParameters>
                                            <asp:Parameter Name="ChallanNo" Type="String" />
                                            <asp:Parameter Name="ItemNo" Type="String" />
                                            <asp:Parameter Name="ModelId" Type="String" />
                                            <asp:Parameter Name="Qty" Type="Int32" />
                                            <asp:Parameter Name="Rate" Type="Decimal" />
                                            <asp:Parameter Name="Amount" Type="Decimal" />
                                            <asp:Parameter Name="SlNo" Type="Int32" />
                                        </UpdateParameters>
                                        <InsertParameters>
                                            <asp:Parameter Name="SlNo" Type="Int32" />
                                            <asp:Parameter Name="ChallanNo" Type="String" />
                                            <asp:Parameter Name="ItemNo" Type="String" />
                                            <asp:Parameter Name="ModelId" Type="String" />
                                            <asp:Parameter Name="Qty" Type="Int32" />
                                            <asp:Parameter Name="Rate" Type="Decimal" />
                                            <asp:Parameter Name="Amount" Type="Decimal" />
                                        </InsertParameters>
                </asp:SqlDataSource>
                                    <%--<asp:SqlDataSource ID="sds_gvItemDetails" runat="server" 
                                        ConnectionString="<%$ ConnectionStrings:sales_invoiceConnectionString %>" 
                                        SelectCommand="SELECT im.ItemName, mm.ModelName, id.CostRate, id.SaleRate, id.StockInHand, id.ReorderQty FROM ItemMaster AS im INNER JOIN ItemDetails AS id ON im.ItemNo = id.ItemNo INNER JOIN ModelMaster AS mm ON id.ModelId = mm.ModelId WHERE (id.StockInHand &lt;&gt; '0')">
                                    </asp:SqlDataSource>--%>
                                    <asp:SqlDataSource ID="sds_ddlModelName" runat="server" 
                                        ConnectionString="<%$ ConnectionStrings:sales_invoiceConnectionString %>" 
                                        SelectCommand="select distinct mm.ModelName,id.ModelId from ModelMaster mm, ItemDetails id where id.ModelId=mm.ModelId">
                                    </asp:SqlDataSource>
                                    <asp:SqlDataSource ID="sds_ddlItemName" runat="server" 
                                        ConnectionString="<%$ ConnectionStrings:sales_invoiceConnectionString %>" 
                                        SelectCommand="select distinct im.ItemName,id.ItemNo from ItemMaster im, ItemDetails id where id.ItemNo=im.ItemNo">
                                    </asp:SqlDataSource>
            </td> 
        </tr>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
            ControlToValidate="txtQty" Display="None" 
            ErrorMessage="Quantity should not be blank" ValidationGroup="s"></asp:RequiredFieldValidator>
        <asp:ValidationSummary ID="ValidationSummary1" runat="server" 
            ShowMessageBox="True" ShowSummary="False" ValidationGroup="s" />
                        
    </table>
    
    
    <uc1:MessageBox ID="MessageBox1" runat="server" />

    <asp:Label ID="lblTotalQtyPurchase" runat="server" Text="" Visible="false"></asp:Label>
    <asp:Label ID="lblTotalQtySale" runat="server" Text="" Visible="false"></asp:Label>
    <asp:Label ID="lblStockInHand" runat="server" Text="" Visible="false"></asp:Label>                
                
                
    <asp:Label ID="lblItemNo" runat="server" Text="" Visible="false"></asp:Label>
    
    <asp:Label ID="lblCustNo" runat="server" Text="" Visible="false"></asp:Label>
    <asp:Label ID="lblModelId" runat="server" Text="" Visible="false"></asp:Label>
    <asp:Label ID="lblChallanNo_SaleDetails" runat="server" Text="" Visible="false"></asp:Label>
    <asp:Label ID="lblChallanNo_SaleMaster" runat="server" Text="" Visible="false"></asp:Label>
    
    <asp:Label ID="lblPrevTotalQtySale" runat="server" Text="" Visible="false"></asp:Label>
    <asp:Label ID="lblPrevStockInHand" runat="server" Text="" Visible="false"></asp:Label>
    <asp:Label ID="lblPrevQty" runat="server" Text="" Visible="false"></asp:Label>
    
    <asp:Label ID="lblCurrTotalQtySale" runat="server" Text="" Visible="false"></asp:Label>
    <asp:Label ID="lblCurrStockInHand" runat="server" Text="" Visible="false"></asp:Label>
    
    
    
    
    
    
</asp:Content>

