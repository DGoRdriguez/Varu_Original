﻿<%@ Page Title="" Language="C#" MasterPageFile="~/formularios.master" AutoEventWireup="true" CodeFile="listaDocumentosEntregables.aspx.cs" Inherits="_ListaDocumentosEntregables" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">



    <asp:HiddenField ID="HiddenField_ID_DOCUMENTO" runat="server" />

    <asp:Panel ID="Panel_INFO_ADICIONAL_MODULO" runat="server">
        <div class="div_contenedor_formulario">
            <div id="div_info_adicional_modulo">
                <asp:Label ID="Label_INFO_ADICIONAL_MODULO" runat="server" Text=""></asp:Label>
            </div>
        </div>
    </asp:Panel>

    <asp:UpdatePanel ID="UpdatePanel9" runat="server" UpdateMode="Conditional">
        <ContentTemplate>
            <asp:Panel ID="Panel_FONDO_MENSAJE" runat="server" Visible="false" Style="background-color: #999999;">
            </asp:Panel>
            <asp:Panel ID="Panel_MENSAJES" runat="server">
                <asp:Image ID="Image_MENSAJE_POPUP" runat="server" Width="50px" Height="50px" style="margin: 5px auto 8px auto; display:block;" />
                <asp:Panel ID="Panel_COLOR_FONDO_POPUP" runat="server" style="text-align:center">
                    <asp:Label ID="Label_MENSAJE" runat="server" ForeColor="Red" >Este es el mensaje, tiene un  texto de acuerdo a la acción correspondiente.</asp:Label>
                </asp:Panel>
                <div style="text-align: center; margin-top: 15px;">
                    <asp:Button ID="Button_CERRAR_MENSAJE" runat="server" Text="Cerrar" 
                        OnClick="Button_CERRAR_MENSAJE_Click" style="height: 26px" />
                </div>
            </asp:Panel>
        </ContentTemplate>
    </asp:UpdatePanel>

    <asp:Panel ID="Panel_FORM_BOTONES" runat="server">
        <div class="div_espaciador"></div>
        <table class="tabla_contiene_botones" cellpadding="0" cellspacing="0">
            <tr>
                <td>
                    <div class="div_cabeza_groupbox">
                        Botones de acción
                    </div>
                    <div class="div_contenido_groupbox">
                        <table cellpadding="0" cellspacing="0" border="0" style="margin:0 auto;">
                            <tr>
                            <td rowspan="0">
                                    <asp:Button ID="Butto_NUEVO" runat="server" Text="Nuevo"  
                                        CssClass="margin_botones"
                                        ValidationGroup="NUEVO" onclick="Butto_NUEVO_Click"/>
                                </td>
                                <td rowspan="0">
                                    <asp:Button ID="Button_MODIFICAR" runat="server" Text="Actualizar"  
                                        CssClass="margin_botones"
                                        ValidationGroup="ADICIONAR" onclick="Button_MODIFICAR_Click"/>
                                </td>
                                <td rowspan="0">
                                    <asp:Button ID="Button_GUARDAR" runat="server" Text="Guardar"  
                                        CssClass="margin_botones" onclick="Button_GUARDAR_Click" 
                                        ValidationGroup="GUARDAR"/>
                                </td>
                                <td rowspan="0">
                                    <asp:Button ID="Button_CANCELAR" runat="server" Text="Cancelar"  
                                        CssClass="margin_botones" ValidationGroup="CANCELAR" 
                                        onclick="Button_CANCELAR_Click"/>
                                </td>
                                <td rowspan="0">
                                    <input class="margin_botones" id="Button1" onclick="window.close();" 
                                        type="button" value="Salir" />
                                </td>
                            </tr>
                        </table>
                    </div>
                </td>
            </tr>
        </table>
    </asp:Panel>

    <asp:Panel ID="Panel_RESULTADOS_GRID" runat="server">
        <div class="div_espaciador"></div>
        <div class=" div_contenedor_formulario">
            <div class="div_cabeza_groupbox">
                <asp:Label ID="Label_RESULTADOS_GRILLA" runat="server" Text="Resultados de la busqueda"></asp:Label>
            </div>
            <div class="div_contenido_groupbox">
                <div class="div_contenedor_grilla_resultados">
                    <div class="grid_seleccionar_registros">
                        <asp:GridView ID="GridView_RESULTADOS_BUSQUEDA" runat="server" Width="885px" AutoGenerateColumns="False"
                            DataKeyNames="ID_DOCUMENTO" OnRowCommand="GridView_RESULTADOS_BUSQUEDA_RowCommand"
                            AllowPaging="True" 
                            OnPageIndexChanging="GridView_RESULTADOS_BUSQUEDA_PageIndexChanging">
                            <Columns>
                                <asp:ButtonField ButtonType="Image" CommandName="seleccionar" ImageUrl="~/imagenes/areas/view2.gif"
                                    Text="seleccionar">
                                    <ItemStyle CssClass="columna_grid_centrada" Width="30px" />
                                </asp:ButtonField>
                                <asp:BoundField DataField="NOMBRE" HeaderText="Nombre Documento" />
                                <asp:BoundField DataField="ESTADO_DOCUMENTO" HeaderText="Estado" >
                                <ItemStyle CssClass="columna_grid_centrada" />
                                </asp:BoundField>
                            </Columns>
                            <headerStyle BackColor="#DDDDDD" />
                        </asp:GridView>
                    </div>
                </div>
            </div>
        </div>
    </asp:Panel>

    <asp:Panel ID="Panel_INFO_DOCUMENTO" runat="server">
        <div class="div_espaciador"></div>
        <div class="div_contenedor_formulario">
            <div class="div_cabeza_groupbox">
                Información del Documento
            </div>
            <div class="div_contenido_groupbox">
                <asp:Panel ID="Panel_CONTROL_REGISTRO" runat="server">
                    <asp:Panel ID="Panel_CABEZA_REGISTRO" runat="server" CssClass="div_cabeza_groupbox_gris">
                        <table cellpadding="0" cellspacing="0" border="0" style="width: 100%;">
                            <tr>
                                <td style="width: 87%;">
                                    Control de registro
                                </td>
                                <td>
                                    <table cellpadding="0" cellspacing="0" border="0" style="width: 100%;">
                                        <tr>
                                            <td style="font-size: 80%">
                                                <asp:Label ID="Label_REGISTRO" runat="server">(Mostrar detalles...)</asp:Label>
                                            </td>
                                            <td>
                                                <asp:Image ID="Image_REGISTRO" runat="server" CssClass="img_cabecera_hoja" />
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                        </table>
                    </asp:Panel>

                    <asp:Panel ID="Panel_CONTENIDO_REGISTRO" runat="server" CssClass="div_contenido_groupbox_gris">
                        <table class="table_control_registros">
                            <tr>
                                <td class="td_izq">
                                    <asp:Label ID="Label_FCH_CRE" runat="server" Text="Fecha de Creación"></asp:Label>
                                </td>
                                <td class="td_der">
                                    <asp:TextBox ID="TextBox_FCH_CRE" runat="server" Enabled="False" ReadOnly="True"
                                        ValidationGroup="REGISTRO_CONTROL"></asp:TextBox>
                                </td>
                                <td class="td_izq">
                                    <asp:Label ID="Label_HOR_CRE" runat="server" Text="Hora de Creación"></asp:Label>
                                </td>
                                <td class="td_der">
                                    <asp:TextBox ID="TextBox_HOR_CRE" runat="server" Enabled="False" ReadOnly="True"
                                        ValidationGroup="REGISTRO_CONTROL"></asp:TextBox>
                                </td>
                                <td class="td_izq">
                                    <asp:Label ID="Label_USU_CRE" runat="server" Text="Usuario"></asp:Label>
                                </td>
                                <td class="td_der">
                                    <asp:TextBox ID="TextBox_USU_CRE" runat="server" Enabled="False" ReadOnly="True"
                                        ValidationGroup="REGISTRO_CONTROL"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td class="td_izq">
                                    <asp:Label ID="Label_FCH_MOD" runat="server" Text="Fecha de Modificación"></asp:Label>
                                </td>
                                <td class="td_der">
                                    <asp:TextBox ID="TextBox_FCH_MOD" runat="server" Enabled="False" ReadOnly="True"
                                        ValidationGroup="REGISTRO_CONTROL"></asp:TextBox>
                                </td>
                                <td class="td_izq">
                                    <asp:Label ID="Label_HOR_MOD" runat="server" Text="Hora de Modificación"></asp:Label>
                                </td>
                                <td class="td_der">
                                    <asp:TextBox ID="TextBox_HOR_MOD" runat="server" Enabled="False" ReadOnly="True"
                                        ValidationGroup="REGISTRO_CONTROL"></asp:TextBox>
                                </td>
                                <td class="td_izq">
                                    <asp:Label ID="Label_USU_MOD" runat="server" Text="Usuario"></asp:Label>
                                </td>
                                <td class="td_der">
                                    <asp:TextBox ID="TextBox_USU_MOD" runat="server" Enabled="False" ReadOnly="True"
                                        ValidationGroup="REGISTRO_CONTROL"></asp:TextBox>
                                </td>
                            </tr>
                        </table>
                    </asp:Panel>
                    <ajaxToolkit:CollapsiblePanelExtender ID="CollapsiblePanelExtender_REGISTRO" runat="Server"
                        TargetControlID="Panel_CONTENIDO_REGISTRO" ExpandControlID="Panel_CABEZA_REGISTRO"
                        CollapseControlID="Panel_CABEZA_REGISTRO" Collapsed="True" TextLabelID="Label_REGISTRO"
                        ImageControlID="Image_REGISTRO" ExpandedText="(Ocultar detalles...)" CollapsedText="(Mostrar detalles...)"
                        ExpandedImage="~/imagenes/plantilla/collapse.jpg" CollapsedImage="~/imagenes/plantilla/expand.jpg"
                        SuppressPostBack="true">
                    </ajaxToolkit:CollapsiblePanelExtender>
                </asp:Panel>
                


                <table class="table_control_registros">
                    <tr>
                        <td class="td_izq">
                            Nombre:
                        </td>
                        <td class="td_der">
                            <asp:TextBox ID="TextBox_NombreDocumento" runat="server" 
                                ValidationGroup="GUARDAR" Width="260px"></asp:TextBox>
                        </td>
                        <td colspan="2">
                            <asp:Panel ID="Panel_EstadoDocumento" runat="server">
                                Estado: 
                                <asp:DropDownList ID="DropDownList_EstadoDocumento" runat="server" ValidationGroup="GUARDAR"
                                    Width="150px">
                                </asp:DropDownList>
                                <!-- DropDownList_EstadoDocumento -->
                                <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator_DropDownList_EstadoDocumento"
                                    ControlToValidate="DropDownList_EstadoDocumento" Display="None" ErrorMessage="<b>Campo Requerido faltante</b><br />El ESTADO es requerido."
                                    ValidationGroup="GUARDAR" />
                                <ajaxToolkit:ValidatorCalloutExtender runat="Server" ID="ValidatorCalloutExtender_DropDownList_EstadoDocumento"
                                    TargetControlID="RequiredFieldValidator_DropDownList_EstadoDocumento" HighlightCssClass="validatorCalloutHighlight" />
                            </asp:Panel>
                        </td>
                    </tr>
                </table>
                <!-- TextBox_NombreDocumento -->
                <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator_TextBox_NombreDocumento"
                    ControlToValidate="TextBox_NombreDocumento" Display="None" ErrorMessage="<b>Campo Requerido faltante</b><br />El NOMBRE DEL DOCUMENTO es requerido."
                    ValidationGroup="GUARDAR" />
                <ajaxToolkit:ValidatorCalloutExtender runat="Server" ID="ValidatorCalloutExtender_TextBox_NombreDocumento"
                    TargetControlID="RequiredFieldValidator_TextBox_NombreDocumento" HighlightCssClass="validatorCalloutHighlight" />
            </div>
        </div>
    </asp:Panel>

    <asp:Panel ID="Panel_BOTONES_PIE" runat="server">
        <div class="div_espaciador"></div>
        <table class="tabla_contiene_botones" cellpadding="0" cellspacing="0">
            <tr>
                <td>
                    <div class="div_cabeza_groupbox">
                        Botones de acción
                    </div>
                    <div class="div_contenido_groupbox">
                        <table cellpadding="0" cellspacing="0" border="0" style="margin:0 auto;">
                            <tr>
                            <td rowspan="0">
                                    <asp:Button ID="Button_NUEVO_1" runat="server" Text="Nuevo"  
                                        CssClass="margin_botones"
                                        ValidationGroup="NUEVO" onclick="Butto_NUEVO_Click"/>
                                </td>
                                <td rowspan="0">
                                    <asp:Button ID="Button_MODIFICAR_1" runat="server" Text="Actualizar"  
                                        CssClass="margin_botones"
                                        ValidationGroup="ADICIONAR" onclick="Button_MODIFICAR_Click"/>
                                </td>
                                <td rowspan="0">
                                    <asp:Button ID="Button_GUARDAR_1" runat="server" Text="Guardar"  
                                        CssClass="margin_botones" onclick="Button_GUARDAR_Click" 
                                        ValidationGroup="GUARDAR"/>
                                </td>
                                <td rowspan="0">
                                    <asp:Button ID="Button_CANCELAR_1" runat="server" Text="Cancelar"  
                                        CssClass="margin_botones" ValidationGroup="CANCELAR" 
                                        onclick="Button_CANCELAR_Click"/>
                                </td>
                            </tr>
                        </table>
                    </div>
                </td>
            </tr>
        </table>
    </asp:Panel>
</asp:Content>

