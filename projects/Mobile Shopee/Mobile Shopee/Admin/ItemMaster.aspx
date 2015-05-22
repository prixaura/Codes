<%@ Page Language="C#" MasterPageFile="~/Admin/AdminMasterPage.master" AutoEventWireup="true" CodeFile="ItemMaster.aspx.cs" Inherits="Admin_ItemMaster" Title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <br />
<br />
<br />
    <table width="800px" align="center">
        <tr>
            <td align="left" valign="top">
                <fieldset style="width:250px;">
                    <legend>Item Details</legend>
                    
                        <table align="left" style="width: 200px">
                                                         
                            <tr>
                                <td>
                                    <asp:Label ID="lblItemName" runat="server" Text="Item Name:"></asp:Label>
                                </td>
                            </tr>
                            <tr>                        
                                <td>
                                     <asp:TextBox ID="txtItemName" runat="server" Width="200px"></asp:TextBox>
                                </td>
                            </tr>
                            
                            <tr>
                                <td align="center" style="border-top:solid 1px maroon;" 
                                    bgcolor="#CC6600">
                                    <asp:Button ID="btnSave" runat="server" Text="Save" Width="70px" 
                                        onclick="btnSave_Click" />
                                    <asp:Button ID="btnCancel" runat="server" Text="Cancel" 
                                        CausesValidation="False" Width="70px" onclick="btnCancel_Click" />
                                </td>
                            </tr>
                        </table>
                        
                    </fieldset>
            </td>
            
            <td valign="top" style="width:500px;">
               
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
                    CellPadding="4" DataKeyNames="ItemNo" DataSourceID="SqlDataSource1" 
                    ForeColor="#333333" GridLines="None" Width="500px">
                    <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                    <RowStyle BackColor="#EFF3FB" />
                    <Columns>
                        <asp:BoundField DataField="ItemNo" HeaderText="ItemNo" ReadOnly="True" 
                            SortExpression="ItemNo" />
                        <asp:BoundField DataField="ItemName" HeaderText="ItemName" 
                            SortExpression="ItemName" />
                        <asp:CommandField ShowEditButton="True" />
                        <asp:TemplateField ShowHeader="False">
                            <ItemTemplate>
                                <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" 
                                    CommandName="Delete" 
                                    onclientclick="return confirm(&quot;Are u sure to delete this item&quot;);" 
                                    Text="Delete"></asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                    <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                    <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                    <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                    <EditRowStyle BackColor="#2461BF" />
                    <AlternatingRowStyle BackColor="White" />
                </asp:GridView>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:sales_invoiceConnectionString %>" 
                    DeleteCommand="DELETE FROM [ItemMaster] WHERE [ItemNo] = @ItemNo" 
                    InsertCommand="INSERT INTO [ItemMaster] ([ItemNo], [ItemName]) VALUES (@ItemNo, @ItemName)" 
                    SelectCommand="SELECT * FROM [ItemMaster]" 
                    UpdateCommand="UPDATE [ItemMaster] SET [ItemName] = @ItemName WHERE [ItemNo] = @ItemNo">
                    <DeleteParameters>
                        <asp:Parameter Name="ItemNo" Type="String" />
                    </DeleteParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="ItemName" Type="String" />
                        <asp:Parameter Name="ItemNo" Type="String" />
                    </UpdateParameters>
                    <InsertParameters>
                        <asp:Parameter Name="ItemNo" Type="String" />
                        <asp:Parameter Name="ItemName" Type="String" />
                    </InsertParameters>
                </asp:SqlDataSource>
               
            </td>
        </tr>
    </table>
</asp:Content>

