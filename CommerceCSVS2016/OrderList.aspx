<%@ Page Language="c#" CodeBehind="OrderList.aspx.cs" AutoEventWireup="false" MasterPageFile="~/MainLayout.Master" Inherits="ASPNET.StarterKit.Commerce.OrderList" %>

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
                                <img align="left" height="32" width="60" src="images/1x1.gif">Account History
                                                <br>
                            </td>
                        </tr>
                    </table>
                    <img align="left" height="4" width="110" src="images/1x1.gif">
                    <font color="red">
                                        <asp:Label id="MyError" class="ErrorText" runat="Server" />
                                    </font>
                    <br>
                    <img align="left" height="15" width="84" src="images/1x1.gif" border="0">
                    <table height="100%" cellspacing="0" cellpadding="0" width="550" border="0">
                        <tr valign="top">
                            <td width="100%">
                                <asp:DataGrid ID="MyList" Width="90%" BorderColor="black" GridLines="Vertical" CellPadding="4" CellSpacing="0" Font-Name="Verdana" Font-Size="8pt" ShowFooter="true" HeaderStyle-CssClass="CartListHead" FooterStyle-CssClass="cartlistfooter" ItemStyle-CssClass="CartListItem" AlternatingItemStyle-CssClass="CartListItemAlt" AutoGenerateColumns="false" runat="server">
                                    <Columns>
                                        <asp:BoundColumn HeaderText="Order ID" DataField="OrderID" />
                                        <asp:BoundColumn HeaderText="Order Date" DataField="OrderDate" DataFormatString="{0:d}" />
                                        <asp:BoundColumn HeaderText="Order Total" DataField="OrderTotal" DataFormatString="{0:c}" />
                                        <asp:BoundColumn HeaderText="Ship Date" DataField="ShipDate" DataFormatString="{0:d}" />
                                        <asp:HyperLinkColumn HeaderText="Show Details" Text="Show Details" DataNavigateUrlField="OrderID" DataNavigateUrlFormatString="orderdetails.aspx?OrderID={0}" />
                                    </Columns>
                                </asp:DataGrid>
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
        <h4>Account History</h4>

        <asp:Label ID="MyError2" class="ErrorText" runat="Server" />

        <asp:DataGrid ID="MyList2" Width="90%" BorderColor="black" GridLines="Vertical" CellPadding="4" CellSpacing="0" Font-Name="Verdana" Font-Size="8pt" ShowFooter="true" HeaderStyle-CssClass="CartListHead" FooterStyle-CssClass="cartlistfooter" ItemStyle-CssClass="CartListItem" AlternatingItemStyle-CssClass="CartListItemAlt" AutoGenerateColumns="false" runat="server">
            <Columns>
                <asp:BoundColumn HeaderText="Order ID" DataField="OrderID" />
                <asp:BoundColumn HeaderText="Order Date" DataField="OrderDate" DataFormatString="{0:d}" />
                <asp:BoundColumn HeaderText="Order Total" DataField="OrderTotal" DataFormatString="{0:c}" />
                <asp:BoundColumn HeaderText="Ship Date" DataField="ShipDate" DataFormatString="{0:d}" />
                <asp:HyperLinkColumn HeaderText="Show Details" Text="Show Details" DataNavigateUrlField="OrderID" DataNavigateUrlFormatString="orderdetails.aspx?OrderID={0}" />
            </Columns>
        </asp:DataGrid>

    </asp:Panel>
</asp:Content>

