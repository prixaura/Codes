<%@ Page Language="C#" MasterPageFile="~/Admin/AdminMasterPage.master" AutoEventWireup="true" CodeFile="Bill.aspx.cs" Inherits="Admin_Bill" Title="Untitled Page" %>

<%--<%@ Register assembly="CrystalDecisions.Web, Version=10.5.3700.0, Culture=neutral, PublicKeyToken=692fbea5521e1304" namespace="CrystalDecisions.Web" tagprefix="CR" %>--%>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

    <script language="javascript" type="text/javascript">

        function openNewWin(url) 
        {
            var x = window.open(url, 'mynewwin', 'width=600,height=400,toolbar=1');

            x.focus();
        }
        
</script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    


    <table width="550px" align="center">    
        <tr>
            <td>
                <fieldset>
                    <legend>Generate invoice</legend>
                        <table align="center" width="">
                            <tr>
                                <td>Select Challan No:</td>
                                <td>
                                    <asp:DropDownList ID="ddlChallanNo" runat="server">
                                    </asp:DropDownList>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                                        ControlToValidate="ddlChallanNo" Display="Dynamic" 
                                        ErrorMessage="Select Challan No" InitialValue="--select--"></asp:RequiredFieldValidator>
                                </td>
                                <td>
                                    <asp:Button ID="btnGenerate" runat="server" Text="Generate Bill" 
                                        onclick="btnGenerate_Click" />
                                </td>
                            </tr>
                        </table>
                </fieldset>
            </td>
           
        </tr>
    </table>

    <table border="1" align="center" style="width:300px; height:50px;">
        <tr>
            <td valign="top" align="center">
                <fieldset>
                    <legend>Print Bill</legend>
                    <asp:Label ID="lblBillNo" runat="server"></asp:Label>
                    <br /><br /><br />
                    <asp:Button ID="btnPrint" runat="server" Text="Print" onclick="btnPrint_Click" 
                        CausesValidation="False" />
                </fieldset>
            </td>
        </tr>
    </table>
</asp:Content>

