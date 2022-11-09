<%/*********************************************************************************************************
Elaboro:	Claudia V. Sandoval Pardo
Lugar:		Monterrey, NL
Fecha:		25.Oct.2002
Compañia:	CONSISS*/%><%

String	sOpcion = request.getParameter("sOpcion")!= null ? request.getParameter("sOpcion"): "";
String	sCodigo = request.getParameter("sCodigo")!= null ? request.getParameter("sCodigo"): "0";

String	sNombre	= request.getParameter("sNombre")!= null ? request.getParameter("sNombre"): "";
String	sMensage = "";

com.gob.Municipio oMunicipio = new com.gob.Municipio();
	
if(sOpcion.equals("SAVE")){
	if(sCodigo.equals("0")){
		oMunicipio.Insert(sNombre);
	} else {
		oMunicipio.Update(java.lang.Integer.parseInt(sCodigo), sNombre);
	}
}

if(sOpcion.equals("DEL")){
	if(! oMunicipio.Delete(java.lang.Integer.parseInt(sCodigo)) ){
		sMensage = "No se puede eliminar el Municipio porque tiene información asignada";
	}
sCodigo = "";
sOpcion = "";
}
 %>

<html>
<head>
	<title>Entrega - Recepción : Municipios (Procesando...)</title>
</head>

<body>
<form action="fMunicipio.jsp" name="forma" method="post" target="_parent">
	<input type="hidden" name="sOpcion" value="<%=sOpcion%>">
	<input type="hidden" name="sCodigo" value="<%=sCodigo%>">
	<input type="hidden" name="sMensage" value="<%=sMensage%>">
</form>
</body>
<script>
	document.forma.submit();
</script>
</html>
