<%@page import="com.consiss.util.tools.*"%>
<%@page import="com.gob.*"%>
<%@page import="java.util.*" %>
<%
/********************************************************************************************************
'Elaboro:	Jesus Limon
'Lugar:		Monterrey, NL
'Fecha:		11.Dic.2002
'Compañia:	CONSISS
'Ultima Modificacion:
'By:
'
'Distintas opciones:
'
'********************************************************************************************************/
%>
<%
//Valida la permanencia del usuario en session
if ((String)session.getValue("ok")!="Consiss")
			response.sendRedirect("Error.html");
String	sOpcion = request.getParameter("sOpcion")!= null ? request.getParameter("sOpcion"): "";
String	sOrigen = request.getParameter("sOrigen")!= null ? request.getParameter("sOrigen"): "0";
int 	iOrigen =  java.lang.Integer.parseInt(sOrigen );

String	sCodigo = request.getParameter("sCodigo")!= null ? request.getParameter("sCodigo"): "";
java.text.DecimalFormat myFormatter = new java.text.DecimalFormat("###,##0.00");

Anexo3XVIII oAnexo		= new Anexo3XVIII();
int iIdAnexo 			= oAnexo.GetIdAnexo();
%>
<%@include file="fAnexoInicia.jsp"%>
<html>
<head>
	<title>Entrega - Recepción : Anexo III.18</title>
	<link rel="stylesheet" type="text/css" href="<%=sPath%>Styles/Gobierno.css">
	<script language="JavaScript" src="<%=sPath%>Scripts/Gobierno.js"></script>
	<script language="JavaScript" src="<%=sPath%>Scripts/Libreria.js"></script>
	<script language="JavaScript">	
		function edit(pCODE){
	<%//AGREGADO POR VALIDACION ESTATUS 1
	if(!bSoloLectura) { %>
			document.forma.sCodigo.value = pCODE;
			document.forma.sOpcion.value = 'EDIT';
			document.forma.submit();
	<%}%>		
		}
		function save(){
			//document.forma.sCodigo.value = "0";
			document.forma.sOpcion.value = 'SAVE';
			document.forma.submit();
		}
		function cancel(){
			document.forma.sCodigo.value = "0";
			document.forma.sOrigen.value = "0";
			document.forma.sOpcion.value = 'NORMAL';
			document.forma.submit();
		}
		function news() {
			document.forma.sCodigo.value = "0";
			document.forma.sOpcion.value = 'NEW';
			document.forma.submit();
		}
		function del(pCODE){
			if(confirm("¿Desea Eliminar el Registro?")){ 
				document.forma.sCodigo.value = pCODE;
				document.forma.sOpcion.value = 'DELETE';
				document.forma.submit();
			}
		}
		function CambioTipoOrigen(){
//			document.forma.sCodigo.value = "0";
			document.forma.sOpcion.value = 'EDIT';
			document.forma.action='fAnexo3XVIII.jsp'
			document.forma.submit();
		}
	</script>
</head>
<body topmargin="0" leftmargin="0" onfocus=fReload();>
<table border="0" cellspacing="0" cellpadding="0" width="100%">
<!-- Encabezado -->
<tr>
<td colspan="3"><%@include file="Header.jsp"%></td>
<tr>
<!-- Encabezado -->
<tr>
	<!-- Menu -->
	<td width="135" valign="top"><%@include file="Menu.jsp"%></td>
	<!-- Menu -->
	<td width="2px" valign="top" class="TextoOculto">.</td>
	<!-- Contenido -->
	<td valign="top" width="100%">
