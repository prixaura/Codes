<%@ Page Language="C#" MasterPageFile="~/Admin/AdminMasterPage.master" AutoEventWireup="true" CodeFile="SupplierMaster.aspx.cs" Inherits="Admin_SupplierMaster" Title="Untitled Page" %>

<%@ Register src="../MessageBox.ascx" tagname="MessageBox" tagprefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <br />

    <table align="center" style="width: 900px">
        <tr>
            <td valign="top" align="center" style="width:230px;">
                <fieldset style="width:230px;">
                    <legend>Supplier Details</legend>
                        <table width="230px">
                            <tr>
                                <td>Supplier Name:</td>                                            
                            </tr>
                            <tr>
                                <td>
                                    <asp:TextBox ID="txtSupplierName" runat="server" Width="179px" 
                                        ValidationGroup="s"></asp:TextBox>
                                </td>
                            </tr>
                            
                            <tr>
                                <td>Address:</td>                                            
                            </tr>
                            <tr>
                                <td>
                                    <asp:TextBox ID="txtAddress" runat="server" TextMode="MultiLine"></asp:TextBox>
                                </td>
                            </tr>
                            
                             <tr>
                                <td>State:</td>                                            
                            </tr>
                            <tr>
                                <td>
                                     <asp:TextBox ID="txtState" runat="server" Width="179px" ValidationGroup="s"></asp:TextBox>
                                </td>
                            </tr>
                            
                            <tr>
                                <td>City:</td>                                            
                            </tr>
                            <tr>
                                <td>
                                    
                                     <asp:TextBox ID="txtCity" runat="server" Width="179px" ValidationGroup="s"></asp:TextBox>
                                    
                                </td>
                            </tr>
                            
                            <tr>
                                <td>Mobile No:</td>                                            
                            </tr>
                            <tr>
                                <td>
                                     <asp:TextBox ID="txtMobNo" runat="server" Width="179px" ValidationGroup="s" 
                                         MaxLength="10"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>Fax:</td>                                            
                            </tr>
                            <tr>
                                <td>
                                     <asp:TextBox ID="txtFax" runat="server" Width="179px"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>Email:</td>                                            
                            </tr>
                            <tr>
                                <td>
                                     <asp:TextBox ID="txtEmail" runat="server" Width="179px" ValidationGroup="s"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Button ID="btnSave" runat="server" Text="Save" width="56px" 
                                        onclick="btnSave_Click" ValidationGroup="s"/>
                                    <asp:Button ID="btnUpdate" runat="server" Text="Update" width="56px" 
                                        Visible="false" onclick="btnUpdate_Click" ValidationGroup="s"/>
                                    <asp:Button ID="btnDelete" runat="server" onclick="btnDelete_Click" 
                                        Text="Delete" Visible="False" Width="56px" CausesValidation="False" />
                                    <asp:Button ID="btnCancel" runat="server" Text="Cancel" width="56px" 
                                        onclick="btnCancel_Click" CausesValidation="False"/>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                                        ControlToValidate="txtSupplierName" Display="None" 
                                        ErrorMessage="Input Supplier Name" SetFocusOnError="True" ValidationGroup="s"></asp:RequiredFieldValidator>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                                        ControlToValidate="txtAddress" Display="None" ErrorMessage="Input Address" 
                                        SetFocusOnError="True" ValidationGroup="s"></asp:RequiredFieldValidator>
                                    <br />
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                                        ControlToValidate="txtState" Display="None" ErrorMessage="Input State" 
                                        SetFocusOnError="True" ValidationGroup="s"></asp:RequiredFieldValidator>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                                        ControlToValidate="txtCity" Display="None" ErrorMessage="Input City" 
                                        ValidationGroup="s"></asp:RequiredFieldValidator>
                                    <br />
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" 
                                        ControlToValidate="txtMobNo" Display="None" ErrorMessage="Input Mobile No" 
                                        SetFocusOnError="True" ValidationGroup="s"></asp:RequiredFieldValidator>
                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
                                        ControlToValidate="txtEmail" Display="None" 
                                        ErrorMessage="Email Id not in a correct format" SetFocusOnError="True" 
                                        ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" 
                                        ValidationGroup="s"></asp:RegularExpressionValidator>
                                    <asp:ValidationSummary ID="ValidationSummary1" runat="server" 
                                        ShowMessageBox="True" ShowSummary="False" ValidationGroup="s" />
                                </td>
                            </tr>
                        </table>
                    
                </fieldset>
            </td>
            
            <td style="width:600px;" valign="top">
                <asp:GridView ID="gvSupplierMaster" runat="server" AllowPaging="True" 
                    AutoGenerateColumns="False" BackColor="White" BorderColor="#CC9966" 
                    BorderStyle="None" BorderWidth="1px" CellPadding="2" 
                    DataKeyNames="SupplierCode" DataSourceID="sds_gvSupplierMaster" 
                    ShowFooter="True" Width="545px" 
                    onselectedindexchanged="gvSupplierMaster_SelectedIndexChanged">
                    <FooterStyle BackColor="#FFFFCC" ForeColor="#330099" />
                    <RowStyle BackColor="White" ForeColor="#330099" />
                    <Columns>
                        <asp:BoundField DataField="SupplierCode" HeaderText="SupplierCode" 
                            ReadOnly="True" SortExpression="SupplierCode" />
                        <asp:BoundField DataField="SupplierName" HeaderText="SupplierName" 
                            SortExpression="SupplierName" />
                        <asp:BoundField DataField="Address" HeaderText="Address" 
                            SortExpression="Address" />
                        <asp:BoundField DataField="City" HeaderText="City" SortExpression="City" />
                        <asp:BoundField DataField="State" HeaderText="State" SortExpression="State" />
                        <asp:CommandField ShowSelectButton="True" />
                    </Columns>
                    <PagerStyle BackColor="#FFFFCC" ForeColor="#330099" HorizontalAlign="Center" />
                    <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="#663399" />
                    <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="#FFFFCC" />
                </asp:GridView>
                <asp:SqlDataSource ID="sds_gvSupplierMaster" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:sales_invoiceConnectionString %>" 
                    DeleteCommand="DELETE FROM [SupplierMaster] WHERE [SupplierCode] = @SupplierCode" 
                    InsertCommand="INSERT INTO [SupplierMaster] ([SupplierCode], [SupplierName], [Address], [City], [State], [MobNo], [Fax], [Email]) VALUES (@SupplierCode, @SupplierName, @Address, @City, @State, @MobNo, @Fax, @Email)" 
                    SelectCommand="SELECT * FROM [SupplierMaster]" 
                    UpdateCommand="UPDATE [SupplierMaster] SET [SupplierName] = @SupplierName, [Address] = @Address, [City] = @City, [State] = @State, [MobNo] = @MobNo, [Fax] = @Fax, [Email] = @Email WHERE [SupplierCode] = @SupplierCode">
                    <DeleteParameters>
                        <asp:Parameter Name="SupplierCode" Type="String" />
                    </DeleteParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="SupplierName" Type="String" />
                        <asp:Parameter Name="Address" Type="String" />
                        <asp:Parameter Name="City" Type="String" />
                        <asp:Parameter Name="State" Type="String" />
                        <asp:Parameter Name="MobNo" Type="Decimal" />
                        <asp:Parameter Name="Fax" Type="String" />
                        <asp:Parameter Name="Email" Type="String" />
                        <asp:Parameter Name="SupplierCode" Type="String" />
                    </UpdateParameters>
                    <InsertParameters>
                        <asp:Parameter Name="SupplierCode" Type="String" />
                        <asp:Parameter Name="SupplierName" Type="String" />
                        <asp:Parameter Name="Address" Type="String" />
                        <asp:Parameter Name="City" Type="String" />
                        <asp:Parameter Name="State" Type="String" />
                        <asp:Parameter Name="MobNo" Type="Decimal" />
                        <asp:Parameter Name="Fax" Type="String" />
                        <asp:Parameter Name="Email" Type="String" />
                    </InsertParameters>
                </asp:SqlDataSource>
            </td>
        </tr>
    </table>    

</asp:Content>

