<%
response.setHeader("Cache-Control","no-cache");
response.setHeader("Pragma","no-cache");
response.setDateHeader ("Expires", -1);
 %>
<%@page import="com.consiss.util.*"%>
<%@page import="java.util.*" %>
<html>
<head>
	<title>Entrega - Recepción : Anexo I.1 (Procesando...)</title>
</head>
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
String 	sFechaActual= "";
// sCodigo = IdRenglon
String	sLey		= request.getParameter("sLey")!= null ? request.getParameter("sLey"): "";
String	sNombre		= request.getParameter("sNombre")!= null ? request.getParameter("sNombre"): "";
String	sObjetivoGeneral		= request.getParameter("sObjetivoGeneral")!= null ? request.getParameter("sObjetivoGeneral"): "";
String	sFideicomitente		= request.getParameter("sFideicomitente")!= null ? request.getParameter("sFideicomitente"): "";
String	sFiduciario		= request.getParameter("sFiduciario")!= null ? request.getParameter("sFiduciario"): "";
String	sFideicomisario		= request.getParameter("sFideicomisario")!= null ? request.getParameter("sFideicomisario"): "";
String	sFechaCreacion		= request.getParameter("sFechaCreacion")!= null ? request.getParameter("sFechaCreacion"): "";
String	sFechaPublicacion		= request.getParameter("sFechaPublicacion")!= null ? request.getParameter("sFechaPublicacion"): "";
String	sPeriodicoOficial		= request.getParameter("sPeriodicoOficial")!= null ? request.getParameter("sPeriodicoOficial"): "";
String	sIntegracion		= request.getParameter("sIntegracion")!= null ? request.getParameter("sIntegracion"): "";
String	sActasSesion		= request.getParameter("sActasSesion")!= null ? request.getParameter("sActasSesion"): "";

com.gob.Anexo1I oAnexo1I = new com.gob.Anexo1I();
com.gob.DetalleAnexo1I oDetalleAnexo1I = new com.gob.DetalleAnexo1I();
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
	
	oAnexoEstatus.Insert(iIdFuncionario, oAnexo1I.GetIdAnexo(), sEstatus, iIdUsuario, sFechaActual, "");
	if(!sCodigo.equals("")){
		if(sCodigo.equals("0")){
			if (oAnexo1I.GetAll(iIdFuncionario) == 0  ){
			    if(oDetalleAnexo1I.Get(iIdFuncionario)){
	    	 	    oDetalleAnexo1I.Update(iIdFuncionario, sIntegracion, sActasSesion);
			    }else{
					oDetalleAnexo1I.Insert(iIdFuncionario, sIntegracion, sActasSesion);
		        }
				 
			}else{
				if(oDetalleAnexo1I.Get(iIdFuncionario)){
	    	 	    oDetalleAnexo1I.Update(iIdFuncionario, sIntegracion, sActasSesion);
			    }else{
					oDetalleAnexo1I.Insert(iIdFuncionario, sIntegracion, sActasSesion);
				}  
					  
			}
		  	oAnexo1I.Insert(iIdFuncionario, sLey, sNombre, sObjetivoGeneral, sFideicomitente, sFiduciario, sFideicomisario, sFechaCreacion, sFechaPublicacion, sPeriodicoOficial);
			// PARA GUARDAR BITACORA
			oSeguridad.Bitacora(sUsuario, "Nuevo", "Anexo I.1", request.getRemoteAddr(), request.getRemoteHost(), request.getHeader("User-Agent"));
		}else {
			oAnexo1I.Update(java.lang.Integer.parseInt(sCodigo), sLey, sNombre, sObjetivoGeneral, sFideicomitente, sFiduciario, sFideicomisario, sFechaCreacion, sFechaPublicacion, sPeriodicoOficial);
			// PARA GUARDAR BITACORA
			oSeguridad.Bitacora(sUsuario, "Grabar", "Anexo I.1", request.getRemoteAddr(), request.getRemoteHost(), request.getHeader("User-Agent"));
		}
	} else {
	// PARA GUARDAR BITACORA
	oSeguridad.Bitacora(sUsuario, "Grabar", "Anexo I.1 Estatus", request.getRemoteAddr(), request.getRemoteHost(), request.getHeader("User-Agent"));
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
	oSeguridad.Bitacora(sUsuario, "Grabar", "Anexo I.1 Detalle", request.getRemoteAddr(), request.getRemoteHost(), request.getHeader("User-Agent"));
	
   oAnexoEstatus.Insert(iIdFuncionario, oAnexo1I.GetIdAnexo(), sEstatus, iIdUsuario, sFechaActual, "");
	 if(!sCodigo.equals("")){
   if (oDetalleAnexo1I.Get(iIdFuncionario)){
     oDetalleAnexo1I.Update(iIdFuncionario, sIntegracion, sActasSesion);
	 }else{
	   oDetalleAnexo1I.Insert(iIdFuncionario, sIntegracion, sActasSesion);
	 }
	 }
sCodigo = "";
sOpcion = "";
}


if(sOpcion.equals("DEL")){
	// PARA GUARDAR BITACORA
	oSeguridad.Bitacora(sUsuario, "Elimina", "Anexo I.1", request.getRemoteAddr(), request.getRemoteHost(), request.getHeader("User-Agent"));
	oAnexo1I.Delete(java.lang.Integer.parseInt(sCodigo));
	if(oAnexo1I.GetAll(iIdFuncionario) == 0)
	oDetalleAnexo1I.Delete(iIdFuncionario);
sCodigo = "";
sOpcion = "";
}

oSeguridad = null;
%>
<body>
<form action="fAnexo1I.jsp" name="forma" method="post" target="_parent">
	<input type="hidden" name="sOpcion" value="<%=sOpcion%>">
	<input type="hidden" name="sCodigo" value="<%=sCodigo%>">
	<input type="hidden" name="sOpt" value="<%=sOpt%>"> 
</form>
</body>
<script>
	document.forma.submit();
</script>
</html>