<FORM action="pAnexo3XVIII.jsp" name="forma" method="post" >
	<input type="hidden" name="sOpcion" value="">
	<input type="hidden" name="sCodigo" value="<%=iOrigen%>"> <!--sOrigen--> 
	<TABLE align=center border=0 cellPadding=0 cellSpacing=0 width="100%">
		<TR>
			<TD class="TituloParrafo" colspan="3">&nbsp;&nbsp;ANEXO III.18 - RELACIÓN DE PLANOS, ESTUDIOS Y PROYECTOS NO DESARROLLADOS&nbsp;&nbsp;</TD>
		</tr>
		<tr>
			<TD width="70%" valign="middle">
				<%//AGREGADO POR VALIDACION ESTATUS 1
				if(!bSoloLectura) { %>
				Vacío: <input type="radio" name="sEstatus" value="1" <%=sEstatus.equals("1")?" checked":""%>>
				&nbsp;&nbsp;
				En Proceso: <input type="radio" name="sEstatus" value="2" <%=sEstatus.equals("2")?" checked":""%>>
				&nbsp;&nbsp;
				Lleno: <input type="radio" name="sEstatus" value="3" <%=sEstatus.equals("3")?" checked":""%>>
				<%if(iTipoUsuario == oUsuario.GetTipoFuncionario()) { %>
				Autorizado: <input type="radio" name="sEstatus" value="4" <%=sEstatus.equals("4")?" checked":""%>>
				<%}%>
				<%}
		//AGREGADO POR MENSAJES SOLO LECTURA (5)
		if( !sMensageEstatus.equals("") ) {
			out.println("<font class='TituloEstatus'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;" + sMensageEstatus + "</font>" );
		}%>
				<br>Consecutivo : 
			<select class="cmbBox" name="sOrigen" onchange="CambioTipoOrigen();">
				<option value="0" <%if(iOrigen == 0){%>selected<%}%>>---- Seleccione Consecutivo ----</option>
<%
			oAnexo.GetAll(iIdFuncionario);
			for(int i=0;i<oAnexo.GetAll(iIdFuncionario);i++){
				int iRenglonPaso		= oAnexo.GetIdRenglon(i)!=-1?		oAnexo.GetIdRenglon(i):0;
				String 	sOrigenPaso		= oAnexo.GetConsecutivo(i)!=null?	oAnexo.GetConsecutivo(i):"";
%>
				<option value="<%=iRenglonPaso%>" <%if(iOrigen == iRenglonPaso){%>selected<%}%>><%=sOrigenPaso%></option>
<%
				}
%>
			</select></TD>
			<TD align=right>
			<%//AGREGADO POR VALIDACION ESTATUS 1
				if(!bSoloLectura) { %>
			<a onmouseover="this.style.cursor='hand'" style="cursor:normal" onclick="Adjuntar('<%=iIdFuncionario%>', '<%=iIdAnexo%>');"><img src="<%=sPath%>Images/Attach.jpg" ></a>&nbsp;&nbsp;
			<%}%>
			<a onmouseover="this.style.cursor='hand'" style="cursor:normal" onclick="imprimirTipo(<%=iIdFuncionario%>, '<%=sOrigen%>', 'iAnexo3XVIII.jsp');"><img src="<%=sPath%>Images/Impresora.jpg" ></a>&nbsp;&nbsp;
			<a onmouseover="this.style.cursor='hand'" style="cursor:normal" onclick="ayuda('<%=sPath%>Help/aAnexo3XVIII.htm');"><img src="<%=sPath%>Images/Ayuda.jpg" ></a></td> 
<!--
			<TD align=right><a onmouseover="this.style.cursor='hand'" style="cursor:normal" onclick="Adjuntar();"><img src="<%=sPath%>Images/Attach.jpg" ></a>&nbsp;&nbsp;<%if(iOrigen != 0){%><a onmouseover="this.style.cursor='hand'" style="cursor:normal" onclick="imprimir(<%=iIdFuncionario%>,<%=sOrigen%>);"><img src="<%=sPath%>Images/Impresora.jpg" ></a>&nbsp;<%}%>&nbsp;<a onmouseover="this.style.cursor='hand'" style="cursor:normal" onclick="ayuda();"><img src="<%=sPath%>Images/Ayuda.jpg" ></a></td> 
-->
			<TD align=right>
<%
//AGREGADO POR VALIDACION ESTATUS 1
	if(!bSoloLectura) {
		if((sOpcion.equals("SAVE") || sOpcion.equals("NORMAL") || sOpcion.equals("") || sOrigen.equals("0")) && !sOpcion.equals("NEW")) {
			%>
				<INPUT class="boton" type="button" onclick="news();" name="NEW" value="Nuevo">&nbsp;<%
		} else {%>	
				<INPUT class="boton" type="button" onclick="cancel();" name="CANCEL" value="Cancelar">&nbsp;<%	
		}%>
				<INPUT class="boton" type="button" onclick="save();" name="SAVE" value="Grabar">&nbsp;<%
	}%>
			</TD>
		</TR>
