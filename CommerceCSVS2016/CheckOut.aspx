<%@ Register TagPrefix="ASPNETCommerce" TagName="Menu" Src="_Menu.ascx" %>
<%@ Register TagPrefix="ASPNETCommerce" TagName="Header" Src="_Header.ascx" %>

<%@ Page Language="c#" CodeBehind="CheckOut.aspx.cs" AutoEventWireup="false" MasterPageFile="~/MainLayout.Master" Inherits="ASPNET.StarterKit.Commerce.CheckOut" %>

<asp:Content runat="server" ContentPlaceHolderID="Main">
    <asp:Panel ID="OriginalUi" Visible="true" runat="server">
        <table height="100%" align="left" cellspacing="0" cellpadding="0" width="100%" border="0">
            <tr valign="top">
                <td>
                    <br>
                    <img align="left" width="24" src="images/1x1.gif">
                    <table cellspacing="0" cellpadding="0" width="100%" border="0">
                        <tr>
                            <td class="ContentHead">
                                <img align="left" height="32" width="60" src="images/1x1.gif"><asp:Label ID="Header" runat="server">Review and Submit Your Order</asp:Label>
                                <br>
                            </td>
                        </tr>
                    </table>
                    <img align="left" height="1" width="92" src="images/1x1.gif">
                    <table height="100%" cellspacing="0" cellpadding="0" width="550" border="0">
                        <tr valign="top">
                            <td width="100%" class="Normal">
                                <br>
                                <asp:Label ID="Message" runat="server">Please check all the information below to be sure it's correct.</asp:Label>
                                <br>
                                <br>
                                <asp:DataGrid ID="MyDataGrid" Width="90%" BorderColor="black" GridLines="Vertical" CellPadding="4" CellSpacing="0" Font-Name="Verdana" Font-Size="8pt" ShowFooter="true" HeaderStyle-CssClass="CartListHead" FooterStyle-CssClass="cartlistfooter" ItemStyle-CssClass="CartListItem" AlternatingItemStyle-CssClass="CartListItemAlt" AutoGenerateColumns="false" runat="server">
                                    <Columns>
                                        <asp:BoundColumn HeaderText="Product Name" DataField="ModelName" />
                                        <asp:BoundColumn HeaderText="Model Number" DataField="ModelNumber" />
                                        <asp:BoundColumn HeaderText="Quantity" DataField="Quantity" />
                                        <asp:BoundColumn HeaderText="Price" DataField="UnitCost" DataFormatString="{0:c}" />
                                        <asp:BoundColumn HeaderText="Subtotal" DataField="ExtendedAmount" DataFormatString="{0:c}" />
                                    </Columns>
                                </asp:DataGrid>
                                <br>
                                <br>
                                <b>Total: </b>
                                <asp:Label ID="TotalLbl" runat="server" />
                                <p>
                                    <asp:ImageButton ID="SubmitBtn" ImageUrl="images/submit.gif" runat="server" />
                                </p>
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
        <h4><asp:Label ID="Header2" runat="server">Review and Submit Your Order</asp:Label></h4>
        <h6><asp:Label ID="Message2" runat="server">Please check all the information below to be sure it's correct.</asp:Label></h6>

        <asp:DataGrid ID="MyDataGrid2" Width="90%" BorderColor="black" GridLines="Vertical" CellPadding="4" CellSpacing="0" Font-Name="Verdana" Font-Size="8pt" ShowFooter="true" HeaderStyle-CssClass="CartListHead" FooterStyle-CssClass="cartlistfooter" ItemStyle-CssClass="CartListItem" AlternatingItemStyle-CssClass="CartListItemAlt" AutoGenerateColumns="false" runat="server">
            <Columns>
                <asp:BoundColumn HeaderText="Product Name" DataField="ModelName" />
                <asp:BoundColumn HeaderText="Model Number" DataField="ModelNumber" />
                <asp:BoundColumn HeaderText="Quantity" DataField="Quantity" />
                <asp:BoundColumn HeaderText="Price" DataField="UnitCost" DataFormatString="{0:c}" />
                <asp:BoundColumn HeaderText="Subtotal" DataField="ExtendedAmount" DataFormatString="{0:c}" />
            </Columns>
        </asp:DataGrid>
        <br>
        <br>
        <b>Total: </b><asp:Label ID="TotalLbl2" runat="server" />
        <p>
            <asp:Button ID="SubmitBtn2" runat="server" CssClass="btn btn-primary" Text="Submit" />
        </p>

    </asp:Panel>
</asp:Content>
