﻿<%@ Page Title="" Language="C#" MasterPageFile="~/formularios.master" AutoEventWireup="true" CodeFile="administracion.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:Panel ID="Panel_BOTONES_INTERNOS" runat="server" Width="900px" style="margin:0 auto; text-align:center;">
        <div class="div_botones_internos">
            <table class="table_control_registros" cellpadding="0" cellspacing="0" border="0">
                <tr>
                    <td style="text-align:center;">
                        <asp:Table ID="Table_MENU" runat="server">
                        </asp:Table>
                    </td>
                </tr>
            </table>
            <table class="table_control_registros" cellpadding="0" cellspacing="0" border="0">
                <tr>
                    <td style="text-align:center;">
                        <asp:Table ID="Table_MENU_1" runat="server">
                        </asp:Table>
                    </td>
                </tr>
            </table>
        </div>
    </asp:Panel>
</asp:Content>

