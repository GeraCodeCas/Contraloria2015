<%@page import="com.consiss.util.tools.*"%>
<%@page import="com.gob.*"%>
<%@page import="java.util.*" %>
<%
/********************************************************************************************************
'Elaboro:	Jesus Limon
'Lugar:		Monterrey, NL
'Fecha:		22.Nov.2002
'Compañia:	CONSISS
'Ultima Modificacion:06-Dic-2002
'By:		sigifredo Vazquez
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
String	sCodigo = request.getParameter("sCodigo")!= null ? request.getParameter("sCodigo"): "";

Anexo3XIV oAnexo	= new Anexo3XIV();
int iIdAnexo = oAnexo.GetIdAnexo();
%>
<%@include file="fAnexoInicia.jsp"%>
<html>
<head>
	<title>Entrega - Recepción : Anexo III.14</title>
<link rel="stylesheet" type="text/css" href="<%=sPath%>Styles/Gobierno.css">
<script language="JavaScript" src="<%=sPath%>Scripts/Gobierno.js"></script>
<script language="JavaScript" src="<%=sPath%>Scripts/Libreria.js"></script>
<script language="JavaScript" src="<%=sPath%>Scripts/Calendario.js"></script>
<script language="JavaScript">
	function edit(pCODE){
	<%//AGREGADO POR VALIDACION ESTATUS
		if(!bSoloLectura) { %>
		document.forma.sCodigo.value = pCODE;
		document.forma.sOpcion.value = 'EDIT';
		document.forma.submit();
	<%}%>
	}
	function save(){
			document.forma.sOpcion.value = 'SAVE';
			document.forma.submit();
	}
	
	function cancel(){
		document.forma.sCodigo.value = 0;
		document.forma.sOpcion.value = 'NORMAL';
		document.forma.submit();
	}
	function news() {
		document.forma.sCodigo.value = 0;
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
<FORM action="pAnexo3XIV.jsp" name="forma" method="post" >
	<input type="hidden" name="sOpcion" value="">
	<input type="hidden" name="sCodigo" value="<%=sCodigo%>"> 
	<TABLE align=center border=0 cellPadding=0 cellSpacing=0 width="100%">
		<TR>
			<TD class="TituloParrafo"  colspan="3">&nbsp;&nbsp;ANEXO III.14 - RELACIÓN DE COMPROMISOS GUBERNAMENTALES&nbsp;&nbsp;</TD>
		<tr>
			<TD width="70%" valign="middle">
				<%//AGREGADO POR VALIDACION ESTATUS
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
			</td>
			<TD align=right><%//AGREGADO POR VALIDACION ESTATUS
				if(!bSoloLectura) { %>
			<a onmouseover="this.style.cursor='hand'" style="cursor:normal" onclick="Adjuntar('<%=iIdFuncionario%>', '<%=iIdAnexo%>');"><img src="<%=sPath%>Images/Attach.jpg" ></a>&nbsp;&nbsp;
			<%}%>
			<a onmouseover="this.style.cursor='hand'" style="cursor:normal" onclick="imprimir('<%=iIdFuncionario%>', 'iAnexo3XIV.jsp');"><img src="<%=sPath%>Images/Impresora.jpg" ></a>&nbsp;&nbsp;
			<a onmouseover="this.style.cursor='hand'" style="cursor:normal" onclick="ayuda('<%=sPath%>Help/aAnexo3XIV.htm');"><img src="<%=sPath%>Images/Ayuda.jpg" ></a></td> 
			<TD align=right>
<%//AGREGADO POR VALIDACION ESTATUS
		if(!bSoloLectura) {
			if(sOpcion.equals("SAVE") || sOpcion.equals("NORMAL") || sOpcion.equals("") ) {%>						    
				<INPUT class="boton" type="button" onclick="news();" name="NEW" value="Nuevo">&nbsp;<%	
			} else {%>
				<INPUT class="boton" type="button" onclick="cancel();" name="CANCEL" value="Cancelar">&nbsp;<%
			}%>
				<INPUT class="boton" type="button" onclick="save();" name="SAVE" value="Grabar">&nbsp;<%
		}%>
			</TD>
		</TR><%
		VMatrix vArchivoA;
		AnexoArchivo oArchivoA 	= new AnexoArchivo();
		vArchivoA = oArchivoA.GetAll(iIdAnexo, iIdFuncionario);
		String sSep = "";
		if(vArchivoA.getNumRows()>0){%>
		<TR>
			<TD><b>Archivos Adjuntos (Attachment): &nbsp;&nbsp;</b><% 
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
		<TR align="middle">
			<td class="TituloMenu" colspan="2">&nbsp;</td>
			<td class="TituloMenu">No. de Compromiso</TD>
			<td class="TituloMenu">Fecha</TD>
			<td class="TituloMenu">Descripción del Compromiso</TD>
			<td class="TituloMenu">Situación Actual</TD>
			<td class="TituloMenu">% Avance Físico</TD>
			<td class="TituloMenu">% Avance Financiero</TD>
		</TR>
<%
if(!sEstatus.equals("0")){
	if(sOpcion.equals("NEW")){
%>
		<TR align="middle">
        	<TD colspan="2"></TD>
	       	<TD>
				<INPUT class="txtBox" name="sNoCompromiso" id="sNoCompromiso" type="Text" size="20" maxlength="50" value="" onKeyPress="isInValid();" onpaste="validaPasteStr(this);"></TD>
			<TD>
				<INPUT class="txtBox" name="sFecha" id="sFecha" type="Text" size="9" maxlength="9" readonly value="">&nbsp;<img src="<%=sPath%>Images/Fecha.gif" align="top" border=0 onclick="fPopCalendar(sFecha, sFecha)"></TD>
			<TD>
				<INPUT class="txtBox" name="sDescripcion" id="sDescripcion" type="Text" size="30" maxlength="50" value="" onKeyPress="isInValid();" onpaste="validaPasteStr(this);"></TD>
			<TD><select class="cmbBox" name="sSituacion">
					<option value="0">   --------   </option>
					<option value="1">No Iniciado</option>
					<option value="2">En Proceso</option>
					<option value="3">Cumplido</option>
					<option value="4">No Viable</option>
				</select></TD>
			<TD>
				<INPUT class="txtBox" name="sAvanceFisico" id="sAvanceFisico" type="Text" size="20" maxlength="3" value=""  onkeypress="valida(this);" onpaste="return validaPasteNum(this);"></TD>
			<TD>
				<INPUT class="txtBox" name="sAvanceFinanciero" id="sAvanceFinanciero" type="Text" size="20" maxlength="3" value=""  onkeypress="valida(this);" onpaste="return validaPasteNum(this);"></TD>
		</TR>
<%
		}
		int intContador = 0;
		String sBackColor = "";
		oAnexo.GetAll(iIdFuncionario);
		for(int i=0;i<oAnexo.GetAll(iIdFuncionario);i++){
			int 	iIdRenglon			= oAnexo.GetIdRenglon(i)!=-1?			oAnexo.GetIdRenglon(i):0;
			String 	sNoCompromiso		= oAnexo.GetNoCompromiso(i)!=null?		oAnexo.GetNoCompromiso(i)+"":"";
			String 	sFecha 				= oAnexo.GetFecha(i)!=null?				oAnexo.GetFecha(i):"";
			String 	sDescripcion	  	= oAnexo.GetDescripcion(i)!=null?		oAnexo.GetDescripcion(i):"";
			int 	iSituacion 			= oAnexo.GetSituacion(i)!=-1?			oAnexo.GetSituacion(i):0;
			String 	sSituacion 			= oAnexo.GetSituacionDescripcion(i)!=null?		oAnexo.GetSituacionDescripcion(i):"";
			String 	sAvanceFisico 		= oAnexo.GetAvanceFisico(i)!=null?		oAnexo.GetAvanceFisico(i):"";
			String 	sAvanceFinanciero	= oAnexo.GetAvanceFinanciero(i)!=null?	oAnexo.GetAvanceFinanciero(i):"";
			intContador = intContador + 1;
			if(intContador%2 == 0){
				sBackColor = "#ffffff";
			}else{
				sBackColor = "#eeeeee";
			}
			if(sOpcion.equals("EDIT") && (iIdRenglon == java.lang.Integer.parseInt(sCodigo))){
%>
		<TR align="left" bgcolor="<%=sBackColor%>">
        	<TD colspan="2"></TD>
	       	<TD>
				<INPUT class="txtBox" name="sNoCompromiso" id="sNoCompromiso" type="Text" size="20" maxlength="50" value="<%=sNoCompromiso%>" onKeyPress="isInValid();" onpaste="validaPasteStr(this);"></TD>
			<TD>
				<INPUT class="txtBox" name="sFecha" id="sFecha" type="Text" size="9" maxlength="9" value="<%=sFecha%>">&nbsp;<img src="<%=sPath%>Images/Fecha.gif" align="top" border=0 onclick="fPopCalendar(sFecha, sFecha)"></TD>
			<TD>
				<INPUT class="txtBox" name="sDescripcion" id="sDescripcion" type="Text" size="30" maxlength="50" value="<%=sDescripcion%>" onKeyPress="isInValid();" onpaste="validaPasteStr(this);"></TD>

			<TD><select class="cmbBox" name="sSituacion">
					<option value="0" <%if(iSituacion == 0){%>selected<%}%>>   --------   </option>
					<option value="1" <%if(iSituacion == 1){%>selected<%}%>>No Iniciado</option>
					<option value="2" <%if(iSituacion == 2){%>selected<%}%>>En Proceso</option>
					<option value="3" <%if(iSituacion == 3){%>selected<%}%>>Cumplido</option>
					<option value="4" <%if(iSituacion == 4){%>selected<%}%>>No Viable</option>
				</select></TD>
			<TD>
				<INPUT class="txtBox" name="sAvanceFisico" id="sAvanceFisico" type="Text" size="20" maxlength="3" value="<%=sAvanceFisico%>"  onkeypress="valida(this);" onpaste="return validaPasteNum(this);"></TD>
			<TD>
				<INPUT class="txtBox" name="sAvanceFinanciero" id="sAvanceFinanciero" type="Text" size="20" maxlength="3" value="<%=sAvanceFinanciero%>"  onkeypress="valida(this);" onpaste="return validaPasteNum(this);"></TD>
		</TR>
<%
			} else {
%>
		<TR align="left" bgcolor="<%=sBackColor%>" 
			onMouseOver = "MouseDentro(this);"
			onMouseOut  = "MouseFuera(this,'<%=sBackColor%>');">
			<TD colspan="2"><%//AGREGADO POR VALIDACION ESTATUS
				if(!bSoloLectura) { %>
			<a onmouseover="this.style.cursor='hand'" style="cursor:normal" onclick="del(<%=iIdRenglon%>);"><img src="<%=sPath%>Images/Eliminar.gif" ></a>
			<%}%>
			</TD>
			<TD align="right">
				<a onmouseover="this.style.cursor='hand'" style="cursor:normal" onclick="edit(<%=iIdRenglon%>);">
					<%=sNoCompromiso%>&nbsp;
				</a>
			</TD>
			<TD>&nbsp;
				<a onmouseover="this.style.cursor='hand'" style="cursor:normal" onclick="edit(<%=iIdRenglon%>);">
					<%=sFecha%>
				</a>
			</TD>
			<TD>&nbsp;	
				<a onmouseover="this.style.cursor='hand'" style="cursor:normal" onclick="edit(<%=iIdRenglon%>);">
					<%=sDescripcion%>
				</a>
			</TD>
			<TD >&nbsp;	
				<a onmouseover="this.style.cursor='hand'" style="cursor:normal" onclick="edit(<%=iIdRenglon%>);">
					<%=sSituacion%>
				</a>
			</TD>
			<TD align="right">
				<a onmouseover="this.style.cursor='hand'" style="cursor:normal" onclick="edit(<%=iIdRenglon%>);">
					<%=sAvanceFisico%>&nbsp;
				</a>
			</TD>
			<TD align="right">
				<a onmouseover="this.style.cursor='hand'" style="cursor:normal" onclick="edit(<%=iIdRenglon%>);">
					<%=sAvanceFinanciero%>&nbsp;
				</a>
			</TD>
		</TR><%
			}
		}
%>
	</TABLE>
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
