<%@page import="javazoom.upload.*"%>
<%@page import="java.util.*" %>
<%@page import="java.io.*" %>
<%@page import="com.gob.*" %>
<%@page import="com.consiss.util.*"%>
<%response.setHeader("Cache-Control","no-cache");
response.setHeader("Pragma","no-cache");
response.setDateHeader ("Expires", -1);
%><%@include file="HeaderCarga.jsp"%><%
/********************************************************************************************************
'Elaboro:	Enrique Martinez
'Lugar:		Monterrey, NL
'Fecha:		22.Abril.2003
'Compañia:	CONSISS
'Ultima Modificacion:
'By:
'Distintas opciones:
'********************************************************************************************************/

Funcionario oFuncionario= new Funcionario();
Anexo		oAnexo		= new Anexo();
String	sIdFuncionario 	= request.getParameter("sIdFuncionario") != null ? request.getParameter("sIdFuncionario") : "0";
String  sNombreFuncionario;
String	sIdAnexo 		= request.getParameter("sIdAnexo") != null ? request.getParameter("sIdAnexo") : "0";
String	sRutaTmp 		= com.consiss.db.ConnectionWEB.getDataWeb() + "/Temp/";
String	sRutaBase 		= sRutaTmp + "F" + sIdFuncionario + "/";
String	sArchivoAgregado = "";
int iRegistrosACargar = 0;
int iRegistrosConError = 0;

if (MultipartFormDataRequest.isMultipartFormData(request)){
	MultipartFormDataRequest oMultiRequest = new MultipartFormDataRequest(request);
	String sOpcion 	= oMultiRequest.getParameter("sOpcion");
	sIdFuncionario	= oMultiRequest.getParameter("sIdFuncionario") != null ? oMultiRequest.getParameter("sIdFuncionario") : "0";
	sRutaBase 		= sRutaTmp + "F" + sIdFuncionario + "/";
	sIdAnexo		= oMultiRequest.getParameter("sIdAnexo") != null ? oMultiRequest.getParameter("sIdAnexo") : "0";
	if ((sOpcion != null) && (sOpcion.equalsIgnoreCase("UpLoad"))) {
		Hashtable files = oMultiRequest.getFiles();
		if ((files != null) || (!files.isEmpty())){
			UploadFile file = (UploadFile) files.get("oFiles");
			sArchivoAgregado = file.getFileName();%>
			<jsp:useBean id="upBean" scope="page" class="javazoom.upload.UploadBean" >
			</jsp:useBean><%
			upBean.setFolderstore(sRutaTmp);
			upBean.setFolderstore(sRutaBase);
			File oFileTemp = null;
			try {
				oFileTemp = new File( sRutaBase + "/" + file.getFileName() );
				oFileTemp.delete();
			}catch(Throwable e){ }
			 upBean.store(oMultiRequest, "oFiles");
			for(int i=0;i<=100000;i++){}
			CargaMasiva oCarga = new CargaMasiva();
			int[] iPaso = {10, 50, 100, 50, 50, 20};
			oCarga.setIdFuncionario(java.lang.Integer.parseInt(sIdFuncionario));
			oCarga.setCorte(iPaso);
			oCarga.setArchivo(sRutaBase + "/" + file.getFileName());
			oCarga.setTabla("PasoAnexo2IV2");
			oCarga.setProcedimiento("Anexo2IV2");
			oCarga.ProcesaInformacion();
			iRegistrosACargar =	oCarga.getRegistrosACargar();
			iRegistrosConError = oCarga.getRegistrosConError();
			try {oFileTemp.delete();}catch(Throwable e){}
			Seguridad oSeguridad = new Seguridad();
			String sUsuario	= ((session.getValue("sUsuario")!= null?(String)session.getValue("sUsuario"):""));
			oSeguridad.Bitacora(sUsuario, "Carga", "Anexo II.4.2", request.getRemoteAddr(), request.getRemoteHost(), request.getHeader("User-Agent"));
		}
	}
}

String sPath 			= "../";
%>
<html>
<head>
	<link rel="stylesheet" type="text/css" href="../Styles/Gobierno.css">
	<title>Entrega - Recepción : Anexo II.4.2 (Archivos de Carga Masiva)</title>
	<script language="JavaScript" src="<%=sPath%>Scripts/Libreria.js"></script>
	<script>
		function valida(){
			if (document.upform.oFiles.value == '')
				return false;
			return true;
		}
		function save(){
			if (valida()){
				document.upform.sIdAnexoArchivo.value = '0';
				//idBodyc.style.cursor='wait';
				document.all('idBodyc').style.cursor='wait';
				document.upform.sOpcion.value = 'UpLoad';
				document.all('barra').style.visibility = 'visible';
				document.all('barraTitulo').style.visibility = 'visible';
				progress_update('progress');
				document.upform.submit();
			}else
				alert('Elija un archivo válido');
		}
		function errores(){
			popBoxRize("Errores", 800, 600, "fErrAnexo2IV2.jsp?sIdFuncionario=<%=sIdFuncionario%>");
		}
	</script>
