<%
response.setHeader("Cache-Control","no-cache");
response.setHeader("Pragma","no-cache");
response.setDateHeader ("Expires", -1);
 %>
<%@page import="com.consiss.util.*"%>
<%@page import="java.util.*" %>
<html>
<head>
	<title>Entrega - Recepción : Anexo II.4.1 (Procesando...)</title>
</head>
<body>
<%/*********************************************************************************************************
Elaboro:	Julio Enrique Espinosa Torres
Lugar:		Monterrey, NL
Fecha:		29.Oct.2002
Compañia:	CONSISS*/
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

String	sNoCuenta		= request.getParameter("sNoCuenta")!= null ? request.getParameter("sNoCuenta"): "";
String	sNombre		= request.getParameter("sNombre")!= null ? request.getParameter("sNombre"): "";
String	sChequera		= request.getParameter("sChequera")!= null ? request.getParameter("sChequera"): "";
String	sBanco		= request.getParameter("sBanco")!= null ? request.getParameter("sBanco"): "";
String	sInicial		= request.getParameter("sInicial")!= null ? request.getParameter("sInicial"): "";
String	sFinal		= request.getParameter("sFinal")!= null ? request.getParameter("sFinal"): "";
String	sNumero		= request.getParameter("sNumero")!= null ? request.getParameter("sNumero"): "";
String	sFecha		= request.getParameter("sFecha")!= null ? request.getParameter("sFecha"): "";
String	sImporte		= request.getParameter("sImporte")!= null ? request.getParameter("sImporte"): "";
String	sNombreFirma		= request.getParameter("sNombreFirma")!= null ? request.getParameter("sNombreFirma"): "";
String	sCargo		= request.getParameter("sCargo")!= null ? request.getParameter("sCargo"): "";
String	sChequesSinEntregar		= request.getParameter("sChequesSinEntregar")!= null ? request.getParameter("sChequesSinEntregar"): "";

com.gob.Anexo2IV1 oAnexo2IV1 = new com.gob.Anexo2IV1();
com.gob.DetalleAnexo2IV1 oDetalleAnexo2IV1 = new com.gob.DetalleAnexo2IV1();
com.gob.AnexoEstatus 	oAnexoEstatus 	= new com.gob.AnexoEstatus();
Utilerias		oUtil			= new Utilerias();
sFechaActual = oUtil.sGetDateToNum(oUtil.sGetDate(oUtil.GetFecha(), "dd/MM/yyyy"), "/");

// PARA GUARDAR BITACORA, SE LEE USUARIO
Seguridad	oSeguridad;
String sUsuario	= ((session.getValue("sUsuario")!= null?(String)session.getValue("sUsuario"):""));
oSeguridad = new Seguridad();

if(sOpcion.equals("NORMAL")){ sCodigo = ""; }

if(sOpcion.equals(""))
	oAnexoEstatus.Insert(iIdFuncionario, oAnexo2IV1.GetIdAnexo(), sEstatus, iIdUsuario, sFechaActual, sChequesSinEntregar);

