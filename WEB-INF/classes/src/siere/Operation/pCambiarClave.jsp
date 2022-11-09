<%/*********************************************************************************************************
Elaboro:	Claudia V. Sandoval Pardo
Lugar:		Monterrey, NL
Fecha:		01.Nov.2002
Compañia:	CONSISS*/%>
<html>
<head>
	<title>Entrega - Recepción : Cambia Clave de Sistema (Procesando...)</title>
</head>

<body>
<%
response.setHeader("Cache-Control","no-cache");
response.setHeader("Pragma","no-cache");
response.setDateHeader ("Expires", -1);

String	sOpcion 		= request.getParameter("sOpcion")!= null 		? request.getParameter("sOpcion"): "";

String	sClaveActual 	= request.getParameter("sClaveActual")!= null 	? request.getParameter("sClaveActual"): "";
String	sClaveNueva 	= request.getParameter("sClaveNueva")!= null 	? request.getParameter("sClaveNueva"): "";
String	sConfirmaClave 	= request.getParameter("sConfirmaClave")!= null ? request.getParameter("sConfirmaClave"): "";
String	sMensage		= "";
int iIdUsuario =  java.lang.Integer.parseInt(
		(String)(session.getValue("iIdUsuario")!= null?session.getValue("iIdUsuario"):"0") );

com.gob.Usuario	 oUsuario		= new com.gob.Usuario();

if(sOpcion.equals("SAVE")){
	if (oUsuario.Get(iIdUsuario)) {
		//out.println(oUsuario.GetClave() + " " + sClaveActual + "<br>");
		//out.println(oUsuario.GetClave().equals(sClaveActual));
		if (oUsuario.GetClave().equals(sClaveActual)) {
			oUsuario.SetClave(sClaveNueva);
			oUsuario.Update();
			sMensage = "La Clave ha sido Actualizada";
		} else {
			sMensage = "La Clave Actual es incorrecta, por favor vuelva a intentarlo";
		}
	}
}
%>

<form action="fCambiarClave.jsp" name="forma" method="post" target="_parent">
	<input type="hidden" name="sOpcion" value="<%=sOpcion%>">
	<input type="hidden" name="sMensage" value="<%=sMensage%>"> 
</form>
</body>
<script>
	document.forma.submit();
</script>
</html>
