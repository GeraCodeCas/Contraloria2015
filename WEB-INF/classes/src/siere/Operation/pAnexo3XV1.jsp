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
'Fecha:		27.Nov.2002
'Compañia:	CONSISS
'Ultima Modificacion:
'By:
'
'Distintas opciones:
'
'********************************************************************************************************/
%>
<%
int iIdFuncionario =  java.lang.Integer.parseInt((String)(session.getValue("iIdFuncionario")!= null?session.getValue("iIdFuncionario"):"0") );
int iIdUsuario		= java.lang.Integer.parseInt((String)(session.getValue("iIdUsuario")!= null?session.getValue("iIdUsuario"):"0") );

String	sOpcion 		= request.getParameter("sOpcion")!= null ? 			request.getParameter("sOpcion"): "";
String	sCodigo 		= request.getParameter("sCodigo")!= null ? 			request.getParameter("sCodigo"): "";

String	sIdentificacion = request.getParameter("sIdentificacion")!= null ? 	request.getParameter("sIdentificacion"): "";
String	sDiskette 		= request.getParameter("sDiskette")!= null ? 		request.getParameter("sDiskette"): "";
String	sCD	 			= request.getParameter("sCD")!= null ? 				request.getParameter("sCD"): "";
String	sPeriodo 		= request.getParameter("sPeriodo")!= null ? 		request.getParameter("sPeriodo"): "";
String	sUbicacion 		= request.getParameter("sUbicacion")!= null ? 		request.getParameter("sUbicacion"): "";
String	sPrograma 		= request.getParameter("sPrograma")!= null ? 		request.getParameter("sPrograma"): "";

String	sEstatus	= request.getParameter("sEstatus")!= null ? request.getParameter("sEstatus"): "1";
String 	sFechaActual= "";

Anexo3XV1 		oAnexo 			= new Anexo3XV1();
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

	oAnexoEstatus.Insert(iIdFuncionario, oAnexo.GetIdAnexo(), sEstatus, iIdUsuario, sFechaActual, "");
	if(sCodigo.equals("0")){
	  	oAnexo.Insert(iIdFuncionario, sIdentificacion, sDiskette, sCD, sPeriodo, sUbicacion, sPrograma);
		// PARA GUARDAR BITACORA
		oSeguridad.Bitacora(sUsuario, "Nuevo", "Anexo III.15.1", request.getRemoteAddr(), request.getRemoteHost(), request.getHeader("User-Agent"));
	} else {
		if (!sCodigo.equals("")){
	  		oAnexo.Update(java.lang.Integer.parseInt(sCodigo), iIdFuncionario, sIdentificacion, sDiskette, sCD, sPeriodo, sUbicacion, sPrograma);
			// PARA GUARDAR BITACORA
			oSeguridad.Bitacora(sUsuario, "Grabar", "Anexo III.15.1", request.getRemoteAddr(), request.getRemoteHost(), request.getHeader("User-Agent"));
		}else{
		// PARA GUARDAR BITACORA
		oSeguridad.Bitacora(sUsuario, "Grabar", "Anexo III.15.1 Estatus", request.getRemoteAddr(), request.getRemoteHost(), request.getHeader("User-Agent"));
		}
	}
	sCodigo = "";
	sOpcion = "";
}
if(sOpcion.equals("DELETE")){
	// PARA GUARDAR BITACORA
	oSeguridad.Bitacora(sUsuario, "Elimina", "Anexo III.15.1", request.getRemoteAddr(), request.getRemoteHost(), request.getHeader("User-Agent"));
	oAnexo.Delete(java.lang.Integer.parseInt(sCodigo));
	sCodigo = "";
	sOpcion = "";
}
%>

<html>
<head>
	<title>Entrega - Recepción : Anexo III.15.1 (Procesando...)</title>
</head>
<body>
	<form action="fAnexo3XV1.jsp" name="forma" method="post" target="_parent">
		<input type="hidden" name="sOpcion" value="<%=sOpcion%>">
		<input type="hidden" name="sCodigo" value="<%=sCodigo%>"> 
	</form>
</body>
<script>
	document.forma.submit();
</script>
</html>
