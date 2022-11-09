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
String	sIdUnidadGobierno = request.getParameter("iIdUnidadGobierno")!= null ? request.getParameter("iIdUnidadGobierno"): "-1";

String	sNombre = request.getParameter("sNombre")!= null ? request.getParameter("sNombre"): "";
String	sApePaterno = request.getParameter("sApePaterno")!= null ? request.getParameter("sApePaterno"): "";
String	sApeMaterno = request.getParameter("sApeMaterno")!= null ? request.getParameter("sApeMaterno"): "";
String	dFecIni = request.getParameter("dFecIni")!= null ? request.getParameter("dFecIni"): "";
String	dFecFin = request.getParameter("dFecFin")!= null ? request.getParameter("dFecFin"): "";
String	sIdCargo = request.getParameter("sIdCargo")!= null ? request.getParameter("sIdCargo"): "0";
String	sEmail = request.getParameter("sEmail")!= null ? request.getParameter("sEmail"): "";
String	sMaxUsuarios = request.getParameter("sMaxUsuarios")!= null ? request.getParameter("sMaxUsuarios"): "2";
String	sEstatus = request.getParameter("sEstatus")!= null ? request.getParameter("sEstatus"): "1";
String	sIdUsuario = request.getParameter("sIdUsuario")!= null ? request.getParameter("sIdUsuario"): "0";
String	sMensaje = "";
String	sFocus = request.getParameter("sFocus")!= null ? request.getParameter("sFocus"): "";

int		iIdUsuario, iIdFuncionario;
com.gob.Usuario				oUsuario 	 = new com.gob.Usuario();
com.gob.Funcionario			oFuncionario = new com.gob.Funcionario();
com.consiss.util.Utilerias	oUtil		 = new com.consiss.util.Utilerias();

dFecIni = oUtil.sGetDateToNum(dFecIni, "/");
dFecFin = oUtil.sGetDateToNum(dFecFin, "/");

java.text.DecimalFormat dfN = new java.text.DecimalFormat("000");

if(sOpcion.equals("SAVE")){
	if(sCodigo.equals("0")){
		iIdUsuario = oUsuario.InsertFuncionario();
		if(iIdUsuario>=0){
			iIdFuncionario = oFuncionario.Insert(sNombre, sApePaterno, sApeMaterno, dFecIni, dFecFin, iIdUsuario, 
				java.lang.Integer.parseInt(sIdCargo), sEmail, sMaxUsuarios, sEstatus);
			sMensaje = "El usuario " + oUsuario.GetUsuario() + " se ha creado con la clave " + oUsuario.GetClave();
		}
	} else {
		oFuncionario.Update(java.lang.Integer.parseInt(sCodigo), sNombre, sApePaterno, sApeMaterno,
				dFecIni, dFecFin, java.lang.Integer.parseInt(sIdCargo), sEmail, sMaxUsuarios, sEstatus, 
				java.lang.Integer.parseInt(sIdUsuario) );
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
	<title>Entrega - Recepción : Funcionarios (Procesando...)</title>
</head>

<body>
<form action="fFuncionario.jsp" name="forma" method="post" target="_parent">
	<input type="hidden" name="sOpcion" value="<%=sOpcion%>">
	<input type="hidden" name="sCodigo" value="<%=sCodigo%>">
	<input type="hidden" name="sMensaje" value="<%=sMensaje%>">
	<input type="hidden" name="iIdUnidadGobierno" value="<%=sIdUnidadGobierno%>">
	<input type="hidden" name="sFocus" value="<%=sFocus%>">
</form>
</body>
<script language="JavaScript">
	document.forma.submit();
</script>
</html>
