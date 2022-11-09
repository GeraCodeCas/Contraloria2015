<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<%@page import="com.gob.EntregaEstatus.*"%>
<%
if ((String)session.getValue("ok")!="Consiss") response.sendRedirect("Error.html");
			
int iIdUnidadGobierno = java.lang.Integer.parseInt(request.getParameter("iIdUnidadGobierno")!= null ? request.getParameter("iIdUnidadGobierno"): "-1");
int tempIdUnidadGobierno =  java.lang.Integer.parseInt(
		(String)(session.getValue("iIdUnidadGobierno")!= null?session.getValue("iIdUnidadGobierno"):"0") );
int tempTipoUsuario =  java.lang.Integer.parseInt(
	(String)(session.getValue("iTipoUsuario")!= null?session.getValue("iTipoUsuario"):"0") );
	

com.gob.EntregaEstatus	oEntregaEstatus = new com.gob.EntregaEstatus();
		
String sPath = "../"; 

com.gob.UnidadGobierno		oUnidadGobierno = new com.gob.UnidadGobierno();
com.consiss.util.Utilerias	oUtil		 	= new com.consiss.util.Utilerias();
%>
<link rel="stylesheet" type="text/css" href="<%=sPath%>Styles/Gobierno.css">
<script language="JavaScript" src="<%=sPath%>Scripts/Libreria.js"></script>
<script language="JavaScript" src="<%=sPath%>Scripts/Gobierno.js"></script>
<script language="JavaScript">
	function selecciona(){
		
		document.forma.submit();
	}

	function generaFoto(pIdFuncionario){
		document.forma.sIdFuncionario.value = pIdFuncionario;
		document.forma.sOpcion.value = "FOTO";
		document.forma.submit();
	}
		
	function validaEntrega(pIdFuncionario){
		if(confirm("¿Desea Validar y Cerrar la Entrega?")){ 
			document.forma.sIdFuncionario.value = pIdFuncionario;
			document.forma.sOpcion.value = "VALIDA";
			document.forma.submit();
		}
	}
	
	function asignaNuevoFuncionario(pIdFuncionario, pIdCargo, pIdUnidadAdministrativa, pIdUnidadGobierno){
		document.forma.sIdFuncionario.value			= pIdFuncionario;
		document.forma.sIdCargo.value				= pIdCargo;
		document.forma.sIdUnidadAdministrativa.value= pIdUnidadAdministrativa;
		document.forma.sIdUnidadGobierno.value		= pIdUnidadGobierno;
		document.forma.sOpcion.value = "ASIGNA";
		document.forma.submit();
	}
		
	function rechazaEntrega(pIdFuncionario){
		if(confirm("¿Desea Rechazar la Entrega?")){ 
			document.forma.sIdFuncionario.value = pIdFuncionario;
			document.forma.sOpcion.value = "RECHAZA";
			document.forma.submit();
		}
	}
	function imprimir(){
		var ancho = 600;
		var alto = 500;
		var x = (screen.width - ancho) / 2;
		var y = (screen.height - alto)- 150 / 2;		
		var strUrl  = "iListaEntregas.jsp?iIdUnidadGobierno=" + document.forma.iIdUnidadGobierno.value;
		window.open(strUrl, "Imprimir", "width=" + ancho + ",height=" + alto + ",top=" + y + ",left=" + x + ",toolbar=0,location=0,directories=0,status=0,menubar=0,scrollbars=1,resizable=0");
	}
	
	function deshaceEntrega(pIdFuncionario){
		document.forma.sIdFuncionario.value = pIdFuncionario;
		document.forma.sOpcion.value = "DESHACE";
		document.forma.submit();
	}
</script>
	<title>Entrega - Recepción : Lista de Entregas</title>
</head>

