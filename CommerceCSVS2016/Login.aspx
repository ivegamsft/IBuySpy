<%@ Page Language="c#" CodeBehind="Login.aspx.cs" AutoEventWireup="false" Inherits="ASPNET.StarterKit.Commerce.Login" MasterPageFile="~/MainLayout.Master" %>

<%@ Register TagPrefix="ASPNETCommerce" TagName="Header" Src="_Header.ascx" %>
<%@ Register TagPrefix="ASPNETCommerce" TagName="Menu" Src="_Menu.ascx" %>

<asp:Content runat="server" ContentPlaceHolderID="Main">
    <asp:Panel ID="OriginalUi" Visible="true" runat="server">
        <table height="100%" align="left" cellspacing="0" cellpadding="0" width="100%" border="0">
            <tr valign="top">
                <td>
                    <br>
                    <img align="left" width="24" height="1" src="images/1x1.gif">
                    <table cellspacing="0" cellpadding="0" width="100%" border="0">
                        <tr>
                            <td class="ContentHead">
                                <img align="left" height="32" width="60" src="images/1x1.gif">Sign Into Your Account
                                        <br>
                            </td>
                        </tr>
                    </table>
                    <img align="left" height="1" width="92" src="images/1x1.gif">
                    <table height="100%" cellspacing="0" cellpadding="0" border="0">
                        <tr valign="top">
                            <td width="550">
                                <asp:Label ID="Message" class="ErrorText" runat="server" />
                                <br>
                                <br>
                                &nbsp;<span class="NormalBold">Email</span>
                                <br>
                                &nbsp;<asp:TextBox size="25" ID="email" runat="server" />&nbsp;
                                        <asp:RequiredFieldValidator ID="emailRequired" ControlToValidate="email" Display="dynamic" Font-Name="verdana" Font-Size="9pt" ErrorMessage="'Name' must not be left blank." runat="server" />
                                <asp:RegularExpressionValidator ID="emailValid" ControlToValidate="email" ValidationExpression="[\w\.-]+(\+[\w-]*)?@([\w-]+\.)+[\w-]+" Display="Dynamic" ErrorMessage="Must use a valid email address." runat="server" />
                                <br>
                                <br>
                                &nbsp;<span class="NormalBold">Password</span>
                                <br>
                                &nbsp;<asp:TextBox ID="password" TextMode="password" size="25" runat="server" />&nbsp;
                                        <asp:RequiredFieldValidator ID="passwordRequired" ControlToValidate="password" Display="Static" Font-Name="verdana" Font-Size="9pt" ErrorMessage="'Password' must not be left blank." runat="server" />
                                <br>
                                <br>
                                <asp:CheckBox ID="RememberLogin" runat="server" />
                                <span class="NormalBold">Remember My Sign-In Across Browser Restarts</span>
                                <br>
                                <br>
                                <br>
                                <asp:ImageButton ID="LoginBtn" ImageUrl="images/sign_in_now.gif" runat="server" />
                                <br>
                                <br>
                                <span class="Normal">&nbsp;If you are a new user and you don't have an account with the Commerce Starter Kit, then register for one now.</span>
                                <br>
                                <br>
                                <a href="register.aspx">
                                    <img border="0" src="images/register.gif"></a>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
    </asp:Panel>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="MainBody">
    <asp:Panel ID="NewUi" Visible="false" runat="server">
        <h4>Sign Into Your Account</h4>
        <div class="row">
            <div class="col-12 pt-4 pb-4">
                <asp:Label ID="Message2" class="text-danger" runat="server" />
            </div>
        </div>
        <div class="row">
            <div class="col-8">
                <div class="form-group">
                    <label for="email2">Email address</label>
                    <asp:TextBox ID="email2" ClientIDMode="Static" runat="server" CssClass="form-control" />&nbsp;
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ControlToValidate="email2" Display="dynamic" CssClass="text-danger" ErrorMessage="'Name' must not be left blank." runat="server" />
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" ControlToValidate="email2" ValidationExpression="[\w\.-]+(\+[\w-]*)?@([\w-]+\.)+[\w-]+" Display="Dynamic" ErrorMessage="Must use a valid email address." CssClass="text-danger" runat="server" />
                </div>
                <div class="form-group">
                    <label for="password2">Password</label>
                    <asp:TextBox ID="password2" TextMode="password" size="25" runat="server" ClientIDMode="Static" CssClass="form-control" />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" ControlToValidate="password2" Display="Static" CssClass="text-danger" ErrorMessage="'Password' must not be left blank." runat="server" />
                </div>
                <div class="form-group form-check">
                    <asp:CheckBox ID="RememberLogin2" runat="server" ClientIDMode="Static" CssClass="form-check-input" />
                    <label class="form-check-label" for="RememberLogin2">Remember My Sign-In Across Browser Restarts</label>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-8">
                <asp:Button ID="LoginBtn2" CssClass="btn btn-primary" runat="server" Text="Sign in" />
            </div>
        </div>
        <div class="row">
            <div class="col-8">
                <p class="pt-5">If you are a new user and you don't have an account with the Commerce Starter Kit, then <a href="register.aspx">register</a> for one now.</p>
            </div>
        </div>
    </asp:Panel>
</asp:Content>
