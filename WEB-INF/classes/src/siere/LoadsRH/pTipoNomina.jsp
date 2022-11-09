<%/*********************************************************************************************************
Elaboro:	Claudia V. Sandoval Pardo
Lugar:		Monterrey, NL
Fecha:		29.May.2003
Compañia:	CONSISS*/%>
<html>
<head>
<%

String	sOpcion = request.getParameter("sOpcion")!= null ? request.getParameter("sOpcion"): "";
String	sCodigo = request.getParameter("sCodigo")!= null ? request.getParameter("sCodigo"): "0";

String	sClave = request.getParameter("sClave")!= null ? request.getParameter("sClave"): "";
String	sDescripcion = request.getParameter("sDescripcion")!= null ? request.getParameter("sDescripcion"): "";
String	sMensage = "";

com.gob.TipoNomina	oTipoNomina = new com.gob.TipoNomina();

if(sOpcion.equals("SAVE")){
	if(sCodigo.equals("0")){
		oTipoNomina.Insert(sClave, sDescripcion);
	} else {
		oTipoNomina.Update(java.lang.Integer.parseInt(sCodigo), sClave, sDescripcion);
	}
}

if(sOpcion.equals("DEL")){
	if(! oTipoNomina.Delete(java.lang.Integer.parseInt(sCodigo)) ){
		sMensage = "No se puede eliminar el Tipo de Nómina porque tiene información asignada";
	}
sCodigo = "";
sOpcion = "";
}
%>
	<title>Entrega - Recepción : Tipo de Nómina (Procesando...)</title>
</head>

<body>
<form action="fTipoNomina.jsp" name="forma" method="post" target="_parent">
	<input type="hidden" name="sOpcion" value="<%=sOpcion%>">
	<input type="hidden" name="sCodigo" value="<%=sCodigo%>">
	<input type="hidden" name="sMensage" value="<%=sMensage%>">
</form>
</body>
<script language="JavaScript">
	document.forma.submit();
</script>
</html>
