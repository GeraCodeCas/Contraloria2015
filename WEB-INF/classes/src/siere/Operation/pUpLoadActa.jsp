<%@page import="javazoom.upload.*"%>
<%@page import="java.util.*" %>
<%@page import="java.io.*" %>
<%@page import="com.gob.*" %>
<%@page import="com.consiss.util.tools.*"%>
<%
/********************************************************************************************************
'Elaboro:	Jesus Limon
'Lugar:		Monterrey, NL
'Fecha:		29.Oct.2002
'Compañia:	CONSISS
'Ultima Modificacion:	29.Oct.2002
'By:		Jesus Limon
'
'Distintas opciones:
'
Logo de prueba para sistema de gobierno Sistema de Caminos.jpg
'********************************************************************************************************/
//<%@ page errorPage="ExceptionHandler.jsp" %
Funcionario oFuncionario= new Funcionario();
Acta oActa = new com.gob.Acta();
String	sIdFuncionario 	= request.getParameter("sIdFuncionario") != null ? request.getParameter("sIdFuncionario") : "0";
String  sNombreFuncionario;
//String	sRutaBase 		= com.consiss.db.ConnectionWEB.getSourceWeb() + "/Attachment";
String	sRutaBase 		= "/Attachment";
String 	sRutaBaseWeb	= "../Attachment";
String 	sRutaWeb		= "";
String 	sRutaAccesoDB1	= "";
String 	sRutaAccesoDB2	= "";
String 	sRutaAccesoDW1	= "";
String 	sRutaAccesoDW2	= "";
String 	sMensage		= "";


      if (MultipartFormDataRequest.isMultipartFormData(request)) {
         MultipartFormDataRequest oMultiRequest = new MultipartFormDataRequest(request);
         String sOpcion 	= oMultiRequest.getParameter("sOpcion");
		 sIdFuncionario		= oMultiRequest.getParameter("sIdFuncionario") != null ? oMultiRequest.getParameter("sIdFuncionario") : "0";
		 sRutaAccesoDB1 	= sRutaBase + "/Funcionario" + sIdFuncionario;
		 sRutaAccesoDB2 	= sRutaBase + "/Funcionario" + sIdFuncionario + "/Acta" ;
		 sRutaAccesoDW1 	= com.consiss.db.ConnectionWEB.getDataWeb() + "/" + sRutaBase + "/Funcionario" + sIdFuncionario;
		 sRutaAccesoDW2 	= com.consiss.db.ConnectionWEB.getDataWeb() + "/" + sRutaBase + "/Funcionario" + sIdFuncionario + "/Acta" ;
		 
		 sRutaWeb			= sRutaBaseWeb + "/Funcionario" + sIdFuncionario + "/Acta/";
		 oActa.Get(java.lang.Integer.parseInt(sIdFuncionario));
		 
		 if ((sOpcion != null) && (sOpcion.equalsIgnoreCase("UpLoad"))) {
		 	if((oActa.GetArchivoAnexo()!=null)){
			 	File oFileTemp = new File(com.consiss.db.ConnectionWEB.getDataWeb() + "/" + sRutaBase + "/Funcionario" + sIdFuncionario + "/Acta/" + oActa.GetArchivoAnexo().trim());
				oFileTemp.delete();
				oActa.UpdateArchivo( java.lang.Integer.parseInt(sIdFuncionario), "");
		 	}
		 
	     	Hashtable files = oMultiRequest.getFiles();
	        if ( (files != null) || (!files.isEmpty()) ){
	        	UploadFile file = (UploadFile) files.get("oFiles");
				if((file.getFileName()).length()>60){
					sMensage = "El nombre del documento debe ser menor a 60";
				} else {%>
<jsp:useBean id="upBean" scope="page" class="javazoom.upload.UploadBean" >
</jsp:useBean>
<jsp:useBean id="PasoBean" scope="page" class="javazoom.upload.UploadBean" >
</jsp:useBean><%
					//PasoBean.setFolderstore(sRutaAcceso1);
					//upBean.setFolderstore(sRutaAcceso2);
					PasoBean.setFolderstore(sRutaAccesoDW1);
					upBean.setFolderstore(sRutaAccesoDW2);
					upBean.store(oMultiRequest, "oFiles");
					for(int i=0;i<=100000;i++){	}
					if (file != null)
						oActa.UpdateArchivo( java.lang.Integer.parseInt(sIdFuncionario), file.getFileName());
				}
	        }
		 } 
		 if((oActa.GetArchivoAnexo()!=null) && (sOpcion.equalsIgnoreCase("Remove"))){
		 	File oFileTemp = new File(com.consiss.db.ConnectionWEB.getDataWeb() + "/" + sRutaBase + "/Funcionario" + sIdFuncionario + "/Acta/" + oActa.GetArchivoAnexo().trim());
			oFileTemp.delete();
			oActa.UpdateArchivo( java.lang.Integer.parseInt(sIdFuncionario), "");
		 }
      }

