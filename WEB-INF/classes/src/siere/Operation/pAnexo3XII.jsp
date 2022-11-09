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
'Ultima Modificacion:	10.Dic.2002
'By:		Sigifredo Vazquez
'
'Distintas opciones:
'
'********************************************************************************************************/
%>
<%
int iIdFuncionario =  java.lang.Integer.parseInt((String)(session.getValue("iIdFuncionario")!= null?session.getValue("iIdFuncionario"):"0") );
int iIdUsuario		= java.lang.Integer.parseInt((String)(session.getValue("iIdUsuario")!= null?session.getValue("iIdUsuario"):"0") );

String	sOpcion 				= request.getParameter("sOpcion")!= null ? 		request.getParameter("sOpcion"): "";
String	sCodigo 				= request.getParameter("sCodigo")!= null ? 		request.getParameter("sCodigo"): "";

String	sClave 					= request.getParameter("sClave")!= null ? 		request.getParameter("sClave"): "";
String	sObra 					= request.getParameter("sObra")!= null ?	request.getParameter("sObra"): "";
String	sNoContrato 			= request.getParameter("sNoContrato")!= null ? 		request.getParameter("sNoContrato"): "";
String	sNombreContratista 		= request.getParameter("sNombreContratista")!= null ? request.getParameter("sNombreContratista"): "";
String	sCostoTotal 			= request.getParameter("sCostoTotal")!= null && !(request.getParameter("sCostoTotal")+"").equals("") ? request.getParameter("sCostoTotal"): "0";
String	sAnticiposOtorgados 	= request.getParameter("sAnticipoOtorgado")!= null && !(request.getParameter("sAnticipoOtorgado")+"").equals("") ? request.getParameter("sAnticipoOtorgado"): "0";
String	sAnticiposAmortizados 	= request.getParameter("sAnticipoAmortizado")!= null && !(request.getParameter("sAnticipoAmortizado")+"").equals("") ? request.getParameter("sAnticipoAmortizado"): "0";
String	sSaldoAnticipoAmortizar = request.getParameter("sSaldoAnticipoAmortizar")!= null && !(request.getParameter("sSaldoAnticipoAmortizar")+"").equals("") ? request.getParameter("sSaldoAnticipoAmortizar"): "0";
String	sObservaciones 			= request.getParameter("sObservaciones")!= null ? request.getParameter("sObservaciones"): "";
String	sIdTipoOrigen 			= request.getParameter("sIdTipoOrigen")!= null ? 		request.getParameter("sIdTipoOrigen"): "";

String	sOrigen 				= request.getParameter("sOrigen")!= null ? request.getParameter("sOrigen"): "";
String	sEstatus				= request.getParameter("sEstatus")!= null ? request.getParameter("sEstatus"): "1";
String	iPagina = request.getParameter("iPagina")!= null ? request.getParameter("iPagina"): "1";
String 	sFechaActual			= "";

Anexo3XII 		oAnexo 			= new Anexo3XII();
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

	oAnexoEstatus.Insert(iIdFuncionario, oAnexo.GetIdAnexo(), sEstatus, iIdUsuario, sFechaActual,"");
	if(sCodigo.equals("0") && !sIdTipoOrigen.equals("0")){
	  	oAnexo.Insert(iIdFuncionario, sClave, sObra, sNoContrato, sCostoTotal, sAnticiposOtorgados, 
		sAnticiposAmortizados, sSaldoAnticipoAmortizar, sNombreContratista, sObservaciones, java.lang.Integer.parseInt(sIdTipoOrigen));
		 // PARA GUARDAR BITACORA
		oSeguridad.Bitacora(sUsuario, "Nuevo", "Anexo III.12", request.getRemoteAddr(), request.getRemoteHost(), request.getHeader("User-Agent"));
	} else {
		if (!sCodigo.equals("") && !sIdTipoOrigen.equals("0")){
	  		oAnexo.Update(java.lang.Integer.parseInt(sCodigo), iIdFuncionario, sClave, sObra, sNoContrato, sCostoTotal, sAnticiposOtorgados, 
			sAnticiposAmortizados, sSaldoAnticipoAmortizar, sNombreContratista, sObservaciones, java.lang.Integer.parseInt(sIdTipoOrigen));
			// PARA GUARDAR BITACORA
			oSeguridad.Bitacora(sUsuario, "Grabar", "Anexo III.12", request.getRemoteAddr(), request.getRemoteHost(), request.getHeader("User-Agent"));
		}else{
		// PARA GUARDAR BITACORA
		oSeguridad.Bitacora(sUsuario, "Grabar", "Anexo III.12 Estatus", request.getRemoteAddr(), request.getRemoteHost(), request.getHeader("User-Agent"));
		}
	}
	sCodigo = "";
	sOpcion = "";
}
if(sOpcion.equals("DELETE")){
	// PARA GUARDAR BITACORA
	oSeguridad.Bitacora(sUsuario, "Elimina", "Anexo III.12", request.getRemoteAddr(), request.getRemoteHost(), request.getHeader("User-Agent"));
	oAnexo.Delete(java.lang.Integer.parseInt(sCodigo));
	sCodigo = "";
	sOpcion = "";
}
if(sOpcion.equals("DELALL")){
	// PARA GUARDAR BITACORA
	oSeguridad.Bitacora(sUsuario, "Elimina", "Anexo III.12 Contenido", request.getRemoteAddr(), request.getRemoteHost(), request.getHeader("User-Agent"));
	oAnexo.DeleteAll(iIdFuncionario);
sCodigo = "";
sOpcion = "";
}
if(sOpcion.equals("UNDO")){
	// PARA GUARDAR BITACORA
	oSeguridad.Bitacora(sUsuario, "DeshaceCarga", "Anexo III.12", request.getRemoteAddr(), request.getRemoteHost(), request.getHeader("User-Agent"));
	oAnexo.Undo(iIdFuncionario);
sCodigo = "";
sOpcion = "";
}
%>
<html>
<head>
	<title>Entrega - Recepción : Anexo III.12 (Procesando...)</title>
</head>
<body>
	<form action="fAnexo3XII.jsp" name="forma" method="post" target="_parent">
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
