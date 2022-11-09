<%
response.setHeader("Cache-Control","no-cache");
response.setHeader("Pragma","no-cache");
response.setDateHeader ("Expires", -1);
 %>
<%@page import="com.consiss.util.*"%>
<%@page import="java.util.*" %>
<%/*********************************************************************************************************
Elaboro:	Claudia Sandoval
Lugar:		Monterrey, NL
Fecha:		19.Nov.2002
Compañia:	CONSISS*/%><%
int iIdFuncionario	= java.lang.Integer.parseInt(
		(String)(session.getValue("iIdFuncionario")!= null?session.getValue("iIdFuncionario"):"0") );
int iIdUsuario		= java.lang.Integer.parseInt(
		(String)(session.getValue("iIdUsuario")!= null?session.getValue("iIdUsuario"):"0") );

String	sOpcion = request.getParameter("sOpcion")!= null ? request.getParameter("sOpcion"): "";
String	sCodigo = request.getParameter("sCodigo")!= null ? request.getParameter("sCodigo"): "";
String	sEstatus= request.getParameter("sEstatus")!= null ? request.getParameter("sEstatus"): "1";

String	sSoftware	= request.getParameter("sSoftware")!= null ? request.getParameter("sSoftware"): "";
String	sMarca		= request.getParameter("sMarca")!= null ? request.getParameter("sMarca"): "";
String	sVersion	= request.getParameter("sVersion")!= null ? request.getParameter("sVersion"): "";
String	sLicencia	= request.getParameter("sLicencia")!= null ? request.getParameter("sLicencia"): "";
String	sDiscos		= request.getParameter("sDiscos")!= null ? request.getParameter("sDiscos"): "";
String	sManuales	= request.getParameter("sManuales")!= null ? request.getParameter("sManuales"): "";

com.gob.Anexo3V2II			oAnexo3V2II		= new com.gob.Anexo3V2II();
com.gob.AnexoEstatus		oAnexoEstatus	= new com.gob.AnexoEstatus();
com.consiss.util.Utilerias	oUtil			= new com.consiss.util.Utilerias();

int iIdAnexo = oAnexo3V2II.GetIdAnexo();

// PARA GUARDAR BITACORA, SE LEE USUARIO
Seguridad	oSeguridad;
String sUsuario	= ((session.getValue("sUsuario")!= null?(String)session.getValue("sUsuario"):""));
oSeguridad = new Seguridad();

if(sOpcion.equals("SAVE")){
	// CAMBIO DE ENTREGA DE ESTATUS
	com.gob.EntregaEstatus 	oEntregaEstatus 	= new com.gob.EntregaEstatus();
	String sEstatusEntrega	= ((session.getValue("sEstatusEntrega")!= null?(String)session.getValue("sEstatusEntrega"):""));
	if(sEstatusEntrega.equals(oEntregaEstatus.GetEstatusSinInformacion())) {
		oEntregaEstatus.Insert(iIdFuncionario, oEntregaEstatus.GetEstatusNoIniciada(), oUtil.sGetDate(oUtil.GetFecha(), "yyyyMMddHHmmss"), "Entrega No Iniciada. Inicia Captura Diaria de Información");
		session.putValue("sEstatusEntrega",	oEntregaEstatus.GetEstatusNoIniciada()+"");		}

	if(sCodigo.equals("")){
		oAnexoEstatus.Update(iIdFuncionario, iIdAnexo, sEstatus, iIdUsuario, oUtil.sGetDate(oUtil.GetFecha(), "yyyyMMdd"), "" );
		// PARA GUARDAR BITACORA
		oSeguridad.Bitacora(sUsuario, "Grabar", "Anexo III.5.2.2 Estatus", request.getRemoteAddr(), request.getRemoteHost(), request.getHeader("User-Agent"));
	} else {
		//sEstatus = sEstatus.equals(oAnexoEstatus.GetEstatusVacio())?oAnexoEstatus.GetEstatusEnProceso():sEstatus;
		
		if(sCodigo.equals("0")){
		  	oAnexo3V2II.Insert(iIdFuncionario, sSoftware, sMarca, sVersion, sLicencia, sDiscos, sManuales);
			// PARA GUARDAR BITACORA
			oSeguridad.Bitacora(sUsuario, "Nuevo", "Anexo III.5.2.2", request.getRemoteAddr(), request.getRemoteHost(), request.getHeader("User-Agent"));
		} else {
		  	oAnexo3V2II.Update(java.lang.Integer.parseInt(sCodigo), sSoftware, sMarca, sVersion, sLicencia, sDiscos, sManuales);
			// PARA GUARDAR BITACORA
			oSeguridad.Bitacora(sUsuario, "Grabar", "Anexo III.5.2.2", request.getRemoteAddr(), request.getRemoteHost(), request.getHeader("User-Agent"));
		}
		oAnexoEstatus.Update(iIdFuncionario, iIdAnexo, sEstatus, iIdUsuario, oUtil.sGetDate(oUtil.GetFecha(), "yyyyMMdd"), "" );
	}
	sCodigo = "";
	sOpcion = "";
}

if(sOpcion.equals("DEL")){
	oAnexo3V2II.Delete(java.lang.Integer.parseInt(sCodigo));
	// PARA GUARDAR BITACORA
	oSeguridad.Bitacora(sUsuario, "Elimina", "Anexo III.5.2.2", request.getRemoteAddr(), request.getRemoteHost(), request.getHeader("User-Agent"));
	//sEstatus = oAnexo3V2II.GetAll(iIdFuncionario)==0?oAnexoEstatus.GetEstatusVacio():sEstatus;
	//oAnexoEstatus.Update(iIdFuncionario, iIdAnexo, sEstatus, iIdUsuario, oUtil.sGetDate(oUtil.GetFecha(), "yyyyMMdd"), "" );
	sCodigo = "";
	sOpcion = "";
}

if(sOpcion.equals("NORMAL")){sCodigo = "";}
%>

<html>
<head>
	<title>Entrega - Recepción : Anexo III.5.2.2 (Procesando...)</title>
</head>

<body>
<form action="fAnexo3V2II.jsp" name="forma" method="post" target="_parent">
	<input type="hidden" name="sOpcion" value="<%=sOpcion%>">
	<input type="hidden" name="sCodigo" value="<%=sCodigo%>"> 
</form>
</body>
<script>
	document.forma.submit();
</script>
</html>