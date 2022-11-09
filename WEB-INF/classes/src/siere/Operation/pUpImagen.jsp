<%@page import="javazoom.upload.*"%>
<%@page import="java.util.*" %>
<%@page import="java.io.*" %>
<%@page import="com.gob.*" %>
<%@page import="com.consiss.util.tools.*"%>
<%
response.setHeader("Cache-Control","no-cache");
response.setHeader("Pragma","no-cache");
response.setDateHeader ("Expires", -1);
/********************************************************************************************************
'Elaboro:	Claudia Sandoval
'Lugar:		Monterrey, NL
'Fecha:		10.Dic.2002
'Compañia:	CONSISS
'Ultima Modificacion:	29.Oct.2002
'
'Distintas opciones:
'
'********************************************************************************************************/
//<%@ page errorPage="ExceptionHandler.jsp" %
UnidadGobierno oUnidadGobierno = new UnidadGobierno();

String	sIdUnidadGobierno = request.getParameter("sIdUnidadGobierno") != null ? request.getParameter("sIdUnidadGobierno") : "0";
String	sImagen = request.getParameter("sImagen") != null ? request.getParameter("sImagen") : "";
String	sNombre = request.getParameter("sNombre") != null ? request.getParameter("sNombre") : "";
String	sTipo = request.getParameter("sTipo") != null ? request.getParameter("sTipo") : "";

String	sIdFuncionario 	= "";
String	sIdAnexo 		= request.getParameter("sIdAnexo") != null ? request.getParameter("sIdAnexo") : "0";
//String	sRutaBase 		= com.consiss.db.ConnectionWEB.getSourceWeb() + "/Images";
String	sRutaBase 		= com.consiss.db.ConnectionWEB.getDataWeb() + "/Imagenes";
String	sRutaBaseWeb	= "../Imagenes";
String	sRutaWeb		= "";
String	sRutaAcceso1	= "";
String	sRutaAcceso2	= "";
String	sMensage		= "";

if (MultipartFormDataRequest.isMultipartFormData(request)) {
	MultipartFormDataRequest oMultiRequest = new MultipartFormDataRequest(request);
	sIdUnidadGobierno	= oMultiRequest.getParameter("sIdUnidadGobierno") != null ? oMultiRequest.getParameter("sIdUnidadGobierno") : "0";
	sImagen			= oMultiRequest.getParameter("sImagen") != null ? oMultiRequest.getParameter("sImagen") : "";
	sNombre			= oMultiRequest.getParameter("sNombre") != null ? oMultiRequest.getParameter("sNombre") : "";
	sTipo				= oMultiRequest.getParameter("sTipo") != null ? oMultiRequest.getParameter("sTipo") : "";
	
	String sOpcion		= oMultiRequest.getParameter("sOpcion") != null ? oMultiRequest.getParameter("sOpcion") : "";
	
	sRutaAcceso1 		= sRutaBase + "/UnidadGobierno" + sIdUnidadGobierno;
	sRutaWeb			= sRutaBaseWeb + "/UnidadGobierno" + sIdUnidadGobierno + "/";
	
	if ((sOpcion != null) && (sOpcion.equalsIgnoreCase("UpLoad"))) {
		Hashtable files = oMultiRequest.getFiles();
		if ( (files != null) || (!files.isEmpty()) ){
			UploadFile file = (UploadFile) files.get("oFiles");
			//file.setFileName("UnidadGobierno" + sIdUnidadGobierno);
			// FALTA VALIDAR QUE SEA EL NOMBRE MENOR A 60 CARACTERES file.getFileName()
			if((file.getFileName()).length()>60){
				sMensage = "El nombre de la imagen debe ser menor a 60";
			} else {
%><jsp:useBean id="upBean" scope="page" class="javazoom.upload.UploadBean" ></jsp:useBean>
<jsp:useBean id="PasoBean" scope="page" class="javazoom.upload.UploadBean" ></jsp:useBean><%
				if(!sImagen.equals("")){
					File oFileTemp = new File( sRutaBase + "/" + sImagen );
					oFileTemp.delete();
				}
				sImagen = sRutaWeb + file.getFileName();
				PasoBean.setFolderstore(sRutaAcceso1);
				upBean.setFolderstore(sRutaAcceso1);
				upBean.store(oMultiRequest, "oFiles");
				if (file != null)
					oUnidadGobierno.UpdateImagen(java.lang.Integer.parseInt(sIdUnidadGobierno), sRutaWeb + file.getFileName());
			}
		}
	}
}
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
	<link rel="stylesheet" type="text/css" href="../Styles/Gobierno.css">
	<title>Entrega - Recepción : Imagen de Dependencia, Organismo o Tribunal</title>
	<script>
		function valida(){
			if (document.upform.oFiles.value == '')
				return false;
			return true;
		}
		function save(){
			if (valida()){
				//document.upform.sIdAnexoArchivo.value = '0';
				document.upform.sOpcion.value = 'UpLoad';
				document.upform.submit();
			}else
				alert('Elija un archivo valido');
		}
		
	</script>