</head>
<body id="idBodyc">
<form method="post" action="cAnexo2IV2.jsp" name="upform" enctype="multipart/form-data">
<table border="0" cellspacing="0" cellpadding="0" width="100%">
<tr>
	<!-- Contenido -->
	<td valign="top">
		<table align=center border=0 cellPadding=0 cellSpacing=0 width="100%">
			<tr>
				<td class="boton">&nbsp;&nbsp;ARCHIVOS DE CARGA MASIVA&nbsp;&nbsp;</td>
				<td class="TituloParrafo" align=right width="60px">
					<INPUT onclick="javascript: window.opener.vLoadCM = 1;self.close();window.opener.document.forma.submit();" 	name="CLOSE" id="CLOSE" type="button" value="Cerrar" class="boton1">
				</td>
			</tr>
		</table>		
		<!-- Datos que se agregaran a la tabla  -->
		<table cellPadding="0" cellSpacing="0" width="100%" border="1" bordercolor="white">
		<!-- Etiqueta donde se aplican los encabezados de las tablas-->
		<%
			oFuncionario.Get(java.lang.Integer.parseInt(sIdFuncionario));
			oAnexo.Get(java.lang.Integer.parseInt(sIdAnexo));
		%>
			<tr align="left">
				<td colspan="3">&nbsp;<%=oAnexo.GetClave().toUpperCase()%>: <%=oAnexo.GetNombre()%></td>
			</tr>
			<tr align="left">
				<td colspan="3">&nbsp;FUNCIONARIO: <%=oFuncionario.GetNombre() + " " + oFuncionario.GetApePaterno() + " " + oFuncionario.GetApeMaterno()%></td>
			</tr>
			<tr align="left" class="TituloMenu">
				<td colspan="3">
				<br>&nbsp;Agregar Archivos </td>
			</tr>
			<tr align="left">
				<td class="Etiquetafrm">&nbsp;Archivo: </td>
				<td colspan="2"><input type="file" name="oFiles"  size="50"> &nbsp;&nbsp;
								<INPUT onclick="save();" 	name="SAVE" 	type="button" value="Grabar"  class="boton1"></td>
			</tr>
			<%if(!sArchivoAgregado.equals("")){ %>			
			<tr align="left" class="TituloMenu">
				<td colspan="3">
					<br>&nbsp;Archivo Agregado</td>
			</tr>
			<tr>
				<td colspan="3"><%=sArchivoAgregado%></td>
			</tr>
			<tr>
				<td colspan="3"><br>Se cargaron <b><%=iRegistrosACargar - iRegistrosConError%></b> Registros Exitosamente</td>
			</tr>
			<tr>
				<td colspan="3"><br><a onClick="errores();" href="javascript:errores();return false;" >Con <b><%=iRegistrosConError%></b> Registros de Errores</a></td>
			</tr>
			<SCRIPT language="JavaScript">window.opener.vLoadCM = 0;</SCRIPT>
			<%}%>
			<tr align="left" class="TituloMenu" id="barraTitulo" style="visibility = hidden">
				<td colspan="3">
					<br>&nbsp;Agregando Registros</td>
			</tr>
			<tr>
				<td colspan="3">
				<div id="barra" style="font-size:8pt;padding:2px;border:solid black 1px;visibility = hidden">
				<span id="progress1">&nbsp; &nbsp;</span>
				<span id="progress2">&nbsp; &nbsp;</span>
				<span id="progress3">&nbsp; &nbsp;</span>
				<span id="progress4">&nbsp; &nbsp;</span>
				<span id="progress5">&nbsp; &nbsp;</span>
				<span id="progress6">&nbsp; &nbsp;</span>
				<span id="progress7">&nbsp; &nbsp;</span>
				<span id="progress8">&nbsp; &nbsp;</span>
				<span id="progress9">&nbsp; &nbsp;</span>
				<span id="progress10">&nbsp; &nbsp;</span>
				<span id="progress11">&nbsp; &nbsp;</span>
				<span id="progress12">&nbsp; &nbsp;</span>
				<span id="progress13">&nbsp; &nbsp;</span>
				<span id="progress14">&nbsp; &nbsp;</span>
				<span id="progress15">&nbsp; &nbsp;</span>
				<span id="progress16">&nbsp; &nbsp;</span>
				<span id="progress17">&nbsp; &nbsp;</span>
				<span id="progress18">&nbsp; &nbsp;</span>
				<span id="progress19">&nbsp; &nbsp;</span>
				<span id="progress20">&nbsp; &nbsp;</span>
				<span id="progress21">&nbsp; &nbsp;</span>
				<span id="progress22">&nbsp; &nbsp;</span>
				<span id="progress23">&nbsp; &nbsp;</span>
				<span id="progress24">&nbsp; &nbsp;</span>
				<span id="progress25">&nbsp; &nbsp;</span>
				<span id="progress26">&nbsp; &nbsp;</span>
				<span id="progress27">&nbsp; &nbsp;</span>
				<span id="progress28">&nbsp; &nbsp;</span>
				<span id="progress29">&nbsp; &nbsp;</span>
				<span id="progress30">&nbsp; &nbsp;</span>
				<span id="progress31">&nbsp; &nbsp;</span>
				<span id="progress32">&nbsp; &nbsp;</span>
				<span id="progress33">&nbsp; &nbsp;</span>
				</div>
				</td>
			</tr>
		</table>
	</td>
</tr>
</table>
<input type="hidden" name="sOpcion" 		value="">
<input type="hidden" name="sIdAnexoArchivo"	value="">
<input type="hidden" name="sIdFuncionario" 	value="<%=sIdFuncionario%>">
<input type="hidden" name="sIdAnexo" 		value="<%=sIdAnexo%>">
</form>
<table border="0" height="45%" width="100%"><tr><td valign="bottom">
<%@include file="Footer.jsp"%>
</td></tr></table>

</body>
</html>
