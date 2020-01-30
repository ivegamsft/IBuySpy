<%@ Control Language="c#" CodeBehind="_AlsoBought.ascx.cs" AutoEventWireup="false" Inherits="ASPNET.StarterKit.Commerce.C_AlsoBought" %>
<%--
        This user controls lists other products that
        customers who purchased a product "also bought".
--%>


<asp:Panel ID="OriginalUi" Visible="true" runat="server">
    <table width="95%" cellpadding="0" cellspacing="0" border="0">
	    <tr>
		    <td>
			    <asp:Repeater ID="alsoBoughtList" runat="server">
				    <HeaderTemplate>
					    <tr>
						    <td class="MostPopularHead">
							    &nbsp;Customers who bought this also bought
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
		    </td>
	    </tr>
    </table>
</asp:Panel>

<asp:Panel ID="NewUi" Visible="true" runat="server">

    <div class="panel panel-default">
        <asp:Repeater ID="alsoBoughtList2" runat="server">
            <HeaderTemplate>
                <div class="panel-heading">
                    <h3>Customers who bought this also bought</h3>
                </div>
                <div class="panel-body">
                    <ul class="list-group">
            </HeaderTemplate>
            <ItemTemplate>
                <li class="list-group-item">
                    <asp:HyperLink CssClass="MostPopularItemText2" NavigateUrl='<%# "ProductDetails.aspx?ProductID=" + DataBinder.Eval(Container.DataItem, "ProductID")%>' Text='<%#DataBinder.Eval(Container.DataItem, "ModelName")%>' runat="server" />
                </li>
            </ItemTemplate>
            <FooterTemplate>
                </ul>
             </div>
            </FooterTemplate>
        </asp:Repeater>
    </div>
</asp:Panel>
