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
String	iIdTipo		= request.getParameter("sTipo")!= null ? request.getParameter("sTipo"): "";
String	sPresupuestoAprobado= request.getParameter("sPresupuestoAprobado")!= null ? request.getParameter("sPresupuestoAprobado"): "";
String	sIncrementos		= request.getParameter("sIncrementos")!= null ? request.getParameter("sIncrementos"): "";
String	sReducciones		= request.getParameter("sReducciones")!= null ? request.getParameter("sReducciones"): "";
String	sProgramasEspeciales= request.getParameter("sProgramasEspeciales")!= null ? request.getParameter("sProgramasEspeciales"): "";
String	sTotalAprobado		= request.getParameter("sTotalAprobado")!= null ? request.getParameter("sTotalAprobado"): "";
String	sTotalEjercido		= request.getParameter("sTotalEjercido")!= null ? request.getParameter("sTotalEjercido"): "";
String	sTotalPorEjercer	= request.getParameter("sTotalPorEjercer")!= null ? request.getParameter("sTotalPorEjercer"): "";
String	sObservaciones		= request.getParameter("sObservaciones")!= null ? request.getParameter("sObservaciones"): "";
char [] cPresupuestoAprobado = sPresupuestoAprobado.toCharArray();
sPresupuestoAprobado = "";
for(int i=0;i<cPresupuestoAprobado.length;i++){
	sPresupuestoAprobado = cPresupuestoAprobado[i]!=','?sPresupuestoAprobado + cPresupuestoAprobado[i]:sPresupuestoAprobado; }
char [] cIncrementos         = sIncrementos.toCharArray();
sIncrementos = "";
for(int i=0;i<cIncrementos.length;i++){
	sIncrementos = cIncrementos[i]!=','?sIncrementos + cIncrementos[i]:sIncrementos; }
char [] cReducciones         = sReducciones.toCharArray();
sReducciones = "";
for(int i=0;i<cReducciones.length;i++){
	sReducciones = cReducciones[i]!=','?sReducciones + cReducciones[i]:sReducciones; }
char [] cProgramasEspeciales = sProgramasEspeciales.toCharArray();
sProgramasEspeciales = "";
for(int i=0;i<cProgramasEspeciales.length;i++){
	sProgramasEspeciales = cProgramasEspeciales[i]!=','?sProgramasEspeciales + cProgramasEspeciales[i]:sProgramasEspeciales; }
char [] cTotalAprobado       = sTotalAprobado.toCharArray();
sTotalAprobado = "";
for(int i=0;i<cTotalAprobado.length;i++){
	sTotalAprobado = cTotalAprobado[i]!=','?sTotalAprobado + cTotalAprobado[i]:sTotalAprobado; }
char [] cTotalEjercido       = sTotalEjercido.toCharArray();
sTotalEjercido = "";
for(int i=0;i<cTotalEjercido.length;i++){
	sTotalEjercido = cTotalEjercido[i]!=','?sTotalEjercido + cTotalEjercido[i]:sTotalEjercido; }
char [] cTotalPorEjercer     = sTotalPorEjercer.toCharArray();
sTotalPorEjercer = "";
for(int i=0;i<cTotalPorEjercer.length;i++){
	sTotalPorEjercer = cTotalPorEjercer[i]!=','?sTotalPorEjercer + cTotalPorEjercer[i]:sTotalPorEjercer; }

com.gob.Anexo2I oAnexo2I = new com.gob.Anexo2I();
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
	
	oAnexoEstatus.Insert(iIdFuncionario, oAnexo2I.GetIdAnexo(), sEstatus, iIdUsuario, sFechaActual, "");
	
	if(!sCodigo.equals("")){
		if(!oAnexo2I.Get(iIdFuncionario)){
	  		oAnexo2I.Insert(iIdFuncionario, sPresupuestoAprobado, sIncrementos, sReducciones, sProgramasEspeciales, sTotalAprobado, sTotalEjercido, sTotalPorEjercer, sObservaciones);
			//PARA GUARDAR BITACORA
			oSeguridad.Bitacora(sUsuario, "Nuevo", "Anexo II.1", request.getRemoteAddr(), request.getRemoteHost(), request.getHeader("User-Agent"));
		} else {
			oAnexo2I.Update(java.lang.Integer.parseInt(sCodigo), sPresupuestoAprobado, sIncrementos, sReducciones, sProgramasEspeciales, sTotalAprobado, sTotalEjercido, sTotalPorEjercer, sObservaciones);
			//PARA GUARDAR BITACORA
			oSeguridad.Bitacora(sUsuario, "Grabar", "Anexo II.1", request.getRemoteAddr(), request.getRemoteHost(), request.getHeader("User-Agent"));
		}
	}else{
	// PARA GUARDAR BITACORA
	oSeguridad.Bitacora(sUsuario, "Grabar", "Anexo II.1 Estatus", request.getRemoteAddr(), request.getRemoteHost(), request.getHeader("User-Agent"));	
	}
sCodigo = "";
sOpcion = "";
}

if(sOpcion.equals("DEL")){
	oAnexo2I.Delete(java.lang.Integer.parseInt(sCodigo));
	// PARA GUARDAR BITACORA
	oSeguridad.Bitacora(sUsuario, "Elimina", "Anexo II.1", request.getRemoteAddr(), request.getRemoteHost(), request.getHeader("User-Agent"));
sCodigo = "";
sOpcion = "";
}%>

<html>
<head>
	<title>Entrega - Recepción : Anexo II.1 (Procesando...)</title>
</head>

<body>
<form action="fAnexo2I.jsp" name="forma" method="post" target="_parent">
	<input type="hidden" name="sOpcion" value="<%=sOpcion%>">
	<input type="hidden" name="sCodigo" value="<%=sCodigo%>"> 
</form>
</body>
<script>
	document.forma.submit();
</script>
</html>