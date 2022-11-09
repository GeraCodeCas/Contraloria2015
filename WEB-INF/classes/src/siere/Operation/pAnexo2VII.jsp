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
String 	sFechaActual= "";		
// sCodigo = IdFuncionario
%>
<%
String	sBalanceGeneral		= request.getParameter("sBalanceGeneral")!= null ? request.getParameter("sBalanceGeneral"): "";
String	sEstadoResultados		= request.getParameter("sEstadoResultados")!= null ? request.getParameter("sEstadoResultados"): "";
String	sEstadoOrigen		= request.getParameter("sEstadoOrigen")!= null ? request.getParameter("sEstadoOrigen"): "";
String	sLibrosRegistros		= request.getParameter("sLibrosRegistros")!= null ? request.getParameter("sLibrosRegistros"): "";
String	sEstadosFinancieros		= request.getParameter("sEstadosFinancieros")!= null ? request.getParameter("sEstadosFinancieros"): "";
String	sQuienAudito		= request.getParameter("sQuienAudito")!= null ? request.getParameter("sQuienAudito"): "";
String	sFechaCierre		= request.getParameter("sFechaCierre")!= null ? request.getParameter("sFechaCierre"): "";
String	sFechaAuditoria		= request.getParameter("sFechaAuditoria")!= null ? request.getParameter("sFechaAuditoria"): "";

com.gob.Anexo2VII oAnexo2VII = new com.gob.Anexo2VII();
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

	oAnexoEstatus.Insert(iIdFuncionario, oAnexo2VII.GetIdAnexo(), sEstatus, iIdUsuario, sFechaActual, "");
	if(!sCodigo.equals("")){
		if(sCodigo.equals("0")){
			oAnexo2VII.Insert(iIdFuncionario, sBalanceGeneral, sEstadoResultados, sEstadoOrigen, sLibrosRegistros, sEstadosFinancieros, sQuienAudito, sFechaCierre, sFechaAuditoria);
			// PARA GUARDAR BITACORA
			oSeguridad.Bitacora(sUsuario, "Nuevo", "Anexo II.7", request.getRemoteAddr(), request.getRemoteHost(), request.getHeader("User-Agent"));
		} else {
			oAnexo2VII.Update(java.lang.Integer.parseInt(sCodigo), sBalanceGeneral, sEstadoResultados, sEstadoOrigen, sLibrosRegistros, sEstadosFinancieros, sQuienAudito, sFechaCierre, sFechaAuditoria);
			// PARA GUARDAR BITACORA
			oSeguridad.Bitacora(sUsuario, "Grabar", "Anexo II.7", request.getRemoteAddr(), request.getRemoteHost(), request.getHeader("User-Agent"));
		}
	}else{
	// PARA GUARDAR BITACORA
	oSeguridad.Bitacora(sUsuario, "Grabar", "Anexo II.7 Estatus", request.getRemoteAddr(), request.getRemoteHost(), request.getHeader("User-Agent"));
	}
sCodigo = "";
sOpcion = "";
}

if(sOpcion.equals("DEL")){
	// PARA GUARDAR BITACORA
	oSeguridad.Bitacora(sUsuario, "Elimina", "Anexo II.7", request.getRemoteAddr(), request.getRemoteHost(), request.getHeader("User-Agent"));
	oAnexo2VII.Delete(java.lang.Integer.parseInt(sCodigo));
sCodigo = "";
sOpcion = "";
}%>

<html>
<head>
	<title>Entrega - Recepción : Anexo II.7 (Procesando...)</title>
</head>

<body>
<form action="fAnexo2VII.jsp" name="forma" method="post" target="_parent">
	<input type="hidden" name="sOpcion" value="<%=sOpcion%>">
	<input type="hidden" name="sCodigo" value="<%=sCodigo%>"> 
</form>
</body>
<script>
	document.forma.submit();
</script>
</html>