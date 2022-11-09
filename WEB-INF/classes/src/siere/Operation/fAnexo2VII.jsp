<%/*********************************************************************************************************
Elaboro:	Julio Enrique Espinosa Torres
Lugar:		Monterrey, NL
Fecha:		29.Oct.2002
Compañia:	CONSISS*/%>
<%@page import="com.consiss.util.tools.*"%>
<%@page import="com.gob.*"%>
<%@page import="java.util.*" %>
<%
//Valida la permanencia del usuario en session
if ((String)session.getValue("ok")!="Consiss")	response.sendRedirect("Error.html");

String	sOpcion = request.getParameter("sOpcion")!= null ? request.getParameter("sOpcion"): "";
String	sCodigo = request.getParameter("sCodigo")!= null ? request.getParameter("sCodigo"): "";

Anexo2VII oAnexo2VII 	= new Anexo2VII();

int iIdAnexo = oAnexo2VII.GetIdAnexo();
%>
<%@include file="fAnexoInicia.jsp"%>
<html>
<head>
	<title>Entrega - Recepción : Anexo II.7</title>
<link rel="stylesheet" type="text/css" href="<%=sPath%>Styles/Gobierno.css">
<script language="JavaScript" src="<%=sPath%>Scripts/Calendario.js"></script>
<script language="JavaScript" src="<%=sPath%>Scripts/Libreria.js"></script>
<script language="JavaScript" src="<%=sPath%>Scripts/Gobierno.js"></script>
<script language="JavaScript">
	function edit(pCODE ){
	<%//AGREGADO POR VALIDACION ESTATUS 1
	if(!bSoloLectura) { %>
		if(document.forma.txtTipoBoton.value=='1'){
			document.forma.sCodigo.value = pCODE;
			document.forma.sOpcion.value = 'EDIT';
			document.forma.submit();
		}else{
			document.forma.sCodigo.value = 0;
			document.forma.sOpcion.value = 'NEW';
			document.forma.submit();
		}
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
			document.forma.sOpcion.value = 'DEL';
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

<FORM action="pAnexo2VII.jsp" name="forma" method="post" >
	<input type="hidden" name="sOpcion" value="">
	<input type="hidden" name="sCodigo" value="<%=sCodigo%>"> 
	<TABLE align=center border=0 cellPadding=0 cellSpacing=0 width="100%">
		
		<TR>
			<TD  colspan="3" class="TituloParrafo" width="70%">&nbsp;&nbsp;ANEXO II.7 - ESTADOS FINANCIEROS DICTAMINADOS</TD>
		</TR>
		<TR>
		<TD width="70%">
		<%//AGREGADO POR VALIDACION ESTATUS 2
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
			</TD>		
			<TD align=right>
			<%//AGREGADO POR VALIDACION ESTATUS 4
			if(!bSoloLectura) { %>
			<a onmouseover="this.style.cursor='hand'" style="cursor:normal" onclick="Adjuntar('<%=iIdFuncionario%>','<%=iIdAnexo%>');"><img src="<%=sPath%>Images/Attach.jpg" ></a>&nbsp;&nbsp;
			<%}%>
			<a onmouseover="this.style.cursor='hand'" style="cursor:normal" onclick="imprimir(<%=iIdFuncionario%>, 'iAnexo2VII.jsp');"><img src="<%=sPath%>Images/Impresora.jpg" ></a>&nbsp;&nbsp;
			<a onmouseover="this.style.cursor='hand'" style="cursor:normal" onclick="ayuda('../Help/aAnexo2VII.htm');"><img src="<%=sPath%>Images/Ayuda.jpg" ></a></td> 
			<TD align=right>
	<%//AGREGADO POR VALIDACION ESTATUS 5
	if(!bSoloLectura) {
	if(sOpcion.equals("SAVE") || sOpcion.equals("NORMAL") || sOpcion.equals("") ) {%>			
			<INPUT type="Hidden"  name="NEW" value="Nuevo" > &nbsp; 
			
			<INPUT class="boton" type="button" onclick="edit(<%=iIdFuncionario%>);" name="EDIT" value="Editar">&nbsp;
	<%} else {%>	

			<INPUT class="boton" type="button" onclick="cancel();" name="CANCEL" value="Cancelar">&nbsp;
	<%}%>
			<INPUT class="boton" type="button" onclick="save();" name="SAVE" value="Grabar">&nbsp;
	<%}%>
			</TD>
		</TR>
		<%		VMatrix vArchivoA;
		AnexoArchivo oArchivoA 	= new AnexoArchivo();
		vArchivoA = oArchivoA.GetAll(iIdAnexo, iIdFuncionario);
		String sSep = "";
		if(vArchivoA.getNumRows()>0){%>
		<TR>
			<TD colspan="3"><b>Archivos Adjuntos (Attachment):</b><% 
			for(int i=0;i<vArchivoA.getNumRows();i++){
				String	sAnexoArchivo = (((Vector)vArchivoA.getVMatrixAll().elementAt(0)).elementAt(i)+"").trim();
				String  sRuta 		= (((Vector)vArchivoA.getVMatrixAll().elementAt(3)).elementAt(i)+"").trim();
				String 	sArchivo 	= (((Vector)vArchivoA.getVMatrixAll().elementAt(4)).elementAt(i)+"").trim();
				String	sLink		= (((Vector)vArchivoA.getVMatrixAll().elementAt(5)).elementAt(i)+"").trim() + (((Vector)vArchivoA.getVMatrixAll().elementAt(4)).elementAt(i)+"").trim();
				%><%=sSep%><a target="new" onmouseover="this.style.cursor='hand'" style="cursor:normal" href="<%=sLink%>"><font color="Blue"><%=sArchivo%></font></a><%
				sSep = ", ";
			}%>
			</TD>
		</TR><% 
		}%>
		</TABLE>	
<%	if(!sEstatus.equals("0")){%>		
<table align="center" cellspacing="0" cellpadding="0" border="0" width="100%">
<tr>
    <td width="450" align="left" class="TituloMenu">Se Entrega (*)</td>
    <td  align="center" class="TituloMenu">Sí</td>
    <td  align="center" class="TituloMenu">No</td>
    <td  align="center" class="TituloMenu">Fecha de cierre de la Información</td>
</tr>
<tr>
<TD valign="top" width="450">
     <TABLE cellPadding="0" cellSpacing="0" width="452" BORDER="0">
		 <TR height="25">
			 <TD class="TituloMenu"><a onmouseover="this.style.cursor='hand'" style="cursor:normal" onclick="edit(<%=iIdFuncionario%>);">Balance General</a></TD>
		 </TR>
		 <TR height="25">
		 	 <TD class="TituloMenu"><a onmouseover="this.style.cursor='hand'" style="cursor:normal" onclick="edit(<%=iIdFuncionario%>);">Estado de Resultados</a></TD>
		 </TR>
		 <TR height="25">
			 <TD class="TituloMenu"><a onmouseover="this.style.cursor='hand'" style="cursor:normal" onclick="edit(<%=iIdFuncionario%>);">Estado de Origen y Aplicación</a></TD>
		 </TR>
		 <TR height="25">
			 <TD class="TituloMenu"><a onmouseover="this.style.cursor='hand'" style="cursor:normal" onclick="edit(<%=iIdFuncionario%>);">Libros y Registros de Contabilidad al Corriente</a></TD>
		 </TR>
		  <TR height="1"><td height="1" bgcolor="Black"></td></tr>
		 <TR height="50">
			 <TD class="TituloMenu"><a onmouseover="this.style.cursor='hand'" style="cursor:normal" onclick="edit(<%=iIdFuncionario%>);">Los Estados Financieros fueron auditados externamente</a></TD>
		 </TR>
		
	  </TABLE></TD>
<TD valign="top">
	  <TABLE cellPadding="0" cellSpacing="0" width="100%" BORDER="0">
	  <%if(sOpcion.equals("NEW")){%>
        	<TR height="25"><td><input type="radio" name="sBalanceGeneral" id="sBalanceGeneral" value="1"></td></tr>
			<TR height="25"><td><input type="radio" name="sEstadoResultados" id="sEstadoResultados" value="1"></td></tr>
			<TR height="25"><td><input type="radio" name="sEstadoOrigen" id="sEstadoOrigen" value="1"></td></tr>
			<TR height="25"><td><input type="radio" name="sLibrosRegistros" id="sLibrosRegistros" value="1"></td></tr>
			<TR height="2"><td height="2"></td></tr>
			<TR height="50"><td><input type="radio" name="sEstadosFinancieros" id="sEstadosFinancieros" value="1"></td></tr>
	<%}%>	
	<%		
			oAnexo2VII.Get(iIdFuncionario);
			String vBalanceGeneral 		= oAnexo2VII.GetBalanceGeneral()!=null?oAnexo2VII.GetBalanceGeneral():"";
			String vEstadoResultados	= oAnexo2VII.GetEstadoResultados()!=null?oAnexo2VII.GetEstadoResultados():"";
			String vEstadoOrigen 		= oAnexo2VII.GetEstadoOrigen()!=null?oAnexo2VII.GetEstadoOrigen():"";
			String vLibrosRegistros 	= oAnexo2VII.GetLibrosRegistros()!=null?oAnexo2VII.GetLibrosRegistros():"";
			String vEstadosFinancieros 	= oAnexo2VII.GetEstadosFinancieros()!=null?oAnexo2VII.GetEstadosFinancieros():"";
			String vQuienAudito		    = oAnexo2VII.GetQuienAudito()!=null?oAnexo2VII.GetQuienAudito():"";
			String vFechaCierre 		= oAnexo2VII.GetFechaCierre()!=null?oAnexo2VII.GetFechaCierre():"";
			String vFechaAuditoria 		= oAnexo2VII.GetFechaAuditoria()!=null?oAnexo2VII.GetFechaAuditoria():"";
			
			if (oAnexo2VII.GetBalanceGeneral()==null || oAnexo2VII.GetBalanceGeneral().trim().equals("")){
				%>
				
				<input type="Hidden" name="txtTipoBoton" id="txtTipoBoton" value="0">
				<%
			}else{
				%>
				<input type="Hidden" name="txtTipoBoton" id="txtTipoBoton" value="1">
				
				<%
			}
			if(sOpcion.equals("EDIT") && sCodigo.equals(iIdFuncionario+"") ){
			%>
		    <TR height="25"><td><input type="radio" name="sBalanceGeneral" id="sBalanceGeneral" value="1" <%if(vBalanceGeneral.equals("1")){%>checked<%}%>></td></tr>
			<TR height="25"><td><input type="radio" name="sEstadoResultados" id="sEstadoResultados" value="1" <%if(vEstadoResultados.equals("1")){%>checked<%}%>></td></tr>
			<TR height="25"><td><input type="radio" name="sEstadoOrigen" id="sEstadoOrigen" value="1" <%if(vEstadoOrigen.equals("1")){%>checked<%}%>></td></tr>
			<TR height="25"><td><input type="radio" name="sLibrosRegistros" id="sLibrosRegistros" value="1" <%if(vLibrosRegistros.equals("1")){%>checked<%}%>></td></tr>
			<TR height="2"><td height="2"></td></tr>
			<TR height="50"><td><input type="radio" name="sEstadosFinancieros" id="sEstadosFinancieros" value="1" <%if(vEstadosFinancieros.equals("1")){%>checked<%}%>></td></tr>
	<%
			} 
			
			if(!sOpcion.equals("NEW") && !sOpcion.equals("EDIT")){%>
			<TR height="25"><td><%if(vBalanceGeneral.equals("1")){%><img src="<%=sPath%>/Images/VinetaGde.gif"><%}%></td></tr>
			<TR height="25"><td><%if(vEstadoResultados.equals("1")){%><img src="<%=sPath%>/Images/VinetaGde.gif"><%}%></td></tr>
			<TR height="25"><td><%if(vEstadoOrigen.equals("1")){%><img src="<%=sPath%>/Images/VinetaGde.gif"><%}%></td></tr>
			<TR height="25"><td><%if(vLibrosRegistros.equals("1")){%><img src="<%=sPath%>/Images/VinetaGde.gif"><%}%></td></tr>
			<TR height="2"><td height="2"></td></tr>
			<TR height="50"><td><%if(vEstadosFinancieros.equals("1")){%><img src="<%=sPath%>/Images/VinetaGde.gif"><%}%></td></tr>
	<%}%>	
       </TABLE></td>


<TD valign="top">
      <TABLE cellPadding="0" cellSpacing="0" width="100%" BORDER="0" bgcolor="eeeeee">
        	 <%if(sOpcion.equals("NEW")){%>
        	<TR height="25"><td><input type="radio" name="sBalanceGeneral" id="sBalanceGeneral" value="2" checked></td></tr>
			<TR height="25"><td><input type="radio" name="sEstadoResultados" id="sEstadoResultados" value="2" checked></td></tr>
			<TR height="25"><td><input type="radio" name="sEstadoOrigen" id="sEstadoOrigen" value="2" checked></td></tr>
			<TR height="25"><td><input type="radio" name="sLibrosRegistros" id="sLibrosRegistros" value="2" checked></td></tr>
			<TR height="2"><td height="2"></td></tr>
			<TR height="50"><td><input type="radio" name="sEstadosFinancieros" id="sEstadosFinancieros" value="2" checked></td></tr>
	<%}%>	
	<%if(sOpcion.equals("EDIT") && sCodigo.equals(iIdFuncionario+"") ){%>
		    <TR height="25"><td><input type="radio" name="sBalanceGeneral" id="sBalanceGeneral" value="2" <%if(vBalanceGeneral.equals("2")){%>checked<%}%>></td></tr>
			<TR height="25"><td><input type="radio" name="sEstadoResultados" id="sEstadoResultados" value="2" <%if(vEstadoResultados.equals("2")){%>checked<%}%>></td></tr>
			<TR height="25"><td><input type="radio" name="sEstadoOrigen" id="sEstadoOrigen" value="2" <%if(vEstadoOrigen.equals("2")){%>checked<%}%>></td></tr>
			<TR height="25"><td><input type="radio" name="sLibrosRegistros" id="sLibrosRegistros" value="2" <%if(vLibrosRegistros.equals("2")){%>checked<%}%>></td></tr>
			<TR height="2"><td height="2"></td></tr>
			<TR height="50"><td><input type="radio" name="sEstadosFinancieros" id="sEstadosFinancieros" value="2" <%if(vEstadosFinancieros.equals("2")){%>checked<%}%>></td></tr>
	<%} 
	if(!sOpcion.equals("NEW") && !sOpcion.equals("EDIT")){%>
			<TR height="25"><td><%if(vBalanceGeneral.equals("2")){%><img src="<%=sPath%>/Images/VinetaGde.gif"><%}%></td></tr>
			<TR height="25"><td><%if(vEstadoResultados.equals("2")){%><img src="<%=sPath%>/Images/VinetaGde.gif"><%}%></td></tr>
			<TR height="25"><td><%if(vEstadoOrigen.equals("2")){%><img src="<%=sPath%>/Images/VinetaGde.gif"><%}%></td></tr>
			<TR height="25"><td><%if(vLibrosRegistros.equals("2")){%><img src="<%=sPath%>/Images/VinetaGde.gif"><%}%></td></tr>
			<TR height="2"><td height="2"></td></tr>
			<TR height="50"><td><%if(vEstadosFinancieros.equals("2")){%><img src="<%=sPath%>/Images/VinetaGde.gif"><%}%></td></tr>
	<%}%>	
      </TABLE></td>
<TD valign="top">
      <TABLE cellPadding="0" cellSpacing="0" width="100%" BORDER="0">
        	<TR height="25"><td align="center"><%if(sOpcion.equals("NEW")){%>
				<INPUT class="txtBox" name="sFechaCierre" id="sFechaCierre" type="Text" size="9"  value="" readonly>&nbsp;<img src="<%=sPath%>Images/Fecha.gif" align="top" border=0 onclick="fPopCalendar(sFechaCierre,sFechaCierre)">
				<%}	
				if(sOpcion.equals("EDIT") && sCodigo.equals(iIdFuncionario+"") ){%>
				<INPUT class="txtBox" name="sFechaCierre" id="sFechaCierre" type="Text" size="9"  value="<%=vFechaCierre%>" readonly>&nbsp;<img src="<%=sPath%>Images/Fecha.gif" align="top" border=0 onclick="fPopCalendar(sFechaCierre,sFechaCierre)">
				<%} 
				if(!sOpcion.equals("NEW") && !sOpcion.equals("EDIT")){%>
				&nbsp;<a onmouseover="this.style.cursor='hand'" style="cursor:normal" onclick="edit(<%=iIdFuncionario%>);"><%=vFechaCierre%></a>
				<%}%></td></tr>
			<TR height="25"><td></td></tr>
			<TR height="25"><td></td></tr>
			<TR height="25"><td></td></tr>
			<TR height="2"><td height="2" bgcolor="black"></td></tr>
			<TR height="50" valign="top"><td valign="top">
			 <TABLE cellPadding="0" cellSpacing="0" width="100%" BORDER="0">
        	    <TR height="25"><td align="center" width="100%" class="TituloMenu">Fecha de la Auditoría</td></tr>
				<TR height="25"><td  width="100%" align="center">
				<%if(sOpcion.equals("NEW")){%>
				<INPUT class="txtBox" name="sFechaAuditoria" id="sFechaAuditoria" type="Text" size="9"  value="" readonly>&nbsp;<img src="<%=sPath%>Images/Fecha.gif" align="top" border=0 onclick="fPopCalendar(sFechaAuditoria,sFechaAuditoria)">
				<%}	
				if(sOpcion.equals("EDIT") && sCodigo.equals(iIdFuncionario+"") ){%>
				<INPUT class="txtBox" name="sFechaAuditoria" id="sFechaAuditoria" type="Text" size="9"  value="<%=vFechaAuditoria%>" readonly>&nbsp;<img src="<%=sPath%>Images/Fecha.gif" align="top" border=0 onclick="fPopCalendar(sFechaAuditoria,sFechaAuditoria)">
				<%} 
				if(!sOpcion.equals("NEW") && !sOpcion.equals("EDIT")){%>
				&nbsp;<a onmouseover="this.style.cursor='hand'" style="cursor:normal" onclick="edit(<%=iIdFuncionario%>);"><%=vFechaAuditoria%></a>
				<%}%></td></tr>
			 </TABLE></td></tr>
      </TABLE></td>
</tr>
<TR>
	<TD height="25" class="TituloMenu"><a onmouseover="this.style.cursor='hand'" style="cursor:normal" onclick="edit(<%=iIdFuncionario%>);">¿Quién Auditó?</a></TD>
	<td colspan="3">
	<%if(sOpcion.equals("NEW")){%>
	<INPUT class="txtBox" name="sQuienAudito" id="sQuienAudito" maxlength="100" type="Text" size="20" value="" onKeyPress="isInValid();" onpaste="validaPasteStr(this);">
	<%}	
	if(sOpcion.equals("EDIT") && sCodigo.equals(iIdFuncionario+"") ){%>
	<INPUT class="txtBox" name="sQuienAudito" id="sQuienAudito" maxlength="100" type="Text" size="20"  value="<%=vQuienAudito%>" onKeyPress="isInValid();" onpaste="validaPasteStr(this);">
	<%} 
	if(!sOpcion.equals("NEW") && !sOpcion.equals("EDIT")){%>
	&nbsp;<a onmouseover="this.style.cursor='hand'" style="cursor:normal" onclick="edit(<%=iIdFuncionario%>);"><%=vQuienAudito%></a>
	<%}%></td>
</TR>
<TR>
	<TD height="25" colspan="4" class="SubTituloMenu">* Adjuntar Últimos Estados Financieros Auditados y Relación de los Estados Financieros Anteriores, Auditados</td>
</TR>
</table>
<%
} else {
%>
	<TABLE width="100%">
		<TR>
			<TD align="center"><H1 style="size=+2"><br>ESTE ANEXO NO APLICA</H1></TD>
		</TR>
	</TABLE>
<%
}
%>	

</FORM>
</td>	<!-- Contenido -->
</tr>
</table>
<%@include file="Footer.jsp"%>
</body>
</html>
