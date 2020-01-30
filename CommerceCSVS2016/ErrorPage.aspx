<%@ Page CodeBehind="ErrorPage.aspx.cs" Language="c#" AutoEventWireup="false" MasterPageFile="~/MainLayout.Master" Inherits="ASPNET.StarterKit.Commerce.ErrorPage" %>

<%@ Register TagPrefix="ASPNETCommerce" TagName="Header" Src="_Header.ascx" %>
<%@ Register TagPrefix="ASPNETCommerce" TagName="Menu" Src="_Menu.ascx" %>

<asp:Content runat="server" ContentPlaceHolderID="Main">
    <table height="100%" align="left" cellspacing="0" cellpadding="0" width="100%" border="0">
        <tr valign="top">
            <td>
                <br>
                <img align="left" width="32" src="images/1x1.gif">
                <table cellspacing="0" cellpadding="0" width="100%">
                    <tr>
                        <td>
                            <table cellspacing="0" cellpadding="0" width="100%">
                                <tr>
                                    <td class="HomeHead">
                                        <h3>We are sorry, but an error occured during the
                                                            <br>
                                            processing of your last request.
                                                            <br>
                                            <br>
                                            This could be a result of either illegal input
                                                            <br>
                                            values, or a bug in our code. Sorry for the inconvenience.
                                        </h3>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
</asp:Content>
