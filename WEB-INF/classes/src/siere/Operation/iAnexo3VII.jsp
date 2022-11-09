<%@page import="com.consiss.util.tools.*"%>
<%@page import="com.gob.*"%>
<%@page import="java.util.*" %>
<%
/********************************************************************************************************
'Elaboro:	Jesus Limon
'Lugar:		Monterrey, NL
'Fecha:		29.Nov.2002
'Compañia:	CONSISS
'Ultima Modificacion: Claudia Sandoval
'By: 16.Dic.02
'
'Ultima Modificacion: 07.Ene.2003
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

java.text.DecimalFormat myFormatter = new java.text.DecimalFormat("###,##0.00");
String sAnexo = "III.7";
Anexo3VII oAnexo	= new Anexo3VII();
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
	<title>Entrega - Recepción : Anexo III.7 (Impresión)</title>
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
	<TR><TD class="TituloParrafoImpr">RELACI&Oacute;N DE FORMAS OFICIALES</TD></TR>  
	</TABLE>
	<TABLE cellPadding="0" cellSpacing="0" width="100%" BORDER="1" BORDERCOLOR="white">
		<TR align="middle">
			<td width="150" class="TituloMenuImpr">No. FORMA</TD>
			<td width="150" class="TituloMenuImpr">CANTIDAD</TD>
			<td width="150" class="TituloMenuImpr">NOMBRE O DESCRIPCIÓN</TD>
			<td width="150" class="TituloMenuImpr">PRECIO UNITARIO</TD>
			<td width="150" class="TituloMenuImpr">IMPORTE TOTAL</TD>
			<td width="150" class="TituloMenuImpr">AREA RESPONSABLE</TD>
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
			String 	sNoForma			= oAnexo.GetNoForma(i)!=null?			oAnexo.GetNoForma(i)+"":"";
			int 	iCantidad 			= oAnexo.GetCantidad(i)!=-1?			oAnexo.GetCantidad(i):0;
			String 	sNombre 		  	= oAnexo.GetNombre(i)!=null?			oAnexo.GetNombre(i):"";
			//Primer Elemento que su contenido puede llevar a un salto de pagina
			iLenCol = sNombre.length();
			iRowsXCol = 1;
			if(iLenCol > 20){
				if(iLenCol%20 == 0){
					iRowsXCol = iLenCol/20;
				}else{
					iRowsXCol = (iLenCol/20)+1;
				}
				String temp = sNombre;
				sNombre = "";
				iRowCountTemp = 0 ;
				for(int x=1;x<=(iRowsXCol);x++){
					int max = (20*x)<=iLenCol ? (20*x) : iLenCol;
					if( (x + iRowsAnt) <= iMaxRowXPag) {
						sNombre = sNombre + temp.substring((20*(x-1)), max) + "<br>";
						}
					else {
						iRowCountTemp = iRowCountTemp + 1;
						vTempCampo1 = vTempCampo1 + temp.substring((20*(x-1)), max) + "<br>";
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
		
			float 	iPrecioUnitario  	= oAnexo.GetPrecioUnitario(i)!=-1?		oAnexo.GetPrecioUnitario(i):0;
			String 	sAreaResponsable 	= oAnexo.GetAreaResponsable(i)!=null?	oAnexo.GetAreaResponsable(i):"";
			// Elemento que su contenido puede llevar a un salto de pagina
			iLenCol = sAreaResponsable.length();
			if(iLenCol > 20){
				if(iLenCol%20 == 0){
					iRowsXCol = iLenCol/20;
				}else{
					iRowsXCol = (iLenCol/20)+1;
				}
				if (iRowsXCol > iRowsMax){
				    iRowsCount = iRowsXCol - iRowsMax + iRowsCount;
					iRowsMax = iRowsXCol;
				}
				String temp = sAreaResponsable;
				sAreaResponsable = "";
				iRowCountTemp = 0 ;
				for(int x=1;x<=(iRowsXCol);x++){
					int max = (20*x)<=iLenCol ? (20*x) : iLenCol;
					if( (x + iRowsAnt) <= iMaxRowXPag) {
						sAreaResponsable = sAreaResponsable + temp.substring((20*(x-1)), max) + "<br>";	}
					else {
						iRowCountTemp = iRowCountTemp + 1;
						vTempCampo2 = vTempCampo2 + temp.substring((20*(x-1)), max) + "<br>";	}
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
		<TR valign="top" align="left" bgcolor="<%=sBackColor%>">
			<TD class="ContenidoImprL">&nbsp;<%=sNoForma%></TD>
			<TD class="ContenidoImpr" align="right"><%=iCantidad%></TD>
			<TD class="ContenidoImpr"><%=sNombre%></TD>
			<TD class="ContenidoImpr" align="right"><%=myFormatter.format(iPrecioUnitario)%></TD>
			<TD class="ContenidoImpr" align="right"><%=myFormatter.format(iPrecioUnitario * iCantidad)%></TD>
			<TD class="ContenidoImprR">&nbsp;<%=sAreaResponsable%></TD>
		</TR><%
		if ((!vTempCampo1.equals("") || !vTempCampo2.equals("")) || iRowsCount>=iMaxRowXPag ){
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
	<TR><TD class="TituloParrafoImpr">RELACIÓN DE FORMAS FISCALES</TD></TR>  
	</TABLE>
	<TABLE cellPadding="0" cellSpacing="0" width="100%" BORDER="1" BORDERCOLOR="white">
		<TR align="middle">
			<td width="150" class="TituloMenuImpr">No. FORMA</TD>
			<td width="150" class="TituloMenuImpr">CANTIDAD</TD>
			<td width="150" class="TituloMenuImpr">NOMBRE O DESCRIPCIÓN</TD>
			<td width="150" class="TituloMenuImpr">PRECIO UNITARIO</TD>
			<td width="150" class="TituloMenuImpr">IMPORTE TOTAL</TD>
			<td width="150" class="TituloMenuImpr">AREA RESPONSABLE</TD>
		</TR>
		<%if (!vTempCampo1.equals("") || !vTempCampo2.equals("")){
				if (vTempCampo1.equals("")) vTempCampo1 = "&nbsp;";%>
		<TR align="left" bgcolor="<%=sBackColor%>" valign="top">
			<TD class="ContenidoImprL">&nbsp;</TD>
			<TD class="ContenidoImpr" align="right">&nbsp;</TD>
			<TD class="ContenidoImpr"><%=vTempCampo1%></TD>
			<TD class="ContenidoImpr" align="right">&nbsp;</TD>
			<TD class="ContenidoImpr" align="right">&nbsp;</TD>
			<TD class="ContenidoImprR">&nbsp;<%=vTempCampo2%></TD>
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
