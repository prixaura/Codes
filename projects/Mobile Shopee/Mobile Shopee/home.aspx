<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="home.aspx.cs" Inherits="home" Title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<br /><br /><br />
    <table align="center">
        <tr>
            <td align="center">
                <asp:Panel ID="pnlMain" runat="server" CssClass="modalPopup">
                    <asp:Panel ID="Panel4" runat="server" Style="cursor: move;background-color:Yellow; border:solid 1px Black;color:Red" Height="30px">
                        <div style="text-align:center;">
                        <table>
                            <tr>                                
                                <td align="center" valign="top" style="width:230px;">
                                    
                                    <asp:Label ID="lblMsg" runat="server" ForeColor="Red" 
                                       Font-Size="18px" Font-Bold="True" Visible="False">
                                    </asp:Label>
                                       
                                   <asp:Label ID="lblLogin" runat="server" ForeColor="Red" 
                                        Font-Size="18px" Font-Bold="True" Text="Login">
                                    </asp:Label>
                                  
                                </td> 
                            </tr>
                        </table>
                            
                        </div>
                    </asp:Panel>
                    
                        <div>                    
                            <table align="center">
                                <tr>
                                    <td>Username:</td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:TextBox ID="txtUsername" runat="server" Width="150px"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td>Password:</td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:TextBox ID="txtPassword" runat="server" Width="150px" TextMode="Password"></asp:TextBox>
                                    </td>
                                </tr>
                            </table>
                            
                            <p style="text-align: center; background-color:;">      
                                
                                <asp:Button ID="btnSignin" runat="server" Text="Signin" Width="70px" BackColor="#ff9900" 
                                    BorderWidth="1px" BorderStyle="Groove" BorderColor="Maroon" onclick="btnSignin_Click" Font-Bold="True" />
                                <asp:Button ID="btnReset" runat="server" Text="Reset" Width="70px" BackColor="#ff9900" 
                                    BorderWidth="1px" BorderStyle="Groove" BorderColor="Maroon" 
                                    onclick="btnReset_Click" Font-Bold="True" />
                            </p>
                        </div>
                    </asp:Panel>
            </td>
            
        </tr>
        
       <%-- <tr>
          
            <td style="width:50px;" align="center">
            
                <asp:Image ID="Image3" runat="server" ImageUrl="~/images/5.jpg" Width="370px" 
                    Height="200px" />        
            
            </td>
        </tr>     --%>   
        </table>  
</asp:Content>
