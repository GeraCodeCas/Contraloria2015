<%/*********************************************************************************************************
Elaboro:	Claudia V. Sandoval Pardo
Lugar:		Monterrey, NL
Fecha:		29.May.2003
Compañia:	CONSISS*/%><%
response.setHeader("Cache-Control","no-cache");
response.setHeader("Pragma","no-cache");
response.setDateHeader ("Expires", -1); %>
<%@page import="com.consiss.util.tools.*"%>
<%@page import="com.consiss.util.*"%>
<%@page import="com.gob.*"%>
<%@page import="java.util.*" %><%
if ((String)session.getValue("ok")!="ConsissRH")	response.sendRedirect("../Operation/Error.html");

String	sMensaje = request.getParameter("sMensaje")!= null ? request.getParameter("sMensaje"): "";

String sSelAnexo = request.getParameter("selAnexo")!= null ? request.getParameter("selAnexo"): "0";

String sPath = "../";%>
<html>
<head>
	<title>Entrega - Recepción : Carga Anexos</title>
<link rel="stylesheet" type="text/css" href="../Styles/Gobierno.css">
<script language='JavaScript' src="<%=sPath%>Scripts/Libreria.js"></script>
<script language="JavaScript" src="<%=sPath%>Scripts/Gobierno.js"></script>
<script language="JavaScript">
	function carga(){
		if(!document.forma.selAnexo[0].checked && !document.forma.selAnexo[1].checked &&
			!document.forma.selAnexo[2].checked){
			alert("Por favor seleccione un Anexo");
			document.forma.selAnexo[0].focus();
			return false;
		}
		var sAnexo = "";
		if(document.forma.selAnexo[0].checked)
			sAnexo = 17;
		else if(document.forma.selAnexo[1].checked)
			sAnexo = 18;
		else
			sAnexo = 21;

		popBox("Carga", 550, 280, "cAnexos.jsp?sIdAnexo=" + sAnexo + "&sUsuario=<%=(String)session.getValue("sUsuario")%>");

	}
</script>
</head>
<body topmargin="0" leftmargin="0">
<!-- Encabezado -->
<%@include file="Header.jsp"%>
<!-- Encabezado -->
<table border="0" cellspacing="0" cellpadding="0" width="100%">
<tr>
	<!-- Menu -->
	<td width="135" valign="top"><%@include file="MenuRH.jsp"%></td>
	<!-- Menu -->
	<!-- Contenido -->
	<td valign="top">
	
	<FORM action="fCarga.jsp" name="forma" method="post">
		<TABLE align=center border=0 cellPadding=0 cellSpacing=0 width="100%">
			<TR>
				<TD class="TituloParrafo">&nbsp;&nbsp;Carga Información de Anexos&nbsp;&nbsp;</TD>
				<TD align="right"><INPUT onclick="carga();" 	name="Carga" 	type="button" value="Carga"  class="boton">&nbsp;</TD>
			</TR>
		</TABLE>		
		<!-- Datos que se agregaran a la tabla  -->
		<TABLE cellPadding="0" cellSpacing="0" width="100%" BORDER="1" BORDERCOLOR="white">
		<!-- Etiqueta donde se aplican los encabezados de las tablas-->
			<TR align="middle">
				<TD class="TituloMenu">Anexo</TD>
			</TR>
			<TR align="left" valign="middle">
				<TD><input type="radio" name="selAnexo" value="1" <%=sSelAnexo.equals("1")?"checked":""%>>III.4.1 Plantilla de Personal</TD>
			</TR>
			<TR>
				<TD><input type="radio" name="selAnexo" value="2" <%=sSelAnexo.equals("2")?"checked":""%>>III.4.2 Personal con licencia, permiso o comisión</TD>
			</TR>
			<TR> 
				<TD><input type="radio" name="selAnexo" value="3" <%=sSelAnexo.equals("3")?"checked":""%>>III.4.5 Relación de Expedientes de Personal</TD>
			</TR>
		</TABLE>
	</FORM>
	</td>
	<!-- Contenido -->
</tr>
</table>
<%if(!sMensaje.trim().equals("")){%>
<script language="JavaScript">alert("<%=sMensaje%>");</script>
<%}%>
<%@include file="Footer.jsp"%>
</body>
</html>