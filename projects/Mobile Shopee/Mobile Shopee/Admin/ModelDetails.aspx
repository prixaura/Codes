<%@ Page Language="C#" MasterPageFile="~/Admin/AdminMasterPage.master" AutoEventWireup="true" CodeFile="ModelDetails.aspx.cs" Inherits="Admin_ModelDetails" Title="Untitled Page" %>

<%@ Register src="../MessageBox.ascx" tagname="MessageBox" tagprefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<br /><br /><br /><br /><br />
    <table style="width:800px;" align="center">
        <tr>
            <td align="center">            
                <fieldset style="width:400px;">
                    <legend>Model Details</legend>                    
                    <table style="width:400px;">
                        <tr>
                            <td>
                                 <asp:GridView ID="gvModelDetails" runat="server" AutoGenerateColumns="False" 
                                    BackColor="#DEBA84" BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" 
                                    CellPadding="3" CellSpacing="2" ShowFooter="True" Width="100%" 
                                     DataKeyNames="ModelId" DataSourceID="sds_gvModelDetails" 
                                     AllowPaging="True" 
                                     onselectedindexchanged="gvModelDetails_SelectedIndexChanged" 
                                     onrowdatabound="gvModelDetails_RowDataBound">
                                    <FooterStyle BackColor="#F7DFB5" ForeColor="#8C4510" />
                                    <RowStyle BackColor="#FFF7E7" ForeColor="#8C4510" />
                                     <Columns>
                                         <asp:BoundField DataField="ModelId" HeaderText="ModelId" ReadOnly="True" 
                                             SortExpression="ModelId" />
                                         <asp:TemplateField HeaderText="ModelName" SortExpression="ModelName">
                                             <ItemTemplate>
                                                 <asp:Label ID="Label1" runat="server" Text='<%# Bind("ModelName") %>'></asp:Label>
                                             </ItemTemplate>
                                             <EditItemTemplate>
                                                 <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("ModelName") %>'></asp:TextBox>
                                             </EditItemTemplate>
                                             <FooterTemplate>
                                                 <asp:TextBox ID="txtModelName" runat="server" ValidationGroup="s"></asp:TextBox>
                                                 <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                                                     ControlToValidate="txtModelName" ErrorMessage="Input Model Name" 
                                                     SetFocusOnError="True" ValidationGroup="s"></asp:RequiredFieldValidator>
                                             </FooterTemplate>
                                         </asp:TemplateField>
                                         <asp:CommandField ShowEditButton="True" />
                                         <asp:CommandField ShowSelectButton="True" />
                                     </Columns>
                                    <PagerStyle ForeColor="#8C4510" HorizontalAlign="Center" />
                                    <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="White" />
                                    <HeaderStyle BackColor="#A55129" Font-Bold="True" ForeColor="White" />
                                </asp:GridView>
                                 <asp:SqlDataSource ID="sds_gvModelDetails" runat="server" 
                                     ConnectionString="<%$ ConnectionStrings:sales_invoiceConnectionString %>" 
                                     DeleteCommand="DELETE FROM [ModelMaster] WHERE [ModelId] = @ModelId" 
                                     InsertCommand="INSERT INTO [ModelMaster] ([ModelId], [ModelName]) VALUES (@ModelId, @ModelName)" 
                                     SelectCommand="SELECT * FROM [ModelMaster]" 
                                     UpdateCommand="UPDATE [ModelMaster] SET [ModelName] = @ModelName WHERE [ModelId] = @ModelId">
                                     <DeleteParameters>
                                         <asp:Parameter Name="ModelId" Type="String" />
                                     </DeleteParameters>
                                     <UpdateParameters>
                                         <asp:Parameter Name="ModelName" Type="String" />
                                         <asp:Parameter Name="ModelId" Type="String" />
                                     </UpdateParameters>
                                     <InsertParameters>
                                         <asp:Parameter Name="ModelId" Type="String" />
                                         <asp:Parameter Name="ModelName" Type="String" />
                                     </InsertParameters>
                                 </asp:SqlDataSource>
                                 <asp:Label ID="lblModelId" runat="server" Text=" "></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td align="center">
                                <asp:Button ID="btnSave" runat="server" Text="Save" onclick="btnSave_Click1" 
                                    ValidationGroup="s" />
                                <asp:Button ID="btnDelete" runat="server" Text="Delete" 
                                    CausesValidation="False" Enabled="False" onclick="btnDelete_Click" />
                            </td>
                        </tr>
                    </table>
                </fieldset>
            </td>
        </tr>
    </table>

</asp:Content>

