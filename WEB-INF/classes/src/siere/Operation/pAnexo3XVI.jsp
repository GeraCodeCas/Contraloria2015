<%
response.setHeader("Cache-Control","no-cache");
response.setHeader("Pragma","no-cache");
response.setDateHeader ("Expires", -1);
 %>
<%@page import="com.consiss.util.*"%>
<%@page import="com.gob.*"%>
<%@page import="java.util.*" %>
<%
/********************************************************************************************************
'Elaboro:	Jesus Limon
'Lugar:		Monterrey, NL
'Fecha:		27.Nov.2002
'Compañia:	CONSISS
'Ultima Modificacion:
'By:
'
'Distintas opciones:
'
'********************************************************************************************************/
%>
<%
int iIdFuncionario =  java.lang.Integer.parseInt((String)(session.getValue("iIdFuncionario")!= null?session.getValue("iIdFuncionario"):"0") );
int iIdUsuario		= java.lang.Integer.parseInt((String)(session.getValue("iIdUsuario")!= null?session.getValue("iIdUsuario"):"0") );

String	sOpcion 			= request.getParameter("sOpcion")!= null ? 			request.getParameter("sOpcion"): "";
String	sCodigo 			= request.getParameter("sCodigo")!= null ? 			request.getParameter("sCodigo"): "";

String	sIdentificacion 	= request.getParameter("sIdentificacion")!= null ? 	request.getParameter("sIdentificacion"): "";
String	sExpediente 		= request.getParameter("sExpediente")!= null ? 		request.getParameter("sExpediente"): "";
String	sPeriodo 			= request.getParameter("sPeriodo")!= null ? 		request.getParameter("sPeriodo"): "";
String	sUbicacion 			= request.getParameter("sUbicacion")!= null ? 		request.getParameter("sUbicacion"): "";
String	sDocumento 			= request.getParameter("sDocumento")!= null ? 		request.getParameter("sDocumento"): "";

String	iPagina = request.getParameter("iPagina")!= null ? request.getParameter("iPagina"): "1";
String	sEstatus	= request.getParameter("sEstatus")!= null ? request.getParameter("sEstatus"): "1";
String 	sFechaActual= "";

Anexo3XVI 		oAnexo 			= new Anexo3XVI();
AnexoEstatus 	oAnexoEstatus 	= new AnexoEstatus();
Utilerias		oUtil			= new Utilerias();
sFechaActual = oUtil.sGetDateToNum(oUtil.sGetDate(oUtil.GetFecha(), "dd/MM/yyyy"), "/");

// PARA GUARDAR BITACORA, SE LEE USUARIO
Seguridad	oSeguridad;
String sUsuario	= ((session.getValue("sUsuario")!= null?(String)session.getValue("sUsuario"):""));
oSeguridad = new Seguridad();

if(sOpcion.equals("NORMAL")){ sCodigo = ""; }

if(sOpcion.equals("SAVE")){
	// CAMBIO DE ENTREGA DE ESTATUS
	com.gob.EntregaEstatus 	oEntregaEstatus 	= new com.gob.EntregaEstatus();
	String sEstatusEntrega	= ((session.getValue("sEstatusEntrega")!= null?(String)session.getValue("sEstatusEntrega"):""));
	if(sEstatusEntrega.equals(oEntregaEstatus.GetEstatusSinInformacion())) {
		oEntregaEstatus.Insert(iIdFuncionario, oEntregaEstatus.GetEstatusNoIniciada(), oUtil.sGetDate(oUtil.GetFecha(), "yyyyMMddHHmmss"), "Entrega No Iniciada. Inicia Captura Diaria de Información");
		session.putValue("sEstatusEntrega",	oEntregaEstatus.GetEstatusNoIniciada()+"");		}

	oAnexoEstatus.Insert(iIdFuncionario, oAnexo.GetIdAnexo(), sEstatus, iIdUsuario, sFechaActual, "");
	if(sCodigo.equals("0")){
	  	oAnexo.Insert(iIdFuncionario, sIdentificacion, sExpediente, sPeriodo, sUbicacion, sDocumento);
		// PARA GUARDAR BITACORA
		oSeguridad.Bitacora(sUsuario, "Nuevo", "Anexo III.16", request.getRemoteAddr(), request.getRemoteHost(), request.getHeader("User-Agent"));
	} else {
		if (!sCodigo.equals("")){
	  		oAnexo.Update(java.lang.Long.parseLong(sCodigo), iIdFuncionario, sIdentificacion, sExpediente, sPeriodo, sUbicacion, sDocumento);
			// PARA GUARDAR BITACORA
			oSeguridad.Bitacora(sUsuario, "Grabar", "Anexo III.16", request.getRemoteAddr(), request.getRemoteHost(), request.getHeader("User-Agent"));
		}else{
		// PARA GUARDAR BITACORA
		oSeguridad.Bitacora(sUsuario, "Grabar", "Anexo III.16 Estatus", request.getRemoteAddr(), request.getRemoteHost(), request.getHeader("User-Agent"));
		}
	}
	sCodigo = "";
	sOpcion = "";
}
if(sOpcion.equals("DELETE")){
	// PARA GUARDAR BITACORA
	oSeguridad.Bitacora(sUsuario, "Elimina", "Anexo III.16", request.getRemoteAddr(), request.getRemoteHost(), request.getHeader("User-Agent"));
	oAnexo.Delete(java.lang.Long.parseLong(sCodigo));
	sCodigo = "";
	sOpcion = "";
}

if(sOpcion.equals("DELALL")){
	// PARA GUARDAR BITACORA
	oSeguridad.Bitacora(sUsuario, "Elimina", "Anexo III.16 Contenido", request.getRemoteAddr(), request.getRemoteHost(), request.getHeader("User-Agent"));
	oAnexo.DeleteAll(iIdFuncionario);
sCodigo = "";
sOpcion = "";
}
if(sOpcion.equals("UNDO")){
	// PARA GUARDAR BITACORA
	oSeguridad.Bitacora(sUsuario, "DeshaceCarga", "Anexo III.16", request.getRemoteAddr(), request.getRemoteHost(), request.getHeader("User-Agent"));
	oAnexo.Undo(iIdFuncionario);
sCodigo = "";
sOpcion = "";
}
%>

<html>
<head>
	<title>Entrega - Recepción : Anexo III.16 (Procesando...)</title>
</head>
<body>
	<form action="fAnexo3XVI.jsp" name="forma" method="post" target="_parent">
		<input type="hidden" name="sOpcion" value="<%=sOpcion%>">
		<input type="hidden" name="sCodigo" value="<%=sCodigo%>"> 
		<input type="hidden" name="iPagina" value="<%=iPagina%>">
	</form>
</body>
<script>
	document.forma.submit();
</script>
</html>