oFuncionario.Get(java.lang.Integer.parseInt(sIdFuncionario));
oActa.Get(java.lang.Integer.parseInt(sIdFuncionario));

String sPath 			= "../";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
	<link rel="stylesheet" type="text/css" href="../Styles/Gobierno.css">
	<title>Entrega - Recepción : Acta (Archivos Adjuntos)</title>
	<script language="JavaScript" src="<%=sPath%>Scripts/Libreria.js"></script>
	<script language="JavaScript" >
		function valida(){
			if (document.upform.oFiles.value == ''){
				alert('Elija un archivo valido');
				return false;
			}
			var sNombreFile = document.upform.oFiles.value;
			sNombreFile = sNombreFile.substring(sNombreFile.lastIndexOf('\\')+1);

			if(document.upform.ArchivoAnexo.value != ""){
				if(confirm("¿Desea Reemplazar el Archivo Adjunto?"))
					return true;
				else	return false;
			}
			return true;
		}
		
		function save(){
			if (valida()){
				document.upform.sIdAnexoArchivo.value = '0';
				document.upform.sOpcion.value = 'UpLoad';
				document.all('idBodyc').style.cursor='wait';
				document.all('barra').style.visibility = 'visible';
				document.all('barraTitulo').style.visibility = 'visible';
				progress_update('progress');
				vLoadOpener = 1;
				document.upform.submit();
			}else
				return;
		}
		function removeit(){
			if(confirm("¿Desea Eliminar el Archivo Adjunto?")){ 
				document.upform.sOpcion.value = 'Remove';
				vLoadOpener = 1;
				document.upform.submit();
			}
		}
	</script>
</head>
<body id="idBodyc">
<form method="post" action="pUpLoadActa.jsp" name="upform" enctype="multipart/form-data">
<table border="0" cellspacing="0" cellpadding="0" width="100%">
<tr>
	<!-- Contenido -->
	<td valign="top">
		<table align=center border=0 cellPadding=0 cellSpacing=0 width="100%">
			<tr>
				<td class="boton">&nbsp;&nbsp;ARCHIVOS ADJUNTOS&nbsp;&nbsp;</td>
				<td class="TituloParrafo" align=right width="60px">
					<INPUT onclick="javascript:window.opener.vLoadAd = 1; self.close();window.opener.document.forma.submit();" 	name="CLOSE" id="CLOSE" type="button" value="Cerrar" class="boton1">
				</td>
			</tr>
		</table>		
		<!-- Datos que se agregaran a la tabla  -->
		<table cellPadding="0" cellSpacing="0" width="100%" border="1" bordercolor="white">
		<!-- Etiqueta donde se aplican los encabezados de las tablas-->
			<tr align="left">
				<td colspan="3">&nbsp;ACTA ADMINISTRATIVA</td>
			</tr>
			<tr align="left">
				<td colspan="3">&nbsp;FUNCIONARIO: <%=oFuncionario.GetNombre() + " " + oFuncionario.GetApePaterno() + " " + oFuncionario.GetApeMaterno()%></td>
			</tr>
			<tr align="left" class="TituloMenu">
				<td colspan="3">
				<br>&nbsp;Agregar Archivo </td>
			</tr>
			<tr align="left">
				<td class="Etiquetafrm">&nbsp;Archivo: </td>
				<td colspan="2"><input type="file" name="oFiles"  size="50"> &nbsp;&nbsp;
								<INPUT onclick="save();" 	name="SAVE" 	type="button" value="Grabar"  class="boton1"></td>
			</tr>
			<tr align="left" class="TituloMenu">
				<td colspan="3">
				<br>&nbsp;Archivo Agregado</td>
			</tr>
			<tr align="left">
				<%if(oActa.GetArchivoAnexo()!=null && !(oActa.GetArchivoAnexo()+"").equals("") ){%>
				<td class="Etiquetafrm" valign="top">&nbsp;Archivo: </td>
				<td colspan="2">				
				<a onmouseover="this.style.cursor='hand'" style="cursor:normal" onclick="removeit();">
						<img src="../Images/Eliminar.gif" width="14" height="14" alt="" border="0"></a>
				<a target="new" onmouseover="this.style.cursor='hand'" style="cursor:normal" href="<%=sRutaBaseWeb + "/" + "/Funcionario" + sIdFuncionario + "/Acta/" + oActa.GetArchivoAnexo()%>"><%=oActa.GetArchivoAnexo().trim()%></a>
				<%}%>
				<input type="Hidden" name="ArchivoAnexo" value="<%=oActa.GetArchivoAnexo()!=null?oActa.GetArchivoAnexo().trim():""%>">
				<br>
				</td>
			</tr>
			<tr align="left" class="TituloMenu" id="barraTitulo" style="visibility = hidden">
				<td colspan="3">
					<br>&nbsp;Agregando Archivo</td>
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
<%if(!sMensage.equals("")){%><script>alert("<%=sMensage%>");document.upform.oFiles.focus();</script><%}%>
</form>
</body>
</html>
