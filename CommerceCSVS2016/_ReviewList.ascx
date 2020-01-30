<%@ Control Language="c#" CodeBehind="_ReviewList.ascx.cs" AutoEventWireup="true" Inherits="ASPNET.StarterKit.Commerce.C_ReviewList" %>

<%--

    This user control display a list of review for a specific product.

--%>

<br>
<br>
<asp:Panel ID="OriginalUi" Visible="true" runat="server">
    <table cellspacing="0" cellpadding="0" width="100%" border="0">
        <tr>
            <td class="SubContentHead">&nbsp;Reviews
                    <br>
            </td>
        </tr>
        <tr>
            <td>&nbsp;
            </td>
        </tr>
        <tr>
            <td>
                <asp:HyperLink ID="AddReview" runat="server">
                        <img align="absbottom" src="images/review_this_product.gif" border="0">
                </asp:HyperLink>
                <br>
                <br>
            </td>
        </tr>
        <tr>
            <td>
                <asp:DataList ID="MyList" runat="server" Width="500" CellPadding="0" CellSpacing="0">
                    <ItemTemplate>
                        <asp:Label class="NormalBold" Text='<%# DataBinder.Eval(Container.DataItem, "CustomerName") %>' runat="server" />
                        <span class="Normal">says... </span>
                        <img src='images/ReviewRating<%# DataBinder.Eval(Container.DataItem, "Rating") %>.gif'>
                        <br>
                        <asp:Label class="Normal" Text='<%# DataBinder.Eval(Container.DataItem, "Comments") %>' runat="server" />
                    </ItemTemplate>
                    <SeparatorTemplate>
                        <br>
                    </SeparatorTemplate>
                </asp:DataList>
            </td>
        </tr>
    </table>
</asp:Panel>

<asp:Panel ID="NewUi" Visible="false" runat="server">
    <div class="card">
        <div class="card-body">
            <h5 class="card-title">
                <asp:HyperLink ID="AddReview2" runat="server" CssClass="btn btn-secondary btn-sm">
                    Leave a Review
                </asp:HyperLink>
            </h5>
        </div>
        <asp:Repeater ID="MyList2" runat="server">
            <HeaderTemplate>
                <ul class="list-group list-group-flush">
            </HeaderTemplate>
            <ItemTemplate>
                <li class="list-group-item">
                    <asp:Label CssClass="NormalBold" Text='<%# DataBinder.Eval(Container.DataItem, "CustomerName") %>' runat="server" />
                    <span class="Normal">says... </span>
                    <img src='images/ReviewRating<%# DataBinder.Eval(Container.DataItem, "Rating") %>.gif'>
                    <br>
                    <asp:Label CssClass="Normal" Text='<%# DataBinder.Eval(Container.DataItem, "Comments") %>' runat="server" />
                </li>
            </ItemTemplate>
            <FooterTemplate>
                </ul>
            </FooterTemplate>
        </asp:Repeater>
    </div>
</asp:Panel>
