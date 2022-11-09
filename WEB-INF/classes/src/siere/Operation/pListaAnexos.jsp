<%/*********************************************************************************************************
Elaboro:	Claudia V. Sandoval Pardo
Lugar:		Monterrey, NL
Fecha:		01.Nov.2002
Compañia:	CONSISS*/%>
<html>
<head>
	<title>Entrega - Recepción : Lista de Anexos (Procesando...)</title>
</head>

<body>
<%
String sOpcion = request.getParameter("sOpcion")!= null ? request.getParameter("sOpcion"): "";
int iIdFuncionario =java.lang.Integer.parseInt(
					(String)(session.getValue("iIdFuncionario")!= null?session.getValue("iIdFuncionario"):"0") );
String sUsuario =	(String)(session.getValue("sUsuario")!= null?session.getValue("sUsuario"):"") ;
int iIdUsuario =	java.lang.Integer.parseInt(
					(String)(session.getValue("iIdUsuario")!= null?session.getValue("iIdUsuario"):"0") );
String sEstatus = "";
String sEstatusAnt = "";

com.gob.AnexoEstatus		oAnexoEstatus	= new com.gob.AnexoEstatus();
java.util.Vector 			oVecAnexos		= new java.util.Vector();
com.consiss.util.Seguridad	oSeguridad		= new com.consiss.util.Seguridad();
com.consiss.util.Utilerias	oUtil			= new com.consiss.util.Utilerias();

int iNumRows = oAnexoEstatus.GetAll(iIdFuncionario);
if(sOpcion.equals("SAVE")){
	// CAMBIO DE ENTREGA DE ESTATUS
	com.gob.EntregaEstatus 	oEntregaEstatus 	= new com.gob.EntregaEstatus();
	String sEstatusEntrega	= ((session.getValue("sEstatusEntrega")!= null?(String)session.getValue("sEstatusEntrega"):""));
	if(sEstatusEntrega.equals(oEntregaEstatus.GetEstatusSinInformacion())) {
		oEntregaEstatus.Insert(iIdFuncionario, oEntregaEstatus.GetEstatusNoIniciada(), oUtil.sGetDate(oUtil.GetFecha(), "yyyyMMddHHmmss"), "Entrega No Iniciada. Inicia Captura Diaria de Información");
		session.putValue("sEstatusEntrega",	oEntregaEstatus.GetEstatusNoIniciada()+"");		}


	for(int i=0;i<iNumRows;i++){
		sEstatus = request.getParameter("sEstatus"+oAnexoEstatus.GetIdAnexo(i))!= null ? request.getParameter("sEstatus"+oAnexoEstatus.GetIdAnexo(i)): "";
		sEstatusAnt = request.getParameter("sEstatusAnt"+oAnexoEstatus.GetIdAnexo(i))!= null ? request.getParameter("sEstatusAnt"+oAnexoEstatus.GetIdAnexo(i)): "";
		
		if(!sEstatus.equals(sEstatusAnt)){
			oAnexoEstatus.Update(iIdFuncionario, oAnexoEstatus.GetIdAnexo(i), sEstatus, 
					iIdUsuario, oUtil.sGetDate(oUtil.GetFecha(), "yyyyMMdd") );
		}
	}
	oSeguridad.Bitacora(sUsuario, "ListaAnexos", "Actualización Status", request.getRemoteAddr(), request.getRemoteHost(), request.getHeader("User-Agent"));
	oSeguridad = null;
}
%>

<form action="fListaAnexos.jsp" name="forma" method="post" target="_parent">
	<input type="hidden" name="sOpcion" value="<%=sOpcion%>">
</form>
</body>
<script>
	document.forma.submit();
</script>
</html>
