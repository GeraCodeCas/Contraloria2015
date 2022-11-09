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
Fecha:		06.Nov.2002
Compañia:	CONSISS*/%><%
int iIdFuncionario =  java.lang.Integer.parseInt(
		(String)(session.getValue("iIdFuncionario")!= null?session.getValue("iIdFuncionario"):"0") );
int iIdUsuario	   = java.lang.Integer.parseInt(
		(String)(session.getValue("iIdUsuario")!= null?session.getValue("iIdUsuario"):"0"));
String	sOpcion = request.getParameter("sOpcion")!= null ? request.getParameter("sOpcion"): "";
String	sCodigo = request.getParameter("sCodigo")!= null ? request.getParameter("sCodigo"): "0";
String	sOpt = request.getParameter("sOpt")!= null ? request.getParameter("sOpt"): "0";
String	sEstatus	= request.getParameter("sEstatus")!= null ? request.getParameter("sEstatus"): "1";
String 	sFechaActual= "";
// sCodigo = IdRenglon
%>
<%
String	sDepartamento			= request.getParameter("sDepartamento")!= null ? request.getParameter("sDepartamento"): "";
String	sMontoTotal				= request.getParameter("sMontoTotal")!= null ? request.getParameter("sMontoTotal"): "";
String	sEfectivo				= request.getParameter("sEfectivo")!= null ? request.getParameter("sEfectivo"): "";
String	sComprobantes			= request.getParameter("sComprobantes")!= null ? request.getParameter("sComprobantes"): "";
String	sValesProvisionales		= request.getParameter("sValesProvisionales")!= null ? request.getParameter("sValesProvisionales"): "";
String	sOtros					= request.getParameter("sOtros")!= null ? request.getParameter("sOtros"): "";
String	sResponsableFondo		= request.getParameter("sResponsableFondo")!= null ? request.getParameter("sResponsableFondo"): "";
String	sFechaCorte				= request.getParameter("sFechaCorte")!= null ? request.getParameter("sFechaCorte"): "";


com.gob.Anexo2II oAnexo2II = new com.gob.Anexo2II();
com.gob.DetalleAnexo2II oDetalleAnexo2II = new com.gob.DetalleAnexo2II();
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

oAnexoEstatus.InsertObservacion(iIdFuncionario, oAnexo2II.GetIdAnexo(), sEstatus, iIdUsuario, sFechaActual, "");
	if(!sCodigo.equals("")){
		if(sCodigo.equals("0")){
			if(!sFechaCorte.equals(""))
	    	oAnexoEstatus.UpdateObservacion(iIdFuncionario, oAnexo2II.GetIdAnexo(), sFechaCorte);
			oAnexo2II.Insert(iIdFuncionario, sDepartamento, sMontoTotal, sEfectivo, sComprobantes, sValesProvisionales, sOtros, sResponsableFondo);
			//PARA GUARDAR BITACORA
			oSeguridad.Bitacora(sUsuario, "Nuevo", "Anexo II.2", request.getRemoteAddr(), request.getRemoteHost(), request.getHeader("User-Agent"));
	    }else {
	  	oAnexo2II.Update(java.lang.Integer.parseInt(sCodigo), sDepartamento, sMontoTotal, sEfectivo, sComprobantes, sValesProvisionales, sOtros, sResponsableFondo);
		//PARA GUARDAR BITACORA
		oSeguridad.Bitacora(sUsuario, "Grabar", "Anexo II.2", request.getRemoteAddr(), request.getRemoteHost(), request.getHeader("User-Agent"));
		oAnexoEstatus.UpdateObservacion(iIdFuncionario, oAnexo2II.GetIdAnexo(), sFechaCorte);
	  	}
	}else{
	// PARA GUARDAR BITACORA
	oSeguridad.Bitacora(sUsuario, "Grabar", "Anexo II.2 Estatus", request.getRemoteAddr(), request.getRemoteHost(), request.getHeader("User-Agent"));	
	if(!sFechaCorte.equals(""))
	    	oAnexoEstatus.UpdateObservacion(iIdFuncionario, oAnexo2II.GetIdAnexo(), sFechaCorte);
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
	oSeguridad.Bitacora(sUsuario, "Grabar", "Anexo II.2 Detalle", request.getRemoteAddr(), request.getRemoteHost(), request.getHeader("User-Agent"));
	oAnexoEstatus.InsertObservacion(iIdFuncionario, oAnexo2II.GetIdAnexo(), sEstatus, iIdUsuario, sFechaActual, "");
	if(!sCodigo.equals("")){
   		oAnexoEstatus.UpdateObservacion(iIdFuncionario, oAnexo2II.GetIdAnexo(), sFechaCorte);
	}
	sOpt = "";
	sCodigo = "";
	sOpcion = "";
}


if(sOpcion.equals("STATUS")){
	oAnexoEstatus.InsertObservacion(iIdFuncionario, oAnexo2II.GetIdAnexo(), sEstatus, iIdUsuario, sFechaActual, "");
	
	if(!sFechaCorte.equals(""))
	    	oAnexoEstatus.UpdateObservacion(iIdFuncionario, oAnexo2II.GetIdAnexo(), sFechaCorte);


  	sCodigo = "";
	sOpcion = "";
}

if(sOpcion.equals("DEL")){
	// PARA GUARDAR BITACORA
	oSeguridad.Bitacora(sUsuario, "Elimina", "Anexo II.2", request.getRemoteAddr(), request.getRemoteHost(), request.getHeader("User-Agent"));
	
	oAnexo2II.Delete(java.lang.Integer.parseInt(sCodigo));
	if(oAnexo2II.GetAll(iIdFuncionario) == 0)
	oAnexoEstatus.UpdateObservacion(iIdFuncionario, oAnexo2II.GetIdAnexo(), sFechaCorte);
	sCodigo = "";
	sOpcion = "";
}%>

<html>
<head>
	<title>Entrega - Recepción : Anexo II.2 (Procesando...)</title>
</head>

<body>
<form action="fAnexo2II.jsp" name="forma" method="post" target="_parent">
	<input type="hidden" name="sOpcion" value="<%=sOpcion%>">
	<input type="hidden" name="sCodigo" value="<%=sCodigo%>">
	<input type="hidden" name="sOpt" value="<%=sOpt%>"> 
</form>
</body>
<script>
	 document.forma.submit();
</script>
</html>