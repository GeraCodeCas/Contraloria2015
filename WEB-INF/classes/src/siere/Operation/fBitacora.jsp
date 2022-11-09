<%/*********************************************************************************************************
Elaboro:     Enrique Martinez Solis
Lugar:	      Monterrey, NL
Fecha:		  16.Ene.2003
Compañia: CONSISS*/%>
<%@page import="com.consiss.util.tools.*"%>
<%@page import="com.consiss.util.*"%>
<%@page import="com.gob.*"%>
<%@page import="java.util.*" %>
<%@page import="java.text.*"%>
<%
//Valida la permanencia del usuario en session
if ((String)session.getValue("ok")!="Consiss")	response.sendRedirect("Error.html");


String hFechaIni = request.getParameter("sFechaIni")!= null ? request.getParameter("sFechaIni"): "";
String hFechaFin = request.getParameter("sFechaFin")!= null ? request.getParameter("sFechaFin"): "";
String hTipo = request.getParameter("sTipo")!= null ? request.getParameter("sTipo"): "";
String hBusca = request.getParameter("hBusca")!= null ? request.getParameter("hBusca"): "";
String sPath = "../";

if(hFechaIni.equals("") && hFechaFin.equals("")){
	hFechaIni = (new SimpleDateFormat("dd/MM/yyyy")).format(new java.util.Date());
	hFechaFin = (new SimpleDateFormat("dd/MM/yyyy")).format(new java.util.Date());
}
%>
<html>
<head>
	<title>Entrega - Recepción : Bitácora</title>
<link rel="stylesheet" type="text/css" href="<%=sPath%>Styles/Gobierno.css">
<script language="JavaScript" src="<%=sPath%>Scripts/Libreria.js"></script>
<script language="JavaScript" src="<%=sPath%>Scripts/Gobierno.js"></script>
<script language="JavaScript" src="<%=sPath%>Scripts/Calendario.js"></script>

<script language="JavaScript">
	function Buscar(){
		if(document.forma.sFechaIni.value==""){
			alert("Favor de capturar la Fecha Inicial");
			return false;
		}
		
		if(document.forma.sFechaFin.value==""){
			alert("Favor de capturar la Fecha Final");
			return false;
		}
		
		var FechaIni = EnviaDate(document.forma.sFechaIni.value);
		
		var FechaFin = EnviaDate(document.forma.sFechaFin.value);
		
		//if(document.forma.sFechaFin.value<document.forma.sFechaIni.value){
		if(FechaFin<FechaIni){	
			alert("La Fecha Inicial debe de ser menor o igual que la Fecha Final")
			return false;
		}
		
		document.forma.submit();
	}
	function EnviaDate(fecha){
		//Recibe una fecha en formato string dd/mm/aa
		if(fecha=="") { return ""; }
		var arrfecha = fecha.split("/");
		var dia = arrfecha[0];
		var mes = arrfecha[1];
		var anio = arrfecha[2];
		var fecha = anio+mes+dia;
		return (fecha);
	}
