<%/*********************************************************************************************************
Elaboro:	Claudia V. Sandoval Pardo
Lugar:		Monterrey, NL
Fecha:		29.May.2003
Compañia:	CONSISS*/%>
<html>
<head>
<%
String sMensage = "";
String sSelAnexo = request.getParameter("selAnexo")!= null ? request.getParameter("selAnexo"): "0";
String sSelNivel = request.getParameter("selNivel")!= null ? request.getParameter("selNivel"): "0";
String sSelDependencia = request.getParameter("selDependencia")!= null ? request.getParameter("selDependencia"): "0";
String sSelUAdministrativa = request.getParameter("selUAdministrativa")!= null ? request.getParameter("selUAdministrativa"): "0";
String sSelTipoNomina [] = request.getParameterValues("selTipoNomina"); //!= null ? request.getParameterValues("selTipoNomina"): "0";
com.consiss.util.Seguridad	oSeguridad = new com.consiss.util.Seguridad();
String sUsuario	= ((session.getValue("sUsuario")!= null?(String)session.getValue("sUsuario"):""));

%>
<br>
	<title>Entrega - Recepción : Limpia Anexos (Procesando...)</title>
</head>

<body><%
String sUnidad = "";
if(null!=sSelTipoNomina){
	if(sSelNivel.equals("2"))
		sUnidad = sSelDependencia;
	else if(sSelNivel.equals("3"))
		sUnidad = sSelUAdministrativa;
	
	String sAccion = sSelNivel.equals("1")?"TODAS DEPS":(sSelNivel.equals("2")?"DEP.":"U. ADMIN.");
	if(sSelAnexo.equals("1")){
		com.gob.Anexo3IV1 oAnexo = new com.gob.Anexo3IV1();
		oAnexo.DeleteAll(sSelTipoNomina, sSelNivel, sUnidad);
		oSeguridad.Bitacora(sUsuario, "LimpiaRH", "Anexo III.4.1 " + sAccion, request.getRemoteAddr(), request.getRemoteHost(), request.getHeader("User-Agent"));
	}
	else if(sSelAnexo.equals("2")){
		com.gob.Anexo3IV2 oAnexo = new com.gob.Anexo3IV2();
		oAnexo.DeleteAll(sSelTipoNomina, sSelNivel, sUnidad);
		oSeguridad.Bitacora(sUsuario, "LimpiaRH", "Anexo III.4.2 " + sAccion, request.getRemoteAddr(), request.getRemoteHost(), request.getHeader("User-Agent"));
	}
	else if(sSelAnexo.equals("3")){
		com.gob.Anexo3IV5 oAnexo = new com.gob.Anexo3IV5();
		oAnexo.DeleteAll(sSelTipoNomina, sSelNivel, sUnidad);
		oSeguridad.Bitacora(sUsuario, "LimpiaRH", "Anexo III.4.5 " + sAccion, request.getRemoteAddr(), request.getRemoteHost(), request.getHeader("User-Agent"));
	}
	
}

%>
<form action="fLimpiar.jsp" name="forma" method="post" target="_parent">
	<input type="hidden" name="sMensage" value="<%=sMensage%>">
	<input type="hidden" name="selAnexo" value="<%=sSelAnexo%>">
	<input type="hidden" name="selNivel" value="<%=sSelNivel%>">
	<input type="hidden" name="selDependencia" value="<%=sSelDependencia%>">
	<input type="hidden" name="selUAdministrativa" value="<%=sSelUAdministrativa%>"><%
	for(int i=0;i<sSelTipoNomina.length;i++){%>
	<input type="hidden" name="selTipoNomina" value="<%=sSelTipoNomina[i]%>"><%
	}%>
</form>
</body>
<script language="JavaScript">
	document.forma.submit();
</script>
</html>
