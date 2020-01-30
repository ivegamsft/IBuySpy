<%@ Control Language="c#" CodeBehind="_Menu.ascx.cs" AutoEventWireup="false" Inherits="ASPNET.StarterKit.Commerce.C_Menu" %>
<%--<%@ OutputCache Duration="3600" VaryByParam="selection" %>--%>

<%--

    This user control creates a menu of all product categories
    in the database.  This forms the left-hand navigation of the
    product catalog pages.

--%>
<asp:Panel ID="OriginalUi" Visible="true" runat="server">
    <div><a href="default.aspx">
        <img src="images/logo.gif" border="0"></a></div>
    <div>
        <ul class="nav nav-sidebar">
            <asp:DataList ID="MyList" runat="server" RepeatLayout="Flow" EnableViewState="false">
                <ItemTemplate>
                    <li>
                        <asp:HyperLink CssClass="MenuUnselected" ID="HyperLink1" Text='<%# DataBinder.Eval(Container.DataItem, "CategoryName") %>' NavigateUrl='<%# "productslist.aspx?CategoryID=" + DataBinder.Eval(Container.DataItem, "CategoryID") + "&selection=" + Container.ItemIndex %>' runat="server" /></li>
                </ItemTemplate>
                <SelectedItemTemplate>
                    <li class="active">
                        <asp:HyperLink CssClass="MenuSelected" ID="HyperLink2" Text='<%# DataBinder.Eval(Container.DataItem, "CategoryName") %>' NavigateUrl='<%# "productslist.aspx?CategoryID=" + DataBinder.Eval(Container.DataItem, "CategoryID") + "&selection=" + Container.ItemIndex %>' runat="server" /></li>
                </SelectedItemTemplate>
            </asp:DataList>
        </ul>
    </div>
    <div>
        <a href="docs/docs.htm" target="_blank" class="SiteLink">Commerce Starter Kit<br>
            Documentation</a>
    </div>
</asp:Panel>

<asp:Panel ID="NewUi" Visible="true" runat="server">
    <div class="list-group">
        <asp:Repeater ID="MyList2" runat="server">
            <ItemTemplate>
                <asp:HyperLink CssClass="list-group-item" ID="HyperLink1" Text='<%# DataBinder.Eval(Container.DataItem, "CategoryName") %>' NavigateUrl='<%# "productslist.aspx?CategoryID=" + DataBinder.Eval(Container.DataItem, "CategoryID") + "&selection=" + Container.ItemIndex %>' runat="server" />
            </ItemTemplate>
        </asp:Repeater>
    </div>
</asp:Panel>