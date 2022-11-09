<%
response.setHeader("Cache-Control","no-cache");
response.setHeader("Pragma","no-cache");
response.setDateHeader ("Expires", -1);
 %>
 <%@page import="com.consiss.util.*"%>
<%@page import="com.gob.*"%>
<%@page import="java.util.*" %>
<%/*********************************************************************************************************
Elaboro:	Claudia V. Sandoval Pardo
Lugar:		Monterrey, NL
Fecha:		01.Nov.2002
Compañia:	CONSISS*/%>
<html>
<head>
	<title>Entrega - Recepción : Asigna Anexos (Procesando...)</title>
</head>
<body>
<%
// PARA GUARDAR BITACORA, SE LEE USUARIO
Seguridad	oSeguridad;
String sUsuario	= ((session.getValue("sUsuario")!= null?(String)session.getValue("sUsuario"):""));
oSeguridad = new Seguridad();

String	sOpcion = request.getParameter("sOpcion")!= null ? request.getParameter("sOpcion"): "";
int iIdFuncionario =  java.lang.Integer.parseInt(
		(String)(session.getValue("iIdFuncionario")!= null?session.getValue("iIdFuncionario"):"0") );
com.gob.UsuarioAnexo	 oAnexo		= new com.gob.UsuarioAnexo();
String idUsuario, idUsuarioAnt;
for(int i=0;i<oAnexo.GetAll(iIdFuncionario).getNumRows();i++){
	idUsuarioAnt = request.getParameter("sIdUsuarioAnt" + oAnexo.GetIdAnexo(i));
	idUsuario = request.getParameter("sIdUsuario" + oAnexo.GetIdAnexo(i));
	//out.println(oAnexo.GetIdAnexo(i) + " - idUsuarioAnt: " + idUsuarioAnt + " - idUsuario :" + idUsuario + "<br>");
	//out.println(idUsuarioAnt + " " + idUsuario+"<br>");
	if(!(idUsuarioAnt+"").equals(idUsuario+"")){
		oAnexo.Save(oAnexo.GetIdAnexo(i)+"", iIdFuncionario+"", idUsuario, idUsuarioAnt);
		// PARA GUARDAR BITACORA
		oSeguridad.Bitacora(sUsuario, "Grabar", "Asigna Anexo Usuario Limitado", request.getRemoteAddr(), request.getRemoteHost(), request.getHeader("User-Agent"));
	}
}
%>

<form action="fAsignaAnexos.jsp" name="forma" method="post" target="_parent">
	<input type="hidden" name="sOpcion" value="<%=sOpcion%>">
</form>
</body>
<script>
	document.forma.submit();
</script>
</html>
