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

String	sNombre = request.getParameter("sNombre")!= null ? request.getParameter("sNombre"): "";
String	sApePaterno = request.getParameter("sApePaterno")!= null ? request.getParameter("sApePaterno"): "";
String	sApeMaterno = request.getParameter("sApeMaterno")!= null ? request.getParameter("sApeMaterno"): "";
int		iIdUsuario = java.lang.Integer.parseInt( request.getParameter("idUsuario")!= null ? request.getParameter("idUsuario"): "0" );
String	sEstatus = request.getParameter("sEstatus")!= null ? request.getParameter("sEstatus"): "";
String	sMensaje = "";

int		iIdUsuarioRH;
com.gob.Usuario				oUsuario  = new com.gob.Usuario();
com.gob.UsuarioRH			oUsuarioRH = new com.gob.UsuarioRH();
com.consiss.util.Utilerias	oUtil	 = new com.consiss.util.Utilerias();

java.text.DecimalFormat dfN = new java.text.DecimalFormat("000");

if(sOpcion.equals("SAVE")){
	if(sCodigo.equals("0")){
		iIdUsuario = oUsuario.InsertUsrRH();
		if(iIdUsuario>0){
			iIdUsuarioRH = oUsuarioRH.Insert(sNombre, sApePaterno, sApeMaterno, iIdUsuario );
			sMensaje = "El usuario " + oUsuario.GetUsuario() + " se ha creado con la clave " + oUsuario.GetClave();
		} 
	} else {
		oUsuarioRH.Update(java.lang.Integer.parseInt(sCodigo), sNombre, sApePaterno, sApeMaterno,
				iIdUsuario, sEstatus);
	}
}


if(sOpcion.equals("CHANGEPSW")){
	oUsuario.Get(java.lang.Integer.parseInt(sCodigo));
	oUsuario.SetClave( oUsuario.generaClave() );
	oUsuario.Update();
	sMensaje = "Al usuario " + oUsuario.GetUsuario() + " se ha asignado la clave " + oUsuario.GetClave();
	sOpcion = "";
}
%>
	<title>Entrega - Recepción : Usuarios Recursos Humanos (Procesando...)</title>
</head>

<body>
<form action="fUsuarioRH.jsp" name="forma" method="post" target="_parent">
	<input type="hidden" name="sOpcion" value="<%=sOpcion%>">
	<input type="hidden" name="sCodigo" value="<%=sCodigo%>"> 
	<input type="hidden" name="sMensaje" value="<%=sMensaje%>">
</form>
</body>
<script language="JavaScript">
	document.forma.submit();
</script>
</html>
