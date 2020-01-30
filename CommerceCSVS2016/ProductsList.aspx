<%@ Page Language="c#" EnableViewState="false" CodeBehind="ProductsList.aspx.cs" MasterPageFile="~/MainLayout.Master" AutoEventWireup="false" Inherits="ASPNET.StarterKit.Commerce.ProductsList" %>

<%@ Import Namespace="ASPNET.StarterKit.Commerce.AzureFeatures" %>
<%@ Import Namespace="IBuySpyCommon" %>

<%--<%@ OutputCache Duration="6000" VaryByParam="CategoryID" %>--%>
<%@ Register TagPrefix="ASPNETCommerce" TagName="Header" Src="_Header.ascx" %>
<%@ Register TagPrefix="ASPNETCommerce" TagName="Menu" Src="_Menu.ascx" %>

<asp:Content runat="server" ContentPlaceHolderID="Main">
    <asp:Panel ID="OriginalUi" Visible="true" runat="server">
        <table height="100%" align="left" cellspacing="0" cellpadding="0" width="100%" border="0">
            <tr valign="top">
                <td nowrap>
                    <br>
                    <asp:DataList ID="MyList" RepeatColumns="2" runat="server">
                        <ItemTemplate>
                            <table border="0" width="300">
                                <tr>
                                    <td width="25">&nbsp
                                    </td>
                                    <td width="100" valign="middle" align="right">
                                        <a href='ProductDetails.aspx?productID=<%# DataBinder.Eval(Container.DataItem, "ProductID") %>'>
                                            <img src='ProductImages/thumbs/<%# DataBinder.Eval(Container.DataItem, "ProductImage") %>' width="100" height="75" border="0">
                                        </a>
                                    </td>
                                    <td width="200" valign="middle">
                                        <a href='ProductDetails.aspx?productID=<%# DataBinder.Eval(Container.DataItem, "ProductID") %>'>
                                            <span class="ProductListHead">
                                                <%# DataBinder.Eval(Container.DataItem, "ModelName") %>
                                            </span>
                                            <br>
                                        </a><span class="ProductListItem"><b>Special Price: </b>
                                            <%# DataBinder.Eval(Container.DataItem, "UnitCost", "{0:c}") %>
                                        </span>
                                        <br>
                                        <a href='AddToCart.aspx?productID=<%# DataBinder.Eval(Container.DataItem, "ProductID") %>'>
                                            <span class="ProductListItem"><font color="#9D0000"><b>Add To Cart<b></font></span>
                                        </a>
                                    </td>
                                </tr>
                            </table>
                        </ItemTemplate>
                    </asp:DataList>
                </td>
            </tr>
        </table>
    </asp:Panel>
</asp:Content>

<asp:Content runat="server" ContentPlaceHolderID="MainBody">
    <asp:Panel ID="NewUi" Visible="false" runat="server">
        <div class="row">
            <div class="card-columns">
                <asp:DataList ID="MyList2" RepeatColumns="3" RepeatLayout="Flow" runat="server">
                    <ItemTemplate>
                        <div class="card">
                            <a href='ProductDetails.aspx?productID=<%# DataBinder.Eval(Container.DataItem, "ProductID") %>'>
                                <img src='<%# IBuySpyFeatures.BuildProductImageUrl(Eval("ProductImage").ToString(), IBuySpyCommon.RuntimeConstants.ImageSize.Medium) %>' class="img-fluid card-img-top" border="0" style="height: 200px; width: 200px; display: block; align-content: center" />
                            </a>
                            <div class="card-body">
                                <h5 class="card-title"><%# DataBinder.Eval(Container.DataItem, "UnitCost", "{0:c}") %></h5>
                                <p class="card-text"><a href='ProductDetails.aspx?productID=<%# DataBinder.Eval(Container.DataItem, "ProductID") %>'><%# DataBinder.Eval(Container.DataItem, "ModelName") %></a></p>
                                <a class="btn btn-success" href='AddToCart.aspx?productID=<%# DataBinder.Eval(Container.DataItem, "ProductID") %>'>Buy</a>
                            </div>
                        </div>
                    </ItemTemplate>
                </asp:DataList>
            </div>
        </div>
    </asp:Panel>
</asp:Content>
