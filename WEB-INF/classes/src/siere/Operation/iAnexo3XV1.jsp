<%@page import="com.consiss.util.tools.*"%>
<%@page import="com.gob.*"%>
<%@page import="java.util.*" %>
<%
/********************************************************************************************************
'Elaboro:	Jesus Limon
'Lugar:		Monterrey, NL
'Fecha:		29.Nov.2002
'Compañia:	CONSISS
'Ultima Modificacion:16.Dic.2002
'By:Claudia Sandoval
'
'Ultima Modificacion:07.Ene.2003
'By:Enrique Martinez
'Distintas opciones:
'
'********************************************************************************************************/
%>
<%
//Valida la permanencia del usuario en session
if ((String)session.getValue("ok")!="Consiss")
			response.sendRedirect("Error.html");

String	sCodigo = request.getParameter("sCodigo")!= null ? request.getParameter("sCodigo"): "";
int iIdFuncionario =  java.lang.Integer.parseInt(
			(request.getParameter("iIdFuncionario")!= null?request.getParameter("iIdFuncionario"):"0") );

String sAnexo = "III.15.1";
Anexo3XV1 oAnexo	= new Anexo3XV1();
int iIdAnexo = oAnexo.GetIdAnexo();
String sPath = "../";
int numpag = 0;
int numtot = 0;
AnexoEstatus	oAnexoEstatus		= new AnexoEstatus();
oAnexoEstatus.Get(iIdFuncionario, iIdAnexo);
String sEstatus = oAnexoEstatus.GetEstatus();
%>
<html>
<head>
	<title>Entrega - Recepción : Anexo III.15.1 (Impresión)</title>
<link rel="stylesheet" type="text/css" href="<%=sPath%>Styles/Gobierno.css">
<SCRIPT LANGUAGE="javascript">
	var da = (document.all) ? 1 : 0;
	var pr = (window.print) ? 1 : 0;
	var mac = (navigator.userAgent.indexOf("Mac") != -1); 

	function Imprimir() {
	  if (pr){
		/* NS4, IE5 */
		window.print();
	  }else if (da && !mac){ 
		/* IE4 (Windows) */
	   print();
	  }else /* other browsers */
	    alert("Lo siento, su browser no permite esta accion.");
	}
	
	function print()
	{
	
	var WebBrowser = '<OBJECT ID="WebBrowser1"  WIDTH=0 HEIGHT=0 CLASSID="CLSID:8856F961-340A-11D0-A96B-00C04FD705A2"></OBJECT>';
	// insert object
	this.document.body.insertAdjacentHTML('afterBegin', WebBrowser); 
	this.focus();
	//if (confirm("Seguro que desea imprimir?"))
	//{
		printVB();
//	}
	WebBrowser1.outerHTML = '';
	//window.location.reload();
}
DelAll = 0;
</script>
<script language="VBScript">
sub printVB()
    const OLECMDID_PRINT = 7
	const OLECMDEXECOPT_DODEFAULT      =  0 
    const OLECMDEXECOPT_PROMPTUSER     =  1 
    const OLECMDEXECOPT_DONTPROMPTUSER =  2 
    const OLECMDEXECOPT_SHOWHELP       =  3  
	on error resume next
	WebBrowser1.ExecWB OLECMDID_PRINT, OLECMDEXECOPT_DONTPROMPTUSER,9,""
