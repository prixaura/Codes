<%@ Page Language="C#" MasterPageFile="~/Admin/AdminMasterPage.master" AutoEventWireup="true" CodeFile="PurchaseDetails.aspx.cs" Inherits="Admin_PurchaseDetails" Title="Untitled Page" %>

<%@ Register src="../MessageBox.ascx" tagname="MessageBox" tagprefix="uc1" %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .style1
        {
            width: 84px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table width="900px" align="center">
  <tr>            
    <td>    
        <table width="300px" align="center">
            <tr>
                <td style="width:300px;" valign="top">
                    <fieldset>
                        <legend>Generate Purchase Order Number</legend>
                        
                            <table width="300px">
                                <tr>
                                    <td>Purchase Order No:</td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:TextBox ID="txtPurOrdNo" runat="server" ReadOnly="true"></asp:TextBox>
                                    </td>
                                </tr>
                                
                                <tr>
                                    <td>Purchase Order Date:</td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:TextBox ID="txtPurOrdDate" runat="server" ValidationGroup="d"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                                            ControlToValidate="txtPurOrdDate" Display="None" 
                                            ErrorMessage="Date should be required" SetFocusOnError="True" 
                                            ValidationGroup="d"></asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                                
                                <tr>
                                    <td>Supplier:</td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:DropDownList ID="ddlSupplier" runat="server" DataSourceID="sds_Supplier" 
                                            DataTextField="SupplierName" DataValueField="SupplierCode" 
                                            Width="145px" AutoPostBack="True" 
                                            onselectedindexchanged="ddlSupplier_SelectedIndexChanged">
                                        </asp:DropDownList>
                                        <asp:SqlDataSource ID="sds_Supplier" runat="server" 
                                            ConnectionString="<%$ ConnectionStrings:sales_invoiceConnectionString %>" 
                                            
                                            SelectCommand="SELECT [SupplierCode], [SupplierName] FROM [SupplierMaster]">
                                        </asp:SqlDataSource>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:Button ID="btnCreate" runat="server" Text="Create" width="60px" 
                                            onclick="btnCreate_Click" ValidationGroup="d"/>
                                        <asp:Button ID="btnCancel" runat="server" Text="Cancel" width="60px" 
                                            onclick="btnCancel_Click"/>
                                    </td>
                                </tr>
                                
                                <tr>
                                    <td>
                                        <cc1:CalendarExtender ID="CalendarExtender1" runat="server" 
                                            Format="dd-MMM-yyyy" PopupButtonID="txtPurOrdDate" 
                                            TargetControlID="txtPurOrdDate">
                                        </cc1:CalendarExtender>
                                        <asp:ValidationSummary ID="ValidationSummary1" runat="server" 
                                            ShowMessageBox="True" ShowSummary="False" ValidationGroup="d" />
                                        <asp:Label ID="lblSupplierCode" runat="server"></asp:Label>
                                       
                                    </td>
                                </tr>
                            </table>
                            
                    </fieldset>
                </td>
                
                
               <td style="width:700px;" valign="top">
                    <fieldset>
                        <legend>Generate Purchase Order Number</legend>
                        
                            <table width="700px">
                                <tr>
                                    <td width="10%">Item Name:</td>
                                    <td width="15%">
                                        <asp:DropDownList ID="ddlItemName" runat="server" 
                                            DataSourceID="sds_ddlItemName" DataTextField="ItemName" 
                                            DataValueField="ItemNo" Width="160px">
                                        </asp:DropDownList>
                                        <asp:SqlDataSource ID="sds_ddlItemName" runat="server" 
                                            ConnectionString="<%$ ConnectionStrings:sales_invoiceConnectionString %>" 
                                            SelectCommand="SELECT * FROM [ItemMaster]"></asp:SqlDataSource>
                                    </td>
                                    <td>
                                        <asp:Button ID="btnAddNewItem" runat="server" Text="Add New Item" 
                                            Width="95px" onclick="btnAddNewItem_Click" />
                                    </td>
                                    
                                    <td align="right">Model:</td>
                                    <td>
                                        <asp:DropDownList ID="ddlModel" runat="server" DataSourceID="sds_ddlModel" 
                                            DataTextField="ModelName" DataValueField="ModelId">
                                        </asp:DropDownList>
                                        <asp:Button ID="btnAddModel" runat="server" Text="Add New Model" Width="95px" 
                                            onclick="btnAddModel_Click" />
                                    </td>                             
                                </tr>
                                
                                <tr>
                                    <td colspan="5">
                                        <table>
                                            <tr>
                                                <td>Quantity:</td>
                                                    <td>
                                                        <asp:TextBox ID="txtQtyPurchase" runat="server" Width="40px" 
                                                            ontextchanged="txtQtyPurchase_TextChanged" AutoPostBack="True"></asp:TextBox>
                                                    </td> 
                                                    <td>Rate:</td>
                                                    <td>
                                                        <asp:TextBox ID="txtRate" runat="server" Width="80px" 
                                                            ontextchanged="txtRate_TextChanged" AutoPostBack="True"></asp:TextBox>
                                                    </td> 
                                                    <td>Total Amount:</td>
                                                    <td>
                                                        <asp:TextBox ID="txtTotalAmount" runat="server" Width="80px" ReadOnly="True"></asp:TextBox>
                                                    </td> 
                                            </tr>
                                            
                                            <tr>
                                                <td colspan="6" style="border-top:solid 1px maroon;">
                                                    <asp:Button ID="btnSave" runat="server" Text="Save" onclick="btnSave_Click" />
                                                    <asp:Button ID="btnDelete" runat="server" Text="Delete" Visible="False" 
                                                        onclick="btnDelete_Click" />
                                                    <asp:Button ID="btnCancel1" runat="server" Text="Cancel" 
                                                        onclick="btnCancel1_Click" />
                                                </td>
                                            </tr>
                                        </table>                                    
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="5">


        <asp:GridView ID="gvPurchaseOrderDetails" 
                runat="server" PageSize="5" ShowFooter="True" 
                                                    AutoGenerateColumns="False" 
                BackColor="White" BorderColor="#CC9966" 
                                                    BorderStyle="None" BorderWidth="1px" 
                CellPadding="2" 
                                                    
                DataSourceID="sds_gvPurchaseOrderDetails" Width="590px" 
                onselectedindexchanged="gvPurchaseOrderDetails_SelectedIndexChanged">
                <FooterStyle BackColor="#FFFFCC" ForeColor="#330099" />
            <RowStyle BackColor="White" ForeColor="#330099" />
                <Columns>
                    <asp:BoundField DataField="SlNo" HeaderText="SlNo" ReadOnly="True" 
                        SortExpression="SlNo" />
                    <asp:BoundField DataField="PurOrdNo" HeaderText="PurOrdNo" 
                        SortExpression="PurOrdNo" />
                    <asp:BoundField DataField="ItemNo" HeaderText="ItemNo" 
                        SortExpression="ItemNo" />
                    <asp:BoundField DataField="ModelId" HeaderText="ModelId" 
                        SortExpression="ModelId" />
                    <asp:BoundField DataField="Qty" HeaderText="Qty" SortExpression="Qty" />
                    <asp:BoundField DataField="Rate" HeaderText="Rate" SortExpression="Rate" />
                    <asp:BoundField DataField="Amount" HeaderText="Amount" 
                        SortExpression="Amount" />
                </Columns>
            <PagerStyle BackColor="#FFFFCC" ForeColor="#330099" HorizontalAlign="Center" />
            <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="#663399" />
            <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="#FFFFCC" />
        </asp:GridView>
                                    

                                        <br />
                                        <asp:SqlDataSource ID="sds_gvPurchaseOrderDetails" runat="server" 
                                            ConnectionString="<%$ ConnectionStrings:sales_invoiceConnectionString %>" 
                                            DeleteCommand="DELETE FROM [PurchaseDetails] WHERE [SlNo] = @SlNo" 
                                            InsertCommand="INSERT INTO [PurchaseDetails] ([SlNo], [PurOrdNo], [ItemNo], [ModelId], [Qty], [Rate], [Amount]) VALUES (@SlNo, @PurOrdNo, @ItemNo, @ModelId, @Qty, @Rate, @Amount)" 
                                            SelectCommand="SELECT * FROM [PurchaseDetails]" 
                                            
                                            UpdateCommand="UPDATE [PurchaseDetails] SET [PurOrdNo] = @PurOrdNo, [ItemNo] = @ItemNo, [ModelId] = @ModelId, [Qty] = @Qty, [Rate] = @Rate, [Amount] = @Amount WHERE [SlNo] = @SlNo">
                                            <DeleteParameters>
                                                <asp:Parameter Name="SlNo" Type="Int32" />
                                            </DeleteParameters>
                                            <UpdateParameters>
                                                <asp:Parameter Name="PurOrdNo" Type="String" />
                                                <asp:Parameter Name="ItemNo" Type="String" />
                                                <asp:Parameter Name="ModelId" Type="String" />
                                                <asp:Parameter Name="Qty" Type="Int32" />
                                                <asp:Parameter Name="Rate" Type="Decimal" />
                                                <asp:Parameter Name="Amount" Type="Decimal" />
                                                <asp:Parameter Name="SlNo" Type="Int32" />
                                            </UpdateParameters>
                                            <InsertParameters>
                                                <asp:Parameter Name="SlNo" Type="Int32" />
                                                <asp:Parameter Name="PurOrdNo" Type="String" />
                                                <asp:Parameter Name="ItemNo" Type="String" />
                                                <asp:Parameter Name="ModelId" Type="String" />
                                                <asp:Parameter Name="Qty" Type="Int32" />
                                                <asp:Parameter Name="Rate" Type="Decimal" />
                                                <asp:Parameter Name="Amount" Type="Decimal" />
                                            </InsertParameters>
                                        </asp:SqlDataSource>
                                        <asp:SqlDataSource ID="sds_ddlModel" runat="server" 
                                            ConnectionString="<%$ ConnectionStrings:sales_invoiceConnectionString %>" 
                                            SelectCommand="SELECT * FROM [ModelMaster]"></asp:SqlDataSource>
                                    </td>
                                </tr>
                            </table>
                           
                    </fieldset>
                    
                </td>
            </tr>
        </table>
        
    </td>
  </tr>            
</table>
    <uc1:MessageBox ID="MessageBox1" runat="server" />


   <!-- Modal Popup for Model Master-->
    <asp:Panel ID="pnlModalPopup1" runat="server" CssClass="modalPopup" style="display:none;">    
            <table style="border:double 2px maroon; width:350px;" align="center">
                <tr>
                    <td>&nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                            ControlToValidate="txtModelName" ErrorMessage="*" SetFocusOnError="true" 
                            ValidationGroup="m"></asp:RequiredFieldValidator>
                        Model:</td>
                    <td>
                        <asp:TextBox ID="txtModelName" runat="server" ValidationGroup="m"></asp:TextBox>
                    </td>
                    
                    <td>
                        <asp:Button ID="btnAddModel1" runat="server" Text="Add" 
                             width="40px" onclick="btnAddModel1_Click" ValidationGroup="m"/>
                        <asp:Button ID="btnClose" runat="server" 
                            Text="Close" width="45px" onclick="btnClose_Click"  CausesValidation="false"/>
                    </td>
                </tr>
                
            </table>
        </asp:Panel>
           
         <cc1:ModalPopupExtender ID="ModalPopupExtender1" runat="server" 
            TargetControlID="btnAddModel" PopupControlID="pnlModalPopup1" 
            BackgroundCssClass="modalBackground">
         </cc1:ModalPopupExtender>
        
        <!-- Modal Popup for Item Master -->
    <asp:Panel ID="pnlModalPopup2" runat="server" CssClass="modalPopup" align="center" style="display:none;">    
            <table style="border:double 2px maroon; width:350px;">
                <tr>
                    <td class="style1">
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                            ControlToValidate="txtItemName1" ErrorMessage="*" SetFocusOnError="true" 
                            ValidationGroup="i"></asp:RequiredFieldValidator>
                        Item Name:</td>
                    <td>
                        <asp:TextBox ID="txtItemName1" runat="server" ValidationGroup="i"></asp:TextBox>
                    </td>
                    
                    <td>
                        <asp:Button ID="btnAddItem" runat="server" Text="Add" 
                             width="40px" onclick="btnAddItem_Click" ValidationGroup="i"/>
                        <asp:Button ID="btnClose2" runat="server" 
                            Text="Close" width="50px" onclick="btnClose2_Click" 
                            CausesValidation="false"/>
                    </td>
                </tr>
                
            </table>
        </asp:Panel>
           
         <cc1:ModalPopupExtender ID="ModalPopupExtender2" runat="server" 
            TargetControlID="btnAddNewItem" PopupControlID="pnlModalPopup2" 
            BackgroundCssClass="modalBackground">
         </cc1:ModalPopupExtender>
 <asp:Label ID="lblItemNo" runat="server" Text="" Visible="false"></asp:Label>
                                        <asp:Label ID="lblModeld" runat="server" Text="" Visible="false"></asp:Label>
                                        <asp:Label ID="lblTotalQtyPur" runat="server" Text="" Visible="false"></asp:Label>
                                        <asp:Label ID="lblPurOrderNo_PurchaseDetails" Text="" runat="server" Visible="false"></asp:Label>
                                        <br />
                                        <asp:Label ID="lblPurOrderNo_PurchaseMaster" runat="server" Text="" Visible="false"></asp:Label>
                                        <asp:Label ID="lblStockInHand" runat="server" Text="" Visible="false"></asp:Label>
                                        <asp:Label ID="lblTotalQtySale" runat="server" Text="" Visible="false"></asp:Label>
</asp:Content>

