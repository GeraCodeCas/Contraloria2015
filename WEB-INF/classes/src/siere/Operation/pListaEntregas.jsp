<%/*********************************************************************************************************
Elaboro:	Claudia V. Sandoval Pardo
Lugar:		Monterrey, NL
Fecha:		01.Nov.2002
Compañia:	CONSISS*/%>
<html>
<head>
	<title>Entrega - Recepción : Lista de Entregas (Procesando...)</title>
</head>

<body>
<%
if ((String)session.getValue("ok")!="Consiss") response.sendRedirect("Error.html");

String sOpcion = request.getParameter("sOpcion")!= null ? request.getParameter("sOpcion"): "";
int iIdUnidadGobierno = java.lang.Integer.parseInt(
					(String)(request.getParameter("iIdUnidadGobierno")!= null?request.getParameter("iIdUnidadGobierno"):"-1") );

String sIdFuncionario			= (String)(request.getParameter("sIdFuncionario")!= null?		  request.getParameter("sIdFuncionario"):"0") ;
String sIdCargo  				= (String)(request.getParameter("sIdCargo")!= null?				  request.getParameter("sIdCargo"):"0") ;
String sIdUnidadAdministrativa  = (String)(request.getParameter("sIdUnidadAdministrativa")!= null?request.getParameter("sIdUnidadAdministrativa"):"0");
String sIdUnidadGobierno 		= (String)(request.getParameter("sIdUnidadGobierno")!= null?	  request.getParameter("sIdUnidadGobierno"):"0") ;

int		iIdFuncionario = java.lang.Integer.parseInt(sIdFuncionario);

com.gob.EntregaEstatus		oEntregaEstatus = new com.gob.EntregaEstatus();
com.gob.Funcionario			oFuncionario 	= new com.gob.Funcionario();
com.consiss.util.Utilerias	oUtil			= new com.consiss.util.Utilerias();
String sPath = "../";

if(sOpcion.equals("FOTO")){%>
	<script language="JavaScript" src="<%=sPath%>Scripts/Libreria.js"></script>
	<script language="JavaScript">
		popBox("Histórico", 550, 280, "pHistorico.jsp?sIdFuncionario=" + <%=iIdFuncionario%> + "&iProceso=0&sIdFuncionarioAnt=0");
	</script><%
}

if(sOpcion.equals("VALIDA")){
	/*
	// PASO AL pHistoricoDetalle9.jsp
	oEntregaEstatus.Insert(iIdFuncionario, oEntregaEstatus.GetEstatusValidadaPorEnlace(), oUtil.sGetDate(oUtil.GetFecha(), "yyyyMMddHHmmss"), "Validada y Cerrada por Enlace Responsable");
	// BLOQUEAR USUARIOS
	oFuncionario.Get(iIdFuncionario);
	
	oFuncionario.UpdateEstatus(iIdFuncionario, "0", oFuncionario.GetIdUsuario());
	*/
	// GENERA FOTOGRAFIA DE ANEXOS%>
	<script language="JavaScript" src="<%=sPath%>Scripts/Libreria.js"></script>
	<script language="JavaScript">
		popBox("Histórico", 550, 280, "pHistorico.jsp?sIdFuncionario=" + <%=iIdFuncionario%> + "&iProceso=1&sIdFuncionarioAnt=0");
	</script><%
}

if(sOpcion.equals("RECHAZA")){
	oEntregaEstatus.Insert(iIdFuncionario, oEntregaEstatus.GetEstatusRechazadaPorEnlace(), oUtil.sGetDate(oUtil.GetFecha(), "yyyyMMddHHmmss"), "Rechazada por Enlace Responsable");
}

if(sOpcion.equals("ASIGNA")){	%>
	<form action="fAsignaNuevoFuncionario.jsp" name="forma" method="post">
		<input type="hidden" name="sIdFuncionario"			value="<%=sIdFuncionario%>">
		<input type="hidden" name="sIdCargo"				value="<%=sIdCargo%>">
		<input type="hidden" name="sIdUnidadAdministrativa" value="<%=sIdUnidadAdministrativa%>">
		<input type="hidden" name="sIdUnidadGobierno"		value="<%=sIdUnidadGobierno%>">
		<input type="hidden" name="iIdUnidadGobierno"		value="<%=iIdUnidadGobierno%>">
	</form>
	</body>
	<script>
		document.forma.submit();
	</script>
	<%
}

if(sOpcion.equals("DESHACE")){
	//AL REVES DE ESTO
	//oEntregaEstatus.Insert(iIdFuncionario, EntregaEstatus.GetEstatusValidadaPorEnlace(), oUtil.sGetDate(oUtil.GetFecha(), "yyyyMMddHHmmss"), "Validada y Cerrada por Enlace Responsable");
	oEntregaEstatus.Insert(iIdFuncionario, oEntregaEstatus.GetEstatusIniciada(), oUtil.sGetDate(oUtil.GetFecha(), "yyyyMMddHHmmss"), "Reinicia Entrega de Recepción por Administrador");
	// BLOQUEAR USUARIOS
	oFuncionario.Get(iIdFuncionario);
	oFuncionario.UpdateEstatus(iIdFuncionario, oFuncionario.GetEstatusActivo(), oFuncionario.GetIdUsuario());
}
%>

<form action="fListaEntregas.jsp" name="forma" method="post">
	<input type="hidden" name="iIdUnidadGobierno" value="<%=iIdUnidadGobierno%>">
</form>
</body>
<script>
	document.forma.submit();
</script>
</html>
