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

String	sOpcion 			= request.getParameter("sOpcion")!= null ? 				request.getParameter("sOpcion"): "";
String	sCodigo 			= request.getParameter("sCodigo")!= null ? 				request.getParameter("sCodigo"): "";

String	sConsecutivo		= request.getParameter("sConsecutivo")!= null ?			request.getParameter("sConsecutivo"): "";
String	sClave 				= request.getParameter("sClave")!= null ? 				request.getParameter("sClave"): "";
String	sJustificacion		= request.getParameter("sJustificacion")!= null ?		request.getParameter("sJustificacion"): "";
String	sDescripcion		= request.getParameter("sDescripcion")!= null ? 		request.getParameter("sDescripcion"): "";
String	sObservacion 		= request.getParameter("sObservacion")!= null ? 		request.getParameter("sObservacion"): "";
String	sTecnico	 		= request.getParameter("sTecnico")!= null ? 			request.getParameter("sTecnico"): "";
String	sFinanciero 		= request.getParameter("sFinanciero")!= null ? 			request.getParameter("sFinanciero"): "";
String	sSocioEconomico 	= request.getParameter("sSocioEconomico")!= null ? 		request.getParameter("sSocioEconomico"): "";
String	sPlanoEjecutivo 	= request.getParameter("sPlanoEjecutivo")!= null ? 		request.getParameter("sPlanoEjecutivo"): "";
String	sPlanoDetalle 		= request.getParameter("sPlanoDetalle")!= null ? 		request.getParameter("sPlanoDetalle"): "";

String	sOrigen 			= request.getParameter("sOrigen")!= null ? 				request.getParameter("sOrigen"): "";
String	sEstatus			= request.getParameter("sEstatus")!= null ? 			request.getParameter("sEstatus"): "1";
String 	sFechaActual= "";

Anexo3XVIII		oAnexo 			= new Anexo3XVIII();
AnexoEstatus 	oAnexoEstatus 	= new AnexoEstatus();
Utilerias		oUtil			= new Utilerias();
sFechaActual = 	oUtil.sGetDateToNum(oUtil.sGetDate(oUtil.GetFecha(), "dd/MM/yyyy"), "/");

// PARA GUARDAR BITACORA, SE LEE USUARIO
Seguridad	oSeguridad;
String sUsuario	= ((session.getValue("sUsuario")!= null?(String)session.getValue("sUsuario"):""));
oSeguridad = new Seguridad();

if(sOpcion.equals("NORMAL")){ sCodigo = ""; }
System.out.println("iIdFuncionario:" + iIdFuncionario);

