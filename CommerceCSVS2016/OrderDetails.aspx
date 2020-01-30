<%@ Page Language="c#" CodeBehind="OrderDetails.aspx.cs" AutoEventWireup="false" MasterPageFile="~/MainLayout.Master" Inherits="ASPNET.StarterKit.Commerce.OrderDetailsPage" %>

<%@ Register TagPrefix="ASPNETCommerce" TagName="Header" Src="_Header.ascx" %>
<%@ Register TagPrefix="ASPNETCommerce" TagName="Menu" Src="_Menu.ascx" %>


<asp:Content runat="server" ContentPlaceHolderID="Main">
    <asp:Panel ID="OriginalUi" Visible="true" runat="server">
        <table height="100%" align="left" cellspacing="0" cellpadding="0" width="100%" border="0">
            <tr valign="top">
                <td nowrap>
                    <br>
                    <img align="left" width="24" src="images/1x1.gif">
                    <table cellspacing="0" cellpadding="0" width="100%" border="0">
                        <tr>
                            <td class="ContentHead">
                                <img align="left" height="32" width="60" src="images/1x1.gif">Order Details
                                            <br>
                            </td>
                        </tr>
                    </table>
                    <img align="left" height="15" width="86" src="images/1x1.gif" border="0">
                    <asp:Label ID="MyError" CssClass="ErrorText" EnableViewState="false" runat="Server" />
                    <table id="detailsTable" height="100%" cellspacing="0" cellpadding="0" width="550" border="0" enableviewstate="false" runat="server">
                        <tr valign="top">
                            <td width="100%" class="Normal">
                                <br>
                                <b>Your Order Number Is: </b>
                                <asp:Label ID="lblOrderNumber" EnableViewState="false" runat="server" />
                                <br>
                                <b>Order Date: </b>
                                <asp:Label ID="lblOrderDate" EnableViewState="false" runat="server" />
                                <br>
                                <b>Ship Date: </b>
                                <asp:Label ID="lblShipDate" EnableViewState="false" runat="server" />
                                <br>
                                <br>
                                <asp:DataGrid ID="GridControl1" Width="90%" BorderColor="black" GridLines="Vertical" CellPadding="4" CellSpacing="0" Font-Name="Verdana" Font-Size="8pt" ShowFooter="true" HeaderStyle-CssClass="CartListHead" FooterStyle-CssClass="cartlistfooter" ItemStyle-CssClass="CartListItem" AlternatingItemStyle-CssClass="CartListItemAlt" AutoGenerateColumns="false" runat="server">
                                    <Columns>
                                        <asp:BoundColumn HeaderText="Product Name" DataField="ModelName" />
                                        <asp:BoundColumn HeaderText="Model Number" DataField="ModelNumber" />
                                        <asp:BoundColumn HeaderText="Quantity" DataField="Quantity" />
                                        <asp:BoundColumn HeaderText="Price" DataField="UnitCost" DataFormatString="{0:c}" />
                                        <asp:BoundColumn HeaderText="Subtotal" DataField="ExtendedAmount" DataFormatString="{0:c}" />
                                    </Columns>
                                </asp:DataGrid>
                                <br>
                                <b>Total: </b>
                                <asp:Label ID="lblTotal" EnableViewState="false" runat="server" />
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
        <h4>Order Details</h4>

        <asp:Label ID="MyError2" CssClass="ErrorText" EnableViewState="false" runat="Server" />


        <b>Your Order Number Is: </b>
        <asp:Label ID="lblOrderNumber2" EnableViewState="false" runat="server" />
        <br>
        <b>Order Date: </b>
        <asp:Label ID="lblOrderDate2" EnableViewState="false" runat="server" />
        <br>
        <b>Ship Date: </b>
        <asp:Label ID="lblShipDate2" EnableViewState="false" runat="server" />
        <br>
        <br>
        <asp:DataGrid ID="GridControl12" Width="90%" BorderColor="black" GridLines="Vertical" CellPadding="4" CellSpacing="0" Font-Name="Verdana" Font-Size="8pt" ShowFooter="true" HeaderStyle-CssClass="CartListHead" FooterStyle-CssClass="cartlistfooter" ItemStyle-CssClass="CartListItem" AlternatingItemStyle-CssClass="CartListItemAlt" AutoGenerateColumns="false" runat="server">
            <Columns>
                <asp:BoundColumn HeaderText="Product Name" DataField="ModelName" />
                <asp:BoundColumn HeaderText="Model Number" DataField="ModelNumber" />
                <asp:BoundColumn HeaderText="Quantity" DataField="Quantity" />
                <asp:BoundColumn HeaderText="Price" DataField="UnitCost" DataFormatString="{0:c}" />
                <asp:BoundColumn HeaderText="Subtotal" DataField="ExtendedAmount" DataFormatString="{0:c}" />
            </Columns>
        </asp:DataGrid>
        <br>
        <b>Total: </b>
        <asp:Label ID="lblTotal2" EnableViewState="false" runat="server" />

    </asp:Panel>
</asp:Content>
