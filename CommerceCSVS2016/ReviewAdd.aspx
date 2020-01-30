<%@ Page Language="c#" CodeBehind="ReviewAdd.aspx.cs" AutoEventWireup="false" MasterPageFile="~/MainLayout.Master" Inherits="ASPNET.StarterKit.Commerce.ReviewAdd" %>

<%@ Register TagPrefix="ASPNETCommerce" TagName="Header" Src="_Header.ascx" %>
<%@ Register TagPrefix="ASPNETCommerce" TagName="Menu" Src="_Menu.ascx" %>

<asp:Content runat="server" ContentPlaceHolderID="Main">
    <table height="100%" align="left" cellspacing="0" cellpadding="0" width="100%" border="0">
        <tr valign="top">
            <td nowrap>
                <br>
                    <img align="left" width="24" src="images/1x1.gif">
                    <table cellspacing="0" cellpadding="0" width="100%" border="0">
                        <tr>
                            <td class="ContentHead">
                                <img align="left" height="32" width="60" src="images/1x1.gif">Add Review -
                                                <asp:Label ID="ModelName" runat="server" />
                                <br>
                            </td>
                        </tr>
                    </table>
                    <br>
                    <img align="left" width="92" src="Images/1x1.gif">
                    <table width="500" border="0">
                        <tr valign="top">
                            <td>
                                <table border="0">
                                    <tr>
                                        <td valign="top" width="550">
                                            <span class="NormalBold">Name</span>
                                            <br>
                                            <asp:TextBox size="20" ID="Name" runat="server" />
                                            <asp:RequiredFieldValidator ControlToValidate="Name" Display="Dynamic" Font-Name="verdana" Font-Size="9pt" ErrorMessage="'Name' must not be left blank." runat="server" ID="RequiredFieldValidator1"></asp:RequiredFieldValidator>
                                            <br>
                                            <br>
                                            <span class="NormalBold">Email</span>
                                            <br>
                                            <asp:TextBox ID="Email" size="20" runat="server" />
                                            <asp:RequiredFieldValidator ControlToValidate="Email" Display="Dynamic" Font-Name="verdana" Font-Size="9pt" ErrorMessage="'Email' must not be left blank." runat="server" ID="RequiredFieldValidator2"></asp:RequiredFieldValidator>
                                            <br>
                                            <br>
                                            <span class="NormalBold">Rating</span>
                                            <br>
                                            <br>
                                            <asp:RadioButtonList ID="Rating" runat="server">
                                                <asp:ListItem Text="Five" Value="5" Selected="True">
                                                                    <img src="Images/reviewrating5.gif"></asp:ListItem>
                                                <asp:ListItem Text="Four" Value="4">
                                                                    <img src="Images/reviewrating4.gif"></asp:ListItem>
                                                <asp:ListItem Text="Three" Value="3">
                                                                    <img src="Images/reviewrating3.gif"></asp:ListItem>
                                                <asp:ListItem Text="Two" Value="2">
                                                                    <img src="Images/reviewrating2.gif"></asp:ListItem>
                                                <asp:ListItem Text="One" Value="1">
                                                                    <img src="Images/reviewrating1.gif"></asp:ListItem>
                                            </asp:RadioButtonList>
                                        </td>
                                    </tr>
                                </table>
                                <br>
                                <br>
                                <span class="NormalBold">Comments</span>
                                <br>
                                <asp:TextBox ID="Comment" TextMode="multiline" Rows="7" Columns="60" runat="server" />
                                <asp:RequiredFieldValidator ControlToValidate="Comment" Display="Dynamic" Font-Name="verdana" Font-Size="9pt" ErrorMessage="'Comment' must not be left blank." runat="server" ID="RequiredFieldValidator3"></asp:RequiredFieldValidator>
                                <br>
                                <br>
                                <asp:ImageButton ImageUrl="images/submit.gif" runat="server" ID="ReviewAddBtn" />
                                <br>
                                <br>
                                <br>
                            </td>
                        </tr>
                    </table>
            </td>
        </tr>
    </table>
</asp:Content>
