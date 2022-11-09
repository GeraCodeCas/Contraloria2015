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
String	iPagina = request.getParameter("iPagina")!= null ? request.getParameter("iPagina"): "1";
String	sEstatus= request.getParameter("sEstatus")!= null ? request.getParameter("sEstatus"): "1";

String	sClave		= request.getParameter("sClave")!= null ? request.getParameter("sClave"): "";
String	sNumFactura	= request.getParameter("sNumFactura")!= null ? request.getParameter("sNumFactura"): "";
String	sFecha		= request.getParameter("sFecha")!= null ? request.getParameter("sFecha"): "";
String	sConcepto	= request.getParameter("sConcepto")!= null ? request.getParameter("sConcepto"): "";
String	sImporte	= request.getParameter("sImporte")!= null && !(request.getParameter("sImporte")+"").trim().equals("") ? request.getParameter("sImporte"): "0";
String	sTipo		= request.getParameter("sTipo")!= null ? request.getParameter("sTipo"): "";

com.gob.Anexo3V3			oAnexo3V3		= new com.gob.Anexo3V3();
com.gob.AnexoEstatus		oAnexoEstatus	= new com.gob.AnexoEstatus();
com.consiss.util.Utilerias	oUtil			= new com.consiss.util.Utilerias();

int iIdAnexo = oAnexo3V3.GetIdAnexo();

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
		oSeguridad.Bitacora(sUsuario, "Grabar", "Anexo III.5.3 Estatus", request.getRemoteAddr(), request.getRemoteHost(), request.getHeader("User-Agent"));
	} else {
		//sEstatus = sEstatus.equals(oAnexoEstatus.GetEstatusVacio())?oAnexoEstatus.GetEstatusEnProceso():sEstatus;
		
		if(sCodigo.equals("0")){
		  	oAnexo3V3.Insert(iIdFuncionario, sClave, sNumFactura, sFecha, sConcepto, sImporte, sTipo);
			// PARA GUARDAR BITACORA
			oSeguridad.Bitacora(sUsuario, "Nuevo", "Anexo III.5.3", request.getRemoteAddr(), request.getRemoteHost(), request.getHeader("User-Agent"));
		} else {
		  	oAnexo3V3.Update(java.lang.Integer.parseInt(sCodigo), sClave, sNumFactura, sFecha, sConcepto, sImporte, sTipo);
			// PARA GUARDAR BITACORA
			oSeguridad.Bitacora(sUsuario, "Grabar", "Anexo III.5.3", request.getRemoteAddr(), request.getRemoteHost(), request.getHeader("User-Agent"));
		}
		oAnexoEstatus.Update(iIdFuncionario, iIdAnexo, sEstatus, iIdUsuario, oUtil.sGetDate(oUtil.GetFecha(), "yyyyMMdd"), "" );
	}
	sCodigo = "";
	sOpcion = "";
}

if(sOpcion.equals("DEL")){
	oAnexo3V3.Delete(java.lang.Long.parseLong(sCodigo));
	// PARA GUARDAR BITACORA
	oSeguridad.Bitacora(sUsuario, "Elimina", "Anexo III.5.3", request.getRemoteAddr(), request.getRemoteHost(), request.getHeader("User-Agent"));
	//sEstatus = oAnexo3V3.GetAll(iIdFuncionario)==0?oAnexoEstatus.GetEstatusVacio():sEstatus;
	//oAnexoEstatus.Update(iIdFuncionario, iIdAnexo, sEstatus, iIdUsuario, oUtil.sGetDate(oUtil.GetFecha(), "yyyyMMdd"), "" );
	sCodigo = "";
	sOpcion = "";
}

if(sOpcion.equals("DELALL")){
	// PARA GUARDAR BITACORA
	oSeguridad.Bitacora(sUsuario, "Elimina", "Anexo III.5.3 Contenido", request.getRemoteAddr(), request.getRemoteHost(), request.getHeader("User-Agent"));
	oAnexo3V3.DeleteAll(iIdFuncionario);
sCodigo = "";
sOpcion = "";
}
if(sOpcion.equals("UNDO")){
	// PARA GUARDAR BITACORA
	oSeguridad.Bitacora(sUsuario, "DeshaceCarga", "Anexo III.5.3", request.getRemoteAddr(), request.getRemoteHost(), request.getHeader("User-Agent"));
	oAnexo3V3.Undo(iIdFuncionario);
sCodigo = "";
sOpcion = "";
}
if(sOpcion.equals("NORMAL")){sCodigo = "";}
%>

<html>
<head>
	<title>Entrega - Recepción : Anexo III.5.3 (Procesando...)</title>
</head>

<body>
<form action="fAnexo3V3.jsp" name="forma" method="post" target="_parent">
	<input type="hidden" name="sOpcion" value="<%=sOpcion%>">
	<input type="hidden" name="sCodigo" value="<%=sCodigo%>">
	<input type="hidden" name="iPagina" value="<%=iPagina%>">
</form>
</body>
<script>
	document.forma.submit();
</script>
</html>