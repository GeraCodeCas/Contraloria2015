<%
response.setHeader("Cache-Control","no-cache");
response.setHeader("Pragma","no-cache");
response.setDateHeader ("Expires", -1);
 %>
<%@page import="com.consiss.util.*"%>
<%@page import="java.util.*" %>
<%/*********************************************************************************************************
Elaboro:	Julio Enrique Espinosa Torres
Lugar:		Monterrey, NL
Fecha:		29.Oct.2002
Compañia:	CONSISS*/%><%
int iIdFuncionario =  java.lang.Integer.parseInt(
		(String)(session.getValue("iIdFuncionario")!= null?session.getValue("iIdFuncionario"):"0") );
int iIdUsuario = java.lang.Integer.parseInt(
		(String)(session.getValue("iIdUsuario")!= null?session.getValue("iIdUsuario"):"0"));
String sOpcion			= request.getParameter("sOpcion")!= null ? request.getParameter("sOpcion"): "";
String sCodigo			= request.getParameter("sCodigo")!= null ? request.getParameter("sCodigo"): "0";
String sOpt				= request.getParameter("sOpt")!= null ? request.getParameter("sOpt"): "0";
String sEstatus			= request.getParameter("sEstatus")!= null ? request.getParameter("sEstatus"): "1";
String sFechaActual		= "";
String	iPagina = request.getParameter("iPagina")!= null ? request.getParameter("iPagina"): "1";

String sFecha			= request.getParameter("sFecha")!= null ? request.getParameter("sFecha"): "";
String sNoCuenta		= request.getParameter("sNoCuenta")!= null ? request.getParameter("sNoCuenta"): "";
String sNombreInstitucion= request.getParameter("sNombreInstitucion")!= null ? request.getParameter("sNombreInstitucion"): "";
String sTipoInversion	= request.getParameter("sTipoInversion")!= null ? request.getParameter("sTipoInversion"): "";
String sVencimiento		= request.getParameter("sVencimiento")!= null ? request.getParameter("sVencimiento"): "";
String sSaldo			= request.getParameter("sSaldo")!= null ? request.getParameter("sSaldo"): "";

String sNombreFirma		= request.getParameter("sNombreFirma")!= null ? request.getParameter("sNombreFirma"): "";
String sCargo			= request.getParameter("sCargo")!= null ? request.getParameter("sCargo"): "";

String sObservaciones	= request.getParameter("sObservaciones")!= null ? request.getParameter("sObservaciones"): "";

com.gob.Anexo2IV3 oAnexo2IV3 = new com.gob.Anexo2IV3();
com.gob.DetalleAnexo2IV3 oDetalleAnexo2IV3 = new com.gob.DetalleAnexo2IV3();
com.gob.AnexoEstatus 	oAnexoEstatus 	= new com.gob.AnexoEstatus();
Utilerias		oUtil			= new Utilerias();
sFechaActual = oUtil.sGetDateToNum(oUtil.sGetDate(oUtil.GetFecha(), "dd/MM/yyyy"), "/");

// PARA GUARDAR BITACORA, SE LEE USUARIO
Seguridad	oSeguridad;
String sUsuario	= ((session.getValue("sUsuario")!= null?(String)session.getValue("sUsuario"):""));
oSeguridad = new Seguridad();

if(sOpcion.equals(""))
	oAnexoEstatus.Insert(iIdFuncionario, oAnexo2IV3.GetIdAnexo(), sEstatus, iIdUsuario, sFechaActual, "");

if(sOpcion.equals("NORMAL")){
	sCodigo = "";
}

