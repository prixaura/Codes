<%@ Page Language="C#" MasterPageFile="~/Admin/AdminMasterPage.master" AutoEventWireup="true" CodeFile="ItemDetails.aspx.cs" Inherits="Admin_ItemDetails" Title="Untitled Page" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="cc1" %>

<%@ Register src="../MessageBox.ascx" tagname="MessageBox" tagprefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <br /><br /><br />
    <table width="800px" align="center">
        <tr>
            <td align="left" valign="top">
                <fieldset style="width:200px;">
                    <legend>Item Details</legend>
                    
                        <table align="left" style="width: 200px">
                            <tr>
                                <td colspan="2">
                                    <asp:Label ID="lblItemName" runat="server" Text="Item Name:"></asp:Label>
                                </td>
                            </tr>
                            <tr>                        
                                <td colspan="2">
                                     <asp:TextBox ID="txtItemName" runat="server" ValidationGroup="s" 
                                         ontextchanged="txtItemName_TextChanged"></asp:TextBox>
                                </td>
                            </tr>
                            
                            
                            <tr>
                                <td colspan="2">
                                    <asp:Label ID="lblModelName" runat="server" Text="Model Name:"></asp:Label>
                                </td>
                            </tr>
                            <tr>                        
                                <td colspan="2">
                                     <asp:TextBox ID="txtModelName1" runat="server" 
                                         ontextchanged="txtModelName1_TextChanged"></asp:TextBox>
                                </td>
                            </tr>
                            
                            
                            
                            
                            
                            
                            <tr>
                                <td colspan="2">
                                    <asp:Label ID="lblReorderQty" runat="server" Text="Reorder Quantity:"></asp:Label>
                               </td> 
                            </tr>
                                 <td colspan="2">
                                    <asp:TextBox ID="txtReordQty" runat="server" Width="70px"></asp:TextBox>
                                </td> 
                            <tr>
                                 <td colspan="2">
                                        <asp:Label ID="lblCostRate" runat="server" Text="Cost Rate:"></asp:Label>                                       
                                 </td> 
                            </tr>
                            
                            <tr>
                                <td colspan="2">
                                    <asp:TextBox ID="txtCostRate" runat="server" Width="70px" ReadOnly="True" 
                                        ontextchanged="txtCostRate_TextChanged"></asp:TextBox>
                                </td>
                            </tr>
                            
                            <tr>
                                <td colspan="2">
                                    <asp:Label ID="lblSaleRate" runat="server" Text="Sale Rate:"></asp:Label>
                                </td> 
                            </tr>
                               
                            <tr>
                                <td colspan="2">
                                    <asp:TextBox ID="txtSaleRate" runat="server" Width="70px"></asp:TextBox>
                                </td>
                            </tr> 
                             
                            
                            <tr>
                                <td align="center" colspan="6" style="border-top:solid 1px maroon;" 
                                    bgcolor="#CC6600">
                                    <asp:Button ID="btnUpdate" runat="server" onclick="btnUpdate_Click" 
                                        Text="Update" ValidationGroup="u" Width="70px" 
                                        Height="26px" Enabled="False" />
                                    <asp:Button ID="btnCancel" runat="server" Text="Cancel" 
                                        CausesValidation="False" onclick="btnCancel_Click" Width="70px" />
                                </td>
                            </tr>
                        </table>
                        
                    </fieldset>
            </td>
            
            
            
            
            
            
            <td valign="top" style="width:500px;">
                <asp:GridView ID="gvItemDetails" runat="server" AutoGenerateColumns="False" 
                    BackColor="White" BorderColor="#CC9966" BorderStyle="None" BorderWidth="1px" 
                    CellPadding="2" DataSourceID="sds_gvItemDetails" 
                    PageSize="5" ShowFooter="True" 
                    onselectedindexchanged="gvItemDetails_SelectedIndexChanged">
                    <FooterStyle BackColor="#FFFFCC" ForeColor="#330099" />
                    <RowStyle BackColor="White" ForeColor="#330099" />
                    <Columns>
                        <asp:BoundField DataField="ItemNo" HeaderText="ItemNo" 
                            SortExpression="ItemNo" />
                        <asp:BoundField DataField="ModelId" HeaderText="ModelId" 
                            SortExpression="ModelId" />
                        <asp:BoundField DataField="ReorderQty" HeaderText="ReorderQty" 
                            SortExpression="ReorderQty" />
                        <asp:BoundField DataField="TotalQtyPurchase" HeaderText="TotalQtyPurchase" 
                            SortExpression="TotalQtyPurchase" />
                        <asp:BoundField DataField="TotalQtySale" HeaderText="TotalQtySale" 
                            SortExpression="TotalQtySale" />
                        <asp:BoundField DataField="CostRate" HeaderText="CostRate" 
                            SortExpression="CostRate" />
                        <asp:BoundField DataField="SaleRate" HeaderText="SaleRate" 
                            SortExpression="SaleRate" />
                        <asp:BoundField DataField="StockInHand" HeaderText="StockInHand" 
                            SortExpression="StockInHand" />
                        <asp:CommandField SelectText="Edit" ShowSelectButton="True" />
                    </Columns>
                    <PagerStyle BackColor="#FFFFCC" ForeColor="#330099" HorizontalAlign="Center" />
                    <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="#663399" />
                    <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="#FFFFCC" />
                </asp:GridView>
                <asp:SqlDataSource ID="sds_gvItemDetails" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:sales_invoiceConnectionString %>" 
                    DeleteCommand="DELETE FROM [ItemDetails] WHERE [SlNo] = @SlNo" 
                    InsertCommand="INSERT INTO [ItemDetails] ([SlNo], [ItemNo], [ModelId], [ReorderQty], [TotalQtyPurchase], [TotalQtySale], [CostRate], [SaleRate], [StockInHand]) VALUES (@SlNo, @ItemNo, @ModelId, @ReorderQty, @TotalQtyPurchase, @TotalQtySale, @CostRate, @SaleRate, @StockInHand)" 
                    SelectCommand="SELECT ItemNo,ModelId,ReorderQty,TotalQtyPurchase,TotalQtySale,CostRate,SaleRate,StockInHand FROM ItemDetails" 
                    
                    
                    UpdateCommand="UPDATE [ItemDetails] SET [ItemNo] = @ItemNo, [ModelId] = @ModelId, [ReorderQty] = @ReorderQty, [TotalQtyPurchase] = @TotalQtyPurchase, [TotalQtySale] = @TotalQtySale, [CostRate] = @CostRate, [SaleRate] = @SaleRate, [StockInHand] = @StockInHand WHERE [SlNo] = @SlNo">
                    <DeleteParameters>
                        <asp:Parameter Name="SlNo" Type="Int32" />
                    </DeleteParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="ItemNo" Type="String" />
                        <asp:Parameter Name="ModelId" Type="String" />
                        <asp:Parameter Name="ReorderQty" Type="Int32" />
                        <asp:Parameter Name="TotalQtyPurchase" Type="Int32" />
                        <asp:Parameter Name="TotalQtySale" Type="Int32" />
                        <asp:Parameter Name="CostRate" Type="Decimal" />
                        <asp:Parameter Name="SaleRate" Type="Decimal" />
                        <asp:Parameter Name="StockInHand" Type="Int32" />
                        <asp:Parameter Name="SlNo" Type="Int32" />
                    </UpdateParameters>
                    <InsertParameters>
                        <asp:Parameter Name="SlNo" Type="Int32" />
                        <asp:Parameter Name="ItemNo" Type="String" />
                        <asp:Parameter Name="ModelId" Type="String" />
                        <asp:Parameter Name="ReorderQty" Type="Int32" />
                        <asp:Parameter Name="TotalQtyPurchase" Type="Int32" />
                        <asp:Parameter Name="TotalQtySale" Type="Int32" />
                        <asp:Parameter Name="CostRate" Type="Decimal" />
                        <asp:Parameter Name="SaleRate" Type="Decimal" />
                        <asp:Parameter Name="StockInHand" Type="Int32" />
                    </InsertParameters>
                </asp:SqlDataSource>
            </td>
        </tr>
    </table>
      
    
    <table align="center" width="100%">
        <tr>
            <td align="center">
                <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender2" runat="server" 
                    FilterType="Numbers" TargetControlID="txtReordQty">
                </cc1:FilteredTextBoxExtender>
                <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender1" runat="server" 
                    FilterType="Custom,Numbers" TargetControlID="txtSaleRate" ValidChars=".">
                </cc1:FilteredTextBoxExtender>
                <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender3" runat="server" 
                    FilterType="Custom,Numbers" TargetControlID="txtCostRate" ValidChars=".">
                </cc1:FilteredTextBoxExtender>
               
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                    ControlToValidate="txtItemName" Display="None" ErrorMessage="Input Item name" 
                    SetFocusOnError="True"></asp:RequiredFieldValidator>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                    ControlToValidate="txtCostRate" Display="None" 
                    ErrorMessage="Cost rate should not be blank" SetFocusOnError="True"></asp:RequiredFieldValidator>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                    ControlToValidate="txtSaleRate" Display="None" 
                    ErrorMessage="Sale rate should not be blank" SetFocusOnError="True" 
                    ValidationGroup="u"></asp:RequiredFieldValidator>
                <asp:CompareValidator ID="CompareValidator1" runat="server" 
                    ControlToCompare="txtCostRate" ControlToValidate="txtSaleRate" Display="None" 
                    ErrorMessage="Sale rate must be greater than Cost rate" Operator="GreaterThan" 
                    SetFocusOnError="True" Type="Double" ValidationGroup="u"></asp:CompareValidator>
                <br />
                <asp:ValidationSummary ID="ValidationSummary1" runat="server" 
                    ShowMessageBox="True" ShowSummary="False" ValidationGroup="u" />
                <asp:ValidationSummary ID="ValidationSummary2" runat="server" 
                    ShowMessageBox="True" ShowSummary="False" ValidationGroup="s" />
               
                <br />
            </td>
        </tr>
    </table>
    
    <uc1:MessageBox ID="MessageBox1" runat="server" />
</asp:Content>

