<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<%
com.gob.EntregaEstatus	oEntregaEstatus = new com.gob.EntregaEstatus();
com.gob.AnexoEstatus oAnexoEstatus = new com.gob.AnexoEstatus();

int iIdFuncionario =  java.lang.Integer.parseInt(
		(String)(session.getValue("iIdFuncionario")!= null?session.getValue("iIdFuncionario"):"0") );
		
int iIdFuncionarioAnt =  java.lang.Integer.parseInt(
		(String)(session.getValue("iIdFuncionarioAnt")!= null?session.getValue("iIdFuncionarioAnt"):"0") );
		
String sPath = "../"; %>
<link rel="stylesheet" type="text/css" href="<%=sPath%>Styles/Gobierno.css">
<script language="JavaScript" src="<%=sPath%>Scripts/Libreria.js"></script>
<script language="JavaScript" src="<%=sPath%>Scripts/Gobierno.js"></script>
<script language="JavaScript">
	function cierre(){
		document.forma.sOpcion.value = 'CIERRE';
		document.forma.submit();
	}
</script>
	<title>Entrega - Recepción : Cierre de Entrega</title>
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
	<!-- Contenido -->
	<td valign="top" align="center" width="80%">
	<FORM action="pCierreEntrega.jsp" name="forma" method="post">
			<input type="hidden" name="sOpcion" value="">
	<%
	// Validamos primero que todos los anexos esten en No aplica o en Estatus Autorizado
	oAnexoEstatus.GetContador(iIdFuncionarioAnt);
	oEntregaEstatus.Get(iIdFuncionarioAnt);
	
	int vTotNoAplica	= java.lang.Integer.parseInt(oAnexoEstatus.GetPorcRegistros(0)!=-1?oAnexoEstatus.GetPorcRegistros(0)+"":"0");
	int vTotVacio		= java.lang.Integer.parseInt(oAnexoEstatus.GetPorcRegistros(1)!=-1?oAnexoEstatus.GetPorcRegistros(1)+"":"0");
	int vTotEnProceso	= java.lang.Integer.parseInt(oAnexoEstatus.GetPorcRegistros(2)!=-1?oAnexoEstatus.GetPorcRegistros(2)+"":"0");
	int vTotPorAutorizar= java.lang.Integer.parseInt(oAnexoEstatus.GetPorcRegistros(3)!=-1?oAnexoEstatus.GetPorcRegistros(3)+"":"0");
	int vTotAutorizado	= java.lang.Integer.parseInt(oAnexoEstatus.GetPorcRegistros(4)!=-1?oAnexoEstatus.GetPorcRegistros(4)+"":"0");
	 %>
	<TABLE align=center border=0 cellPadding=0 cellSpacing=0 width="100%">
		<tr>
			<TD class="TituloParrafo">CIERRE DE ENTREGA DE FUNCIONARIO ANTERIOR</TD>
		</tr>
	</TABLE><BR>
	
		<table border="0" bordercolor="White">
			<tr>
				<td class="TituloMenu" >Estatus los Anexos de Entrega Anterior:</td>
				<td align="center" bgcolor="<%=oAnexoEstatus.GetEstatusColor(oAnexoEstatus.GetEstatusNoAplica())%>"><font style="color:'white';">No Aplica</font></td>
				<td align="center" bgcolor="<%=oAnexoEstatus.GetEstatusColor(oAnexoEstatus.GetEstatusVacio())%>"><font style="color:'white';">Vacio</font></td>
				<td align="center" bgcolor="<%=oAnexoEstatus.GetEstatusColor(oAnexoEstatus.GetEstatusEnProceso())%>"><font style="color:'black';">En Proceso</font></td>
				<td align="center" bgcolor="<%=oAnexoEstatus.GetEstatusColor(oAnexoEstatus.GetEstatusPorAutorizar())%>"><font style="color:'white';">Por Autorizar</font></td>
				<td align="center" bgcolor="<%=oAnexoEstatus.GetEstatusColor(oAnexoEstatus.GetEstatusAutorizado())%>"><font style="color:'white';">Autorizado</font></td>
			</tr>
	 		<tr bgcolor="#eeeeee">
				<td valign="middle" align="right"><b>Total:&nbsp;</b></td>
				<td valign="middle" align="center"><b><%=vTotNoAplica%></td>
				<td valign="middle" align="center"><b><%=vTotVacio%></b></td>
				<td valign="middle" align="center"><b><%=vTotEnProceso%></b></td>
				<td valign="middle" align="center"><b><%=vTotPorAutorizar%></b></td>
				<td valign="middle" align="center"><b><%=vTotAutorizado%></b></td>
				<td valign="middle" align="center"></td>
			</tr>
		</table>
		<br>
		<br>
		<INPUT onclick="cierre();" 	name="CIERRE" 	type="button" value="Cierre de Entrega-Recepción" class="boton">
		</form>
	</td>
	<!-- Contenido -->
</tr>
</table>
<%@include file="Footer.jsp"%>
</body>
</html>
