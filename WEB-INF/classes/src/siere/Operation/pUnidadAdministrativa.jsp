<%/*********************************************************************************************************
Elaboro:	Claudia V. Sandoval Pardo
Lugar:		Monterrey, NL
Fecha:		28.Oct.2002
Compañia:	CONSISS*/%><%

String	sOpcion = request.getParameter("sOpcion")!= null ? request.getParameter("sOpcion"): "";
String	sCodigo = request.getParameter("sCodigo")!= null ? request.getParameter("sCodigo"): "0";
String	iIdUnidadGobierno = request.getParameter("iIdUnidadGobierno")!= null ? request.getParameter("iIdUnidadGobierno"): "-1";
String	sMensage = "";

String	sNombre			= request.getParameter("sNombre")!= null ? request.getParameter("sNombre"): "";
String	sIdUnidadGobierno= request.getParameter("sIdUnidadGobierno")!= null ? request.getParameter("sIdUnidadGobierno"): "0";
String	sDireccion		= request.getParameter("sDireccion")!= null ? request.getParameter("sDireccion"): "";
String	sIdMunicipio	= request.getParameter("sIdMunicipio")!= null ? request.getParameter("sIdMunicipio"): "";
String	sClave			= request.getParameter("sClave")!= null ? request.getParameter("sClave"): "";

com.gob.UnidadAdministrativa oUnidadAdministrativa = new com.gob.UnidadAdministrativa();
com.gob.UnidadGobierno oUnidadGobierno = new com.gob.UnidadGobierno();

if(sOpcion.equals("SAVE")){
	oUnidadGobierno.Get(java.lang.Integer.parseInt(sIdUnidadGobierno));
	String sTipoUnidad = oUnidadGobierno.GetTipoUnidad();
	
	if(sCodigo.equals("0")){
		int iIdUnidadAdministrativa = oUnidadAdministrativa.Insert(sNombre, java.lang.Integer.parseInt(sIdUnidadGobierno), sDireccion, java.lang.Integer.parseInt(sIdMunicipio), sClave);
		if(sTipoUnidad.equals("1")){
			com.gob.MensajeRH oMensajeRH = new com.gob.MensajeRH();
			String sDependencia = oUnidadGobierno.GetNombre();
			//oMensajeRH.Insert("Se ha insertado a la Dependencia:<B>" + sDependencia + "</B> la Unidad Administrativa:<B>" + sNombre + "</B>");
			oMensajeRH.Insert(java.lang.Integer.parseInt(sIdUnidadGobierno), iIdUnidadAdministrativa, 'A', "");
		}
	} else {
		oUnidadAdministrativa.Get(java.lang.Integer.parseInt(sCodigo));
		String sNombreAnt = oUnidadAdministrativa.GetNombre();
		String sIdUnidadGobiernoAnt = oUnidadAdministrativa.GetIdUnidadGobierno() + "";
		oUnidadAdministrativa.Update(java.lang.Integer.parseInt(sCodigo), sNombre, java.lang.Integer.parseInt(sIdUnidadGobierno), sDireccion, java.lang.Integer.parseInt(sIdMunicipio), sClave);
		if(sTipoUnidad.equals("1")){
			com.gob.MensajeRH oMensajeRH = new com.gob.MensajeRH();
			String sDependencia = oUnidadGobierno.GetNombre();
			if(!sNombreAnt.equals(sNombre)){
				oMensajeRH.Insert(java.lang.Integer.parseInt(sIdUnidadGobierno), java.lang.Integer.parseInt(sCodigo), 'N', sNombreAnt);
			}
			if(!sIdUnidadGobiernoAnt.equals(sIdUnidadGobierno)){
				oMensajeRH.Insert(java.lang.Integer.parseInt(sIdUnidadGobierno), java.lang.Integer.parseInt(sCodigo), 'G', sIdUnidadGobiernoAnt);
			}
		}
	}
}

if(sOpcion.equals("DEL")){
	oUnidadAdministrativa.Get(java.lang.Integer.parseInt(sCodigo));
	sNombre = oUnidadAdministrativa.GetNombre();
	sIdUnidadGobierno = oUnidadAdministrativa.GetIdUnidadGobierno() + "";
	if(! oUnidadAdministrativa.Delete(java.lang.Integer.parseInt(sCodigo)) ){
		sMensage = "No se puede eliminar la Unidad Administrativa porque tiene información asignada";
	} else {
		oUnidadGobierno.Get(java.lang.Integer.parseInt(sIdUnidadGobierno));
		String sTipoUnidad = oUnidadGobierno.GetTipoUnidad();
		if(sTipoUnidad.equals("1")){
			com.gob.MensajeRH oMensajeRH = new com.gob.MensajeRH();
			String sDependencia = oUnidadGobierno.GetNombre();
			//oMensajeRH.Insert("Se ha eliminado de la Dependencia:<B>" + sDependencia + "</B> la Unidad Administrativa:<B>" + sNombre + "</B>");
			oMensajeRH.Insert(java.lang.Integer.parseInt(sIdUnidadGobierno), java.lang.Integer.parseInt(sCodigo), 'E', sNombre);
		}
	}
	sCodigo = "";
	sOpcion = "";
}%>

<html>
<head>
	<title>Entrega - Recepción : Unidades Administrativas (Procesando...)</title>
</head>

<body>
<form action="fUnidadAdministrativa.jsp" name="forma" method="post" target="_parent">
	<input type="hidden" name="sOpcion" value="<%=sOpcion%>">
	<input type="hidden" name="sCodigo" value="<%=sCodigo%>">
	<input type="hidden" name="sMensage" value="<%=sMensage%>">
	<input type="hidden" name="iIdUnidadGobierno" value="<%=iIdUnidadGobierno%>"> 
</form>
</body>
<script>
	document.forma.submit();
</script>
</html>
