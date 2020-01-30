<%@ Control CodeBehind="_Header.ascx.cs" Language="c#" AutoEventWireup="true" Inherits="ASPNET.StarterKit.Commerce.C_Header" %>
<%--

    This user control form the header for each page in the Commerce Starter Kit.

--%>

<asp:Panel ID="OriginalUi" Visible="true" runat="server">
    <table cellspacing="0" cellpadding="0" width="100%" border="0">
        <tr>
            <td colspan="2" background="images/grid_background.gif" nowrap>
                <table cellspacing="0" cellpadding="0" width="100%" border="0">
                    <tr>
                        <td colspan="2">
                            <img src="images/most_secretive_place.gif">
                        </td>
                        <td align="right">
                            <table cellpadding="0" cellspacing="0" border="0">
                                <tr valign="top">
                                    <td align="center" width="65">
                                        <a href="Login.aspx" class="SiteLinkBold">
                                            <img src="images/sign_in.gif" border="0">
                                            Sign In</a>
                                    </td>
                                    <td align="center" width="75">
                                        <a href="OrderList.aspx" class="SiteLinkBold">
                                            <img src="images/account.gif" border="0">
                                            Account</a>
                                    </td>
                                    <td align="center" width="55">
                                        <a href="ShoppingCart.aspx" class="SiteLinkBold">
                                            <img src="images/cart.gif" border="0">
                                            Cart</a>
                                    </td>
                                    <td align="center" width="65">
                                        <a href="InstantOrder.asmx" class="SiteLinkBold">
                                            <img src="images/services.gif" border="0">
                                            Services</a>
                                    </td>
                            </table>
                        </td>
                        <td width="10">&nbsp;
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <table cellspacing="0" cellpadding="0" width="100%" border="0">
                    <tr bgcolor="#9D0000">
                        <td background="images/modernliving_bkgrd.gif">
                            <img align="left" src="images/modernliving.gif">
                        </td>
                        <td width="94" align="right" bgcolor="#9D0000">
                            <img src="images/search.gif">
                        </td>
                        <td width="120" align="right" bgcolor="#9D0000">
                            <asp:TextBox ID="SearchText" runat="server" />
                        </td>
                        <td align="left" bgcolor="#9D0000">&nbsp;<asp:ImageButton runat="server" ID="searchButton" ImageUrl="images/arrowbutton.gif" Height="20px" OnClick="searchBtn_Click" />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
</asp:Panel>

<asp:Panel ID="NewUi" Visible="false" runat="server">
    <div class="container">
        <nav class="navbar navbar-expand-lg">
            <a href="../" class="navbar-brand">IBuySpy</a>
            <button type="button" class="navbar-toggler" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
                <span class="navbar-toggler-icon"></span>
            </button>

            <div id="navbar" class="collapse navbar-collapse">
                <ul class="navbar-nav mr-auto">
                    <li class="nav-item active"><a class="nav-link SiteLinkBold" href="/">Home</a></li>
                    <li class="nav-item"><a href="OrderList.aspx" class="nav-link SiteLinkBold">Account</a></li>
                    <li class="nav-item"><a href="ShoppingCart.aspx" class="nav-link SiteLinkBold">Cart</a></li>
                    <li class="nav-item">
                        <asp:HyperLink ID="login2" runat="server" AlternateText="Sign In" NavigateUrl="Login.aspx" CssClass="nav-link">Sign in</asp:HyperLink></li>
                </ul>
                <div class="form-inline">
                    <div class="input-group">
                        <asp:TextBox AutoCompleteType="Search" ID="SearchText2" runat="server" CssClass="form-control form-control-sm" TextMode="SingleLine"></asp:TextBox>
                        <div class="input-group-btn">
                            <asp:Button ID="searchBtn" CssClass="btn" runat="server" Text="Search" OnClick="searchBtn_Click"></asp:Button>
                        </div>
                    </div>
                </div>
            </div>
        </nav>
    </div>
</asp:Panel>