end sub
</script>
</HEAD>
<body topmargin="2" leftmargin="2" onload="Imprimir();">
<%@include file="HeaderAnexo.jsp"%>
<br>
<table border="0" cellspacing="0" cellpadding="0" width="900">
<tr>
	<td valign="top">
	<TABLE cellPadding="0" cellSpacing="0" width="100%" BORDER="1" BORDERCOLOR="white">
		<TR><TD class="TituloParrafoImpr">RELACIÓN DE RESPALDO DE ARCHIVOS Y CARPETAS EN DISKETTES O CD'S</TD></TR>  
	</TABLE>
	<TABLE cellPadding="0" cellSpacing="0" width="100%" BORDER="1" BORDERCOLOR="white">
		<TR align="middle">
			<td class="TituloMenuImpr" width="185">IDENTIFICACIÓN DEL ARCHIVO</TD>
			<td class="TituloMenuImpr" width="80">DISKETTE</TD>
			<td class="TituloMenuImpr" width="80">C.D.</TD>
			<td class="TituloMenuImpr" width="185">PERIODO COMPRENDIDO</TD>
			<td class="TituloMenuImpr" width="185">UBICACIÓN</TD>
			<td class="TituloMenuImpr" width="185">PROGRAMA</TD>
		</TR>
<%
if(!sEstatus.equals("0")){
		int intContador = 0;
		String sBackColor = "";
		oAnexo.GetAll(iIdFuncionario);
		// Variables para Paginacion
		int iLenCol = 0;
		int iRowsMax = 0; // POR REGISTRO
		int iRowsXCol = 0;
		int iRowsCount = 0;
		int iRowsAnt = 0; //posicion anterior
		int iMaxRowXPag = 24; //Numero de Renglones por Pagina
		// Variables para Paginacion
		
		for(int i=0;i<oAnexo.GetAll(iIdFuncionario);i++){
			// Variables para Paginacion
			int iRowMaxTemp = 1;
			int iRowCountTemp = 0;
			String vTempCampo1 = "";
			String vTempCampo2 = "";
			String vTempCampo3 = "";
			String vTempCampo4 = "";
			// Variables para Paginacion
			iRowsAnt = iRowsCount;
		
			int 	iIdRenglon			= oAnexo.GetIdRenglon(i)!=-1?			oAnexo.GetIdRenglon(i):0;
			String 	sIdentificacion		= oAnexo.GetIdentificacion(i)!=null?	oAnexo.GetIdentificacion(i)+"":"";
			//Primer Elemento que su contenido puede llevar a un salto de pagina
			iLenCol = sIdentificacion.length();
			iRowsXCol = 1;
			if(iLenCol > 22){
				if(iLenCol%22 == 0){
					iRowsXCol = iLenCol/22;
				}else{
					iRowsXCol = (iLenCol/22)+1;
				}
				String temp = sIdentificacion;
				sIdentificacion = "";
				iRowCountTemp = 0 ;
				for(int x=1;x<=(iRowsXCol);x++){
					int max = (22*x)<=iLenCol ? (22*x) : iLenCol;
					if( (x + iRowsAnt) <= iMaxRowXPag) {
						sIdentificacion = sIdentificacion + temp.substring((22*(x-1)), max) + "<br>";
						}
					else {
						iRowCountTemp = iRowCountTemp + 1;
						vTempCampo1 = vTempCampo1 + temp.substring((22*(x-1)), max) + "<br>";
						}
				}
				iRowMaxTemp = iRowMaxTemp >= iRowCountTemp ? iRowMaxTemp : iRowCountTemp ;
			}else{
				iRowsMax = 1;
			}	
			iRowsMax = iRowsXCol;
			iRowsCount = iRowsMax + iRowsCount;
			iRowsMax = iRowsXCol;
			// Primer Elemento que su contenido puede llevar a un salto de pagina
			
			String 	sDiskette 			= oAnexo.GetDiskette(i)!=null?			oAnexo.GetDiskette(i):"";
			if (sDiskette.equals("1")){sDiskette="SI";}else{sDiskette="NO";}
			
			String 	sCD 				= oAnexo.GetCD(i)!=null?				oAnexo.GetCD(i):"";
			if (sCD.equals("1")){sCD="SI";}else{sCD="NO";}
			
			String 	sPeriodo 			= oAnexo.GetPeriodo(i)!=null?			oAnexo.GetPeriodo(i):"";
			// Elemento que su contenido puede llevar a un salto de pagina
			iLenCol = sPeriodo.length();
			if(iLenCol > 22){
				if(iLenCol%22 == 0){
					iRowsXCol = iLenCol/22;
				}else{
					iRowsXCol = (iLenCol/22)+1;
				}
				if (iRowsXCol > iRowsMax){
				    iRowsCount = iRowsXCol - iRowsMax + iRowsCount;
					iRowsMax = iRowsXCol;
				}
				String temp = sPeriodo;
				sPeriodo = "";
				iRowCountTemp = 0 ;
				for(int x=1;x<=(iRowsXCol);x++){
					int max = (22*x)<=iLenCol ? (22*x) : iLenCol;
					if( (x + iRowsAnt) <= iMaxRowXPag) {
						sPeriodo = sPeriodo + temp.substring((22*(x-1)), max) + "<br>";	}
					else {
						iRowCountTemp = iRowCountTemp + 1;
						vTempCampo2 = vTempCampo2 + temp.substring((22*(x-1)), max) + "<br>";	}
				}
				iRowMaxTemp = iRowMaxTemp >= iRowCountTemp ? iRowMaxTemp : iRowCountTemp ;
			}else{
				iRowsXCol = 1;
			}
			// Elemento que su contenido puede llevar a un salto de pagina
			
			String 	sUbicacion 			= oAnexo.GetUbicacion(i)!=null?			oAnexo.GetUbicacion(i):"";
			// Elemento que su contenido puede llevar a un salto de pagina
			iLenCol = sUbicacion.length();
			if(iLenCol > 22){
				if(iLenCol%22 == 0){
					iRowsXCol = iLenCol/22;
				}else{
					iRowsXCol = (iLenCol/22)+1;
				}
				if (iRowsXCol > iRowsMax){
				    iRowsCount = iRowsXCol - iRowsMax + iRowsCount;
					iRowsMax = iRowsXCol;
				}
				String temp = sUbicacion;
				sUbicacion = "";
				iRowCountTemp = 0 ;
				for(int x=1;x<=(iRowsXCol);x++){
					int max = (22*x)<=iLenCol ? (22*x) : iLenCol;
					if( (x + iRowsAnt) <= iMaxRowXPag) {
						sUbicacion = sUbicacion + temp.substring((22*(x-1)), max) + "<br>";	}
					else {
						iRowCountTemp = iRowCountTemp + 1;
						vTempCampo3 = vTempCampo3 + temp.substring((22*(x-1)), max) + "<br>";	}
				}
				iRowMaxTemp = iRowMaxTemp >= iRowCountTemp ? iRowMaxTemp : iRowCountTemp ;
			}else{
				iRowsXCol = 1;
			}
			// Elemento que su contenido puede llevar a un salto de pagina
			
			String 	sPrograma 			= oAnexo.GetPrograma(i)!=null?			oAnexo.GetPrograma(i):"";
			// Elemento que su contenido puede llevar a un salto de pagina
			iLenCol = sPrograma.length();
			if(iLenCol > 22){
				if(iLenCol%22 == 0){
					iRowsXCol = iLenCol/22;
				}else{
					iRowsXCol = (iLenCol/22)+1;
				}
				if (iRowsXCol > iRowsMax){
				    iRowsCount = iRowsXCol - iRowsMax + iRowsCount;
					iRowsMax = iRowsXCol;
				}
				String temp = sPrograma;
				sPrograma = "";
				iRowCountTemp = 0 ;
				for(int x=1;x<=(iRowsXCol);x++){
					int max = (22*x)<=iLenCol ? (22*x) : iLenCol;
					if( (x + iRowsAnt) <= iMaxRowXPag) {
						sPrograma = sPrograma + temp.substring((22*(x-1)), max) + "<br>";	}
					else {
						iRowCountTemp = iRowCountTemp + 1;
						vTempCampo4 = vTempCampo4 + temp.substring((22*(x-1)), max) + "<br>";	}
				}
				iRowMaxTemp = iRowMaxTemp >= iRowCountTemp ? iRowMaxTemp : iRowCountTemp ;
			}else{
				iRowsXCol = 1;
			}
			// Elemento que su contenido puede llevar a un salto de pagina
			
			intContador = intContador + 1;
			if(intContador%2 == 0){
				sBackColor = "#ffffff";
			}else{
				sBackColor = "#dddddd";
			}
%>
		<TR align="left" bgcolor="<%=sBackColor%>">
			<TD class="ContenidoImprL">&nbsp;<%=sIdentificacion%></TD>
			<TD class="ContenidoImpr" align="center"><%=sDiskette%></TD>
			<TD class="ContenidoImpr" align="center"><%=sCD%></TD>
			<TD class="ContenidoImpr">&nbsp;<%=sPeriodo%></TD>
			<TD class="ContenidoImpr">&nbsp;<%=sUbicacion%></TD>
			<TD class="ContenidoImprR">&nbsp;<%=sPrograma%></TD>
		</TR>
		<%
		if ((!vTempCampo1.equals("") || !vTempCampo2.equals("") || !vTempCampo3.equals("") || !vTempCampo4.equals("")) 
		|| iRowsCount>=iMaxRowXPag ){
		%>
		<tr><td colspan="6" class="ContenidoImprB">&nbsp;</td></tr>
	</TABLE>
</td>
</tr>
</table>
<p style="page-break-after:always"></p>
<%@include file="HeaderAnexo.jsp"%>
<br>
<table border="0" cellspacing="0" cellpadding="0" width="900">
<tr>
	<td valign="top">
	<TABLE cellPadding="0" cellSpacing="0" width="100%" BORDER="1" BORDERCOLOR="white">
		<TR><TD class="TituloParrafoImpr">RELACIÓN DE RESPALDO DE ARCHIVOS Y CARPETAS EN DISKETTES O CD'S</TD></TR>  
	</TABLE>
	<TABLE cellPadding="0" cellSpacing="0" width="100%" BORDER="1" BORDERCOLOR="white">
		<TR align="middle">
			<td class="TituloMenuImpr" width="185">IDENTIFICACIÓN DEL ARCHIVO</TD>
			<td class="TituloMenuImpr" width="80">DISKETTE</TD>
			<td class="TituloMenuImpr" width="80">C.D.</TD>
			<td class="TituloMenuImpr" width="185">PERIODO COMPRENDIDO</TD>
			<td class="TituloMenuImpr" width="185">UBICACIÓN</TD>
			<td class="TituloMenuImpr" width="185">PROGRAMA</TD>
		</TR>
		<%if (!vTempCampo1.equals("") || !vTempCampo2.equals("") || !vTempCampo3.equals("") || !vTempCampo4.equals("")){%>
		<TR align="left" bgcolor="<%=sBackColor%>">
			<TD class="ContenidoImprL">&nbsp;<%=vTempCampo1%></TD>
			<TD class="ContenidoImpr" align="center">&nbsp;</TD>
			<TD class="ContenidoImpr" align="center">&nbsp;</TD>
			<TD class="ContenidoImpr">&nbsp;<%=vTempCampo2%></TD>
			<TD class="ContenidoImpr">&nbsp;<%=vTempCampo3%></TD>
			<TD class="ContenidoImprR">&nbsp;<%=vTempCampo4%></TD>
		</TR>
<%
			}
		}
			iRowsCount = iRowsCount>=iMaxRowXPag?iRowMaxTemp:iRowsCount;
			
		} // FIN DEL FOR
//Si existe la paginacion debera repetir esto
		%>
	<tr><td colspan="6" class="ContenidoImprB">&nbsp;</td></tr>
	</TABLE>
</td>
</tr>
</table>
<%@include file="FooterAnexo.jsp"%>
</body>
</html>
<%
} else {
%>
</table>
	<TABLE width="100%">
		<TR>
			<TD align="center"><H1 style="size=+2"><br>ESTE ANEXO NO APLICA</H1></TD>
		</TR>
	</TABLE>
</td>
</tr>
</table>
<br>
<%@include file="FooterAnexo.jsp"%>
</body>
</html>
<%}%>
