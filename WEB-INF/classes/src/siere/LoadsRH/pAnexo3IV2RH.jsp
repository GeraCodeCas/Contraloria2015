<%@page import="com.consiss.util.*"%>
<%@page import="java.util.*" %>
<%/*********************************************************************************************************
Elaboro:	Julio Enrique Espinosa Torres
Lugar:		Monterrey, NL
Fecha:		29.Oct.2002
Compa�ia:	CONSISS*/%><%
int	selDependencia = java.lang.Integer.parseInt(
	request.getParameter("selDependencia")!= null ? request.getParameter("selDependencia"): "0");
int	selUAdministrativa = java.lang.Integer.parseInt(
	request.getParameter("selUAdministrativa")!= null ? request.getParameter("selUAdministrativa"): "0");
int iIdUsuario	   = java.lang.Integer.parseInt(
	(String)(session.getValue("iIdUsuario")!= null?session.getValue("iIdUsuario"):"0"));

String	sOpcion = request.getParameter("sOpcion")!= null ? request.getParameter("sOpcion"): "";
String	sCodigo = request.getParameter("sCodigo")!= null ? request.getParameter("sCodigo"): "0";

String	iPagina = request.getParameter("iPagina")!= null ? request.getParameter("iPagina"): "1";

String sIdFuncionario=request.getParameter("sIdFuncionario")!= null ? request.getParameter("sIdFuncionario"): "";
String sNomina = request.getParameter("sNomina")!= null ? request.getParameter("sNomina"): "";
String sNombre = request.getParameter("sNombre")!= null ? request.getParameter("sNombre"): "";
String sSituacion = request.getParameter("sSituacion")!= null ? request.getParameter("sSituacion"): "";
String sDeComisionado = request.getParameter("sDeComisionado")!= null ? request.getParameter("sDeComisionado"): "";
String sAComisionado = request.getParameter("sAComisionado")!= null ? request.getParameter("sAComisionado"): "";
String sFechaDePeriodo = request.getParameter("sFechaDePeriodo")!= null ? request.getParameter("sFechaDePeriodo"): "";
String sFechaAPeriodo = request.getParameter("sFechaAPeriodo")!= null ? request.getParameter("sFechaAPeriodo"): "";
String sObservaciones = request.getParameter("sObservaciones")!= null ? request.getParameter("sObservaciones"): "";
String sTipoNomina	= request.getParameter("sClaveTipoNomina")!= null ? request.getParameter("sClaveTipoNomina"): "";

com.gob.Anexo3IV2 oAnexo3IV2 = new com.gob.Anexo3IV2();
/*com.gob.AnexoEstatus 	oAnexoEstatus 	= new com.gob.AnexoEstatus();
Utilerias		oUtil			= new Utilerias();
sFechaActual = oUtil.sGetDateToNum(oUtil.sGetDate(oUtil.GetFecha(), "dd/MM/yyyy"), "/");
*/
// PARA GUARDAR BITACORA, SE LEE USUARIO
Seguridad	oSeguridad;
String sUsuario	= ((session.getValue("sUsuario")!= null?(String)session.getValue("sUsuario"):""));
oSeguridad = new Seguridad();

if(sOpcion.equals("NORMAL")){ sCodigo = ""; }

if(sOpcion.equals("SAVE")){
	// CAMBIO DE ENTREGA DE ESTATUS
	/*com.gob.EntregaEstatus 	oEntregaEstatus 	= new com.gob.EntregaEstatus();
	String sEstatusEntrega	= ((session.getValue("sEstatusEntrega")!= null?(String)session.getValue("sEstatusEntrega"):""));
	if(sEstatusEntrega.equals(oEntregaEstatus.GetEstatusSinInformacion())) {
		oEntregaEstatus.Insert(iIdFuncionario, oEntregaEstatus.GetEstatusNoIniciada(), oUtil.sGetDate(oUtil.GetFecha(), "yyyyMMddHHmmss"), "Entrega No Iniciada. Inicia Captura Diaria de Informaci�n");
		session.putValue("sEstatusEntrega",	oEntregaEstatus.GetEstatusNoIniciada()+"");		}
	
	oAnexoEstatus.Insert(iIdFuncionario, oAnexo3IV2.GetIdAnexo(), sEstatus, iIdUsuario, sFechaActual, "");
	*/
	if(!sCodigo.equals("")){
		if(sCodigo.equals("0") ){
			oAnexo3IV2.Insert(java.lang.Integer.parseInt(sIdFuncionario), sNomina, sNombre, sSituacion, sDeComisionado, sAComisionado, sFechaDePeriodo, sFechaAPeriodo, sObservaciones, sTipoNomina);
			// PARA GUARDAR BITACORA
			oSeguridad.Bitacora(sUsuario, "Nuevo", "Anexo III.4.2", request.getRemoteAddr(), request.getRemoteHost(), request.getHeader("User-Agent"));
		} else {
	  		oAnexo3IV2.Update(java.lang.Long.parseLong(sCodigo), sNomina, sNombre, sSituacion, sDeComisionado, sAComisionado, sFechaDePeriodo, sFechaAPeriodo, sObservaciones, sTipoNomina);
			// PARA GUARDAR BITACORA
			oSeguridad.Bitacora(sUsuario, "Grabar", "Anexo III.4.2", request.getRemoteAddr(), request.getRemoteHost(), request.getHeader("User-Agent"));
		}
	}else{
	// PARA GUARDAR BITACORA
	//oSeguridad.Bitacora(sUsuario, "Grabar", "Anexo III.4.2 Estatus", request.getRemoteAddr(), request.getRemoteHost(), request.getHeader("User-Agent"));
	}
sCodigo = "";
sOpcion = "";
}

if(sOpcion.equals("DEL")){
	// PARA GUARDAR BITACORA
	oSeguridad.Bitacora(sUsuario, "Elimina", "Anexo III.4.2", request.getRemoteAddr(), request.getRemoteHost(), request.getHeader("User-Agent"));
	oAnexo3IV2.Delete(java.lang.Long.parseLong(sCodigo));
	sCodigo = "0";
sCodigo = "";
sOpcion = "";
}

if(sOpcion.equals("DELALL")){
	// PARA GUARDAR BITACORA
	oSeguridad.Bitacora(sUsuario, "Elimina", "Anexo III.4.2 Contenido", request.getRemoteAddr(), request.getRemoteHost(), request.getHeader("User-Agent"));
	oAnexo3IV2.DeleteAllUnidadA(selUAdministrativa+"");
sCodigo = "";
sOpcion = "";
}
%>

<html>
<head>
	<title>Entrega - Recepci�n : Anexo III.4.2 (Procesando...)</title>
</head>

<body>
<form action="fAnexo3IV2RH.jsp" name="forma" method="post" target="_parent">
	<input type="hidden" name="sOpcion" value="<%=sOpcion%>">
	<input type="hidden" name="sCodigo" value="<%=sCodigo%>">
	<input type="hidden" name="selDependencia" value="<%=selDependencia%>">
	<input type="hidden" name="selUAdministrativa" value="<%=selUAdministrativa%>">
	<input type="hidden" name="iPagina" value="<%=iPagina%>">
</form>
</body>
<script>
	document.forma.submit();
</script>
</html>