if(sOpcion.equals("SAVE")){
	// CAMBIO DE ENTREGA DE ESTATUS
	com.gob.EntregaEstatus 	oEntregaEstatus 	= new com.gob.EntregaEstatus();
	String sEstatusEntrega	= ((session.getValue("sEstatusEntrega")!= null?(String)session.getValue("sEstatusEntrega"):""));
	if(sEstatusEntrega.equals(oEntregaEstatus.GetEstatusSinInformacion())) {
		oEntregaEstatus.Insert(iIdFuncionario, oEntregaEstatus.GetEstatusNoIniciada(), oUtil.sGetDate(oUtil.GetFecha(), "yyyyMMddHHmmss"), "Entrega No Iniciada. Inicia Captura Diaria de Información");
		session.putValue("sEstatusEntrega",	oEntregaEstatus.GetEstatusNoIniciada()+"");		}
	
	oAnexoEstatus.Insert(iIdFuncionario, oAnexo2IV3.GetIdAnexo(), sEstatus, iIdUsuario, sFechaActual, "");
	if(!sCodigo.equals("")){
		if(sCodigo.equals("0")){
			oAnexo2IV3.Insert(iIdFuncionario, sFecha, sNoCuenta, sNombreInstitucion, sTipoInversion, sVencimiento, sSaldo);
			// PARA GUARDAR BITACORA
			oSeguridad.Bitacora(sUsuario, "Nuevo", "Anexo II.4.3", request.getRemoteAddr(), request.getRemoteHost(), request.getHeader("User-Agent"));
		}else{
			oAnexo2IV3.Update(java.lang.Integer.parseInt(sCodigo), sFecha, sNoCuenta, sNombreInstitucion, sTipoInversion, sVencimiento, sSaldo);
			// PARA GUARDAR BITACORA
			oSeguridad.Bitacora(sUsuario, "Grabar", "Anexo II.4.3", request.getRemoteAddr(), request.getRemoteHost(), request.getHeader("User-Agent"));
		}
	}else{
		// PARA GUARDAR BITACORA
		oSeguridad.Bitacora(sUsuario, "Grabar", "Anexo II.4.3 Estatus", request.getRemoteAddr(), request.getRemoteHost(), request.getHeader("User-Agent"));	
	}
sCodigo = "";
sOpcion = "";
sOpt = "0";
}			 
if(sOpcion.equals("SAVEDETALLE")){
	// CAMBIO DE ENTREGA DE ESTATUS
	com.gob.EntregaEstatus 	oEntregaEstatus 	= new com.gob.EntregaEstatus();
	String sEstatusEntrega	= ((session.getValue("sEstatusEntrega")!= null?(String)session.getValue("sEstatusEntrega"):""));
	if(sEstatusEntrega.equals(oEntregaEstatus.GetEstatusSinInformacion())) {
		oEntregaEstatus.Insert(iIdFuncionario, oEntregaEstatus.GetEstatusNoIniciada(), oUtil.sGetDate(oUtil.GetFecha(), "yyyyMMddHHmmss"), "Entrega No Iniciada. Inicia Captura Diaria de Información");
		session.putValue("sEstatusEntrega",	oEntregaEstatus.GetEstatusNoIniciada()+"");		}

	oAnexoEstatus.Insert(iIdFuncionario, oAnexo2IV3.GetIdAnexo(), sEstatus, iIdUsuario, sFechaActual, "");
	if(!sCodigo.equals("")){
	     if(sCodigo.equals("0")){
			oDetalleAnexo2IV3.Insert(iIdFuncionario, sNombreFirma, sCargo);
			// PARA GUARDAR BITACORA
			oSeguridad.Bitacora(sUsuario, "Nuevo", "Anexo II.4.3 Detalle", request.getRemoteAddr(), request.getRemoteHost(), request.getHeader("User-Agent"));
       }else{
	        oDetalleAnexo2IV3.Update(java.lang.Integer.parseInt(sCodigo), sNombreFirma, sCargo);
			// PARA GUARDAR BITACORA
			oSeguridad.Bitacora(sUsuario, "Grabar", "Anexo II.4.3 Detalle", request.getRemoteAddr(), request.getRemoteHost(), request.getHeader("User-Agent"));
	 		 }
	}
sCodigo = "";
sOpcion = "";
sOpt = "0";
}
if(sOpcion.equals("SAVEOBSERVACIONES")){
	// CAMBIO DE ENTREGA DE ESTATUS
	com.gob.EntregaEstatus 	oEntregaEstatus 	= new com.gob.EntregaEstatus();
	String sEstatusEntrega	= ((session.getValue("sEstatusEntrega")!= null?(String)session.getValue("sEstatusEntrega"):""));
	if(sEstatusEntrega.equals(oEntregaEstatus.GetEstatusSinInformacion())) {
		oEntregaEstatus.Insert(iIdFuncionario, oEntregaEstatus.GetEstatusNoIniciada(), oUtil.sGetDate(oUtil.GetFecha(), "yyyyMMddHHmmss"), "Entrega No Iniciada. Inicia Captura Diaria de Información");
		session.putValue("sEstatusEntrega",	oEntregaEstatus.GetEstatusNoIniciada()+"");		}
	oAnexo2IV3.UpdateObservaciones(iIdFuncionario, sObservaciones);
sCodigo = "";
sOpcion = "";
sOpt = "0";
}

if(sOpcion.equals("DEL")){
	// PARA GUARDAR BITACORA
	oSeguridad.Bitacora(sUsuario, "Elimina", "Anexo II.4.3", request.getRemoteAddr(), request.getRemoteHost(), request.getHeader("User-Agent"));
	oAnexo2IV3.Delete(java.lang.Integer.parseInt(sCodigo));
sCodigo = "";
sOpcion = "";
sOpt = "0";
}

if(sOpcion.equals("DELDETALLE")){
	// PARA GUARDAR BITACORA
	oSeguridad.Bitacora(sUsuario, "Elimina", "Anexo II.4.3 Detalle", request.getRemoteAddr(), request.getRemoteHost(), request.getHeader("User-Agent"));
oDetalleAnexo2IV3.Delete(java.lang.Integer.parseInt(sCodigo));
sCodigo = "";
sOpcion = "";
sOpt = "0";
}

if(sOpcion.equals("DELALL")){
	// PARA GUARDAR BITACORA
	oSeguridad.Bitacora(sUsuario, "Elimina", "Anexo II.4.3 Contenido", request.getRemoteAddr(), request.getRemoteHost(), request.getHeader("User-Agent"));
	oAnexo2IV3.DeleteAll(iIdFuncionario);
sCodigo = "";
sOpcion = "";
}
if(sOpcion.equals("UNDO")){
	// PARA GUARDAR BITACORA
	oSeguridad.Bitacora(sUsuario, "DeshaceCarga", "Anexo II.4.3", request.getRemoteAddr(), request.getRemoteHost(), request.getHeader("User-Agent"));
	oAnexo2IV3.Undo(iIdFuncionario);
sCodigo = "";
sOpcion = "";
}
%>

<html>
<head>
	<title>Entrega - Recepción : Anexo II.4.3 (Procesando...)</title>
</head>
<body>
<form action="fAnexo2IV3.jsp" name="forma" method="post" target="_parent">
	<input type="hidden" name="sOpcion" value="<%=sOpcion%>">
	<input type="hidden" name="sCodigo" value="<%=sCodigo%>">
	<input type="hidden" name="sOpt" value="<%=sOpt%>">
	<input type="hidden" name="iPagina" value="<%=iPagina%>">
</form>
</body>
<script>
	document.forma.submit();
</script>
</html>