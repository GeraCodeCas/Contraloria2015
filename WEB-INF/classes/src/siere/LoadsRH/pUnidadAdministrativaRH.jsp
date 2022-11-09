<%/*********************************************************************************************************
Elaboro:	Claudia V. Sandoval Pardo
Lugar:		Monterrey, NL
Fecha:		28.Oct.2002
Compañia:	CONSISS*/%><%

String	sOpcion = request.getParameter("sOpcion")!= null ? request.getParameter("sOpcion"): "";
String	sCodigo = request.getParameter("sCodigo")!= null ? request.getParameter("sCodigo"): "0";
String	iIdUnidadGobierno = request.getParameter("iIdUnidadGobierno")!= null ? request.getParameter("iIdUnidadGobierno"): "-1";
String	sMensage = "";

String	sNombre			= request.getParameter("sNombre")!= null ? request.getParameter("sNombre"): "";
String	sIdUnidadGobierno = request.getParameter("sIdUnidadGobierno")!= null ? request.getParameter("sIdUnidadGobierno"): "0";
String	sDireccion		= request.getParameter("sDireccion")!= null ? request.getParameter("sDireccion"): "";
String	sIdMunicipio	= request.getParameter("sIdMunicipio")!= null ? request.getParameter("sIdMunicipio"): "";
String	sClave			= request.getParameter("sClave")!= null ? request.getParameter("sClave"): "";

com.gob.UnidadAdministrativa oUnidadAdministrativa = new com.gob.UnidadAdministrativa();
	
if(sOpcion.equals("SAVE")){
	if(sCodigo.equals("0")){
		oUnidadAdministrativa.Insert(sNombre, java.lang.Integer.parseInt(sIdUnidadGobierno), sDireccion, java.lang.Integer.parseInt(sIdMunicipio), sClave);
	} else {
		oUnidadAdministrativa.Update(java.lang.Integer.parseInt(sCodigo), sNombre, java.lang.Integer.parseInt(sIdUnidadGobierno), sDireccion, java.lang.Integer.parseInt(sIdMunicipio), sClave);
	}
}

if(sOpcion.equals("DEL")){
	if(! oUnidadAdministrativa.Delete(java.lang.Integer.parseInt(sCodigo)) ){
		sMensage = "No se puede eliminar la Unidad Administrativa porque tiene información asignada";
	}
	sCodigo = "";
	sOpcion = "";
}%>

<html>
<head>
	<title>Entrega - Recepción : Unidades Administrativas (Procesando...)</title>
</head>

<body>
<form action="fUnidadAdministrativaRH.jsp" name="forma" method="post" target="_parent">
	<input type="hidden" name="sOpcion" value="<%=sOpcion%>">
	<input type="hidden" name="sCodigo" value="<%=sCodigo%>">
	<input type="hidden" name="sMensage" value="<%=sMensage%>">
	<input type="hidden" name="iIdUnidadGobierno" value="<%=iIdUnidadGobierno%>"> 
</form>
</body>
<script>
	document.forma.submit();
</script>
</html>
