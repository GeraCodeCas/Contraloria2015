<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<%String sPath = "../"; %>
<link rel="stylesheet" type="text/css" href="<%=sPath%>Styles/Gobierno.css">
	<title>Entrega - Recepción : Espere...</title>

</head>
<body id="idBody" topmargin="0" leftmargin="0">
<table border="0" cellspacing="0" cellpadding="0" width="100%">
<!-- Encabezado -->
<tr>
<td colspan="2"><%@include file="Header.jsp"%></td>
<tr>
<!-- Encabezado -->
<tr>
	<!-- Menu -->
	<!-- Menu -->
	<!-- Contenido -->
	<td valign="top" align="center" width="80%">
	<FORM action="fCierreFinalizado.jsp" name="forma" method="post">
		<br>
		<br>
		<br>
		<br>
		<TABLE align=center border=0 cellPadding=0 cellSpacing=0 width="100%">
			<tr>
				<TD class="TituloParrafo" align="center">ESPERE POR FAVOR MIENTRAS FINALIZA EL PROCESO...</TD>
			</tr>
		</TABLE><br>
		<br>
		<br>
		<br>
		</form>
	</td>
	<!-- Contenido -->
</tr>
</table>
<%@include file="Footer.jsp"%>
<script language="JavaScript">
document.all('idBody').style.cursor='wait';
</script>
</body>
</html>
