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
'Fecha:		15.Nov.2002
'Compañia:	CONSISS
'Ultima Modificacion:	09.Dic.2002
'By:		sigifredo vazquez
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

String	sClave 				= request.getParameter("sClave")!= null ? 		request.getParameter("sClave"): "";
String	sPrograma 			= request.getParameter("sPrograma")!= null ?	request.getParameter("sPrograma"): "";
String	sTipo 				= request.getParameter("sTipo")!= null ? 		request.getParameter("sTipo"): "0";
String	sMontoAprobado		= request.getParameter("sMontoAprobado")!= null && !(request.getParameter("sMontoAprobado")+"").equals("") ? request.getParameter("sMontoAprobado"): "0";
String	sMontoEjercido 		= request.getParameter("sMontoEjercido")!= null && !(request.getParameter("sMontoEjercido")+"").equals("") ? request.getParameter("sMontoEjercido"): "0";
String	sFechaInicial 		= request.getParameter("sFechaInicial")!= null ? request.getParameter("sFechaInicial"): "";
String	sFechaFinal 		= request.getParameter("sFechaFinal")!= null ? 	request.getParameter("sFechaFinal"): "";
String	sAvanceFisico 		= request.getParameter("sAvanceFisico")!= null ? request.getParameter("sAvanceFisico"): "";
String	sAvanceFinanciado 	= request.getParameter("sAvanceFinanciado")!= null ? request.getParameter("sAvanceFinanciado"): "";
String	sObservaciones 		= request.getParameter("sObservaciones")!= null ? request.getParameter("sObservaciones"): "";
String	sIdTipoOrigen 		= request.getParameter("sIdTipoOrigen")!= null ? 		request.getParameter("sIdTipoOrigen"): "0";


String	sOrigen 		= request.getParameter("sOrigen")!= null ? request.getParameter("sOrigen"): "";
String	sEstatus		= request.getParameter("sEstatus")!= null ? request.getParameter("sEstatus"): "1";
String 	sFechaActual= "";

Anexo3X 		oAnexo 			= new Anexo3X();
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

	//oAnexoEstatus.Insert(iIdFuncionario, oAnexo.GetIdAnexo(), sEstatus, iIdUsuario, sFechaActual, sOrigen);
	oAnexoEstatus.Insert(iIdFuncionario, oAnexo.GetIdAnexo(), sEstatus, iIdUsuario, sFechaActual,"");
	if(sCodigo.equals("0") && !sIdTipoOrigen.equals("0")){
	  	oAnexo.Insert(iIdFuncionario, sClave, sPrograma, java.lang.Integer.parseInt(sTipo), sMontoAprobado, sMontoEjercido, 
		sFechaInicial, sFechaFinal, sAvanceFisico, sAvanceFinanciado, sObservaciones, java.lang.Integer.parseInt(sIdTipoOrigen));
		// PARA GUARDAR BITACORA
		oSeguridad.Bitacora(sUsuario, "Nuevo", "Anexo III.10", request.getRemoteAddr(), request.getRemoteHost(), request.getHeader("User-Agent"));
	} else {
		if (!sCodigo.equals("") && !sIdTipoOrigen.equals("0")){
	  		oAnexo.Update(java.lang.Integer.parseInt(sCodigo), iIdFuncionario, sClave, sPrograma, java.lang.Integer.parseInt(sTipo), sMontoAprobado, sMontoEjercido, 
			sFechaInicial, sFechaFinal, sAvanceFisico, sAvanceFinanciado, sObservaciones, java.lang.Integer.parseInt(sIdTipoOrigen));
			// PARA GUARDAR BITACORA
			oSeguridad.Bitacora(sUsuario, "Grabar", "Anexo III.10", request.getRemoteAddr(), request.getRemoteHost(), request.getHeader("User-Agent"));
		}else{
		// PARA GUARDAR BITACORA
		oSeguridad.Bitacora(sUsuario, "Grabar", "Anexo III.10 Estatus", request.getRemoteAddr(), request.getRemoteHost(), request.getHeader("User-Agent"));
		}
	}
	sCodigo = "";
	sOpcion = "";
}
if(sOpcion.equals("DELETE")){
	// PARA GUARDAR BITACORA
	oSeguridad.Bitacora(sUsuario, "Elimina", "Anexo III.10", request.getRemoteAddr(), request.getRemoteHost(), request.getHeader("User-Agent"));
	oAnexo.Delete(java.lang.Integer.parseInt(sCodigo));
	sCodigo = "";
	sOpcion = "";
}
if(sOpcion.equals("DELALL")){
	// PARA GUARDAR BITACORA
	oSeguridad.Bitacora(sUsuario, "Elimina", "Anexo III.10 Contenido", request.getRemoteAddr(), request.getRemoteHost(), request.getHeader("User-Agent"));
	oAnexo.DeleteAll(iIdFuncionario);
sCodigo = "";
sOpcion = "";
}
if(sOpcion.equals("UNDO")){
	// PARA GUARDAR BITACORA
	oSeguridad.Bitacora(sUsuario, "DeshaceCarga", "Anexo III.10", request.getRemoteAddr(), request.getRemoteHost(), request.getHeader("User-Agent"));
	oAnexo.Undo(iIdFuncionario);
sCodigo = "";
sOpcion = "";
}
%>
 
<html>
<head>
	<title>Entrega - Recepción : Anexo III.10 (Procesando...)</title>
</head>
<body>
	<form action="fAnexo3X.jsp" name="forma" method="post" target="_parent">
		<input type="hidden" name="sOpcion" value="<%=sOpcion%>">
		<input type="hidden" name="sIdTipoOrigen" value="<%=sIdTipoOrigen%>">
		<input type="hidden" name="sCodigo" value="<%if(!sOpcion.equals("SAVE")) {%><%=sCodigo%><%}%>"> 
		<input type="hidden" name="iPagina" value="<%=iPagina%>">
	</form>
</body>
<script>
	document.forma.submit();
</script>
</html>