//out.println("iIdFuncionario:" + iIdFuncionario);
//out.println("sOpcion:" + sOpcion);
if(sOpcion.equals("SAVE")){
	// CAMBIO DE ENTREGA DE ESTATUS
	com.gob.EntregaEstatus 	oEntregaEstatus 	= new com.gob.EntregaEstatus();
	String sEstatusEntrega	= ((session.getValue("sEstatusEntrega")!= null?(String)session.getValue("sEstatusEntrega"):""));
	if(sEstatusEntrega.equals(oEntregaEstatus.GetEstatusSinInformacion())) {
		oEntregaEstatus.Insert(iIdFuncionario, oEntregaEstatus.GetEstatusNoIniciada(), oUtil.sGetDate(oUtil.GetFecha(), "yyyyMMddHHmmss"), "Entrega No Iniciada. Inicia Captura Diaria de Información");
		session.putValue("sEstatusEntrega",	oEntregaEstatus.GetEstatusNoIniciada()+"");		}

	oAnexoEstatus.Update(iIdFuncionario, oAnexo.GetIdAnexo(), sEstatus, iIdUsuario, sFechaActual);
	//out.println("sCodigo:" + sCodigo);
	if(sCodigo.equals("0")){
	  	oAnexo.Insert(iIdFuncionario, sConsecutivo, sClave, sJustificacion, sDescripcion, sObservacion, sTecnico, sFinanciero, 
						sSocioEconomico, sPlanoEjecutivo, sPlanoDetalle);
		// PARA GUARDAR BITACORA
		oSeguridad.Bitacora(sUsuario, "Nuevo", "Anexo III.18", request.getRemoteAddr(), request.getRemoteHost(), request.getHeader("User-Agent"));
		System.out.println("Anexo3XVIII.Insert:" + iIdFuncionario + ", " + sConsecutivo + ", " + sClave + ", " + sJustificacion + ", " + sDescripcion + ", " + sObservacion + ", " + sTecnico + ", " + sFinanciero + ", " + 
						sSocioEconomico + ", " + sPlanoEjecutivo + ", " + sPlanoDetalle + ". Usuario" + sUsuario);
	//	out.println("Anexo3XVIII.Insert:" + iIdFuncionario + ", " + sConsecutivo + ", " + sClave + ", " + sJustificacion + ", " + sDescripcion + ", " + sObservacion + ", " + sTecnico + ", " + sFinanciero + ", " + 
	//					sSocioEconomico + ", " + sPlanoEjecutivo + ", " + sPlanoDetalle + ". Usuario" + sUsuario);
	} else {
		if (!sCodigo.equals("")){
	  		oAnexo.Update(java.lang.Integer.parseInt(sCodigo), iIdFuncionario, sConsecutivo, sClave, sJustificacion, sDescripcion, sObservacion, sTecnico, sFinanciero, 
						sSocioEconomico, sPlanoEjecutivo, sPlanoDetalle);
			// PARA GUARDAR BITACORA
			oSeguridad.Bitacora(sUsuario, "Grabar", "Anexo III.18", request.getRemoteAddr(), request.getRemoteHost(), request.getHeader("User-Agent"));
		//	out.println("Anexo3XVIII.Update:" + sCodigo + ", " + iIdFuncionario + ", " + sConsecutivo + ", " + sClave + ", " + sJustificacion + ", " + sDescripcion + ", " + sObservacion + ", " + sTecnico + ", " + sFinanciero + ", " + 
		//				sSocioEconomico + ", " + sPlanoEjecutivo + ", " + sPlanoDetalle + ". Usuario" + sUsuario);
			System.out.println("Anexo3XVIII.Update:" + sCodigo + ", " + iIdFuncionario + ", " + sConsecutivo + ", " + sClave + ", " + sJustificacion + ", " + sDescripcion + ", " + sObservacion + ", " + sTecnico + ", " + sFinanciero + ", " + 
						sSocioEconomico + ", " + sPlanoEjecutivo + ", " + sPlanoDetalle + ". Usuario" + sUsuario);
		}else{
		// PARA GUARDAR BITACORA
			oSeguridad.Bitacora(sUsuario, "Grabar", "Anexo III.18 Estatus", request.getRemoteAddr(), request.getRemoteHost(), request.getHeader("User-Agent"));
		}
	}
	sCodigo = "";
	sOpcion = "";
	sOrigen = "0";
}
if(sOpcion.equals("DELETE")){
	// PARA GUARDAR BITACORA
	oSeguridad.Bitacora(sUsuario, "Elimina", "Anexo III.18", request.getRemoteAddr(), request.getRemoteHost(), request.getHeader("User-Agent"));
	oAnexo.Delete(java.lang.Integer.parseInt(sCodigo));
	System.out.println("Anexo3XVIII.Delete:" + sCodigo + ". Usuario" + sUsuario);
	//out.println("Anexo3XVIII.Delete:" + sCodigo + ". Usuario" + sUsuario);
	sCodigo = "";
	sOpcion = "";
	sOrigen = "0";
}
%>

<html>
<head>
	<title>Entrega - Recepción : Anexo III.18 (Procesando...)</title>
</head>
<body>
	<form action="fAnexo3XVIII.jsp" name="forma" method="post" target="_parent">
		<input type="hidden" name="sOpcion" value="<%=sOpcion%>">
		<input type="hidden" name="sOrigen" value="<%=sOrigen%>">
		<input type="hidden" name="sCodigo" value="<%if(!sOpcion.equals("SAVE")) {%><%=sCodigo%><%}%>"> 
	</form>
</body>
<script>
	document.forma.submit();
</script>
</html>
