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
String	sEstructuraOrganizacional		= request.getParameter("sEstructuraOrganizacional")!= null ? request.getParameter("sEstructuraOrganizacional"): "";

com.gob.Anexo3I oAnexo3I = new com.gob.Anexo3I();
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

	oAnexoEstatus.Insert(iIdFuncionario, oAnexo3I.GetIdAnexo(), sEstatus, iIdUsuario, sFechaActual, "");
	if(!sCodigo.equals("")){
		if(!oAnexo3I.Get(iIdFuncionario)){
			oAnexo3I.Insert(iIdFuncionario, sEstructuraOrganizacional);
			// PARA GUARDAR BITACORA
			oSeguridad.Bitacora(sUsuario, "Nuevo", "Anexo III.1", request.getRemoteAddr(), request.getRemoteHost(), request.getHeader("User-Agent"));
		} else {
	  		oAnexo3I.Update(java.lang.Integer.parseInt(sCodigo), sEstructuraOrganizacional);
			// PARA GUARDAR BITACORA
			oSeguridad.Bitacora(sUsuario, "Grabar", "Anexo III.1", request.getRemoteAddr(), request.getRemoteHost(), request.getHeader("User-Agent"));
		}
	}else{
	// PARA GUARDAR BITACORA
	oSeguridad.Bitacora(sUsuario, "Grabar", "Anexo III.1 Estatus", request.getRemoteAddr(), request.getRemoteHost(), request.getHeader("User-Agent"));
	}
sCodigo = "";
sOpcion = "";
}

if(sOpcion.equals("DEL")){
	// PARA GUARDAR BITACORA
	oSeguridad.Bitacora(sUsuario, "Elimina", "Anexo III.1", request.getRemoteAddr(), request.getRemoteHost(), request.getHeader("User-Agent"));
	oAnexo3I.Delete(java.lang.Integer.parseInt(sCodigo));
sCodigo = "";
sOpcion = "";
}%>

<html>
<head>
	<title>Entrega - Recepción : Anexo III.1 (Procesando...)</title>
</head>

<body>
<form action="fAnexo3I.jsp" name="forma" method="post" target="_parent">
	<input type="hidden" name="sOpcion" value="<%=sOpcion%>">
	<input type="hidden" name="sCodigo" value="<%=sCodigo%>"> 
</form>
</body>
<script>
	document.forma.submit();
</script>
</html>