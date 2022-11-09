<%/*********************************************************************************************************
Elaboro:	Julio Enrique Espinosa Torres
Lugar:		Monterrey, NL
Fecha:		25.Oct.2002
Compañia:	CONSISS*/%><%

String	sOpcion = request.getParameter("sOpcion")!= null ? request.getParameter("sOpcion"): "";
String	sCodigo = request.getParameter("sCodigo")!= null ? request.getParameter("sCodigo"): "0";
String	iIdUnidadGobierno = request.getParameter("iIdUnidadGobierno")!= null ? request.getParameter("iIdUnidadGobierno"): "-1";

String	sIdUnidadAdministrativa = request.getParameter("sIdUnidadAdministrativa")!= null ? request.getParameter("sIdUnidadAdministrativa"): "0";
String	sNombre		= request.getParameter("sNombre")!= null ? request.getParameter("sNombre"): "";
String	sMensage	= "";

com.gob.Cargo oCargo = new com.gob.Cargo();
	
if(sOpcion.equals("SAVE")){
	if(sCodigo.equals("0")){
		oCargo.Insert(java.lang.Integer.parseInt(sIdUnidadAdministrativa), sNombre);
	} else {
		oCargo.Update(java.lang.Integer.parseInt(sCodigo), java.lang.Integer.parseInt(sIdUnidadAdministrativa), sNombre);
	}
}

if(sOpcion.equals("DEL")){
	if(! oCargo.Delete(java.lang.Integer.parseInt(sCodigo)) ){
		sMensage = "No se puede eliminar el Cargo porque tiene información asignada";
	}
	sCodigo = "";
	sOpcion = "";
}%>

<html>
<head>
	<title>Entrega - Recepción : Puesto o Cargo (Procesando...)</title>
</head>

<body>
<form action="fCargo.jsp" name="forma" method="post" target="_parent">
	<input type="hidden" name="sOpcion" value="<%=sOpcion%>">
	<input type="hidden" name="sCodigo" value="<%=sCodigo%>"> 
	<input type="hidden" name="iIdUnidadGobierno" value="<%=iIdUnidadGobierno%>"> 
	<input type="hidden" name="sMensage" value="<%=sMensage%>">
</form>
</body>
<script>
	document.forma.submit();
</script>
</html>