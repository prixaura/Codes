<%@ Page Language="C#" MasterPageFile="~/Admin/AdminMasterPage.master" AutoEventWireup="true" CodeFile="DailyPurchaseReport.aspx.cs" Inherits="Admin_Reprt_DailyPurchaseReport" Title="Untitled Page" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table align="center" style="width:500px;">
        <tr>
            <td align="center">
                <fieldset>
                    <legend>Daily Purchase Report</legend>
                        <table align="center">
                        
                            <tr>
                                <td>Select Date:</td>
                                <td>
                                    <asp:TextBox ID="txtDate" runat="server"></asp:TextBox>
                                    <cc1:CalendarExtender ID="CalendarExtender1" runat="server" TargetControlID="txtDate" PopupButtonID="txtDate" Format="dd-MMM-yyyy">
                                    </cc1:CalendarExtender>
                                </td>
                                <td>
                                    <asp:Button ID="btnShow" runat="server" Text="Show Report" onclick="btnShow_Click" 
                                       />
                                </td>
                            </tr>            
                        </table>
                </fieldset>
            </td>
        </tr>
    </table>
    
     <table align="center" style="width:500px;height:300px;">
         <tr>
            <td valign="top" align="center">
                <fieldset style="width:400px;height:300px;">
                    <legend>Details Report</legend>
                        <br />
                        <asp:Label ID="lblMsg" runat="server" Visible="false" ForeColor="Red" Font-Bold="true" Text="No Records Found"></asp:Label>                        
                        <br />
                         <asp:GridView ID="gvPurchase" runat="server" 
                        BackColor="#DEBA84" BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" 
                        CellPadding="3" CellSpacing="2" GridLines="None">
                             <FooterStyle BackColor="#F7DFB5" ForeColor="#8C4510" />
                             <RowStyle BackColor="#FFF7E7" ForeColor="#8C4510" />
                            
                             <PagerStyle ForeColor="#8C4510" HorizontalAlign="Center" />
                             <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="White" />
                             <HeaderStyle BackColor="#A55129" Font-Bold="True" ForeColor="White" />
                        </asp:GridView>
                </fieldset>
                
            </td>
        </tr>         
    </table>
</asp:Content>

