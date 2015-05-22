<%@ Page Language="C#" MasterPageFile="~/Admin/AdminMasterPage.master" AutoEventWireup="true" CodeFile="MobileDesc_Insert.aspx.cs" Inherits="Admin_MobileDesc_Insert" Title="Untitled Page" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table align="center" width="900px">
        <tr>
            <td colspan="2" align="center"> <h3 style="color:Blue;text-decoration:underline;"> Mobile Description Entry Screen</h3></td>
        </tr>
        <tr>
            <td width="250px" align="left" style="border:dotted 1px Maroon;">
                <table align="center">
                    <tr>
                        <td>Mobile Name:</td>
                    </tr>
                    <tr>
                        <td>
                            <asp:TextBox ID="txtMobile" runat="server" MaxLength="50"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                                ControlToValidate="txtMobile" Display="Dynamic" 
                                ErrorMessage="Should not be blank"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td>Model Name:</td>
                    </tr>
                    <tr>
                        <td>
                            <asp:TextBox ID="txtModel" runat="server" MaxLength="50"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                                ControlToValidate="txtModel" Display="Dynamic" 
                                ErrorMessage="Should not be blank"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                     <tr>
                        <td>Price:</td>
                    </tr>
                    <tr>
                        <td>
                            <asp:TextBox ID="txtPrice" runat="server" MaxLength="10"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                                ControlToValidate="txtPrice" Display="Dynamic" 
                                ErrorMessage="Should not be blank"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                     <tr>
                        <td>Battery Backup:</td>
                    </tr>
                    <tr>
                        <td>
                            <asp:TextBox ID="txtBattBackup" runat="server" MaxLength="50"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                                ControlToValidate="txtBattBackup" Display="Dynamic" 
                                ErrorMessage="Should not be blank"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    
                     <tr>
                        <td>Internal Memory:</td>
                    </tr>
                    <tr>
                        <td>
                            <asp:TextBox ID="txtIntMem" runat="server" MaxLength="50"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" 
                                ControlToValidate="txtIntMem" Display="Dynamic" 
                                ErrorMessage="Should not be blank"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                     <tr>
                        <td>External Memory:</td>
                    </tr>
                    <tr>
                        <td>
                            <asp:TextBox ID="txtExtMem" runat="server" MaxLength="50"></asp:TextBox>
                             <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" 
                                ControlToValidate="txtExtMem" Display="Dynamic" 
                                ErrorMessage="Should not be blank"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                     <tr>
                        <td>
                            <table>
                                <tr>
                                    <td>Bluetooth:</td>
                                     <td>
                                        <asp:DropDownList ID="ddlBluetooth" runat="server" 
                                             onselectedindexchanged="ddlBluetooth_SelectedIndexChanged">
                                            <asp:ListItem>Yes</asp:ListItem>
                                            <asp:ListItem>No</asp:ListItem>
                                        </asp:DropDownList>
                                    </td>
                                    <td>Infra Red:</td>
                                    <td>
                                        <asp:DropDownList ID="ddlInfrared" runat="server" 
                                            onselectedindexchanged="ddlInfrared_SelectedIndexChanged">
                                            <asp:ListItem>Yes</asp:ListItem>
                                            <asp:ListItem>No</asp:ListItem>
                                        </asp:DropDownList>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    
                    <tr>
                        <td>Guarantee:</td>
                    </tr>
                    <tr>
                        <td>
                            <asp:TextBox ID="txtGuarantee" runat="server" MaxLength="50" 
                                ontextchanged="txtGuarantee_TextChanged"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" 
                                ControlToValidate="txtGuarantee" Display="Dynamic" 
                                ErrorMessage="Should not be blank"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Button ID="btnSubmit" runat="server" onclick="btnSubmit_Click" 
                                Text="Submit" />
                            <asp:Button ID="btnUpdate" runat="server" Enabled="False" 
                                onclick="btnUpdate_Click" Text="Update" />
                            <asp:Button ID="btnReset" runat="server" onclick="btnReset_Click" 
                                Text="Reset" />
                            <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender1" runat="server" 
                                FilterType="Numbers" TargetControlID="txtPrice">
                            </cc1:FilteredTextBoxExtender>
                        </td>
                    </tr>
                </table>
            </td>
            
            
            <td valign="top">
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
                    BackColor="LightGoldenrodYellow" BorderColor="Tan" BorderWidth="1px" 
                    CellPadding="4" DataKeyNames="MNo" DataSourceID="SqlDataSource1" 
                    ForeColor="Black" GridLines="None" HorizontalAlign="Left" 
                    onselectedindexchanged="GridView1_SelectedIndexChanged" ShowFooter="True" 
                    Width="100%">
                    <FooterStyle BackColor="Tan" />
                    <Columns>
                        <asp:BoundField DataField="MNo" HeaderText="MNo" InsertVisible="False" 
                            ReadOnly="True" SortExpression="MNo" Visible="False" />
                        <asp:BoundField DataField="MobileName" HeaderText="MobileName" 
                            SortExpression="MobileName" />
                        <asp:BoundField DataField="Model" HeaderText="Model" SortExpression="Model" />
                        <asp:BoundField DataField="Price" HeaderText="Price" SortExpression="Price" />
                        <asp:BoundField DataField="BatteryBackup" HeaderText="BatteryBackup" 
                            SortExpression="BatteryBackup" />
                        <asp:BoundField DataField="BlueTooth" HeaderText="BlueTooth" 
                            SortExpression="BlueTooth" />
                        <asp:BoundField DataField="InfraRed" HeaderText="InfraRed" 
                            SortExpression="InfraRed" />
                        <asp:BoundField DataField="Guarantee" HeaderText="Guarantee" 
                            SortExpression="Guarantee" />
                        <asp:CommandField HeaderText="Action" SelectText="Edit" 
                            ShowSelectButton="True" />
                        <asp:TemplateField ShowHeader="False">
                            <ItemTemplate>
                                <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" 
                                    CommandName="Delete" 
                                    onclientclick="return confirm(&quot;Are you sure to delete?&quot;);" 
                                    Text="Delete"></asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                    <PagerStyle BackColor="PaleGoldenrod" ForeColor="DarkSlateBlue" 
                        HorizontalAlign="Center" />
                    <SelectedRowStyle BackColor="DarkSlateBlue" ForeColor="GhostWhite" />
                    <HeaderStyle BackColor="Tan" Font-Bold="True" HorizontalAlign="Left" />
                    <AlternatingRowStyle BackColor="PaleGoldenrod" />
                </asp:GridView>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:sales_invoiceConnectionString %>" 
                    DeleteCommand="DELETE FROM [MobileDesc] WHERE [MNo] = @MNo" 
                    InsertCommand="INSERT INTO [MobileDesc] ([MobileName], [Model], [Price], [BatteryBackup], [BlueTooth], [InfraRed], [Guarantee]) VALUES (@MobileName, @Model, @Price, @BatteryBackup, @BlueTooth, @InfraRed, @Guarantee)" 
                    SelectCommand="SELECT [MobileName], [Model], [Price], [BatteryBackup], [BlueTooth], [InfraRed], [Guarantee], [MNo] FROM [MobileDesc]" 
                    UpdateCommand="UPDATE [MobileDesc] SET [MobileName] = @MobileName, [Model] = @Model, [Price] = @Price, [BatteryBackup] = @BatteryBackup, [BlueTooth] = @BlueTooth, [InfraRed] = @InfraRed, [Guarantee] = @Guarantee WHERE [MNo] = @MNo">
                    <DeleteParameters>
                        <asp:Parameter Name="MNo" Type="Int32" />
                    </DeleteParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="MobileName" Type="String" />
                        <asp:Parameter Name="Model" Type="String" />
                        <asp:Parameter Name="Price" Type="Decimal" />
                        <asp:Parameter Name="BatteryBackup" Type="String" />
                        <asp:Parameter Name="BlueTooth" Type="String" />
                        <asp:Parameter Name="InfraRed" Type="String" />
                        <asp:Parameter Name="Guarantee" Type="String" />
                        <asp:Parameter Name="MNo" Type="Int32" />
                    </UpdateParameters>
                    <InsertParameters>
                        <asp:Parameter Name="MobileName" Type="String" />
                        <asp:Parameter Name="Model" Type="String" />
                        <asp:Parameter Name="Price" Type="Decimal" />
                        <asp:Parameter Name="BatteryBackup" Type="String" />
                        <asp:Parameter Name="BlueTooth" Type="String" />
                        <asp:Parameter Name="InfraRed" Type="String" />
                        <asp:Parameter Name="Guarantee" Type="String" />
                    </InsertParameters>
                </asp:SqlDataSource>
            </td>
        </tr>
    </table>
</asp:Content>

