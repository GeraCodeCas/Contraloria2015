<%/*********************************************************************************************************
Elaboro:	Julio Enrique Espinosa Torres
Lugar:		Monterrey, NL
Fecha:		12.Nov.2002
Compañia:	CONSISS*/%>
<%@page import="com.consiss.util.tools.*"%>
<%@page import="com.gob.*"%>
<%@page import="java.util.*" %>
<%
int iIdFuncionario =  java.lang.Integer.parseInt(
			(request.getParameter("iIdFuncionario")!= null?request.getParameter("iIdFuncionario"):"0") );

String sAnexo = "III.3";
Anexo3III oAnexo3III 	= new Anexo3III();
String sPath = "../";
int numpag = 0;
int numtot = 0;
int iIdAnexo = oAnexo3III.GetIdAnexo();
AnexoEstatus	oAnexoEstatus		= new AnexoEstatus();
oAnexoEstatus.Get(iIdFuncionario, iIdAnexo);
String sEstatus = oAnexoEstatus.GetEstatus();
%>
<html>
<head>
	<title>Entrega - Recepción : Anexo III.3 (Impresión)</title>
<script language="JavaScript" src="<%=sPath%>Scripts/Gobierno.js"></script>
<link rel="stylesheet" type="text/css" href="<%=sPath%>Styles/Gobierno.css">
<script language="JavaScript">
function closewin(){
				 window.close();
}
</script>
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
	<TR><TD class="TituloParrafoImpr">RELACIÓN DE MANUALES DE ORGANIZACIÓN, POLÍTICAS Y NORMAS DE ADMINISTRACIÓN INTERNA</TD></TR>  
	</TABLE>
	<TABLE cellPadding="0" cellSpacing="0" width="100%" BORDER="1" BORDERCOLOR="white">
		<TR align="middle">
			<td width="450" class="TituloMenuImpr">Título</TD>
			<td width="450" class="TituloMenuImpr">Área de Aplicación</TD>
		</TR>