</script>
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
	<td width="135" valign="top"><%@include file="Menu.jsp"%></td>
	<!-- Menu -->
	<!-- Inicia Contenido -->
	<td valign="top">
	<form action="fBitacora.jsp" name="forma" method="post" onsubmit="Valida();">
	<input type="Hidden" name="hFechaIni" value="<%=hFechaIni%>">
	<input type="Hidden" name="hFechaFin" value="<%=hFechaFin%>">
	<input type="Hidden" name="hBusca" value="1">
		<TABLE border=0 cellPadding=0 cellSpacing=0>
			<TR>
				<TD colspan="6" class="TituloParrafo">&nbsp;Reporte de Bitácora</TD>
			</TR>
			<tr>
				<td width="90" align="right"><b>Fecha Inicial: </b></td>
				<td>&nbsp;<INPUT class="txtBox" name="sFechaIni" id="sFechaIni" type="Text" size="10" maxlength="10" value="<%=hFechaIni%>" readonly>&nbsp;<img src="<%=sPath%>Images/Fecha.gif" align="top" border=0 onclick="fPopCalendar(sFechaIni,sFechaIni)"></td>
				<TD>&nbsp;&nbsp;</TD>
				<td width="90" align="right"><b>Fecha Final: </b></td>
				<td>&nbsp;<INPUT class="txtBox" name="sFechaFin" id="sFechaFin" type="Text" size="10" maxlength="10" value="<%=hFechaFin%>" readonly>&nbsp;<img src="<%=sPath%>Images/Fecha.gif" align="top" border=0 onclick="fPopCalendar(sFechaFin,sFechaFin)"></td>
			</tr>
			<tr>
				<td align="right"><b>Tipo: </b></td>
				<td>&nbsp;<select class="cmbBox" name="sTipo" id="sTipo">
						<option value="" <%if(hTipo.trim().equals("")){%> selected<%}%>>--TODOS--</option>
						<option value="Carga" <%if(hTipo.trim().equals("Carga")){%> selected<%}%>>Carga Masivas</option>
						<option value="DeshaceCarga" <%if(hTipo.trim().equals("DeshaceCarga")){%> selected<%}%>>Deshace Carga Masiva</option>

						<option value="Elimina" <%if(hTipo.trim().equals("Elimina")){%> selected<%}%>>Elimina</option>
						<option value="Elimina" <%if(hTipo.trim().equals("Limpia")){%> selected<%}%>>Limpia Anexo</option>
						<option value="Entrada" <%if(hTipo.trim().equals("Entrada")){%> selected<%}%>>Entrada</option>
						
						<option value="Grabar" <%if(hTipo.trim().equals("Grabar")){%> selected<%}%>>Grabar</option>
						<option value="ListaAnexos" <%if(hTipo.trim().equals("ListaAnexos")){%> selected<%}%>>Lista Anexos</option>
						<option value="Nuevo" <%if(hTipo.trim().equals("Nuevo")){%> selected<%}%>>Nuevo</option>

					</select>
					</td>
				<td>&nbsp;</td>
				<td colspan="2" align="right" height="25">&nbsp;&nbsp;<INPUT class="boton" type="button" onclick="Buscar();" name="Busca" value="Buscar"></td>
			</tr>
		</table>
		<TABLE align=center border=0 cellPadding=0 cellSpacing=1 width="900">
			<TR align="middle">
				<td class="TituloMenu">&nbsp;</TD>
				<td class="TituloMenu">Usuario</TD>
				<td class="TituloMenu">Fecha</TD>
				<td class="TituloMenu">Tipo</TD>
				<td class="TituloMenu">Acción</TD>
				<td class="TituloMenu">Dirección IP</TD>
				<td class="TituloMenu">Nombre Máquina</TD>
				<td class="TituloMenu">Información Máquina</TD>
			</TR>
			<%
			int intContador = 0;
			String sBackColor = "";
			
			VMatrix vBitacora;
			Bitacora oBitacora 	= new Bitacora();
			if(!hBusca.equals("")){
			Utilerias oUtil 	= new Utilerias();
			hFechaIni = oUtil.sGetDateToNum(hFechaIni, "/");
			hFechaFin = oUtil.sGetDateToNum(hFechaFin, "/");
			//out.println(hFechaIni);
			//out.println(hFechaFin);
			vBitacora = oBitacora.GetAll(hFechaIni, hFechaFin, hTipo);
			if(vBitacora.getNumRows()>0){
				for(int i=0;i<vBitacora.getNumRows();i++){
					intContador = intContador + 1;
					if (intContador%2 == 0)	{ sBackColor = "#ffffff"; }
					else					{ sBackColor = "#eeeeee"; }
					String	sUsuario = (((Vector)vBitacora.getVMatrixAll().elementAt(0)).elementAt(i)+"").trim();
					String  sFecha		= (((Vector)vBitacora.getVMatrixAll().elementAt(1)).elementAt(i)+"").trim();
					String 	sTipo 	= (((Vector)vBitacora.getVMatrixAll().elementAt(2)).elementAt(i)+"").trim();
					sTipo = sTipo.equals("ListaAnexos")?"Lista Anexos":sTipo;
					sTipo = sTipo.equals("Carga")?"Carga Masiva":sTipo;
					sTipo = sTipo.equals("DeshaceCarga")?"Deshace Carga Masiva":sTipo;
					sTipo = sTipo.equals("LimpiaRH")?"Limpia Anexo":sTipo;

					String	sAccion = (((Vector)vBitacora.getVMatrixAll().elementAt(3)).elementAt(i)+"").trim();
					String  sDireccionIP		= (((Vector)vBitacora.getVMatrixAll().elementAt(4)).elementAt(i)+"").trim();
					String 	sNombreMaquina 	= (((Vector)vBitacora.getVMatrixAll().elementAt(5)).elementAt(i)+"").trim();
					String 	sInfoMaquina 	= (((Vector)vBitacora.getVMatrixAll().elementAt(6)).elementAt(i)+"").trim();
				%>
			<TR bgcolor="<%=sBackColor%>">
				<td>&nbsp;</td>
				<td><%=sUsuario%></td>
				<td><%=sFecha%></td>
				<td>&nbsp;<%=sTipo%></td>
				<td>&nbsp;<%=sAccion%></td>
				<td>&nbsp;<%=sDireccionIP%></td>
				<td>&nbsp;<%=sNombreMaquina%></td>
				<td>&nbsp;<%=sInfoMaquina%></td>
			</TR>
					<%}%>
				<%}%>
			<%}%>
		</table>	
		<TABLE>
			<TR>
				<TD><b>Total de Registros: <em><%=intContador %></em></b></TD>
			</TR>
		</TABLE>
		</form>
	</td>
	<!-- Termina Contendio-->
</tr>
</table>
<%@include file="Footer.jsp"%>