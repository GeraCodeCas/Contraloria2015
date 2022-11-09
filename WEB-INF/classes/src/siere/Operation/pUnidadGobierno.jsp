<%/*********************************************************************************************************
Elaboro:	Claudia V. Sandoval Pardo
Lugar:		Monterrey, NL
Fecha:		28.Oct.2002
Compañia:	CONSISS*/%><%

String	sOpcion = request.getParameter("sOpcion")!= null ? request.getParameter("sOpcion"): "";
String	sCodigo = request.getParameter("sCodigo")!= null ? request.getParameter("sCodigo"): "0";
String	sMensage = "";

String	sNombre	= request.getParameter("sNombre")!= null ? request.getParameter("sNombre"): "";
String	sTipoUnidad	= request.getParameter("sTipoUnidad")!= null ? request.getParameter("sTipoUnidad"): "";

com.gob.UnidadGobierno oUnidadGobierno = new com.gob.UnidadGobierno();
	
if(sOpcion.equals("SAVE")){
	if(sCodigo.equals("0")){
		oUnidadGobierno.Insert(sNombre, sTipoUnidad);
	} else {
		oUnidadGobierno.Update(java.lang.Integer.parseInt(sCodigo), sNombre, sTipoUnidad);
	}
}

if(sOpcion.equals("DEL")){
	if(! oUnidadGobierno.Delete(java.lang.Integer.parseInt(sCodigo)) ){
		sMensage = "No se puede eliminar la Dependencia, Organismo o Tribunal porque tiene información asignada";
	}
	sCodigo = "";
	sOpcion = "";
}%>

<html>
<head>
	<title>Entrega - Recepción : Dependencias, Organismos o Tribunales (Procesando...)</title>
</head>

<body>
<form action="fUnidadGobierno.jsp" name="forma" method="post" target="_parent">
	<input type="hidden" name="sOpcion" value="<%=sOpcion%>">
	<input type="hidden" name="sCodigo" value="<%=sCodigo%>"> 
	<input type="hidden" name="sMensage" value="<%=sMensage%>">
</form>
</body>
<script>
	document.forma.submit();
</script>
</html>
