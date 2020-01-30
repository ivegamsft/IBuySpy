<%@ Page Language="c#" CodeBehind="Default.aspx.cs" AutoEventWireup="false" MasterPageFile="~/MainLayout.Master" Inherits="ASPNET.StarterKit.Commerce.CDefault" %>

<%@ Register TagPrefix="ASPNETCommerce" TagName="PopularItems" Src="_PopularItems.ascx" %>
<%@ Register TagPrefix="ASPNETCommerce" TagName="Menu" Src="_Menu.ascx" %>
<%@ Register TagPrefix="ASPNETCommerce" TagName="Header" Src="_Header.ascx" %>

<asp:Content runat="server" ContentPlaceHolderID="Main">
    <asp:Panel ID="OriginalUi" Visible="true" runat="server">
        <table cellspacing="0" cellpadding="0" width="100%">
            <tr>
                <td class="HomeHead">
                    <asp:Label ID="WelcomeMsg" runat="server">Welcome to the ASP.NET Commerce Starter Kit</asp:Label>
                </td>
            </tr>
        </table>
        <table cellspacing="0" cellpadding="2" width="600" border="0">
            <tr valign="top">
                <td>
                    <table width="300">
                        <tr valign="top">
                            <td>
                                <span class="NormalDouble">The Commerce Starter Kit demonstrates how extraordinarily simple
                                it is to create powerful, scalable applications and services for the
                                .NET platform. IBuySpy.com is a fictitious "click and mortar" retailer
                                whose online presence is based on the ASP.NET Commerce Starter Kit.
                                IBuySpy.com is a lighthearted look at the Starter Kit code and capabilities.
                                <br>
                                    <br>
                                </span>
                            </td>
                        </tr>
                    </table>
                </td>
                <td align="left">
                    <img border="0" width="309" src="ProductImages/image.gif" />
                    <br>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="NormalDouble"><i>Blast off in a <a href='ProductDetails.aspx?productID=373'>
                        <b>Pocket Protector Rocket Pack</b></a></i></span>
                </td>
                <td>&nbsp;
                </td>
            </tr>
            <tr valign="top">
                <td>
                    <ASPNETCommerce:PopularItems runat="server" ID="PopularItems" />
                </td>
                <td>
                    <br>
                    <span class="NormalDouble">To give the Commerce Starter Kit a test spin, simply starting
                    browsing and add any items you want to your shopping cart. Click the <b>Documentation</b>
                        link (left) at any point to learn what's going on under the hood.</span>
                </td>
                <td>&nbsp;
                </td>
            </tr>
        </table>
    </asp:Panel>
</asp:Content>

<asp:Content runat="server" ContentPlaceHolderID="MainBody">
    <asp:Panel ID="NewUi" Visible="true" runat="server">
        <div class="jumbotron jumbotron-fluid bg-white align-content-center" style="background-image: url('/images/spyinhat.jpg') !important; background-size: cover; color: black; height: 100%; width: 100%; background-position: center; background-repeat: no-repeat;background-size: auto 100%; position:fixed">
            <div class="container">
                <h1 class="display-2 text-light">Welcome to IBuySpy</h1>
                <div class="row">
                    <div class="col-5">
                        <div class="text-left">
                            <h1 class="display-7 text-light">The most secretive place to shop on the internet</h1>
                            <hr class="small" />
                            <p class="text-light">
                                The Commerce Starter Kit demonstrates how extraordinarily simple it is to create powerful, scalable applications and services for the .NET platform. IBuySpy.com is a fictitious "click and mortar" retailer
                                whose online presence is based on the ASP.NET Commerce Starter Kit. IBuySpy.com is a lighthearted look at the Starter Kit code and capabilities.
                            </p>
                            <br />
                            <br />
                            <br />
                            <p><a class="btn btn-primary btn-lg" href="productslist.aspx?CategoryID=14&selection=0">Start Shopping</a></p>
                            <br />
                            <br />
                            <br />
                            <br />
                            <br />
                            <br />
                            <p class="text-light">Photo by Sergiu Nista on Unsplash</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-lg-8 col-lg-offset-2 col-md-10 col-md-offset-1">
            <ASPNETCommerce:PopularItems runat="server" ID="PopularItems2" />
        </div>
        <asp:Label ID="WelcomeMsg2" runat="server">Welcome to the ASP.NET Commerce Starter Kit</asp:Label>
    </asp:Panel>
</asp:Content>
