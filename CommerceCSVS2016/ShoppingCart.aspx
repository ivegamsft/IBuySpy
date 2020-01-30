<%@ Page Language="c#" CodeBehind="ShoppingCart.aspx.cs" MasterPageFile="~/MainLayout.Master" AutoEventWireup="false" Inherits="ASPNET.StarterKit.Commerce.ShoppingCart" %>

<%@ Register TagPrefix="ASPNETCommerce" TagName="Menu" Src="_Menu.ascx" %>
<%@ Register TagPrefix="ASPNETCommerce" TagName="Header" Src="_Header.ascx" %>

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
                                <img align="left" height="32" width="60" src="images/1x1.gif">Shopping Cart
                        <br>
                            </td>
                        </tr>
                    </table>
                    <img align="left" height="4" width="110" src="images/1x1.gif">
                    <font color="red">
                <asp:Label id="MyError" class="ErrorText" EnableViewState="false" runat="Server" />
            </font>
                    <br>
                    <img align="left" height="15" width="24" src="images/1x1.gif" border="0">
                    <asp:Panel ID="DetailsPanel" runat="server">
                        <img height="1" src="images/1x1.gif" width="50" align="left">
                        <table height="100%" cellspacing="0" cellpadding="0" width="550" border="0">
                            <tr valign="top">
                                <td width="550">
                                    <asp:DataGrid ID="MyList" runat="server" BorderColor="black" GridLines="Vertical" CellPadding="4" CellSpacing="0" Font-Name="Verdana" Font-Size="8pt" ShowFooter="true" HeaderStyle-CssClass="CartListHead" FooterStyle-CssClass="CartListFooter" ItemStyle-CssClass="CartListItem" AlternatingItemStyle-CssClass="CartListItemAlt" DataKeyField="Quantity" AutoGenerateColumns="false">
                                        <Columns>
                                            <asp:TemplateColumn HeaderText="Product&nbsp;ID">
                                                <ItemTemplate>
                                                    <asp:Label ID="ProductID" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "ProductID") %>' />
                                                </ItemTemplate>
                                            </asp:TemplateColumn>
                                            <asp:BoundColumn HeaderText="Product Name" DataField="ModelName" />
                                            <asp:BoundColumn HeaderText="Model" DataField="ModelNumber" />
                                            <asp:TemplateColumn HeaderText="Quantity">
                                                <ItemTemplate>
                                                    <asp:TextBox ID="Quantity" runat="server" Columns="4" MaxLength="3" Text='<%# DataBinder.Eval(Container.DataItem, "Quantity") %>' Width="40px" />
                                                </ItemTemplate>
                                            </asp:TemplateColumn>
                                            <asp:BoundColumn HeaderText="Price" DataField="UnitCost" DataFormatString="{0:c}" />
                                            <asp:BoundColumn HeaderText="Subtotal" DataField="ExtendedAmount" DataFormatString="{0:c}" />
                                            <asp:TemplateColumn HeaderText="Remove">
                                                <ItemTemplate>
                                                    <center>
                                                <asp:CheckBox id="Remove" runat="server" />
                                            </center>
                                                </ItemTemplate>
                                            </asp:TemplateColumn>
                                        </Columns>
                                    </asp:DataGrid>
                                    <img height="1" src="Images/1x1.gif" width="350">
                                    <span class="NormalBold">Total: </span>
                                    <asp:Label class="NormalBold" ID="lblTotal" runat="server" EnableViewState="false"></asp:Label>
                                    <br>
                                    <br>
                                    <img height="1" src="Images/1x1.gif" width="60">
                                    <asp:ImageButton ID="UpdateBtn" runat="server" ImageUrl="images/update_cart.gif"></asp:ImageButton>
                                    <img height="1" src="Images/1x1.gif" width="15">
                                    <asp:ImageButton ID="CheckoutBtn" runat="server" ImageUrl="images/final_checkout.gif"></asp:ImageButton>
                                    <br>
                                </td>
                            </tr>
                        </table>
                    </asp:Panel>
                </td>
            </tr>
        </table>
    </asp:Panel>
</asp:Content>

<asp:Content runat="server" ContentPlaceHolderID="MainBody">
    <asp:Panel ID="NewUi" Visible="false" runat="server">
        <div class="row">
            <div class="col-4">
                <h4>Shopping Cart</h4>
                <h5>
                    <asp:Label ID="MyError2" class="ErrorText" EnableViewState="false" runat="Server" CssClass="text-danger" /></h5>
            </div>
        </div>
        <asp:Panel ID="DetailsPanel2" runat="server">

            <div class="row">
                <div class="col-12">
                    <asp:DataGrid ID="MyList2" runat="server" Width="100%" CssClass="table-bordered" CellPadding="4" CellSpacing="0" ShowFooter="true" DataKeyField="Quantity" AutoGenerateColumns="false">
                        <HeaderStyle CssClass="thead-light" />
                        <Columns>
                            <asp:TemplateColumn HeaderText="Product&nbsp;ID">
                                <ItemTemplate>
                                    <asp:Label ID="ProductID" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "ProductID") %>' />
                                </ItemTemplate>
                            </asp:TemplateColumn>
                            <asp:BoundColumn HeaderText="Product Name" DataField="ModelName" />
                            <asp:BoundColumn HeaderText="Model" DataField="ModelNumber" />
                            <asp:TemplateColumn HeaderText="Quantity">
                                <ItemTemplate>
                                    <asp:TextBox ID="Quantity" runat="server" Columns="4" MaxLength="3" Text='<%# DataBinder.Eval(Container.DataItem, "Quantity") %>' Width="40px" />
                                </ItemTemplate>
                            </asp:TemplateColumn>
                            <asp:BoundColumn HeaderText="Price" DataField="UnitCost" DataFormatString="{0:c}" />
                            <asp:BoundColumn HeaderText="Subtotal" DataField="ExtendedAmount" DataFormatString="{0:c}" />
                            <asp:TemplateColumn HeaderText="Remove">
                                <ItemTemplate>
                                    <center>
                                        <asp:CheckBox id="Remove" runat="server" />
                                    </center>
                                </ItemTemplate>
                            </asp:TemplateColumn>
                        </Columns>
                    </asp:DataGrid>
                </div>
            </div>
            <div class="row">
                <div class="col-9"></div>
                <div class="col-3 pt-5">
                    <span>Total: <asp:Label ID="lblTotal2" runat="server" EnableViewState="false"></asp:Label></span>
                </div>
            </div>
            <div class="row">
                <div class="col-10">
                </div>
                <div class="col-2">
                    <p>
                        <asp:Button ID="UpdateBtn2" runat="server" Text="Update" CssClass="btn btn-secondary"></asp:Button>
                    </p>
                    <p>
                        <asp:Button ID="CheckoutBtn2" runat="server" Text="Checkout" CssClass="btn btn-primary"></asp:Button>
                    </p>

                </div>
            </div>
        </asp:Panel>
    </asp:Panel>
</asp:Content>
