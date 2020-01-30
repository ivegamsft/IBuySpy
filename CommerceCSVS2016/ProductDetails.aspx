<%@ Page Language="c#" EnableViewState="false" CodeBehind="ProductDetails.aspx.cs" MasterPageFile="~/MainLayout.Master" AutoEventWireup="false" Inherits="ASPNET.StarterKit.Commerce.ProductDetailsPage" %>

<%@ Register TagPrefix="ASPNETCommerce" TagName="Header" Src="_Header.ascx" %>
<%@ Register TagPrefix="ASPNETCommerce" TagName="Menu" Src="_Menu.ascx" %>
<%@ Register TagPrefix="ASPNETCommerce" TagName="AlsoBought" Src="_AlsoBought.ascx" %>
<%@ Register TagPrefix="ASPNETCommerce" TagName="ReviewList" Src="_ReviewList.ascx" %>
<%--<%@ OutputCache Duration="60" VaryByParam="ProductID" %>--%>

<asp:Content runat="server" ContentPlaceHolderID="Main">
    <asp:Panel ID="OriginalUi" Visible="true" runat="server">
        <table width="100%" border="0" cellspacing="0" cellpadding="0">
            <tr>
                <td class="ContentHead">
                    <img height="32" src="images/1x1.gif" align="left"><asp:Label ID="ModelName" runat="server" />
                    <br>
                </td>
            </tr>
        </table>
        <table width="100%" border="0" cellspacing="0" cellpadding="0" valign="top">
            <tbody>
                <tr valign="top">
                    <td rowspan="2">
                        <img width="24" height="1" src="images/1x1.gif">
                    </td>
                    <td width="309">
                        <img height="15" src="images/1x1.gif">
                        <br>
                        <asp:Image ID="ProductImage" runat="server" Height="185" Width="309" border="0" />
                        <br>
                        <br>
                        <img height="20" src="images/1x1.gif" width="72"><span class="UnitCost"><b>Your Price:</b>&nbsp;<asp:Label ID="UnitCost" runat="server" /></span>
                        <br>
                        <img height="20" src="images/1x1.gif" width="72"><span class="ModelNumber"><b>Model Number:</b>&nbsp;<asp:Label ID="ModelNumber" runat="server" /></span>
                        <br>
                        <img height="30" src="images/1x1.gif" width="72"><asp:HyperLink ID="addToCart" runat="server" ImageUrl="images/add_to_cart.gif" />
                    </td>
                    <td>
                        <table width="300" border="0">
                            <tbody>
                                <tr>
                                    <td valign="top">
                                        <asp:Label class="NormalDouble" ID="desc" runat="server"></asp:Label>
                                        <br>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                        <img height="1" src="images/1x1.gif">
                        <ASPNETCommerce:AlsoBought ID="AlsoBoughtList" runat="server" />
                    </td>
                </tr>
                <tr>
                </tr>
            </tbody>
        </table>
        <table border="0">
            <tbody>
                <tr>
                    <td>
                        <img width="89" height="20" src="images/1x1.gif">
                    </td>
                    <td width="100%">
                        <br>
                        <br>
                        <ASPNETCommerce:ReviewList ID="ReviewList" runat="server" />
                    </td>
                </tr>
            </tbody>
        </table>
    </asp:Panel>
</asp:Content>

<asp:Content ContentPlaceHolderID="MainBody" runat="server">
    <asp:Panel ID="NewUi" Visible="false" runat="server">
        <div class="card">
            <asp:Image ID="ProductImage2" runat="server" CssClass="" Height="340" />
            <div class="card-body">
                <h5 class="card-title">
                    <asp:Label ID="ModelName2" runat="server" />
                    -
                            <asp:Label ID="UnitCost2" runat="server" /></h5>
                <p>Model Number:&nbsp;<asp:Label ID="ModelNumber2" runat="server" /></p>
                <p class="card-text">
                    <asp:Label ID="desc2" runat="server"></asp:Label>
                </p>
                <p class="card-text">
                    <asp:HyperLink ID="addToCart2" runat="server" CssClass="btn btn-success">Buy</asp:HyperLink>
                </p>
            </div>
        </div>
        <ASPNETCommerce:ReviewList ID="ReviewList2" runat="server" />
        <div class="ratings">
            <ASPNETCommerce:AlsoBought ID="AlsoBoughtList2" runat="server" />
        </div>

    </asp:Panel>
</asp:Content>