<%		VMatrix vArchivoA;
		AnexoArchivo oArchivoA 	= new AnexoArchivo();
		vArchivoA = oArchivoA.GetAll(iIdAnexo, iIdFuncionario);
		String sSep = "";
		if(vArchivoA.getNumRows()>0){%>
		<TR>
			<TD><b>Archivos Adjuntos (Attachment):</b><% 
			for(int i=0;i<vArchivoA.getNumRows();i++){
				String	sAnexoArchivo = (((Vector)vArchivoA.getVMatrixAll().elementAt(0)).elementAt(i)+"").trim();
				String  sRuta 		= (((Vector)vArchivoA.getVMatrixAll().elementAt(3)).elementAt(i)+"").trim();
				String 	sArchivo 	= (((Vector)vArchivoA.getVMatrixAll().elementAt(4)).elementAt(i)+"").trim();
				String	sLink		= (((Vector)vArchivoA.getVMatrixAll().elementAt(5)).elementAt(i)+"").trim() + (((Vector)vArchivoA.getVMatrixAll().elementAt(4)).elementAt(i)+"").trim();
				%><%=sSep%><a target="new" onmouseover="this.style.cursor='hand'" style="cursor:normal" href="<%=sLink%>"><font color="Blue"><%=sArchivo%></font></a><%
				sSep = ",&nbsp;";
			}%>
			</TD>
		</TR><% 
		}%>
 	</TABLE>		
	<!-- Datos que se agregaran a la tabla  -->

	<TABLE cellPadding="0" cellSpacing="0" width="100%" BORDER="1" BORDERCOLOR="white">
	<!-- Etiqueta donde se aplican los encabezados de las tablas-->
