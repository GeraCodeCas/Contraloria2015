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
'Fecha:		5.Nov.2002
'Compañia:	CONSISS
'Ultima Modificacion:	28.Oct.2002
'By:		Sigifredo Vazquez
'
'Distintas opciones:
'
'********************************************************************************************************/
%>
<%
int iIdFuncionario =  java.lang.Integer.parseInt((String)(session.getValue("iIdFuncionario")!= null?session.getValue("iIdFuncionario"):"0") );
int iIdUsuario		= java.lang.Integer.parseInt((String)(session.getValue("iIdUsuario")!= null?session.getValue("iIdUsuario"):"0") );
String	iPagina = request.getParameter("iPagina")!= null ? request.getParameter("iPagina"): "1";
String	sOpcion 			= request.getParameter("sOpcion")!= null ? 		request.getParameter("sOpcion"): "";
String	sCodigo 			= request.getParameter("sCodigo")!= null ? 		request.getParameter("sCodigo"): "";

String	sNoExpediente 		= request.getParameter("sNoExpediente")!= null ? 	request.getParameter("sNoExpediente"): "";
String	sNoProgresivo 		= request.getParameter("sNoProgresivo")!= null ? 	request.getParameter("sNoProgresivo"): "";
String	sNombre 			= request.getParameter("sNombre")!= null ? 		request.getParameter("sNombre"): "";
String	sDestino 			= request.getParameter("sDestino")!= null ? request.getParameter("sDestino"): "";
String	sEstadoInmueble 	= request.getParameter("sEstadoInmueble")!= null ? request.getParameter("sEstadoInmueble"): "";
String	sTipoInmueble 		= request.getParameter("sTipoInmueble")!= null ? request.getParameter("sTipoInmueble"): "";
String	sTipoAccion 		= request.getParameter("sTipoAccion")!= null ? request.getParameter("sTipoAccion"): "";
String	sObservaciones 		= request.getParameter("sObservaciones")!= null ? request.getParameter("sObservaciones"): "";
String	sEstatus	= request.getParameter("sEstatus")!= null ? request.getParameter("sEstatus"): "1";
String 	sFechaActual= "";

AnexoEstatus oAnexoEstatus 	= new AnexoEstatus();
Anexo3IX 	oAnexo 			= new Anexo3IX();
Utilerias	oUtil			= new Utilerias();
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
	  	oAnexo.Insert(iIdFuncionario, sNoExpediente, sNoProgresivo, sNombre, sDestino, java.lang.Integer.parseInt(sEstadoInmueble), 
		java.lang.Integer.parseInt(sTipoInmueble), java.lang.Integer.parseInt(sTipoAccion),sObservaciones);
		// PARA GUARDAR BITACORA
		oSeguridad.Bitacora(sUsuario, "Nuevo", "Anexo III.9", request.getRemoteAddr(), request.getRemoteHost(), request.getHeader("User-Agent"));
	} else {
		if(!sCodigo.equals("")){
		  	oAnexo.Update(java.lang.Integer.parseInt(sCodigo), iIdFuncionario, sNoExpediente, sNoProgresivo, sNombre, sDestino, java.lang.Integer.parseInt(sEstadoInmueble), 
			java.lang.Integer.parseInt(sTipoInmueble), java.lang.Integer.parseInt(sTipoAccion),sObservaciones);
			// PARA GUARDAR BITACORA
			oSeguridad.Bitacora(sUsuario, "Grabar", "Anexo III.9", request.getRemoteAddr(), request.getRemoteHost(), request.getHeader("User-Agent"));
		}else{
		// PARA GUARDAR BITACORA
		oSeguridad.Bitacora(sUsuario, "Grabar", "Anexo III.9 Estatus", request.getRemoteAddr(), request.getRemoteHost(), request.getHeader("User-Agent"));
		}
	}
	sCodigo = "";
	sOpcion = "";
}
if(sOpcion.equals("DELETE")){
	// PARA GUARDAR BITACORA
	oSeguridad.Bitacora(sUsuario, "Elimina", "Anexo III.9", request.getRemoteAddr(), request.getRemoteHost(), request.getHeader("User-Agent"));
	oAnexo.Delete(java.lang.Integer.parseInt(sCodigo));
	sCodigo = "";
	sOpcion = "";
}
if(sOpcion.equals("DELALL")){
	// PARA GUARDAR BITACORA
	oSeguridad.Bitacora(sUsuario, "Elimina", "Anexo III.9 Contenido", request.getRemoteAddr(), request.getRemoteHost(), request.getHeader("User-Agent"));
	oAnexo.DeleteAll(iIdFuncionario);
sCodigo = "";
sOpcion = "";
}
if(sOpcion.equals("UNDO")){
	// PARA GUARDAR BITACORA
	oSeguridad.Bitacora(sUsuario, "DeshaceCarga", "Anexo III.9", request.getRemoteAddr(), request.getRemoteHost(), request.getHeader("User-Agent"));
	oAnexo.Undo(iIdFuncionario);
sCodigo = "";
sOpcion = "";
}
%>
<html>
<head>
	<title>Entrega - Recepción : Anexo III.9 (Procesando...)</title>
</head>
<body>
	<form action="fAnexo3IX.jsp" name="forma" method="post" target="_parent">
		<input type="hidden" name="sOpcion" value="<%=sOpcion%>">
		<input type="hidden" name="sCodigo" value="<%=sCodigo%>"> 
		<input type="hidden" name="iPagina" value="<%=iPagina%>">
	</form>
</body>
<script>
	document.forma.submit();
</script>
</html>
