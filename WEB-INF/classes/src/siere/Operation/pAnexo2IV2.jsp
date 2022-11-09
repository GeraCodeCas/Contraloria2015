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
Fecha:		18.Nov.2002
Compañia:	CONSISS*/%><%
int iIdFuncionario =  java.lang.Integer.parseInt(
		(String)(session.getValue("iIdFuncionario")!= null?session.getValue("iIdFuncionario"):"0") );
int iIdUsuario	   = java.lang.Integer.parseInt(
		(String)(session.getValue("iIdUsuario")!= null?session.getValue("iIdUsuario"):"0"));
String	sOpcion = request.getParameter("sOpcion")!= null ? request.getParameter("sOpcion"): "";
String	sCodigo = request.getParameter("sCodigo")!= null ? request.getParameter("sCodigo"): "0";
String	sOpt = request.getParameter("sOpt")!= null ? request.getParameter("sOpt"): "0";
String	sEstatus	= request.getParameter("sEstatus")!= null ? request.getParameter("sEstatus"): "1";
String	iPagina = request.getParameter("iPagina")!= null ? request.getParameter("iPagina"): "1";
String 	sFechaActual= "";
// sCodigo = IdRenglon
%>
<%
String	sFecha		= request.getParameter("sFecha")!= null ? request.getParameter("sFecha"): "";
String	sNoCuenta	= request.getParameter("sNoCuenta")!= null ? request.getParameter("sNoCuenta"): "";
String	sBanco		= request.getParameter("sBanco")!= null ? request.getParameter("sBanco"): "";
String	sBeneficiario= request.getParameter("sBeneficiario")!= null ? request.getParameter("sBeneficiario"): "";
String	sNoCheque	= request.getParameter("sNoCheque")!= null ? request.getParameter("sNoCheque"): "";
String	sImporte	= request.getParameter("sImporte")!= null ? request.getParameter("sImporte"): "";
String	sChequesObran= request.getParameter("sChequesObran")!= null ? request.getParameter("sChequesObran"): "";

com.gob.Anexo2IV2 oAnexo2IV2 = new com.gob.Anexo2IV2();
com.gob.AnexoEstatus 	oAnexoEstatus 	= new com.gob.AnexoEstatus();
Utilerias		oUtil			= new Utilerias();
sFechaActual = oUtil.sGetDateToNum(oUtil.sGetDate(oUtil.GetFecha(), "dd/MM/yyyy"), "/");
%>
<%
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

	oAnexoEstatus.Update(iIdFuncionario, oAnexo2IV2.GetIdAnexo(), sEstatus, iIdUsuario, sFechaActual);
	if(!sCodigo.equals("")){
		if(sCodigo.equals("0")){
			if(!sChequesObran.equals(""))
		 	oAnexoEstatus.UpdateObservacion(iIdFuncionario, oAnexo2IV2.GetIdAnexo(), sChequesObran); 
  	     	oAnexo2IV2.Insert(iIdFuncionario, sFecha, sNoCuenta, sBanco, sBeneficiario, sNoCheque, sImporte);
			// PARA GUARDAR BITACORA
			oSeguridad.Bitacora(sUsuario, "Nuevo", "Anexo II.4.2", request.getRemoteAddr(), request.getRemoteHost(), request.getHeader("User-Agent"));
		} else {
			oAnexo2IV2.Update(java.lang.Integer.parseInt(sCodigo), sFecha, sNoCuenta, sBanco, sBeneficiario, sNoCheque, sImporte);
			oAnexoEstatus.UpdateObservacion(iIdFuncionario, oAnexo2IV2.GetIdAnexo(), sChequesObran);
			// PARA GUARDAR BITACORA
			oSeguridad.Bitacora(sUsuario, "Grabar", "Anexo II.4.2", request.getRemoteAddr(), request.getRemoteHost(), request.getHeader("User-Agent"));
		}
	}else{
		// PARA GUARDAR BITACORA
		oSeguridad.Bitacora(sUsuario, "Grabar", "Anexo II.4.2 Estatus", request.getRemoteAddr(), request.getRemoteHost(), request.getHeader("User-Agent"));	
	}
	sCodigo = "";
	sOpcion = "";
}

if(sOpcion.equals("SAVEDETALLE")){
	// CAMBIO DE ENTREGA DE ESTATUS
	com.gob.EntregaEstatus 	oEntregaEstatus 	= new com.gob.EntregaEstatus();
	String sEstatusEntrega	= ((session.getValue("sEstatusEntrega")!= null?(String)session.getValue("sEstatusEntrega"):""));
	if(sEstatusEntrega.equals(oEntregaEstatus.GetEstatusSinInformacion())) {
		oEntregaEstatus.Insert(iIdFuncionario, oEntregaEstatus.GetEstatusNoIniciada(), oUtil.sGetDate(oUtil.GetFecha(), "yyyyMMddHHmmss"), "Entrega No Iniciada. Inicia Captura Diaria de Información");
		session.putValue("sEstatusEntrega",	oEntregaEstatus.GetEstatusNoIniciada()+"");		}

	// PARA GUARDAR BITACORA
	oSeguridad.Bitacora(sUsuario, "Grabar", "Anexo II.4.2 Detalle", request.getRemoteAddr(), request.getRemoteHost(), request.getHeader("User-Agent"));
oAnexoEstatus.InsertObservacion(iIdFuncionario, oAnexo2IV2.GetIdAnexo(), sEstatus, iIdUsuario, sFechaActual, "");
if(!sCodigo.equals("")){
   oAnexoEstatus.UpdateObservacion(iIdFuncionario, oAnexo2IV2.GetIdAnexo(), sChequesObran);
	}
	sOpt = "";
	sCodigo = "";
	sOpcion = "";
}

if(sOpcion.equals("STATUS")){
  oAnexoEstatus.Update(iIdFuncionario, oAnexo2IV2.GetIdAnexo(), sEstatus, iIdUsuario, sFechaActual);
  sCodigo = "";
	sOpcion = "";
}


if(sOpcion.equals("DEL")){
	// PARA GUARDAR BITACORA
	oSeguridad.Bitacora(sUsuario, "Elimina", "Anexo II.4.2", request.getRemoteAddr(), request.getRemoteHost(), request.getHeader("User-Agent"));
	oAnexo2IV2.Delete(java.lang.Integer.parseInt(sCodigo));

	if(oAnexo2IV2.GetAll(iIdFuncionario) == 0)
	oAnexoEstatus.UpdateObservacion(iIdFuncionario, oAnexo2IV2.GetIdAnexo(), sChequesObran);
	sCodigo = "";
	sOpcion = "";
}

if(sOpcion.equals("DELALL")){
	// PARA GUARDAR BITACORA
	oSeguridad.Bitacora(sUsuario, "Elimina", "Anexo II.4.2 Contenido", request.getRemoteAddr(), request.getRemoteHost(), request.getHeader("User-Agent"));
	oAnexo2IV2.DeleteAll(iIdFuncionario);
sCodigo = "";
sOpcion = "";
}
if(sOpcion.equals("UNDO")){
	// PARA GUARDAR BITACORA
	oSeguridad.Bitacora(sUsuario, "DeshaceCarga", "Anexo II.4.2", request.getRemoteAddr(), request.getRemoteHost(), request.getHeader("User-Agent"));
	oAnexo2IV2.Undo(iIdFuncionario);
sCodigo = "";
sOpcion = "";
}
%>

<html>
<head>
	<title>Entrega - Recepción : Anexo II.4.2 (Procesando...)</title>
</head>

<body>
<form action="fAnexo2IV2.jsp" name="forma" method="post" target="_parent">
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