<%@ Control Language="c#" CodeBehind="_PopularItems.ascx.cs" AutoEventWireup="false" Inherits="ASPNET.StarterKit.Commerce.C_PopularItems" %>
<%--<%@ OutputCache Duration="3600" VaryByParam="cache" %>--%>

<%--

    This user control displays a list of the most popular items this week.

--%>


<asp:panel ID="OriginalUi" Visible="false" runat="server">
    <table width="95%" cellpadding="0" cellspacing="0" border="0">
    <asp:Repeater ID="productList" runat="server">
        <HeaderTemplate>
            <tr>
                <td class="MostPopularHead">
                    &nbsp;Our most popular items this week
                </td>
            </tr>
        </HeaderTemplate>
        <ItemTemplate>
            <tr>
                <td bgcolor="#d3d3d3">
                    &nbsp;
                    <asp:HyperLink class="MostPopularItemText" NavigateUrl='<%# "ProductDetails.aspx?ProductID=" + DataBinder.Eval(Container.DataItem, "ProductID")%>' Text='<%#DataBinder.Eval(Container.DataItem, "ModelName")%>' runat="server" />
                    <br>
                </td>
            </tr>
        </ItemTemplate>
        <FooterTemplate>
            <tr>
                <td bgcolor="#d3d3d3">
                    &nbsp;
                </td>
            </tr>
        </FooterTemplate>
    </asp:Repeater>
</table>
</asp:panel>

<asp:panel ID="NewUi" Visible="false" runat="server">

<div class="panel panel-default">
    <asp:Repeater ID="productList2" runat="server">
        <HeaderTemplate>
            <div class="panel-heading">
                <h3>Our most popular items this week</h3>
            </div>
            <div class="panel-body">
                <ul class="list-group">
        </HeaderTemplate>
        <ItemTemplate>
            <li class="list-group-item">
                <asp:HyperLink Cssclass="MostPopularItemText" NavigateUrl='<%# "ProductDetails.aspx?ProductID=" + DataBinder.Eval(Container.DataItem, "ProductID")%>' Text='<%#DataBinder.Eval(Container.DataItem, "ModelName")%>' runat="server" /></li>
        </ItemTemplate>
        <FooterTemplate>
                </ul>
             </div>
        </FooterTemplate>
    </asp:Repeater>
</asp:panel>
</div>
