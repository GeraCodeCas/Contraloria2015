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

Anexo3XIII oAnexo	= new Anexo3XIII();
int iIdAnexo = oAnexo.GetIdAnexo();
String sPath = "../";
int numpag = 0;
int numtot = 0;
String sAnexo = "III.13";
AnexoEstatus	oAnexoEstatus		= new AnexoEstatus();
oAnexoEstatus.Get(iIdFuncionario, iIdAnexo);
String sEstatus = oAnexoEstatus.GetEstatus();
%>
<html>
<head>
	<title>Entrega - Recepción : Anexo III.13 (Impresión)</title>
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
		<TR><TD class="TituloParrafoImpr">RELACIÓN DE COMPROMISOS PRESIDENCIALES PENDIENTES</TD></TR>  
	</TABLE>
	<TABLE cellPadding="0" cellSpacing="0" width="100%" BORDER="1" BORDERCOLOR="white">
		<TR align="middle">
			<td class="TituloMenuImpr" width="200">No. DE COMPROMISO</TD>
			<td class="TituloMenuImpr" width="100">FECHA</TD>
			<td class="TituloMenuImpr" width="250">DESCRIPCIÓN DEL COMPROMISO</TD>
			<td class="TituloMenuImpr" width="150">SITUACIÓN ACTUAL</TD>
			<td class="TituloMenuImpr" width="100">% AVANCE FÍSICO</TD>
			<td class="TituloMenuImpr" width="100">% AVANCE FINANCIERO</TD>
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
			// Variables para Paginacion
			iRowsAnt = iRowsCount;
			
			int 	iIdRenglon			= oAnexo.GetIdRenglon(i)!=-1?			oAnexo.GetIdRenglon(i):0;
			String 	sNoCompromiso		= oAnexo.GetNoCompromiso(i)!=null?		oAnexo.GetNoCompromiso(i)+"":"";
			//Primer Elemento que su contenido puede llevar a un salto de pagina
			iLenCol = sNoCompromiso.length();
			iRowsXCol = 1;
			if(iLenCol > 27){
				if(iLenCol%27 == 0){
					iRowsXCol = iLenCol/27;
				}else{
					iRowsXCol = (iLenCol/27)+1;
				}
				String temp = sNoCompromiso;
				sNoCompromiso = "";
				iRowCountTemp = 0 ;
				for(int x=1;x<=(iRowsXCol);x++){
					int max = (27*x)<=iLenCol ? (27*x) : iLenCol;
					if( (x + iRowsAnt) <= iMaxRowXPag) {
						sNoCompromiso = sNoCompromiso + temp.substring((27*(x-1)), max) + "<br>";
						}
					else {
						iRowCountTemp = iRowCountTemp + 1;
						vTempCampo1 = vTempCampo1 + temp.substring((27*(x-1)), max) + "<br>";
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
			
			String 	svFecha 				= oAnexo.GetFecha(i)!=null?				oAnexo.GetFecha(i):"";
			String 	sDescripcion	  	= oAnexo.GetDescripcion(i)!=null?		oAnexo.GetDescripcion(i):"";
			// Elemento que su contenido puede llevar a un salto de pagina
			iLenCol = sDescripcion.length();
			if(iLenCol > 30){
				if(iLenCol%30 == 0){
					iRowsXCol = iLenCol/30;
				}else{
					iRowsXCol = (iLenCol/30)+1;
				}
				if (iRowsXCol > iRowsMax){
				    iRowsCount = iRowsXCol - iRowsMax + iRowsCount;
					iRowsMax = iRowsXCol;
				}
				String temp = sDescripcion;
				sDescripcion = "";
				iRowCountTemp = 0 ;
				for(int x=1;x<=(iRowsXCol);x++){
					int max = (30*x)<=iLenCol ? (30*x) : iLenCol;
					if( (x + iRowsAnt) <= iMaxRowXPag) {
						sDescripcion = sDescripcion + temp.substring((30*(x-1)), max) + "<br>";	}
					else {
						iRowCountTemp = iRowCountTemp + 1;
						vTempCampo2 = vTempCampo2 + temp.substring((30*(x-1)), max) + "<br>";	}
				}
				iRowMaxTemp = iRowMaxTemp >= iRowCountTemp ? iRowMaxTemp : iRowCountTemp ;
			}else{
				iRowsXCol = 1;
			}
			// Elemento que su contenido puede llevar a un salto de pagina
			
			int 	iSituacion 			= oAnexo.GetSituacion(i)!=-1?			oAnexo.GetSituacion(i):0;
			String 	sSituacion 			= oAnexo.GetSituacionDescripcion(i)!=null?		oAnexo.GetSituacionDescripcion(i):"";
			String 	sAvanceFisico 		= oAnexo.GetAvanceFisico(i)!=null?		oAnexo.GetAvanceFisico(i):"";
			String 	sAvanceFinanciero	= oAnexo.GetAvanceFinanciero(i)!=null?	oAnexo.GetAvanceFinanciero(i):"";
			intContador = intContador + 1;
			if(intContador%2 == 0){
				sBackColor = "#ffffff";
			}else{
				sBackColor = "#dddddd";
			}
%>
		<TR align="left" bgcolor="<%=sBackColor%>">
			<TD class="ContenidoImprL" align="right">&nbsp;<%=sNoCompromiso%></TD>
			<TD class="ContenidoImpr" align="center"><%=svFecha%></TD>
			<TD class="ContenidoImpr"><%=sDescripcion%></TD>
			<TD class="ContenidoImpr"><%=sSituacion%></TD>
			<TD class="ContenidoImpr" align="right"><%=sAvanceFisico%></TD>
			<TD class="ContenidoImprR" align="right">&nbsp;<%=sAvanceFinanciero%></TD>
		</TR>
		<%
		if ((!vTempCampo1.equals("") || !vTempCampo2.equals("")) 
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
		<TR><TD class="TituloParrafoImpr">RELACIÓN DE COMPROMISOS PRESIDENCIALES PENDIENTES</TD></TR>  
	</TABLE>
	<TABLE cellPadding="0" cellSpacing="0" width="100%" BORDER="1" BORDERCOLOR="white">
		<TR align="middle">
			<td class="TituloMenuImpr" width="200">No. DE COMPROMISO</TD>
			<td class="TituloMenuImpr" width="100">FECHA</TD>
			<td class="TituloMenuImpr" width="250">DESCRIPCIÓN DEL COMPROMISO</TD>
			<td class="TituloMenuImpr" width="150">SITUACIÓN ACTUAL</TD>
			<td class="TituloMenuImpr" width="100">AVANCE FÍSICO</TD>
			<td class="TituloMenuImpr" width="100">AVANCE FINANCIERO</TD>
		</TR>
		<%if (!vTempCampo1.equals("") || !vTempCampo2.equals("")){
				if (vTempCampo1.equals("")) vTempCampo1 = "&nbsp;";
				if (vTempCampo2.equals("")) vTempCampo2 = "&nbsp;";%>
		<TR align="left" bgcolor="<%=sBackColor%>">
			<TD class="ContenidoImprL" align="right">&nbsp;<%=vTempCampo1%></TD>
			<TD class="ContenidoImpr" align="center">&nbsp;</TD>
			<TD class="ContenidoImpr"><%=vTempCampo2%></TD>
			<TD class="ContenidoImpr">&nbsp;</TD>
			<TD class="ContenidoImpr" align="right">&nbsp;</TD>
			<TD class="ContenidoImprR" align="right">&nbsp;</TD>
		</TR>
<%
			}
		}
			iRowsCount = iRowsCount>=iMaxRowXPag?iRowMaxTemp:iRowsCount;
			
		} // FIN DEL FOR
//Si existe la paginacion debera repetir esto
		%>
	<tr><td colspan="8" class="ContenidoImprB">&nbsp;</td></tr>
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
