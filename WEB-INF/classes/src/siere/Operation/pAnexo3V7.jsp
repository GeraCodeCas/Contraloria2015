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
Fecha:		18.Nov.2002
Compañia:	CONSISS*/%><%
int iIdFuncionario	= java.lang.Integer.parseInt(
		(String)(session.getValue("iIdFuncionario")!= null?session.getValue("iIdFuncionario"):"0") );
int iIdUsuario		= java.lang.Integer.parseInt(
		(String)(session.getValue("iIdUsuario")!= null?session.getValue("iIdUsuario"):"0") );

String	sOpcion = request.getParameter("sOpcion")!= null ? request.getParameter("sOpcion"): "";
String	sCodigo = request.getParameter("sCodigo")!= null ? request.getParameter("sCodigo"): "";
String	sEstatus= request.getParameter("sEstatus")!= null ? request.getParameter("sEstatus"): "1";
String	iPagina = request.getParameter("iPagina")!= null ? request.getParameter("iPagina"): "1";

String	sTitulo			= request.getParameter("sTitulo")!= null ? request.getParameter("sTitulo"): "";
String	sFecha			= request.getParameter("sFecha")!= null ? request.getParameter("sFecha"): "";
String	sAutores		= request.getParameter("sAutores")!= null ? request.getParameter("sAutores"): "";
String	sNombre			= request.getParameter("sNombre")!= null ? request.getParameter("sNombre"): "";
String	sDepartamento	= request.getParameter("sDepartamento")!= null ? request.getParameter("sDepartamento"): "";
String	sTipo			= request.getParameter("sTipo")!= null ? request.getParameter("sTipo"): "";

com.gob.Anexo3V7			oAnexo3V7		= new com.gob.Anexo3V7();
com.gob.AnexoEstatus		oAnexoEstatus	= new com.gob.AnexoEstatus();
com.consiss.util.Utilerias	oUtil			= new com.consiss.util.Utilerias();

int iIdAnexo = oAnexo3V7.GetIdAnexo();

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
		oSeguridad.Bitacora(sUsuario, "Grabar", "Anexo III.5.7 Estatus", request.getRemoteAddr(), request.getRemoteHost(), request.getHeader("User-Agent"));
	} else {
		//sEstatus = sEstatus.equals(oAnexoEstatus.GetEstatusVacio())?oAnexoEstatus.GetEstatusEnProceso():sEstatus;
		
		if(sCodigo.equals("0")){
		  	oAnexo3V7.Insert(iIdFuncionario, sTitulo, sFecha, sAutores, sNombre, sDepartamento, sTipo);
			// PARA GUARDAR BITACORA
			oSeguridad.Bitacora(sUsuario, "Nuevo", "Anexo III.5.7", request.getRemoteAddr(), request.getRemoteHost(), request.getHeader("User-Agent"));
		} else {
		  	oAnexo3V7.Update(java.lang.Integer.parseInt(sCodigo), sTitulo, sFecha, sAutores, sNombre, sDepartamento, sTipo);
			// PARA GUARDAR BITACORA
			oSeguridad.Bitacora(sUsuario, "Grabar", "Anexo III.5.7", request.getRemoteAddr(), request.getRemoteHost(), request.getHeader("User-Agent"));
		}
		oAnexoEstatus.Update(iIdFuncionario, iIdAnexo, sEstatus, iIdUsuario, oUtil.sGetDate(oUtil.GetFecha(), "yyyyMMdd"), "" );
	}
	sCodigo = "";
	sOpcion = "";
}

if(sOpcion.equals("DEL")){
	oAnexo3V7.Delete(java.lang.Integer.parseInt(sCodigo));
	// PARA GUARDAR BITACORA
	oSeguridad.Bitacora(sUsuario, "Elimina", "Anexo III.5.7", request.getRemoteAddr(), request.getRemoteHost(), request.getHeader("User-Agent"));
	//sEstatus = oAnexo3V7.GetAll(iIdFuncionario)==0?oAnexoEstatus.GetEstatusVacio():sEstatus;
	//oAnexoEstatus.Update(iIdFuncionario, iIdAnexo, sEstatus, iIdUsuario, oUtil.sGetDate(oUtil.GetFecha(), "yyyyMMdd"), "" );
	sCodigo = "";
	sOpcion = "";
}

if(sOpcion.equals("DELALL")){
	// PARA GUARDAR BITACORA
	oSeguridad.Bitacora(sUsuario, "Elimina", "Anexo III.5.7 Contenido", request.getRemoteAddr(), request.getRemoteHost(), request.getHeader("User-Agent"));
	oAnexo3V7.DeleteAll(iIdFuncionario);
sCodigo = "";
sOpcion = "";
}
if(sOpcion.equals("UNDO")){
	// PARA GUARDAR BITACORA
	oSeguridad.Bitacora(sUsuario, "DeshaceCarga", "Anexo III.5.7", request.getRemoteAddr(), request.getRemoteHost(), request.getHeader("User-Agent"));
	oAnexo3V7.Undo(iIdFuncionario);
sCodigo = "";
sOpcion = "";
}
if(sOpcion.equals("NORMAL")){sCodigo = "";}
%>

<html>
<head>
	<title>Entrega - Recepción : Anexo III.5.7 (Procesando...)</title>
</head>

<body>
<form action="fAnexo3V7.jsp" name="forma" method="post" target="_parent">
	<input type="hidden" name="sOpcion" value="<%=sOpcion%>">
	<input type="hidden" name="sCodigo" value="<%=sCodigo%>">
	<input type="hidden" name="iPagina" value="<%=iPagina%>">
</form>
</body>
<script>
	document.forma.submit();
</script>
</html>