<%/*********************************************************************************************************
Elaboro:	Julio Enrique Espinosa Torres
Lugar:		Monterrey, NL
Fecha:		28.Oct.2002
Compañia:	CONSISS*/%>
<%
//int iIdFuncionario =  java.lang.Integer.parseInt(
//		(String)(session.getValue("iIdFuncionario")!= null?session.getValue("iIdFuncionario"):"0") );
int	iIdFuncionario = java.lang.Integer.parseInt(
			request.getParameter("iIdFuncionario")!= null ? request.getParameter("iIdFuncionario"): "0");
int	iTipoActa = java.lang.Integer.parseInt(
			request.getParameter("iTipoActa")!= null ? request.getParameter("iTipoActa"): "0");
String sObservaciones = request.getParameter("sObservaciones")!= null ? request.getParameter("sObservaciones"): "";

String	sUnidadGobierno	= request.getParameter("sUnidadGobierno")!= null ? request.getParameter("sUnidadGobierno"): "";
String	sCiudad	= request.getParameter("sCiudad")!= null ? request.getParameter("sCiudad"): "";
String	sHora	= request.getParameter("sHora")!= null ? request.getParameter("sHora"): "";
int		dFechaActa	= java.lang.Integer.parseInt(request.getParameter("sFechaActa")!= null ? request.getParameter("sFechaActa"): "0");

String	sDireccion			= request.getParameter("sDireccion")!= null ? request.getParameter("sDireccion"): "";
String	sNombreCargo		= request.getParameter("sNombreCargo")!= null ? request.getParameter("sNombreCargo"): "";
String	sResponsableOrgano	= request.getParameter("sResponsableOrgano")!= null ? request.getParameter("sResponsableOrgano"): "";
String	sResponsableCoordinacion= request.getParameter("sResponsableCoordinacion")!= null ? request.getParameter("sResponsableCoordinacion"): "";
String	sNombreEntrega		= request.getParameter("sNombreEntrega")!= null ? request.getParameter("sNombreEntrega"): "";
String	sTestigoEntrega		= request.getParameter("sTestigoEntrega")!= null ? request.getParameter("sTestigoEntrega"): "";
String	sUnidadTestigoEntrega	= request.getParameter("sUnidadTestigoEntrega")!= null ? request.getParameter("sUnidadTestigoEntrega"): "";
String	sPuestoTestigoEntrega	= request.getParameter("sPuestoTestigoEntrega")!= null ? request.getParameter("sPuestoTestigoEntrega"): "";
String	sDireccionTestigoEntrega= request.getParameter("sDireccionTestigoEntrega")!= null ? request.getParameter("sDireccionTestigoEntrega"): "";
String	sNombreRecibe		= request.getParameter("sNombreRecibe")!= null ? request.getParameter("sNombreRecibe"): "";
String	sTestigoRecibe		= request.getParameter("sTestigoRecibe")!= null ? request.getParameter("sTestigoRecibe"): "";
String	sUnidadTestigoRecibe	= request.getParameter("sUnidadTestigoRecibe")!= null ? request.getParameter("sUnidadTestigoRecibe"): "";
String	sPuestoTestigoRecibe	= request.getParameter("sPuestoTestigoRecibe")!= null ? request.getParameter("sPuestoTestigoRecibe"): "";
String	sDireccionTestigoRecibe	= request.getParameter("sDireccionTestigoRecibe")!= null ? request.getParameter("sDireccionTestigoRecibe"): "";
String	sResponsableSecretaria	= request.getParameter("sResponsableSecretaria")!= null ? request.getParameter("sResponsableSecretaria"): "";
String	sPuestoRepresentante	= request.getParameter("sPuestoRepresentante")!= null ? request.getParameter("sPuestoRepresentante"): "";
String	sNombreExpide			= request.getParameter("sNombreExpide")!= null ? request.getParameter("sNombreExpide"): "";
String	sPuestoExpide			= request.getParameter("sPuestoExpide")!= null ? request.getParameter("sPuestoExpide"): "";
			
int		dFechaEntrante		= java.lang.Integer.parseInt(request.getParameter("sFechaEntrante")!= null && !(request.getParameter("sFechaEntrante")+"").equals("") ? request.getParameter("sFechaEntrante"): "0");
int		dFechaFirma			= java.lang.Integer.parseInt(request.getParameter("sFechaFirma")!= null && !(request.getParameter("sFechaFirma")+"").equals("") ? request.getParameter("sFechaFirma"): "0");
String	sHoraConclusionActa	= request.getParameter("sHoraConclusionActa")!= null ? request.getParameter("sHoraConclusionActa"): "";

com.gob.Acta oActa = new com.gob.Acta();
	
if(oActa.Get(iIdFuncionario)){
	oActa.Update(iIdFuncionario, sUnidadGobierno, sCiudad, sHora, dFechaActa, sDireccion, sNombreEntrega, 
			sNombreRecibe, sNombreCargo, dFechaEntrante, sTestigoEntrega, sTestigoRecibe, sUnidadTestigoEntrega, 
			sUnidadTestigoRecibe, sPuestoTestigoEntrega, sPuestoTestigoRecibe,sDireccionTestigoEntrega, 
			sDireccionTestigoRecibe, sResponsableOrgano, sResponsableCoordinacion,sResponsableSecretaria, 
			sPuestoRepresentante, sHoraConclusionActa, dFechaFirma , iTipoActa, sNombreExpide, sPuestoExpide, sObservaciones);
}else{
	oActa.Insert(iIdFuncionario, sUnidadGobierno, sCiudad, sHora, dFechaActa, sDireccion, sNombreEntrega, 
			sNombreRecibe, sNombreCargo, dFechaEntrante, sTestigoEntrega, sTestigoRecibe, sUnidadTestigoEntrega, 
			sUnidadTestigoRecibe, sPuestoTestigoEntrega, sPuestoTestigoRecibe, sDireccionTestigoEntrega, 
			sDireccionTestigoRecibe, sResponsableOrgano, sResponsableCoordinacion, sResponsableSecretaria, 
			sPuestoRepresentante, sHoraConclusionActa, dFechaFirma, iTipoActa, sNombreExpide, sPuestoExpide, sObservaciones);
}
%>

<html>
<head>
	<title>Entrega - Recepción : Acta Administrativa (Procesando...)</title>
</head>

<body>
<form action="rActa.jsp" name="forma" method="post">
	<input type="hidden" name="iIdFuncionario" id="iIdFuncionario" value="<%=iIdFuncionario%>">
</form>
</body>
<script>document.forma.submit();</script>
</html>
