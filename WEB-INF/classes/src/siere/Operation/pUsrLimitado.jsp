<%/*********************************************************************************************************
Elaboro:	Claudia V. Sandoval Pardo
Lugar:		Monterrey, NL
Fecha:		24.Oct.2002
Compañia:	CONSISS*/%>
<html>
<head>
<%

String	sOpcion = request.getParameter("sOpcion")!= null ? request.getParameter("sOpcion"): "";
String	sCodigo = request.getParameter("sCodigo")!= null ? request.getParameter("sCodigo"): "0";

String	sNombre = request.getParameter("sNombre")!= null ? request.getParameter("sNombre"): "";
String	sApePaterno = request.getParameter("sApePaterno")!= null ? request.getParameter("sApePaterno"): "";
String	sApeMaterno = request.getParameter("sApeMaterno")!= null ? request.getParameter("sApeMaterno"): "";
String	dFecIni = request.getParameter("dFecIni")!= null ? request.getParameter("dFecIni"): "";
String	dFecFin = request.getParameter("dFecFin")!= null ? request.getParameter("dFecFin"): "";
int		iIdUsuario = java.lang.Integer.parseInt( request.getParameter("idUsuario")!= null ? request.getParameter("idUsuario"): "0" );
String	sEstatus = request.getParameter("sEstatus")!= null ? request.getParameter("sEstatus"): "";
String	sMensaje = "";

int iIdFuncionario =  java.lang.Integer.parseInt(
		(String)(session.getValue("iIdFuncionario")!= null?session.getValue("iIdFuncionario"):"0") );

int		iIdUsrLimitado;
com.gob.Usuario				oUsuario 	 = new com.gob.Usuario();
com.gob.UsrLimitado			oUsrLimitado = new com.gob.UsrLimitado();
com.consiss.util.Utilerias	oUtil		 = new com.consiss.util.Utilerias();

dFecIni = oUtil.sGetDateToNum(dFecIni, "/");
dFecFin = oUtil.sGetDateToNum(dFecFin, "/");

java.text.DecimalFormat dfN = new java.text.DecimalFormat("000");

if(sOpcion.equals("SAVE")){
	if(sCodigo.equals("0")){
		iIdUsuario = oUsuario.InsertUsrLimitado(iIdFuncionario);
		if(iIdUsuario>0){
			iIdUsrLimitado = oUsrLimitado.Insert(iIdFuncionario, sNombre, sApePaterno, sApeMaterno, 
				dFecIni, dFecFin, iIdUsuario );
			sMensaje = "El usuario " + oUsuario.GetUsuario() + " se ha creado con la clave " + oUsuario.GetClave();
		} else {
			if(iIdUsuario == 0){
				sMensaje = "El limite de Usuarios es de " + oUsuario.GetMaxUsuarios() + ". Si desea agregar mas notifique al Administrador";
			}
		}
	} else {
		oUsrLimitado.Update(java.lang.Integer.parseInt(sCodigo), sNombre, sApePaterno, sApeMaterno,
				dFecIni, dFecFin, iIdUsuario, sEstatus);
	}
}

if(sOpcion.equals("NEW")){
	if(oUsuario.GetCountUsuario(iIdFuncionario) >= oUsuario.GetMaxUsuarios(iIdFuncionario) ){
		sMensaje = "El limite de Usuarios es de " + oUsuario.GetMaxUsuarios() + ". Si desea agregar mas notifique al Administrador";
		sOpcion = "";
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
	<title>Entrega - Recepción : Usuarios Limitados (Procesando...)</title>
</head>

<body>
<form action="fUsrLimitado.jsp" name="forma" method="post" target="_parent">
	<input type="hidden" name="sOpcion" value="<%=sOpcion%>">
	<input type="hidden" name="sCodigo" value="<%=sCodigo%>"> 
	<input type="hidden" name="sMensaje" value="<%=sMensaje%>">
</form>
</body>
<script language="JavaScript">
	document.forma.submit();
</script>
</html>