<%		
if(!sEstatus.equals("0")){
			int intContador = 0;
			String sBackColor = "";
			oAnexo3III.GetAll(iIdFuncionario);
			// Variables para Paginacion
			int iLenCol = 0;
			int iRowsMax = 0; // POR REGISTRO
			int iRowsXCol = 0;
			int iRowsCount = 0;
			int iRowsAnt = 0; //posicion anterior
			int iMaxRowXPag = 25; //Numero de Renglones por Pagina
			// Variables para Paginacion
			
		for(int i=0;i<oAnexo3III.GetAll(iIdFuncionario);i++){
			// Variables para Paginacion
			int iRowMaxTemp = 1;
			int iRowCountTemp = 0;
			String vTempCampo1 = "";
			String vTempCampo2 = "";
			// Variables para Paginacion		
			iRowsAnt = iRowsCount;
			
		    String vIdRenglon 				    = oAnexo3III.GetIdRenglon(i)!=-1?oAnexo3III.GetIdRenglon(i)+"":"0";
			String vTitulo 			= oAnexo3III.GetTitulo(i)!=null?oAnexo3III.GetTitulo(i):"";
			//Primer Elemento que su contenido puede llevar a un salto de pagina
			iLenCol = vTitulo.length();
			iRowsXCol = 1;
			if(iLenCol > 60){
				if(iLenCol%60 == 0){
					iRowsXCol = iLenCol/60;
				}else{
					iRowsXCol = (iLenCol/60)+1;
				}
				String temp = vTitulo;
				vTitulo = "";
				iRowCountTemp = 0 ;
				for(int x=1;x<=(iRowsXCol);x++){
					int max = (60*x)<=iLenCol ? (60*x) : iLenCol;
					if( (x + iRowsAnt) <= iMaxRowXPag) {
						vTitulo = vTitulo + temp.substring((60*(x-1)), max) + "<br>";
						}
					else {
						iRowCountTemp = iRowCountTemp + 1;
						vTempCampo1 = vTempCampo1 + temp.substring((60*(x-1)), max) + "<br>";
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
			
			String vAreaAplicacion 				= oAnexo3III.GetAreaAplicacion(i)!=null?oAnexo3III.GetAreaAplicacion(i):"";
			// Elemento que su contenido puede llevar a un salto de pagina
			iLenCol = vAreaAplicacion.length();
			if(iLenCol > 60){
				if(iLenCol%60 == 0){
					iRowsXCol = iLenCol/60;
				}else{
					iRowsXCol = (iLenCol/60)+1;
				}
				if (iRowsXCol > iRowsMax){
				    iRowsCount = iRowsXCol - iRowsMax + iRowsCount;
					iRowsMax = iRowsXCol;
				}
				String temp = vAreaAplicacion;
				vAreaAplicacion = "";
				iRowCountTemp = 0 ;
				for(int x=1;x<=(iRowsXCol);x++){
					int max = (60*x)<=iLenCol ? (60*x) : iLenCol;
					if( (x + iRowsAnt) <= iMaxRowXPag) {
						vAreaAplicacion = vAreaAplicacion + temp.substring((60*(x-1)), max) + "<br>";	}
					else {
						iRowCountTemp = iRowCountTemp + 1;
						vTempCampo2 = vTempCampo2 + temp.substring((60*(x-1)), max) + "<br>";	}
				}
				iRowMaxTemp = iRowMaxTemp >= iRowCountTemp ? iRowMaxTemp : iRowCountTemp ;
			}else{
				iRowsXCol = 1;
			}
			// Elemento que su contenido puede llevar a un salto de pagina
			
			intContador = intContador + 1;
		 if (intContador%2 == 0){
					sBackColor = "#ffffff";
				}else{
					sBackColor = "#dddddd";
			  }%>
		<TR align="left" bgcolor="<%=sBackColor%>">
			<TD valign="top"  class="ContenidoImprL"><%=vTitulo%></TD>
			<TD valign="top" class="ContenidoImprR"><%=vAreaAplicacion%></TD>
		</TR>
		<%
		//Si existe la paginacion debera repetir esto		
		if ( (!vTempCampo1.equals("") || !vTempCampo2.equals(""))
			|| iRowsCount>=iMaxRowXPag ){
		%>
		<tr>
			<td colspan="2" class="ContenidoImprB">&nbsp;</td>
		</tr>
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
	<TR><TD class="TituloParrafoImpr">RELACIÓN DE MANUALES DE ORGANIZACIÓN, POLÍTICAS Y NORMAS DE ADMINISTRACIÓN INTERNA</TD></TR>  
	</TABLE>
	<TABLE cellPadding="0" cellSpacing="0" width="100%" BORDER="1" BORDERCOLOR="white">
		<TR align="middle">
			<td width="450" class="TituloMenuImpr">Título</TD>
			<td width="450" class="TituloMenuImpr">Área de Aplicación</TD>
		</TR>
		<%if (!vTempCampo1.equals("") || !vTempCampo2.equals("")){
			if (vTempCampo1.equals("")) vTempCampo1 = "&nbsp;";
			if (vTempCampo2.equals("")) vTempCampo2 = "&nbsp;";%>
		<TR align="left" bgcolor="<%=sBackColor%>">
			<TD valign="top"  class="ContenidoImprL"><%=vTempCampo1%></TD>
			<TD valign="top" class="ContenidoImprR"><%=vTempCampo2%></TD>
		</TR>
		<%
			}
		}
			iRowsCount = iRowsCount>=iMaxRowXPag?iRowMaxTemp:iRowsCount;
			
		} // FIN DEL FOR
//Si existe la paginacion debera repetir esto
		%>
		<tr>
			<td colspan="2" class="ContenidoImprB">&nbsp;</td>
		</tr>
	</TABLE>
</td>
</tr>
</table>
<TABLE cellPadding="0" cellSpacing="0" width="100%" BORDER="1" BORDERCOLOR="white">
</TABLE>
<%@include file="FooterAnexo.jsp"%>
</div> 
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