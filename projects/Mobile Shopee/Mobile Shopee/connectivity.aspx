﻿<%@ Page Language="C#" AutoEventWireup="true"  CodeFile="connectivity.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Untitled Page</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        
        <asp:DropDownList ID="DropDownList1" runat="server" 
            DataSourceID="SqlDataSource1" DataTextField="UserId" DataValueField="UserId">
        </asp:DropDownList>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:sales_invoiceConnectionString %>" 
            SelectCommand="SELECT [UserId] FROM [AdminLogin]"></asp:SqlDataSource>
        
    </div>
    </form>
</body>
</html>
