<%String sPath = "../";%>
<html>
<head>
<meta name="AUTHOR" content="Julio Enrique Espinosa Torres">
<title>Sistema de Entrega - Recepción</title>
<link rel="stylesheet" type="text/css" href="<%=sPath%>Styles/Gobierno.css">
<script language="JavaScript">
	function del(pCODE){
	   if(confirm("¿Desea Eliminar el Registro?")){ 
		    document.forma.sCodigo.value = pCODE;
		    document.forma.sOpcion.value = 'DEL';
			document.forma.submit();
	   }
	}
</script>
</head>
<body topmargin="0" leftmargin="0">
<%if ((String)session.getValue("ok")!="ConsissRH") response.sendRedirect("../Operation/Error.html");%>
<!-- Encabezado -->
<%@include file="Header.jsp"%>
<!-- Encabezado -->
<script language="JavaScript" src="<%=sPath%>Scripts/Gobierno.js"></script>
<table border="0" cellspacing="0" cellpadding="0" width="100%">
  <tr>
  <!-- Menu -->
	 	<td width="135" valign="top"><%@include file="MenuRH.jsp"%></td>
  <!-- Menu -->
  <!-- Contenido -->
	  	<td align="center" valign="top"><%
	int	iTipoUsuario = session.getValue("iTipoUsuario")!=null?java.lang.Integer.parseInt((String)session.getValue("iTipoUsuario")):0;
	com.gob.Usuario	oUsuario = new com.gob.Usuario();
	
	if(iTipoUsuario == oUsuario.GetTipoAdmonRH() ){
		com.gob.MensajeRH oMensajeRH = new com.gob.MensajeRH();
		
		if(oMensajeRH.GetAll(false).getNumRows()>0){%>
		<form name="fprincipal" action="fObservacionesRH.jsp" method="post">
		</form>
		<script language="JavaScript">
			document.fprincipal.submit();
		</script><%
		}
	}%></td>
	<!-- Contenido -->
	</tr>
	<tr>
		<td colspan="3" align="center"></td>
	</tr>
</table>
<%@include file="Footer.jsp"%>
</body>
</html>