<%
if(!sEstatus.equals("0")){
%>
		<TR align="middle">
			<td align="left" class="TituloMenu" colspan="2"> &nbsp;Generales</td>
		</TR>
<%
		if(!sOrigen.equals("0")){
			oAnexo.Get(iIdFuncionario, iOrigen);
		}
		if(!sOrigen.equals("0") || sOpcion.equals("NEW")){
%>
		<TR align="middle">
			<td align="left"> &nbsp;Consecutivo</td>
			<td align="left"> &nbsp;<INPUT name="sConsecutivo" size="45" class="txtBox" value="<%=oAnexo.GetConsecutivo()%>" maxlength="50"  onKeyPress="isInValid();" onpaste="validaPasteStr(this);">&nbsp;
			<%//AGREGADO POR VALIDACION ESTATUS 1
			if(!sOpcion.equals("NEW")){
				if(!bSoloLectura) { %>
			<a onmouseover="this.style.cursor='hand'" style="cursor:normal" onclick="del(<%=oAnexo.GetIdRenglon()%>);"><img src="<%=sPath%>Images/Eliminar.gif" ></a>
			<%	}
			}%>
			</td>
		</TR>
<%
		}
%>
		<TR align="middle">
			<td align="left"> &nbsp;Clave</td>
			<td align="left"> &nbsp;<select class="cmbBox" name="sClave" <%if((sOrigen+"").equals("0") && !sOpcion.equals("NEW")){%>disabled<%}%>>
					<option value="1" <%if("1".equals(oAnexo.GetClave())){%>selected<%}%>>Estudio</option>
					<option value="2" <%if("2".equals(oAnexo.GetClave())){%>selected<%}%>>Proyecto</option>
				</select></td>
		</TR>
		<TR align="middle">
			<td align="left"> &nbsp;Justificación</td>
			<td align="left"> &nbsp;<textarea class="txtBox" name="sJustificacion" cols="45" rows="5" <%if(sOrigen.equals("0") && !sOpcion.equals("NEW")){%>disabled<%}%> onKeyPress="isInValid();" onpaste="validaPasteStr(this);"><%=oAnexo.GetJustificacion()%></textarea></td>
		</TR>
		<TR align="middle">
			<td align="left"> &nbsp;Descripción</td>
			<td align="left"> &nbsp;<textarea class="txtBox" name="sDescripcion" cols="45" rows="5" <%if(sOrigen.equals("0") && !sOpcion.equals("NEW")){%>disabled<%}%> onKeyPress="isInValid();" onpaste="validaPasteStr(this);"><%=oAnexo.GetDescripcion()%></textarea></td>
		</TR>
		<TR align="middle">
			<td align="left"> &nbsp;Observaciones</td>
			<td align="left"> &nbsp;<textarea class="txtBox" name="sObservacion" cols="45" rows="5" <%if(sOrigen.equals("0") && !sOpcion.equals("NEW")){%>disabled<%}%> onKeyPress="isInValid();" onpaste="validaPasteStr(this);"><%=oAnexo.GetObservacion()%></textarea></td>
		</TR>
		<TR align="middle">
			<td align="left" class="TituloMenu" colspan="2"> &nbsp;Estudios de Factibilidad</td>
		</TR>
		<TR align="middle">
			<td align="left"> &nbsp;Técnicos</td>
			<td align="left"> &nbsp;<select class="cmbBox" name="sTecnico" <%if(sOrigen.equals("0") && !sOpcion.equals("NEW")){%>disabled<%}%>>
					<option value="0" <%if("0".equals(oAnexo.GetTecnico())){%>selected<%}%>>Sí</option>
					<option value="1" <%if("1".equals(oAnexo.GetTecnico())){%>selected<%}%>>No</option>
				</select></td>
		</TR>
		<TR align="middle">
			<td align="left"> &nbsp;Financieros</td>
			<td align="left"> &nbsp;<select class="cmbBox" name="sFinanciero" <%if(sOrigen.equals("0") && !sOpcion.equals("NEW")){%>disabled<%}%>>
					<option value="0" <%if("0".equals(oAnexo.GetFinanciero())){%>selected<%}%>>Sí</option>
					<option value="1" <%if("1".equals(oAnexo.GetFinanciero())){%>selected<%}%>>No</option>
				</select></td>
		</TR>
		<TR align="middle">
			<td align="left"> &nbsp;Socio Económicos</td>
			<td align="left"> &nbsp;<select class="cmbBox" name="sSocioEconomico" <%if(sOrigen.equals("0") && !sOpcion.equals("NEW")){%>disabled<%}%>>
					<option value="0" <%if("0".equals(oAnexo.GetSocioEconomico())){%>selected<%}%>>Sí</option>
					<option value="1" <%if("1".equals(oAnexo.GetSocioEconomico())){%>selected<%}%>>No</option>
				</select></td>
		</TR>
		<TR align="middle">
			<td align="left"> &nbsp;Planos Ejecutivos</td>
			<td align="left"> &nbsp;<select class="cmbBox" name="sPlanoEjecutivo" <%if(sOrigen.equals("0") && !sOpcion.equals("NEW")){%>disabled<%}%>>
					<option value="0" <%if("0".equals(oAnexo.GetPlanoEjecutivo())){%>selected<%}%>>Sí</option>
					<option value="1" <%if("1".equals(oAnexo.GetPlanoEjecutivo())){%>selected<%}%>>No</option>
				</select></td>
		</TR>
		<TR align="middle">
			<td align="left"> &nbsp;Planos en Detalle</td>
			<td align="left"> &nbsp;<select class="cmbBox" name="sPlanoDetalle" <%if(sOrigen.equals("0") && !sOpcion.equals("NEW")){%>disabled<%}%>>
					<option value="0" <%if("0".equals(oAnexo.GetPlanoDetalle())){%>selected<%}%>>Sí</option>
					<option value="1" <%if("1".equals(oAnexo.GetPlanoDetalle())){%>selected<%}%>>No</option>
				</select></td>
		</TR>
<%
} else {
%>
	</TABLE>
	<TABLE width="100%">
		<TR>
			<TD align="center"><H1 style="size=+2"><br>ESTE ANEXO NO APLICA</H1></TD>
		</TR>
	</TABLE>
<%
}
%>	
</FORM>
</td>
</tr>
</table>
<%@include file="Footer.jsp"%>
</body>
</html>
