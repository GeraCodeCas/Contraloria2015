<%String sPath = "../";%>
<html>
<head>
<meta name="AUTHOR" content="Julio Enrique Espinosa Torres">
<title>Sistema de Entrega - Recepción</title>
<link rel="stylesheet" type="text/css" href="<%=sPath%>Styles/Gobierno.css">
</head>

<body topmargin="0" leftmargin="0">
<%if ((String)session.getValue("ok")!="Consiss") response.sendRedirect("Error.html");%>
<!-- Encabezado -->
<%@include file="Header.jsp"%>
<!-- Encabezado -->
<script language="JavaScript" src="<%=sPath%>Scripts/Gobierno.js"></script>
<table border="0" cellspacing="0" cellpadding="0" width="100%">
  <tr>
  <!-- Menu -->
	 	<td width="135" valign="top"><%@include file="Menu.jsp"%></td>
  <!-- Menu -->
  <!-- Contenido -->
	  	<td></td>
	<!-- Contenido -->
	</tr>
	<tr>
		<td colspan="3" align="center"></td>
	</tr>
</table>
<%@include file="Footer.jsp"%>
</body>
</html>