</head>
<body>
<form method="post" action="pUpImagen.jsp" name="upform" enctype="multipart/form-data">
<table border="0" cellspacing="0" cellpadding="0" width="100%">
<tr>
	<!-- Contenido -->
	<td valign="top">
		<table align=center border=0 cellPadding=0 cellSpacing=0 width="100%">
			<tr>
				<td class="boton">&nbsp;&nbsp;IMAGEN&nbsp;&nbsp;</td>
				<td class="TituloParrafo" align=right width="60px">
					<INPUT onclick="javascript: self.close();window.opener.document.forma.submit();" 	name="CLOSE" id="CLOSE" type="button" value="Cerrar" class="boton1">
				</td>
			</tr>
		</table>		
		<!-- Datos que se agregaran a la tabla  -->
		<table cellPadding="0" cellSpacing="0" width="100%" border="1" bordercolor="white">
		<!-- Etiqueta donde se aplican los encabezados de las tablas-->
			<tr align="left">
				<td colspan="3">&nbsp;<%=sTipo.equals("1")?"Dependencia":(sTipo.equals("2")?"Organismo Parestatal":"Tribunal Administrativo") %>: <%=sNombre%></td>
			</tr>
			<tr align="left" class="TituloMenu">
				<td colspan="3">
				<br>&nbsp;Nueva Imagen</td>
			</tr>
			<tr align="left">
				<td class="Etiquetafrm">&nbsp;Imagen: </td>
				<td colspan="2">
				<input type="file" id="oFiles" name="oFiles" size="50"> &nbsp;&nbsp;
				<INPUT type="button" id="SAVE" name="SAVE" value="Grabar" onclick="save();" class="boton1"></td>
			</tr>
			<tr align="left" class="TituloMenu">
				<td colspan="3">
				<br>&nbsp;Imagen Guardada</td>
			</tr>
			<tr align="left">
				<td class="Etiquetafrm" valign="top">&nbsp;Imagen: </td>
				<td colspan="2">
					<%=sImagen.equals("")?"":"<img src='../Imagenes/" + sImagen + "'>"%>
				<br>
			</tr>
		</table>
	</td>
</tr>
</table>
<input type="hidden" name="sIdUnidadGobierno" 	value="<%=sIdUnidadGobierno%>">
<input type="hidden" name="sNombre"				value="<%=sNombre%>">
<input type="hidden" name="sTipo"				value="<%=sTipo%>">
<input type="hidden" name="sImagen"				value="<%=sImagen%>">
<input type="hidden" name="sOpcion">
<%if(!sMensage.equals("")){%><script>alert("<%=sMensage%>");document.upform.oFiles.focus();</script><%}%>
</form>
</body>
</html>
