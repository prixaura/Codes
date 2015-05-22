<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
    </div>
    <asp:ListBox ID="ListBox1" runat="server" 
        style="top: 37px; left: 558px; position: absolute; height: 311px; width: 203px; margin-top: 0px">
    </asp:ListBox>
    <asp:ListBox ID="ListBox2" runat="server" AutoPostBack="True" 
        onselectedindexchanged="ListBox2_SelectedIndexChanged" 
        style="top: 34px; left: 10px; position: absolute; height: 328px; width: 185px">
    </asp:ListBox>
    </form>
</body>
</html>
