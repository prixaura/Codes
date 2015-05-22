<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Search.aspx.cs" Inherits="Search" Title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table align="center" width="400px" border="1">
        <tr>
            <td>Mobile:</td>
            <td>
                <asp:DropDownList ID="ddlMobile" runat="server" DataSourceID="sds_Mobile" 
                    DataTextField="MobileName" DataValueField="MobileName" AutoPostBack="True">
                </asp:DropDownList>
                <asp:SqlDataSource ID="sds_Mobile" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:sales_invoiceConnectionString %>" 
                    SelectCommand="SELECT DISTINCT [MobileName] FROM [MobileDesc]">
                </asp:SqlDataSource>
            </td>
            
            <td>Model:</td>
            <td>
                <asp:DropDownList ID="ddlModel" runat="server" DataSourceID="sds_Model" 
                    DataTextField="Model" DataValueField="Model">
                </asp:DropDownList>
                <asp:SqlDataSource ID="sds_Model" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:sales_invoiceConnectionString %>" 
                    SelectCommand="SELECT [Model] FROM [MobileDesc] WHERE ([MobileName] = @MobileName)">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="ddlMobile" Name="MobileName" 
                            PropertyName="SelectedValue" Type="String" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </td>
            <td>
                <asp:Button ID="btnSubmit" runat="server" Text="Submit" 
                    onclick="btnSubmit_Click" />
            </td>
        </tr>
    </table>
    <br />
    
    <asp:Panel ID="Panel1" runat="server" Visible="false">
        <table align="center" width="500px" border="1">
            <tr>
                <td colspan="5" align="center"> <h2 style="color:Blue;text-decoration:underline;">Mobile Description</h2></td>
            </tr>
            <tr>
                <td>Mobile Name:</td>
                <td width="125px">
                    <asp:Label ID="lblMobile" runat="server" Font-Bold="True" ForeColor="Maroon"></asp:Label>
                </td>
                <td>Model:</td>
                <td width="130px">
                    <asp:Label ID="lblModel" runat="server" Text="" Font-Bold="True" ForeColor="Maroon"></asp:Label>
                </td>
            </tr>
            
            <tr>
                <td>Price:</td>
                <td>
                    <asp:Label ID="lblPrice" runat="server" Font-Bold="True" ForeColor="Maroon"></asp:Label>
                </td>
                <td>Battery Backup:</td>
                <td>
                    <asp:Label ID="lblBatteryBackup" runat="server" Text="" Font-Bold="True" ForeColor="Maroon"></asp:Label>
                </td>
            </tr>
            
             <tr>
                <td>Internal Memory:</td>
                <td>
                    <asp:Label ID="lblIntMem" runat="server" Font-Bold="True" ForeColor="Maroon"></asp:Label>
                </td>
                <td>External Memory:</td>
                <td>
                    <asp:Label ID="lblExtMem" runat="server" Text="" Font-Bold="True" ForeColor="Maroon"></asp:Label>
                </td>
            </tr>
            
             <tr>
                <td>Bluetooth:</td>
                <td>
                    <asp:Label ID="lblBluetooth" runat="server" Text="" Font-Bold="True" ForeColor="Maroon"></asp:Label>
                </td>
                <td>Infrared:</td>
                <td>
                    <asp:Label ID="lblInfraRed" runat="server" Text="" Font-Bold="True" ForeColor="Maroon"></asp:Label>
                </td>
            </tr>
            
            <tr>
                <td>Guarantee:</td>
                <td colspan="3">
                    <asp:Label ID="lblGuarantee" runat="server" Text="" Font-Bold="True" ForeColor="Maroon"></asp:Label>
                </td>
                
            </tr>
        </table>

    
    </asp:Panel>
    
</asp:Content>

