<%/*********************************************************************************************************
Elaboro:	Claudia V. Sandoval Pardo
Lugar:		Monterrey, NL
Fecha:		25.Oct.2002
Compañia:	CONSISS*/
%><%

com.consiss.util.Utilerias oUtil = new com.consiss.util.Utilerias();

String sOpcion = request.getParameter("sOpcion")!= null ? request.getParameter("sOpcion"): "";
String sCodigo = request.getParameter("sCodigo")!= null ? request.getParameter("sCodigo"): "0";
String sMensaje = request.getParameter("sMensaje")!= null ? request.getParameter("sMensaje"): "";
String sFechaIni = request.getParameter("sFechaIni")!= null ? request.getParameter("sFechaIni"): "";
String sHoraIni = request.getParameter("sHoraIni")!= null ? request.getParameter("sHoraIni"): "";
String sFechaHoraIni = oUtil.sGetDateToNum(sFechaIni, "/") + sHoraIni;
String sFechaFin = request.getParameter("sFechaFin")!= null ? request.getParameter("sFechaFin"): "";
String sHoraFin = request.getParameter("sHoraFin")!= null ? request.getParameter("sHoraFin"): "";
String sFechaHoraFin = oUtil.sGetDateToNum(sFechaFin, "/") + sHoraFin;
com.gob.Alerta oAlerta = new com.gob.Alerta();

if(sOpcion.equals("SAVE")){
 	if(sCodigo.equals("0")){
		oAlerta.Insert(sMensaje, sFechaHoraIni, sFechaHoraFin);
	} else {
		oAlerta.Update(java.lang.Integer.parseInt(sCodigo), sMensaje, sFechaHoraIni, sFechaHoraFin);
	}
sCodigo = "";
sOpcion = "";
}
 %>

<html>
<head>
	<title>Entrega - Recepción : Alerta (Procesando...)</title>
</head>

<body>
<form action="fAlerta.jsp" name="forma" method="post" target="_parent">
	<input type="hidden" name="sOpcion" value="<%=sOpcion%>">
	<input type="hidden" name="sCodigo" value="<%=sCodigo%>">
	<input type="hidden" name="sMensaje" value="<%=sMensaje%>">
</form>
</body>
<script>
	document.forma.submit();
</script>
</html>
