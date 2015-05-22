<%@ Page Language="C#" AutoEventWireup="true" CodeFile="PrintBill.aspx.cs" Inherits="Admin_Reprt_PrintBill" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Bill</title>
    <link href="../AdminStyle.css" rel="stylesheet" type="text/css" />
</head>
<body onload="window.print()">
    <form id="form1" runat="server">
    <div>
        <table border="1" width="500px" align="center">
            <tr>
                <td colspan="4" align="center"><h2 style="color:Maroon;"> Mobile Bazar </h2></td>
            </tr>
            <tr>
                <td>BillNo:</td>
                <td>
                    <asp:Label ID="lblBillNo" runat="server" Text=""></asp:Label>
                </td>
                <td>Date:</td>
                <td>
                    <asp:Label ID="lblDate" runat="server" Text=""></asp:Label>
                </td>
            </tr>
            
            <tr>                
                <td>Name:</td>
                <td colspan="3">
                    <asp:Label ID="lblName" runat="server" Text=""></asp:Label>
                </td>
            </tr>
            
            <tr>
                <td>Address:</td>
                <td>
                    <asp:Label ID="lblAddress" runat="server" Text=""></asp:Label>
                </td>
                <td>MobileNo:</td>
                <td>
                    <asp:Label ID="lblMobNo" runat="server" Text=""></asp:Label>
                </td>
            </tr>
            
            <tr>
                <td colspan="4" style="height:40px;"></td>
            </tr>
            <tr>
                <td align="left" colspan="4">
                    <asp:GridView ID="GridView1" runat="server" Width="487px" 
                        onrowdatabound="GridView1_RowDataBound" ShowFooter="True" 
                        HorizontalAlign="Left" BackColor="White" BorderColor="#DEDFDE" 
                        BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black" 
                        GridLines="Vertical">
                        <FooterStyle BackColor="#CCCC99" />
                        <RowStyle BackColor="#F7F7DE" />
                        <PagerStyle BackColor="#F7F7DE" ForeColor="Black" HorizontalAlign="Right" />
                        <SelectedRowStyle BackColor="#CE5D5A" Font-Bold="True" ForeColor="White" />
                        <HeaderStyle HorizontalAlign="Left" />
                        <AlternatingRowStyle BackColor="White" />
                    </asp:GridView>
                </td>
            </tr>
            
        </table>
    </div>
    </form>
</body>
</html>
