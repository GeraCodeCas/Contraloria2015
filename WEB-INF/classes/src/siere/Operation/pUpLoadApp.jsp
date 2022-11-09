<%
				String sfileNameTotal = request.getParameter("fileH");
				%><%=sfileNameTotal%>
<%
					// // // // upBean.store(oMultiRequest, "oFiles");%>
					<APPLET CODE= "UpLoadFTP.class" WIDTH="800" HEIGHT="100" archive="">
						<PARAM NAME="fileFTP" VALUE="<%=sfileNameTotal%>">
					</APPLET><%
					/*for(int i=0;i<=100000;i++){	}
					if (file != null)
						oArchivoA.Insert(java.lang.Integer.parseInt(sIdAnexo), java.lang.Integer.parseInt(sIdFuncionario), sRutaAccesoDB2, file.getFileName(), sRutaWeb);
					*/
				
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
	<link rel="stylesheet" type="text/css" href="../Styles/Gobierno.css">
	<title>Entrega - Recepción : (Archivos Adjuntos)</title>
</head>
</html>