if(sOpcion.equals("SAVE")){
	// CAMBIO DE ENTREGA DE ESTATUS
	com.gob.EntregaEstatus 	oEntregaEstatus 	= new com.gob.EntregaEstatus();
	String sEstatusEntrega	= ((session.getValue("sEstatusEntrega")!= null?(String)session.getValue("sEstatusEntrega"):""));
	if(sEstatusEntrega.equals(oEntregaEstatus.GetEstatusSinInformacion())) {
		oEntregaEstatus.Insert(iIdFuncionario, oEntregaEstatus.GetEstatusNoIniciada(), oUtil.sGetDate(oUtil.GetFecha(), "yyyyMMddHHmmss"), "Entrega No Iniciada. Inicia Captura Diaria de Información");
		session.putValue("sEstatusEntrega",	oEntregaEstatus.GetEstatusNoIniciada()+"");		}

	oAnexoEstatus.InsertObservacion(iIdFuncionario, oAnexo2IV1.GetIdAnexo(), sEstatus, iIdUsuario, sFechaActual, sChequesSinEntregar);
	if(!sCodigo.equals("")){
		if(sCodigo.equals("0")){
			if(!sChequesSinEntregar.equals(""))
			oAnexoEstatus.UpdateObservacion(iIdFuncionario, oAnexo2IV1.GetIdAnexo(), sChequesSinEntregar);
			oAnexo2IV1.Insert(iIdFuncionario, sNoCuenta, sNombre, sChequera, sBanco, sInicial, sFinal, sNumero, sFecha, sImporte);
			// PARA GUARDAR BITACORA
			oSeguridad.Bitacora(sUsuario, "Nuevo", "Anexo II.4.1", request.getRemoteAddr(), request.getRemoteHost(), request.getHeader("User-Agent"));
		}else{
			oAnexo2IV1.Update(java.lang.Integer.parseInt(sCodigo), sNoCuenta, sNombre, sChequera, sBanco, sInicial, sFinal, sNumero, sFecha, sImporte);
			oAnexoEstatus.UpdateObservacion(iIdFuncionario, oAnexo2IV1.GetIdAnexo(), sChequesSinEntregar);
			// PARA GUARDAR BITACORA
			oSeguridad.Bitacora(sUsuario, "Grabar", "Anexo II.4.1", request.getRemoteAddr(), request.getRemoteHost(), request.getHeader("User-Agent"));
	    }
	}else{
		// PARA GUARDAR BITACORA
		oSeguridad.Bitacora(sUsuario, "Grabar", "Anexo II.4.1 Estatus", request.getRemoteAddr(), request.getRemoteHost(), request.getHeader("User-Agent"));	
	}
sCodigo = "";
sOpcion = "";
sOpt = "0";
}			 

if(sOpcion.equals("SAVEDETALLE")){
	// CAMBIO DE ENTREGA DE ESTATUS
	com.gob.EntregaEstatus 	oEntregaEstatus 	= new com.gob.EntregaEstatus();
	String sEstatusEntrega	= ((session.getValue("sEstatusEntrega")!= null?(String)session.getValue("sEstatusEntrega"):""));
	if(sEstatusEntrega.equals(oEntregaEstatus.GetEstatusSinInformacion())) {
		oEntregaEstatus.Insert(iIdFuncionario, oEntregaEstatus.GetEstatusNoIniciada(), oUtil.sGetDate(oUtil.GetFecha(), "yyyyMMddHHmmss"), "Entrega No Iniciada. Inicia Captura Diaria de Información");
		session.putValue("sEstatusEntrega",	oEntregaEstatus.GetEstatusNoIniciada()+"");		}

	// PARA GUARDAR BITACORA
	oSeguridad.Bitacora(sUsuario, "Grabar", "Anexo II.4.1 Detalle", request.getRemoteAddr(), request.getRemoteHost(), request.getHeader("User-Agent"));
			 oAnexoEstatus.InsertObservacion(iIdFuncionario, oAnexo2IV1.GetIdAnexo(), sEstatus, iIdUsuario, sFechaActual, "");
			 if(!sCodigo.equals("")){
	           if(sCodigo.equals("0")){
			            if(!sChequesSinEntregar.equals(""))
			            oAnexoEstatus.UpdateObservacion(iIdFuncionario, oAnexo2IV1.GetIdAnexo(), sChequesSinEntregar);
					    oDetalleAnexo2IV1.Insert(iIdFuncionario, sNombreFirma, sCargo);
					}else{
					    oDetalleAnexo2IV1.Update(java.lang.Integer.parseInt(sCodigo), sNombreFirma, sCargo);	 
						oAnexoEstatus.UpdateObservacion(iIdFuncionario, oAnexo2IV1.GetIdAnexo(), sChequesSinEntregar);
	 	      }
			  }
sCodigo = "";
sOpcion = "";
sOpt = "0";
}


