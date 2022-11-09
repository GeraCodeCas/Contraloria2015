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
Fecha:		12.Nov.2002
Compañia:	CONSISS*/%><%
int iIdFuncionario =  java.lang.Integer.parseInt(
		(String)(session.getValue("iIdFuncionario")!= null?session.getValue("iIdFuncionario"):"0") );
int iIdUsuario	   = java.lang.Integer.parseInt(
		(String)(session.getValue("iIdUsuario")!= null?session.getValue("iIdUsuario"):"0"));
String	sOpcion = request.getParameter("sOpcion")!= null ? request.getParameter("sOpcion"): "";
String	sCodigo = request.getParameter("sCodigo")!= null ? request.getParameter("sCodigo"): "0";
String	sEstatus	= request.getParameter("sEstatus")!= null ? request.getParameter("sEstatus"): "1";
String	iPagina = request.getParameter("iPagina")!= null ? request.getParameter("iPagina"): "1";
String 	sFechaActual= "";
// sCodigo = IdRenglon
%>
<%
String	sNumeroDocumento				= request.getParameter("sNumeroDocumento")!= null ? request.getParameter("sNumeroDocumento"): "";
String	sNombreDeudor						= request.getParameter("sNombreDeudor")!= null ? request.getParameter("sNombreDeudor"): "";
String	sConcepto					= request.getParameter("sConcepto")!= null ? request.getParameter("sConcepto"): "";
String	sFechaVencimiento				= request.getParameter("sFechaVencimiento")!= null ? request.getParameter("sFechaVencimiento"): "";
String	sImporte							= request.getParameter("sImporte")!= null ? request.getParameter("sImporte"): "";
String	sSaldo							= request.getParameter("sSaldo")!= null ? request.getParameter("sSaldo"): "";

com.gob.Anexo2V oAnexo2V = new com.gob.Anexo2V();
com.gob.AnexoEstatus 	oAnexoEstatus 	= new com.gob.AnexoEstatus();
Utilerias		oUtil			= new Utilerias();
sFechaActual = oUtil.sGetDateToNum(oUtil.sGetDate(oUtil.GetFecha(), "dd/MM/yyyy"), "/");

// PARA GUARDAR BITACORA, SE LEE USUARIO
Seguridad	oSeguridad;
String sUsuario	= ((session.getValue("sUsuario")!= null?(String)session.getValue("sUsuario"):""));
oSeguridad = new Seguridad();

if(sOpcion.equals(""))
	oAnexoEstatus.Insert(iIdFuncionario, oAnexo2V.GetIdAnexo(), sEstatus, iIdUsuario, sFechaActual, "");

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

	oAnexoEstatus.Insert(iIdFuncionario, oAnexo2V.GetIdAnexo(), sEstatus, iIdUsuario, sFechaActual, "");
	if(!sCodigo.equals("")){
		if(sCodigo.equals("0")){
			oAnexo2V.Insert(iIdFuncionario, sNumeroDocumento, sNombreDeudor, sConcepto, sFechaVencimiento, sImporte, sSaldo);
			// PARA GUARDAR BITACORA
			oSeguridad.Bitacora(sUsuario, "Nuevo", "Anexo II.5", request.getRemoteAddr(), request.getRemoteHost(), request.getHeader("User-Agent"));
		} else {
			oAnexo2V.Update(java.lang.Integer.parseInt(sCodigo), sNumeroDocumento, sNombreDeudor, sConcepto, sFechaVencimiento, sImporte , sSaldo);
			// PARA GUARDAR BITACORA
			oSeguridad.Bitacora(sUsuario, "Grabar", "Anexo II.5", request.getRemoteAddr(), request.getRemoteHost(), request.getHeader("User-Agent"));
		}
	}else{
		// PARA GUARDAR BITACORA
		oSeguridad.Bitacora(sUsuario, "Grabar", "Anexo II.5 Estatus", request.getRemoteAddr(), request.getRemoteHost(), request.getHeader("User-Agent"));
	}
sCodigo = "";
sOpcion = "";
}

if(sOpcion.equals("DEL")){
	// PARA GUARDAR BITACORA
	oSeguridad.Bitacora(sUsuario, "Elimina", "Anexo II.5", request.getRemoteAddr(), request.getRemoteHost(), request.getHeader("User-Agent"));
	oAnexo2V.Delete(java.lang.Integer.parseInt(sCodigo));
sCodigo = "";
sOpcion = "";
}
if(sOpcion.equals("DELALL")){
	// PARA GUARDAR BITACORA
	oSeguridad.Bitacora(sUsuario, "Elimina", "Anexo II.5 Contenido", request.getRemoteAddr(), request.getRemoteHost(), request.getHeader("User-Agent"));
	oAnexo2V.DeleteAll(iIdFuncionario);
sCodigo = "";
sOpcion = "";
}
if(sOpcion.equals("UNDO")){
	// PARA GUARDAR BITACORA
	oSeguridad.Bitacora(sUsuario, "DeshaceCarga", "Anexo II.5", request.getRemoteAddr(), request.getRemoteHost(), request.getHeader("User-Agent"));
	oAnexo2V.Undo(iIdFuncionario);
sCodigo = "";
sOpcion = "";
}
%>

<html>
<head>
	<title>Entrega - Recepción : Anexo II.5 (Procesando...)</title>
</head>

<body>
<form action="fAnexo2V.jsp" name="forma" method="post" target="_parent">
	<input type="hidden" name="sOpcion" value="<%=sOpcion%>">
	<input type="hidden" name="sCodigo" value="<%=sCodigo%>"> 
	<input type="hidden" name="iPagina" value="<%=iPagina%>">
</form>
</body>
<script>
	document.forma.submit();
</script>
</html>