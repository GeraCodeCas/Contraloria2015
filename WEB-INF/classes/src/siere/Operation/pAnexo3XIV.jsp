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
'Fecha:		22.Nov.2002
'Compañia:	CONSISS
'Ultima Modificacion:	14.Nov.2002
'By:		Jesus Limon
'
'Distintas opciones:
'
'********************************************************************************************************/
%>
<%
int iIdFuncionario =  java.lang.Integer.parseInt((String)(session.getValue("iIdFuncionario")!= null?session.getValue("iIdFuncionario"):"0") );
int iIdUsuario		= java.lang.Integer.parseInt((String)(session.getValue("iIdUsuario")!= null?session.getValue("iIdUsuario"):"0") );

String	sOpcion 			= request.getParameter("sOpcion")!= null ? 		request.getParameter("sOpcion"): "";
String	sCodigo 			= request.getParameter("sCodigo")!= null ? 		request.getParameter("sCodigo"): "";

String	sNoCompromiso		= request.getParameter("sNoCompromiso")!= null ? 		request.getParameter("sNoCompromiso"): "";
String	sFecha 				= request.getParameter("sFecha")!= null ? 				request.getParameter("sFecha"): "";
String	sDescripcion		= request.getParameter("sDescripcion")!= null ? 		request.getParameter("sDescripcion"): "";
String	sSituacion 			= request.getParameter("sSituacion")!= null ? 			request.getParameter("sSituacion"): "";
String	sAvanceFisico 		= request.getParameter("sAvanceFisico")!= null ? 		request.getParameter("sAvanceFisico"): "";
String	sAvanceFinanciero	= request.getParameter("sAvanceFinanciero")!= null ? 	request.getParameter("sAvanceFinanciero"): "";
String	sEstatus			= request.getParameter("sEstatus")!= null ? 			request.getParameter("sEstatus"): "1";
String 	sFechaActual= "";

Anexo3XIV 		oAnexo 			= new Anexo3XIV();
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
	  	oAnexo.Insert(iIdFuncionario, sNoCompromiso, sFecha, sDescripcion, java.lang.Integer.parseInt(sSituacion), sAvanceFisico, sAvanceFinanciero);
		// PARA GUARDAR BITACORA
		oSeguridad.Bitacora(sUsuario, "Nuevo", "Anexo III.14", request.getRemoteAddr(), request.getRemoteHost(), request.getHeader("User-Agent"));
	} else {
		if (!sCodigo.equals("")){
	  		oAnexo.Update(java.lang.Integer.parseInt(sCodigo), iIdFuncionario, sNoCompromiso, sFecha, sDescripcion, java.lang.Integer.parseInt(sSituacion), sAvanceFisico, sAvanceFinanciero);
			// PARA GUARDAR BITACORA
			oSeguridad.Bitacora(sUsuario, "Grabar", "Anexo III.14", request.getRemoteAddr(), request.getRemoteHost(), request.getHeader("User-Agent"));
		}else{
		// PARA GUARDAR BITACORA
		oSeguridad.Bitacora(sUsuario, "Grabar", "Anexo III.14 Estatus", request.getRemoteAddr(), request.getRemoteHost(), request.getHeader("User-Agent"));
		}
	}
	sCodigo = "";
	sOpcion = "";
}
if(sOpcion.equals("DELETE")){
	// PARA GUARDAR BITACORA
	oSeguridad.Bitacora(sUsuario, "Elimina", "Anexo III.14", request.getRemoteAddr(), request.getRemoteHost(), request.getHeader("User-Agent"));
	oAnexo.Delete(java.lang.Integer.parseInt(sCodigo));
	sCodigo = "";
	sOpcion = "";
}
%>

<html>
<head>
	<title>Entrega - Recepción : Anexo III.14 (Procesando...)</title>
</head>
<body>
	<form action="fAnexo3XIV.jsp" name="forma" method="post" target="_parent">
		<input type="hidden" name="sOpcion" value="<%=sOpcion%>">
		<input type="hidden" name="sCodigo" value="<%=sCodigo%>"> 
	</form>
</body>
<script>
	document.forma.submit();
</script>
</html>