<body topmargin="0" leftmargin="0">
<table border="0" cellspacing="0" cellpadding="0" width="100%">
<!-- Encabezado -->
<tr>
<td colspan="2"><%@include file="Header.jsp"%></td>
<tr>
<!-- Encabezado -->
<tr>
	<!-- Menu -->
	<td width="135px" valign="top"><%@include file="Menu.jsp"%></td>
	<!-- Menu -->
	<!-- Contenido -->
	<td valign="top" align="left">
	<br>
	<FORM action="pListaEntregas.jsp" name="forma" method="post" >
		<input type="hidden" name="sOpcion" id="sOpcion">
		<input type="hidden" name="iIdFuncionario"			id="iIdFuncionario" value="0">
		<input type="hidden" name="sIdFuncionario"			id="sIdFuncionario" value="0">
		<input type="hidden" name="sIdCargo"				id="sIdCargo">
		<input type="hidden" name="sIdUnidadAdministrativa" id="sIdUnidadAdministrativa">
		<input type="hidden" name="sIdUnidadGobierno"		id="sIdUnidadGobierno">
	<TABLE align=center border=0 cellPadding=0 cellSpacing=0 width="100%">
		<TR>
			<TD  colspan="2" class="TituloParrafo">LISTA DE ENTREGAS - RECEPCI&Oacute;N</TD>
		</TR>
		<TR>
			<TD></TD>		
			<TD align=right>&nbsp;&nbsp;<a onmouseover="this.style.cursor='hand'" style="cursor:normal" onclick="imprimir();"><img src="<%=sPath%>Images/Impresora.jpg" ></a></td> 
			<TD align=right></TD>
		</TR>
		<%if(tempIdUnidadGobierno == 0){%>
		<tr>
			<td width="25%"><b>Dependencia, Organismo o Tribunal</b></td>
			<td>
				<select class="cmbBox" name="iIdUnidadGobierno" onchange="selecciona();">
						<option value="-1"> [ SELECCIONE ] </option>
						<option <%=iIdUnidadGobierno==0?"selected":""%> value="0"> [ TODAS ] </option><%
				for(int j=0;j<oUnidadGobierno.GetAll();j++){
					int oIdUnidadGobierno	= oUnidadGobierno.GetIdUnidadGobierno(j);
					String oNombre 			= oUnidadGobierno.GetNombre(j);		%>
						<option <%=iIdUnidadGobierno==oIdUnidadGobierno?"selected":""%> value="<%=oIdUnidadGobierno%>"><%=oNombre%></option><%
				}%>
					</select></td>
		</TR>
		<%} else {%>
			<input type="hidden" name="iIdUnidadGobierno" id="iIdUnidadGobierno" value="<%=tempIdUnidadGobierno%>">
		<%} %>
	</table>
	<br>
		<TABLE cellPadding="0" cellSpacing="0" width="100%" BORDER="1" BORDERCOLOR="white">
			<tr valign="middle" align="center">
				<td class="TituloMenu">Funcionario</TD>
				<td class="TituloMenu">Cargo</TD>
				<td class="TituloMenu">Unidad Administratriva</TD>
				<td class="TituloMenu">Dependencia, Organismo o Tribunal</TD>
				<td class="TituloMenu">Estatus</TD>
				<td class="TituloMenu">Fecha Ultima Actualizaci&oacute;n</TD>
				<td class="TituloMenu">&nbsp;</TD>
			</tr><%
			iIdUnidadGobierno = tempIdUnidadGobierno != 0 ? tempIdUnidadGobierno : iIdUnidadGobierno ;
			int intContador = 0;
			String sBackColor = "";
			for(int j=0;j<oEntregaEstatus.GetAll(iIdUnidadGobierno);j++){
				intContador = intContador + 1;
				if (intContador%2 == 0){	sBackColor = "#ffffff";	}
				else{						sBackColor = "#eeeeee"; }%>
			<tr valign="top" bgcolor="<%=sBackColor%>">
				<TD><%=oEntregaEstatus.GetNombre(j) + " " + 
						oEntregaEstatus.GetApePaterno(j) + " " + oEntregaEstatus.GetApeMaterno(j)%></TD>
				<TD><%=oEntregaEstatus.GetCargo(j)%></TD>
				<TD><%=oEntregaEstatus.GetUnidadAdministrativa(j)%></TD>
				<TD><%=oEntregaEstatus.GetUnidadGobierno(j)%></TD>
				<TD><%=oEntregaEstatus.GetEstatusDesc(oEntregaEstatus.GetEstatus(j))%></TD>
				<TD align="center""><%=!oEntregaEstatus.GetFecha(j).equals("")?
								oUtil.sGetNumToDate(oEntregaEstatus.GetFecha(j),"dd") + "." +
								oUtil.GetMesCorto(java.lang.Integer.parseInt(oUtil.sGetNumToDate(oEntregaEstatus.GetFecha(j),"MM"))) + "." +
								oUtil.sGetNumToDate(oEntregaEstatus.GetFecha(j),"yyyy")
								:""%></TD>
				<%com.gob.Usuario oUsuario = new com.gob.Usuario();
				if(tempTipoUsuario!= oUsuario.GetTipoRepresentante()){ %>
				<TD><% if(oEntregaEstatus.GetEstatus(j).equals( oEntregaEstatus.GetEstatusNoIniciada()) || oEntregaEstatus.GetEstatus(j).equals( oEntregaEstatus.GetEstatusRechazadaPorEnlace()) ){%><a onClick="generaFoto(<%=oEntregaEstatus.GetIdFuncionario(j)%>)" onmouseover="this.style.cursor='hand'" ><img src="..\images\Foto.gif" border="0" height="17px"></a>&nbsp;<%}
					//if(oEntregaEstatus.GetEstatus(j).equals( oEntregaEstatus.GetEstatusIniciada()) || oEntregaEstatus.GetEstatus(j).equals( oEntregaEstatus.GetEstatusRechazadaPorEnlace()) ){
					if(oEntregaEstatus.GetEstatus(j).equals( oEntregaEstatus.GetEstatusIniciada())  ){
						%><INPUT class="boton" type="button" style="width:'140px';" onclick="validaEntrega(<%=oEntregaEstatus.GetIdFuncionario(j)%>);" name="Valida" value="Valida y Cierra Entrega">&nbsp;&nbsp;&nbsp;<%} %>
					<%if(oEntregaEstatus.GetEstatus(j).equals( oEntregaEstatus.GetEstatusIniciada()) ){
						%><INPUT class="boton" type="button" style="width:'110px';" onclick="rechazaEntrega(<%=oEntregaEstatus.GetIdFuncionario(j)%>);" name="Rechaza" value="Rechaza Entrega"><%} %>
					<%if(oEntregaEstatus.GetEstatus(j).equals( oEntregaEstatus.GetEstatusValidadaPorEnlace() )){
						%><INPUT class="boton" type="button"style="width:'160px';" onClick="asignaNuevoFuncionario(<%=oEntregaEstatus.GetIdFuncionario(j)
						%>, <%=oEntregaEstatus.GetIdCargo(j)%>, <%=oEntregaEstatus.GetIdUnidadAdministrativa(j)
						%>, <%=oEntregaEstatus.GetIdUnidadGobierno(j)%>	);" name="Asigna" value="Asigna Nuevo Funcionario"><%
						 if(tempTipoUsuario == oUsuario.GetTipoAdministrador()){
						 %>&nbsp;<INPUT class="boton" type="button" style="width:'100px';" onclick="deshaceEntrega('<%=oEntregaEstatus.GetIdFuncionario(j)%>');" name="deshace" value="Deshace Cierre"><%
						}
					} 
					%>
					</TD><%
				} 
				%>
			</tr><%
			} %>
		</table>
	</form>

	</td>
	<!-- Contenido -->
</tr>
</table>
<%@include file="Footer.jsp"%>
</body>
</html>
