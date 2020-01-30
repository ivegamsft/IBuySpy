<%@ Page Language="c#" CodeBehind="SearchResults.aspx.cs" AutoEventWireup="false" MasterPageFile="~/MainLayout.Master" Inherits="ASPNET.StarterKit.Commerce.SearchResults" %>

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
                                <td width="25">&nbsp;
                                </td>
                                <td width="100" valign="middle" align="right">
                                    <a href='ProductDetails.aspx?productID=<%# DataBinder.Eval(Container.DataItem, "ProductID") %>'>
                                        <img src='ProductImages/thumbs/<%# DataBinder.Eval(Container.DataItem, "ProductImage") %>' width="100" height="75" />
                                    </a>
                                </td>
                                <td width="200" valign="middle">
                                    <a href='ProductDetails.aspx?productID=<%# DataBinder.Eval(Container.DataItem, "ProductID")%>'>
                                        <span class="ProductListHead">
                                            <%# DataBinder.Eval(Container.DataItem, "ModelName")%>
                                        </span>
                                        <br>
                                    </a>
                                    <span class="ProductListItem"><b>Special Price: </b>
                                        <%# DataBinder.Eval(Container.DataItem, "UnitCost", "{0:c}")%>
                                    </span>
                                    <br>
                                    <a href='AddToCart.aspx?productID=<%# DataBinder.Eval(Container.DataItem, "ProductID")%>'>
                                        <font color="#9D0000"><b>Add To Cart</b></font></a>
                                </td>
                            </tr>
                        </table>
                    </ItemTemplate>
                </asp:DataList>
                <img height="1" width="30" src="Images/1x1.gif">
                <asp:Label ID="ErrorMsg" cssclass="ErrorText" runat="server" />
            </td>
        </tr>
    </table>
</asp:Panel>
</asp:Content>

<asp:Content runat="server" ContentPlaceHolderID="MainBody">
    <asp:Panel ID="NewUi" Visible="false" runat="server">
        <asp:Panel ID="errorPanel" Visible="false" runat="server">
            <div class="row">
                <div class="col-lg-12">
                    <asp:Label ID="ErrorMsg2" cssclass="ErrorText" runat="server" />
                </div>
        </div>
        </asp:Panel>
        <asp:Panel ID="resultsPanel" Visible="false" runat="server">
            <div class="row">
                <div class="col-lg-12">
                    <h4>You searched for "<i><asp:Label ID="searchTerm" runat="server"></asp:Label></i>"</h4>
                </div>
            </div>
            <div class="row">
                <asp:DataList ID="MyList2" RepeatColumns="3" RepeatLayout="Flow" runat="server">
                        <ItemTemplate>
                            <div class="col-sm-4 col-lg-4 col-md-4">
                                <div class="thumbnail">
                                    <a href='ProductDetails.aspx?productID=<%# DataBinder.Eval(Container.DataItem, "ProductID") %>'>
                                        <img src='ProductImages/thumbs/<%# DataBinder.Eval(Container.DataItem, "ProductImage") %>' width="320" height="150" border="0"></a>
                                    <div class="caption">
                                        <h4><a href='ProductDetails.aspx?productID=<%# DataBinder.Eval(Container.DataItem, "ProductID") %>'><%# DataBinder.Eval(Container.DataItem, "ModelName") %></a></h4>
                                        <p class="pull-right"><%# DataBinder.Eval(Container.DataItem, "UnitCost", "{0:c}") %></p>
                                    </div>
                                    <div>
                                        <a class="btn btn-success" href='AddToCart.aspx?productID=<%# DataBinder.Eval(Container.DataItem, "ProductID") %>'>Buy</a>
                                    </div>
                                </div>
                            </div>
                    </ItemTemplate>
                </asp:DataList>
            </div>
        </asp:Panel>
    </asp:Panel>
</asp:Content>