if(sOpcion.equals("SAVEDETALLE3")){
	// CAMBIO DE ENTREGA DE ESTATUS
	com.gob.EntregaEstatus 	oEntregaEstatus 	= new com.gob.EntregaEstatus();
	String sEstatusEntrega	= ((session.getValue("sEstatusEntrega")!= null?(String)session.getValue("sEstatusEntrega"):""));
	if(sEstatusEntrega.equals(oEntregaEstatus.GetEstatusSinInformacion())) {
		oEntregaEstatus.Insert(iIdFuncionario, oEntregaEstatus.GetEstatusNoIniciada(), oUtil.sGetDate(oUtil.GetFecha(), "yyyyMMddHHmmss"), "Entrega No Iniciada. Inicia Captura Diaria de Información");
		session.putValue("sEstatusEntrega",	oEntregaEstatus.GetEstatusNoIniciada()+"");		}

	// PARA GUARDAR BITACORA
	oSeguridad.Bitacora(sUsuario, "Grabar", "Anexo II.4.1 Detalle Firmas", request.getRemoteAddr(), request.getRemoteHost(), request.getHeader("User-Agent"));
	oAnexoEstatus.InsertObservacion(iIdFuncionario, oAnexo2IV1.GetIdAnexo(), sEstatus, iIdUsuario, sFechaActual, "");
	if(!sCodigo.equals("")){
        oAnexoEstatus.UpdateObservacion(iIdFuncionario, oAnexo2IV1.GetIdAnexo(), sChequesSinEntregar);
  	 }
	 sCodigo = "";
	 sOpcion = "";
	 sOpt = "0";
}

if(sOpcion.equals("DEL")){
	// PARA GUARDAR BITACORA
	oSeguridad.Bitacora(sUsuario, "Elimina", "Anexo II.4.1", request.getRemoteAddr(), request.getRemoteHost(), request.getHeader("User-Agent"));
	oAnexo2IV1.Delete(java.lang.Integer.parseInt(sCodigo));
sCodigo = "";
sOpcion = "";
sOpt = "0";
}

if(sOpcion.equals("STATUS")){
  oAnexoEstatus.InsertObservacion(iIdFuncionario, oAnexo2IV1.GetIdAnexo(), sEstatus, iIdUsuario, sFechaActual, "");
  sCodigo = "";
	sOpcion = "";
	sOpt = "0";
}
	
if(sOpcion.equals("DELDETALLE")){
// PARA GUARDAR BITACORA
oSeguridad.Bitacora(sUsuario, "Elimina", "Anexo II.4.1 Detalle Firmas", request.getRemoteAddr(), request.getRemoteHost(), request.getHeader("User-Agent"));
oDetalleAnexo2IV1.Delete(java.lang.Integer.parseInt(sCodigo));
sCodigo = "";
sOpcion = "";
sOpt = "0";
}

if(sOpcion.equals("DELALL")){
	// PARA GUARDAR BITACORA
	oSeguridad.Bitacora(sUsuario, "Elimina", "Anexo II.4.1 Contenido", request.getRemoteAddr(), request.getRemoteHost(), request.getHeader("User-Agent"));
	oAnexo2IV1.DeleteAll(iIdFuncionario);
sCodigo = "";
sOpcion = "";
}
if(sOpcion.equals("UNDO")){
	// PARA GUARDAR BITACORA
	oSeguridad.Bitacora(sUsuario, "DeshaceCarga", "Anexo II.4.1", request.getRemoteAddr(), request.getRemoteHost(), request.getHeader("User-Agent"));
	oAnexo2IV1.Undo(iIdFuncionario);
sCodigo = "";
sOpcion = "";
}
%>
<form action="fAnexo2IV1.jsp" name="forma" method="post" target="_parent">
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