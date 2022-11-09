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
String	sOpt = request.getParameter("sOpt")!= null ? request.getParameter("sOpt"): "0";
String	sEstatus	= request.getParameter("sEstatus")!= null ? request.getParameter("sEstatus"): "1";
String	iPagina = request.getParameter("iPagina")!= null ? request.getParameter("iPagina"): "1";
String 	sFechaActual= "";
// sCodigo = IdRenglon
%>
<%
String	sNombre			= request.getParameter("sNombre")!= null ? request.getParameter("sNombre"): "";
String	sPuesto			= request.getParameter("sPuesto")!= null ? request.getParameter("sPuesto"): "";
String	sCategoria		= request.getParameter("sCategoria")!= null ? request.getParameter("sCategoria"): "";
String	sAdscripcion	= request.getParameter("sAdscripcion")!= null ? request.getParameter("sAdscripcion"): "";
String	sTipoPlaza		= request.getParameter("sTipoPlaza")!= null ? request.getParameter("sTipoPlaza"): "";
String	sSueldoBase		= request.getParameter("sSueldoBase")!= null ? request.getParameter("sSueldoBase"): "";
try{
	char [] cSueldoBase = sSueldoBase.toCharArray();
	sSueldoBase = "";
	for(int i=0;i<cSueldoBase.length;i++){	sSueldoBase = cSueldoBase[i]!=','?sSueldoBase + cSueldoBase[i]:sSueldoBase; }
	char [] cSueldoBase2 = sSueldoBase.toCharArray();
	sSueldoBase = "";
	for(int i=0;i<cSueldoBase2.length;i++){	sSueldoBase = cSueldoBase2[i]!='$'?sSueldoBase + cSueldoBase2[i]:sSueldoBase; }
}catch(Throwable e){}

String	sCompensacion	= request.getParameter("sCompensacion")!= null ? request.getParameter("sCompensacion"): "";
try{
	char [] cCompensacion = sCompensacion.toCharArray();
	sCompensacion = "";
	for(int i=0;i<cCompensacion.length;i++){ sCompensacion = cCompensacion[i]!=','?sCompensacion + cCompensacion[i]:sCompensacion; }
	char [] cCompensacion2 = sCompensacion.toCharArray();
	sCompensacion = "";
	for(int i=0;i<cCompensacion2.length;i++){ sCompensacion = cCompensacion2[i]!='$'?sCompensacion + cCompensacion2[i]:sCompensacion; }
}catch(Throwable e){}

String	sOtrasPrestaciones= request.getParameter("sOtrasPrestaciones")!= null ? request.getParameter("sOtrasPrestaciones"): "";
try{
	char [] cOtrasPrestaciones = sOtrasPrestaciones.toCharArray();
	sOtrasPrestaciones = "";
	for(int i=0;i<cOtrasPrestaciones.length;i++){	sOtrasPrestaciones = cOtrasPrestaciones[i]!=','?sOtrasPrestaciones + cOtrasPrestaciones[i]:sOtrasPrestaciones; }
	char [] cOtrasPrestaciones2 = sOtrasPrestaciones.toCharArray();
	sOtrasPrestaciones = "";
	for(int i=0;i<cOtrasPrestaciones2.length;i++){	sOtrasPrestaciones = cOtrasPrestaciones2[i]!='$'?sOtrasPrestaciones + cOtrasPrestaciones2[i]:sOtrasPrestaciones; }
}catch(Throwable e){}

String	sTotal			= request.getParameter("sTotal")!= null ? request.getParameter("sTotal"): "";
try{
	char [] cTotal = sTotal.toCharArray();
	sTotal = "";
	for(int i=0;i<cTotal.length;i++){	sTotal = cTotal[i]!=','?sTotal + cTotal[i]:sTotal; }
	char [] cTotal2 = sTotal.toCharArray();
	sTotal = "";
	for(int i=0;i<cTotal2.length;i++){	sTotal = cTotal2[i]!='$'?sTotal + cTotal2[i]:sTotal; }
}catch(Throwable e){}

String	sObservaciones	= request.getParameter("sObservaciones")!= null ? request.getParameter("sObservaciones"): "";

com.gob.Anexo3IV1 oAnexo3IV1 = new com.gob.Anexo3IV1();
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

	oAnexoEstatus.Update(iIdFuncionario, oAnexo3IV1.GetIdAnexo(), sEstatus, iIdUsuario, sFechaActual);
	if(!sCodigo.equals("")){
		if(sCodigo.equals("0")){
			oAnexo3IV1.Insert(iIdFuncionario, sNombre, sPuesto, sCategoria, sAdscripcion, sTipoPlaza, sSueldoBase, sCompensacion, sOtrasPrestaciones, sTotal, sObservaciones, null);
			// PARA GUARDAR BITACORA
			oSeguridad.Bitacora(sUsuario, "Nuevo", "Anexo III.4.1", request.getRemoteAddr(), request.getRemoteHost(), request.getHeader("User-Agent"));
		}else{
			oAnexo3IV1.Update(java.lang.Long.parseLong(sCodigo), sNombre, sPuesto, sCategoria, sAdscripcion, sTipoPlaza, sSueldoBase, sCompensacion, sOtrasPrestaciones, sTotal, sObservaciones, null);
			// PARA GUARDAR BITACORA
			oSeguridad.Bitacora(sUsuario, "Grabar", "Anexo III.4.1", request.getRemoteAddr(), request.getRemoteHost(), request.getHeader("User-Agent"));
		}
	}else{
	// PARA GUARDAR BITACORA
	oSeguridad.Bitacora(sUsuario, "Grabar", "Anexo III.4.1 Estatus", request.getRemoteAddr(), request.getRemoteHost(), request.getHeader("User-Agent"));
	}
sCodigo = "";
sOpcion = "";
}

if(sOpcion.equals("DEL")){
	// PARA GUARDAR BITACORA
	oSeguridad.Bitacora(sUsuario, "Elimina", "Anexo III.4.1", request.getRemoteAddr(), request.getRemoteHost(), request.getHeader("User-Agent"));
	oAnexo3IV1.Delete(java.lang.Long.parseLong(sCodigo));
sCodigo = "";
sOpcion = "";
}

if(sOpcion.equals("DELALL")){
	// PARA GUARDAR BITACORA
	oSeguridad.Bitacora(sUsuario, "Elimina", "Anexo III.4.1 Contenido", request.getRemoteAddr(), request.getRemoteHost(), request.getHeader("User-Agent"));
	oAnexo3IV1.DeleteAll(iIdFuncionario);
sCodigo = "";
sOpcion = "";
}
if(sOpcion.equals("UNDO")){
	// PARA GUARDAR BITACORA
	oSeguridad.Bitacora(sUsuario, "DeshaceCarga", "Anexo III.4.1", request.getRemoteAddr(), request.getRemoteHost(), request.getHeader("User-Agent"));
	oAnexo3IV1.Undo(iIdFuncionario);
sCodigo = "";
sOpcion = "";
}
%>
<html>
<head>
	<title>Entrega - Recepción : Anexo III.4.1 (Procesando...)</title>
</head>
<body>
<form action="fAnexo3IV1.jsp" name="forma" method="post" target="_parent">
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