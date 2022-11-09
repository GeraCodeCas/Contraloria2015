<%@page import="com.consiss.util.*"%>
<%/*********************************************************************************************************
Elaboro:	Claudia Sandoval
Lugar:		Monterrey, NL
Fecha:		02.Nov.2002
Compa�ia:	CONSISS*/%><%
int	selDependencia = java.lang.Integer.parseInt(
	request.getParameter("selDependencia")!= null ? request.getParameter("selDependencia"): "0");
int	selUAdministrativa = java.lang.Integer.parseInt(
	request.getParameter("selUAdministrativa")!= null ? request.getParameter("selUAdministrativa"): "0");

String	sOpcion = request.getParameter("sOpcion")!= null ? request.getParameter("sOpcion"): "";
String	sCodigo = request.getParameter("sCodigo")!= null ? request.getParameter("sCodigo"): "";

String	iPagina = request.getParameter("iPagina")!= null ? request.getParameter("iPagina"): "1";

String sIdFuncionario=request.getParameter("sIdFuncionario")!= null ? request.getParameter("sIdFuncionario"): "";
String	sNumero		= request.getParameter("sNumero")!= null ? request.getParameter("sNumero"): "";
String	sNombre		= request.getParameter("sNombre")!= null ? request.getParameter("sNombre"): "";
String	sPuesto		= request.getParameter("sPuesto")!= null ? request.getParameter("sPuesto"): "";
String	sUnidadAdministrativa= request.getParameter("sUnidadAdministrativa")!= null ? request.getParameter("sUnidadAdministrativa"): "";
String	sEstatus	= request.getParameter("sEstatus")!= null ? request.getParameter("sEstatus"): "1";
String sTipoNomina	= request.getParameter("sClaveTipoNomina")!= null ? request.getParameter("sClaveTipoNomina"): "";

com.gob.Anexo3IV5			oAnexo3IV5	= new com.gob.Anexo3IV5();
/*com.gob.AnexoEstatus		oAnexoEstatus= new com.gob.AnexoEstatus();
com.consiss.util.Utilerias	oUtil		= new com.consiss.util.Utilerias();
int iIdAnexo = oAnexo3IV5.GetIdAnexo();*/

// PARA GUARDAR BITACORA, SE LEE USUARIO
Seguridad	oSeguridad;
String sUsuario	= ((session.getValue("sUsuario")!= null?(String)session.getValue("sUsuario"):""));
oSeguridad = new Seguridad();

if(sOpcion.equals("NORMAL")){sCodigo = "";}

if(sOpcion.equals("SAVE")){
	// CAMBIO DE ENTREGA DE ESTATUS
	/*com.gob.EntregaEstatus 	oEntregaEstatus 	= new com.gob.EntregaEstatus();
	String sEstatusEntrega	= ((session.getValue("sEstatusEntrega")!= null?(String)session.getValue("sEstatusEntrega"):""));
	if(sEstatusEntrega.equals(oEntregaEstatus.GetEstatusSinInformacion())) {
		oEntregaEstatus.Insert(iIdFuncionario, oEntregaEstatus.GetEstatusNoIniciada(), oUtil.sGetDate(oUtil.GetFecha(), "yyyyMMddHHmmss"), "Entrega No Iniciada. Inicia Captura Diaria de Informaci�n");
		session.putValue("sEstatusEntrega",	oEntregaEstatus.GetEstatusNoIniciada()+"");		}
	*/
	if(sCodigo.equals("")){
		/*oAnexoEstatus.Update(iIdFuncionario, iIdAnexo, sEstatus, iIdUsuario, oUtil.sGetDate(oUtil.GetFecha(), "yyyyMMdd"), "" );
		// PARA GUARDAR BITACORA
		oSeguridad.Bitacora(sUsuario, "Grabar", "Anexo III.4.4 Estatus", request.getRemoteAddr(), request.getRemoteHost(), request.getHeader("User-Agent"));
		*/
	}else{
		if(sCodigo.equals("0")){
		  	oAnexo3IV5.Insert(java.lang.Integer.parseInt(sIdFuncionario), sNumero, sNombre, sPuesto, sUnidadAdministrativa, sTipoNomina);
			// PARA GUARDAR BITACORA
			oSeguridad.Bitacora(sUsuario, "Nuevo", "Anexo III.4.5", request.getRemoteAddr(), request.getRemoteHost(), request.getHeader("User-Agent"));
		} else {
		  	oAnexo3IV5.Update(java.lang.Long.parseLong(sCodigo), sNumero, sNombre, sPuesto, sUnidadAdministrativa, sTipoNomina);
			// PARA GUARDAR BITACORA
			oSeguridad.Bitacora(sUsuario, "Grabar", "Anexo III.4.5", request.getRemoteAddr(), request.getRemoteHost(), request.getHeader("User-Agent"));
		}
		//oAnexoEstatus.Update(iIdFuncionario, iIdAnexo, sEstatus, iIdUsuario, oUtil.sGetDate(oUtil.GetFecha(), "yyyyMMdd"), "" );
	}
	sCodigo = "";
	sOpcion = "";
}

if(sOpcion.equals("DEL")){
	// PARA GUARDAR BITACORA
	oSeguridad.Bitacora(sUsuario, "Elimina", "Anexo III.4.5", request.getRemoteAddr(), request.getRemoteHost(), request.getHeader("User-Agent"));
	
	oAnexo3IV5.Delete(java.lang.Long.parseLong(sCodigo));
	sCodigo = "";
	sOpcion = "";
}

if(sOpcion.equals("DELALL")){
	// PARA GUARDAR BITACORA
	oSeguridad.Bitacora(sUsuario, "Elimina", "Anexo III.4.5 Contenido", request.getRemoteAddr(), request.getRemoteHost(), request.getHeader("User-Agent"));
	oAnexo3IV5.DeleteAllUnidadA(selUAdministrativa+"");
sCodigo = "";
sOpcion = "";
}
%>

<html>
<head>
	<title>Entrega - Recepci�n : Anexo III.4.5 (Procesando...)</title>
</head>

<body>
<form action="fAnexo3IV5RH.jsp" name="forma" method="post" target="_parent">
	<input type="hidden" name="sOpcion" value="<%=sOpcion%>">
	<input type="hidden" name="sCodigo" value="<%=sCodigo%>">
	<input type="hidden" name="selDependencia" value="<%=selDependencia%>">
	<input type="hidden" name="selUAdministrativa" value="<%=selUAdministrativa%>">
	<input type="hidden" name="iPagina" value="<%=iPagina%>">
</form>
</body>
<script>
	document.forma.submit();
</script>
</html>