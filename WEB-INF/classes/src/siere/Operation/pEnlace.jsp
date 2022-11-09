<%/*********************************************************************************************************
Elaboro:	Julio Enrique Espinosa Torres
Lugar:		Monterrey, NL
Fecha:		19.Dic.2002
Compañia:	CONSISS*/%>
<html>
<head>
<%

String	sOpcion = request.getParameter("sOpcion")!= null ? request.getParameter("sOpcion"): "";
String	sCodigo = request.getParameter("sCodigo")!= null ? request.getParameter("sCodigo"): "0";
String	iIdUnidadGobierno = request.getParameter("iIdUnidadGobierno")!= null ? request.getParameter("iIdUnidadGobierno"): "-1";

String	sNombre = request.getParameter("sNombre")!= null ? request.getParameter("sNombre"): "";
String	sApePaterno = request.getParameter("sApePaterno")!= null ? request.getParameter("sApePaterno"): "";
String	sApeMaterno = request.getParameter("sApeMaterno")!= null ? request.getParameter("sApeMaterno"): "";
String	sIdUnidadGobierno = request.getParameter("sIdUnidadGobierno")!= null ? request.getParameter("sIdUnidadGobierno"): "0";
String	sTipoUsuario = "1"; //request.getParameter("sTipoUsuario")!= null ? request.getParameter("sTipoUsuario"): "2";
String	sMensaje = "";

int		iIdUsuario, iIdEnlace;
com.gob.Usuario			oUsuario 	 = new com.gob.Usuario();
com.gob.Enlace			oEnlace = new com.gob.Enlace();
com.consiss.util.Utilerias	oUtil		 = new com.consiss.util.Utilerias();


java.text.DecimalFormat dfN = new java.text.DecimalFormat("000");

if(sOpcion.equals("SAVE")){
	if(sCodigo.equals("0")){
		iIdUsuario = oUsuario.InsertUsrEnlace();
		if(iIdUsuario>=0){
			iIdEnlace = oEnlace.Insert(sNombre, sApePaterno, sApeMaterno, iIdUsuario, 
				java.lang.Integer.parseInt(sIdUnidadGobierno), java.lang.Integer.parseInt(sTipoUsuario));
			sMensaje = "El usuario " + oUsuario.GetUsuario() + " se ha creado con la clave " + oUsuario.GetClave();
		}
	} else {
		oEnlace.Update(java.lang.Integer.parseInt(sCodigo), sNombre, sApePaterno, sApeMaterno,
				java.lang.Integer.parseInt(sIdUnidadGobierno), java.lang.Integer.parseInt(sTipoUsuario));
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
	<title>Entrega - Recepción : Enlaces (Procesando...)</title>
</head>

<body>
<form action="fEnlace.jsp" name="forma" method="post" target="_parent">
	<input type="hidden" name="sOpcion" value="<%=sOpcion%>">
	<input type="hidden" name="sCodigo" value="<%=sCodigo%>"> 
	<input type="hidden" name="sMensaje" value="<%=sMensaje%>">
	<input type="hidden" name="iIdUnidadGobierno" value="<%=iIdUnidadGobierno%>">
</form>
</body>
<script language="JavaScript">
	document.forma.submit();
</script>
</html>
