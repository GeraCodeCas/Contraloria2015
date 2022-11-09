<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<%String sPath = "../"; 
com.gob.EntregaEstatus		oEntregaEstatus	= new com.gob.EntregaEstatus();
com.gob.Funcionario			oFuncionario	= new com.gob.Funcionario();
session.putValue("sEstatusEntrega", oEntregaEstatus.GetEstatusNoIniciada()+"");
session.putValue("sEstatus", oFuncionario.GetEstatusActivo());
%>
<link rel="stylesheet" type="text/css" href="<%=sPath%>Styles/Gobierno.css">
<script language="JavaScript" src="<%=sPath%>Scripts/Libreria.js"></script>
<script language="JavaScript" src="<%=sPath%>Scripts/Gobierno.js"></script>
<script language="JavaScript">
	function cierre(){
		document.forma.sOpcion.value = 'CIERRE';
		document.forma.submit();
	}
</script>
	<title>Entrega - Recepción : Finalización de Entrega</title>
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
	<td valign="top" align="center" width="80%"><BR><BR>
		<TABLE align=center border=0 cellPadding=0 cellSpacing=0 width="100%">
			<tr>
				<TD class="TituloParrafo" align="center">CIERRE FINALIZADO, AHORA YA SE HA INICIALIZADO SU INFORMACION</TD>
			</tr>
		</TABLE>

	</td>
	<!-- Contenido -->
</tr>
</table>
	
	

</head>

<body>


<%@include file="Footer.jsp"%>
</body>
</html>
