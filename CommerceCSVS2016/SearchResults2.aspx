<%@ Page Title="" Language="C#" MasterPageFile="~/SearchLayout.master" AutoEventWireup="true" CodeBehind="SearchResults2.aspx.cs" Inherits="ASPNET.StarterKit.Commerce.SearchResults2" %>

<asp:Content ID="Content3" ContentPlaceHolderID="MainBody" runat="server">
    <asp:Panel ID="errorPanel" Visible="false" runat="server">
        <div class="row">
            <div class="col-lg-12">
                <asp:Label ID="ErrorMsg2" CssClass="ErrorText" runat="server" />
            </div>
        </div>
    </asp:Panel>
    <asp:Panel ID="resultsPanel" Visible="false" runat="server">
        <!-- Page Heading -->
        <div class="row">
            <div class="col-lg-12">
                <h3 class="page-header">You searched for "<i><asp:Label ID="searchTerm" runat="server"></asp:Label>"</i></h3>
            </div>
        </div>
        <asp:DataList ID="MyList2" RepeatColumns="1" RepeatLayout="Flow" runat="server">
            <ItemTemplate>
                <div class="card mb-3">
                    <div class="row no-gutters">
                        <div class="col-md-4">
                            <a href='ProductDetails.aspx?productID=<%# DataBinder.Eval(Container.DataItem, "ProductID") %>'>
                                <img src='<%# DataBinder.Eval(Container.DataItem, "ProductImage") %>' class="card-img" height="150" border="0"></a>
                            </a>
                        </div>
                        <div class="col-md-8">
                            <div class="card-body">
                                <h5 class="card-title"><%# DataBinder.Eval(Container.DataItem, "UnitCost", "{0:c}") %></h5>
                                <p class="card-text"><a href='ProductDetails.aspx?productID=<%# DataBinder.Eval(Container.DataItem, "ProductID") %>'><%# DataBinder.Eval(Container.DataItem, "ModelName") %></a></p>
                                <p class="card-text"><a class="btn btn-success" href='AddToCart.aspx?productID=<%# DataBinder.Eval(Container.DataItem, "ProductID") %>'>Buy</a></p>
                            </div>
                        </div>
                    </div>
                </div>
            </ItemTemplate>
            <FooterTemplate>
            </FooterTemplate>
        </asp:DataList>
    </asp:Panel>
</asp:Content>
