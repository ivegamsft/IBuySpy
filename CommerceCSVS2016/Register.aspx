<%@ Register TagPrefix="ASPNETCommerce" TagName="Header" Src="_Header.ascx" %>
<%@ Register TagPrefix="ASPNETCommerce" TagName="Menu" Src="_Menu.ascx" %>

<%@ Page Language="c#" CodeBehind="Register.aspx.cs" AutoEventWireup="false" Inherits="ASPNET.StarterKit.Commerce.Register" MasterPageFile="~/MainLayout.Master" %>

<asp:Content runat="server" ContentPlaceHolderID="Main">
    <asp:Panel ID="OriginalUi" Visible="true" runat="server">
        <table height="100%" align="left" cellspacing="0" cellpadding="0" width="100%" border="0">
            <tr valign="top">
                <td nowrap>
                    <br>
                    <img align="left" width="24" height="1" src="images/1x1.gif">
                    <table cellspacing="0" cellpadding="0" width="100%" border="0">
                        <tr>
                            <td class="ContentHead">
                                <img align="left" height="32" width="60" src="images/1x1.gif">Create a New Account
                                        <br>
                            </td>
                        </tr>
                    </table>
                    <img align="left" height="1" width="92" src="images/1x1.gif">
                    <asp:Label ID="MyError" CssClass="ErrorText" EnableViewState="false" runat="Server" />
                    <table height="100%" cellspacing="0" cellpadding="0" width="500" border="0">
                        <tr valign="top">
                            <td width="550">
                                <br>
                                <br>
                                <span class="NormalBold">Full Name</span>
                                <br>
                                <asp:TextBox size="25" ID="Name" runat="server" />
                                &nbsp;
                                        <asp:RequiredFieldValidator ControlToValidate="Name" Display="dynamic" Font-Name="verdana" Font-Size="9pt" ErrorMessage="'Name' must not be left blank." runat="server" ID="RequiredFieldValidator1"></asp:RequiredFieldValidator>
                                <br>
                                <br>
                                <span class="NormalBold">Email</span>
                                <br>
                                <asp:TextBox size="25" ID="Email" runat="server" />
                                &nbsp;
                                        <asp:RegularExpressionValidator ControlToValidate="Email" ValidationExpression="[\w\.-]+(\+[\w-]*)?@([\w-]+\.)+[\w-]+" Display="Dynamic" Font-Name="verdana" Font-Size="9pt" ErrorMessage="Must use a valid email address." runat="server" ID="RegularExpressionValidator1"></asp:RegularExpressionValidator>
                                <asp:RequiredFieldValidator ControlToValidate="Email" Display="dynamic" Font-Name="verdana" Font-Size="9pt" ErrorMessage="'Email' must not be left blank." runat="server" ID="RequiredFieldValidator2"></asp:RequiredFieldValidator>
                                <br>
                                <br>
                                <span class="NormalBold">Password</span>
                                <br>
                                <asp:TextBox size="25" ID="Password" TextMode="Password" runat="server" />
                                &nbsp;
                                        <asp:RequiredFieldValidator ControlToValidate="Password" Display="dynamic" Font-Name="verdana" Font-Size="9pt" ErrorMessage="'Password' must not be left blank." runat="server" ID="RequiredFieldValidator3"></asp:RequiredFieldValidator>
                                <br>
                                <br>
                                <span class="NormalBold">Confirm Password</span>
                                <br>
                                <asp:TextBox size="25" ID="ConfirmPassword" TextMode="Password" runat="server" />
                                &nbsp;
                                        <asp:RequiredFieldValidator ControlToValidate="ConfirmPassword" Display="dynamic" Font-Name="verdana" Font-Size="9pt" ErrorMessage="'Confirm' must not be left blank." runat="server" ID="RequiredFieldValidator4"></asp:RequiredFieldValidator>
                                <asp:CompareValidator ControlToValidate="ConfirmPassword" ControlToCompare="Password" Display="Dynamic" Font-Name="verdana" Font-Size="9pt" ErrorMessage="Password fields do not match." runat="server" ID="CompareValidator1"></asp:CompareValidator>
                                <br>
                                <br>
                                <asp:ImageButton ID="RegisterBtn" ImageUrl="images/submit.gif" runat="server" />
                                <br>
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
            <h4>Create a New Account</h4>
            <div class="row">
                <div class="col-12 pt-4 pb-4">
                    <asp:Label ID="MyError2" CssClass="text-danger" EnableViewState="false" runat="Server" />
                </div>
            </div>
            <div class="row">
                <div class="col-8">
                    <div class="form-group">
                        <label for="Name2">Full Name</label>
                        <asp:TextBox ID="Name2" CssClass="form-control" runat="server" />
                        <asp:RequiredFieldValidator ControlToValidate="Name2" Display="dynamic" CssClass="text-danger" ErrorMessage="'Name' must not be left blank." runat="server" ID="RequiredFieldValidator7"></asp:RequiredFieldValidator>
                    </div>
                    <div class="form-group">
                        <label for="Email2">Email</label>
                        <asp:TextBox ID="Email2" ClientIDMode="Static" runat="server" CssClass="form-control" />&nbsp;
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" ControlToValidate="Email2" Display="dynamic" CssClass="text-danger" ErrorMessage="'Name' must not be left blank." runat="server" />
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator2" ControlToValidate="email2" ValidationExpression="[\w\.-]+(\+[\w-]*)?@([\w-]+\.)+[\w-]+" Display="Dynamic" ErrorMessage="Must use a valid email address." CssClass="text-danger" runat="server" />
                    </div>
                    <div class="form-group">
                        <label for="Password2">Password</label>
                        <asp:TextBox ID="Password2" TextMode="password" size="25" runat="server" ClientIDMode="Static" CssClass="form-control" />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator6" ControlToValidate="password2" Display="Static" CssClass="text-danger" ErrorMessage="'Password' must not be left blank." runat="server" />
                    </div>
                    <div class="form-group">
                        <label for="ConfirmPassword2">Confirm Password</label>
                        <asp:TextBox ID="ConfirmPassword2" TextMode="password" size="25" runat="server" ClientIDMode="Static" CssClass="form-control" />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator8" ControlToValidate="ConfirmPassword2" Display="Static" CssClass="text-danger" ErrorMessage="'Confirm Password' must not be left blank." runat="server" />
                        <asp:CompareValidator ControlToValidate="ConfirmPassword2" ControlToCompare="Password2" Display="Dynamic" CssClass="text-danger" ErrorMessage="Password fields do not match." runat="server" ID="CompareValidator2"></asp:CompareValidator>
                    </div>
                    <div class="form-group">
                        <asp:Button ID="RegisterBtn2" runat="server" CssClass="btn btn-primary" Text="Register" />
                    </div>
                </div>
            </div>
        </asp:Panel>
</asp:Content>
