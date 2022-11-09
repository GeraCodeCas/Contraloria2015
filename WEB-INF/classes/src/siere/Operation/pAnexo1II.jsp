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
String	iIdTipo		= request.getParameter("sTipo")!= null ? request.getParameter("sTipo"): "1";
String	sNumero		= request.getParameter("sNumero")!= null ? request.getParameter("sNumero"): "";
String	sFechaSuscripcion		= request.getParameter("sFechaSuscripcion")!= null ? request.getParameter("sFechaSuscripcion"): "";
String	sDuracion		= request.getParameter("sDuracion")!= null ? request.getParameter("sDuracion"): "";
String	sDescripcion		= request.getParameter("sDescripcion")!= null ? request.getParameter("sDescripcion"): "";
String	sImporteTotal		= request.getParameter("sImporteTotal")!= null ? request.getParameter("sImporteTotal"): "";
String	sEntidad		= request.getParameter("sEntidad")!= null ? request.getParameter("sEntidad"): "";
String	sObservaciones		= request.getParameter("sObservaciones")!= null ? request.getParameter("sObservaciones"): "";

char [] cImporteTotal = sImporteTotal.toCharArray();
sImporteTotal = "";
for(int i=0;i<cImporteTotal.length;i++){	sImporteTotal = cImporteTotal[i]!=','?sImporteTotal + cImporteTotal[i]:sImporteTotal; }
char [] cImporteTotal2 = sImporteTotal.toCharArray();
sImporteTotal = "";
for(int i=0;i<cImporteTotal2.length;i++){	sImporteTotal = cImporteTotal2[i]!='$'?sImporteTotal + cImporteTotal2[i]:sImporteTotal; }


com.gob.Anexo1II oAnexo1II = new com.gob.Anexo1II();
com.gob.AnexoEstatus 	oAnexoEstatus 	= new com.gob.AnexoEstatus();
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
	
	oAnexoEstatus.Insert(iIdFuncionario, oAnexo1II.GetIdAnexo(), sEstatus, iIdUsuario, sFechaActual, "");
	if(!sCodigo.equals("")){
		if(sCodigo.equals("0") ){
				oAnexo1II.Insert(iIdFuncionario, java.lang.Integer.parseInt(iIdTipo), sNumero, sFechaSuscripcion, sDuracion, sDescripcion, sImporteTotal, sEntidad, sObservaciones);
				// PARA GUARDAR BITACORA
				oSeguridad.Bitacora(sUsuario, "Nuevo", "Anexo I.2", request.getRemoteAddr(), request.getRemoteHost(), request.getHeader("User-Agent"));
		} else {
				oAnexo1II.Update(java.lang.Integer.parseInt(sCodigo), java.lang.Integer.parseInt(iIdTipo), sNumero, sFechaSuscripcion, sDuracion, sDescripcion, sImporteTotal, sEntidad, sObservaciones);
				// PARA GUARDAR BITACORA
				oSeguridad.Bitacora(sUsuario, "Grabar", "Anexo I.2", request.getRemoteAddr(), request.getRemoteHost(), request.getHeader("User-Agent"));
		}
	}else{
	// PARA GUARDAR BITACORA
	oSeguridad.Bitacora(sUsuario, "Grabar", "Anexo I.2 Estatus", request.getRemoteAddr(), request.getRemoteHost(), request.getHeader("User-Agent"));	
	}
sCodigo = "";
sOpcion = "";
}

if(sOpcion.equals("DEL")){
	oAnexo1II.Delete(java.lang.Integer.parseInt(sCodigo));
	// PARA GUARDAR BITACORA
	oSeguridad.Bitacora(sUsuario, "Elimina", "Anexo I.2", request.getRemoteAddr(), request.getRemoteHost(), request.getHeader("User-Agent"));
	sCodigo = "0";
sCodigo = "";
sOpcion = "";
}

if(sOpcion.equals("DELALL")){
	// PARA GUARDAR BITACORA
	oSeguridad.Bitacora(sUsuario, "Elimina", "Anexo I.2 Contenido", request.getRemoteAddr(), request.getRemoteHost(), request.getHeader("User-Agent"));
	oAnexo1II.DeleteAll(iIdFuncionario);
sCodigo = "";
sOpcion = "";
}

if(sOpcion.equals("UNDO")){
	// PARA GUARDAR BITACORA
	oSeguridad.Bitacora(sUsuario, "DeshaceCarga", "Anexo I.2", request.getRemoteAddr(), request.getRemoteHost(), request.getHeader("User-Agent"));
	oAnexo1II.Undo(iIdFuncionario);
sCodigo = "";
sOpcion = "";
}
%>

<html>
<head>
	<title>Entrega - Recepción : Anexo I.2 (Procesando...)</title>
</head>

<body>
<form action="fAnexo1II.jsp" name="forma" method="post" target="_parent">
	<input type="hidden" name="sOpcion" value="<%=sOpcion%>">
	<input type="hidden" name="sCodigo" value="<%=sCodigo%>"> 
	<input type="hidden" name="iPagina" value="<%=iPagina%>">
</form>
</body>
<script>
	document.forma.submit();
</script>
</html>