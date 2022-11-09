<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<%@page import="com.gob.EntregaEstatus.*"%>
<%
int iIdUnidadGobierno = java.lang.Integer.parseInt(request.getParameter("iIdUnidadGobierno")!= null ? request.getParameter("iIdUnidadGobierno"): "-1");
com.gob.EntregaEstatus	oEntregaEstatus = new com.gob.EntregaEstatus();
		
String sPath = "../"; 

com.gob.UnidadGobierno		oUnidadGobierno = new com.gob.UnidadGobierno();
com.consiss.util.Utilerias	oUtil		 	= new com.consiss.util.Utilerias();
%>
<link rel="stylesheet" type="text/css" href="<%=sPath%>Styles/Gobierno.css">
<title>Entrega - Recepción : Lista de Entregas (Impresión)</title>
<script language="JavaScript">
function closewin(){
				 window.close();
}
</script>
<SCRIPT LANGUAGE="javascript">
	var da = (document.all) ? 1 : 0;
	var pr = (window.print) ? 1 : 0;
	var mac = (navigator.userAgent.indexOf("Mac") != -1); 

	function Imprimir() {
	  if (pr){
		/* NS4, IE5 */
		window.print();
	  }else if (da && !mac){ 
		/* IE4 (Windows) */
	    window.print();/*vbPrintPage();*/
	  }else /* other browsers */
	    alert("Lo siento, su browser no permite esta accion.");
	}
	</SCRIPT>
</HEAD>
<body topmargin="2" leftmargin="2" onLoad="javascript:Imprimir();">
<table border="0" cellspacing="0" cellpadding="0" width="100%">
<!-- Encabezado -->
<tr>
<td><%@include file="HeaderAvance.jsp"%></td>
<tr>
<!-- Encabezado -->
<tr>
	<!-- Contenido -->
	<td valign="top" align="left">
	<br>
	<TABLE align=center border=0 cellPadding=0 cellSpacing=0 width="100%">
		<TR>
			<TD  colspan="2" class="TituloParrafo">LISTA DE ENTREGAS - RECEPCION</TD>
		</TR>
	</table>
	<br>
		<table>
			<tr>
				<td class="TituloMenu">Unidad Gobierno</TD>
				<td class="TituloMenu">Unidad Administratriva</TD>
				<td class="TituloMenu">Cargo</TD>
				<td class="TituloMenu">Funcionario</TD>
				<td class="TituloMenu">Estatus</TD>
				<td class="TituloMenu">Fecha Ultima Actualizaci&oacute;n</TD>
			</tr><%
			for(int j=0;j<oEntregaEstatus.GetAll(iIdUnidadGobierno);j++){%>
			<tr>
				<TD><%=oEntregaEstatus.GetUnidadGobierno(j)%></TD>
				<TD><%=oEntregaEstatus.GetUnidadAdministrativa(j)%></TD>
				<TD><%=oEntregaEstatus.GetCargo(j)%></TD>
				<TD><%=oEntregaEstatus.GetNombre(j) + " " + 
						oEntregaEstatus.GetApePaterno(j) + " " + oEntregaEstatus.GetApeMaterno(j)%></TD>
				<TD><%=oEntregaEstatus.GetEstatusDesc(oEntregaEstatus.GetEstatus(j))%></TD>
				<TD align="center""><%=!oEntregaEstatus.GetFecha(j).equals("")?
								oUtil.sGetNumToDate(oEntregaEstatus.GetFecha(j),"dd") + "." +
								oUtil.GetMesCorto(java.lang.Integer.parseInt(oUtil.sGetNumToDate(oEntregaEstatus.GetFecha(j),"MM"))) + "." +
								oUtil.sGetNumToDate(oEntregaEstatus.GetFecha(j),"yyyy")
								:""%></TD>
			</tr><%
			} %>
		</table>

	</td>
	<!-- Contenido -->
</tr>
</table>

</body>
</html>
