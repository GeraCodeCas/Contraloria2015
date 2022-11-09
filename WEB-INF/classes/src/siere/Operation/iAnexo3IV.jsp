<%/*********************************************************************************************************
Elaboro:	Julio Enrique Espinosa Torres
Lugar:		Monterrey, NL
TotalPersonas:		8.Nov.2002
Compañia:	CONSISS*/%>
<%@page import="com.consiss.util.tools.*"%>
<%@page import="com.gob.*"%>
<%@page import="java.util.*" %>
<%
int iIdFuncionario =  java.lang.Integer.parseInt(
			(request.getParameter("iIdFuncionario")!= null?request.getParameter("iIdFuncionario"):"0") );

java.text.DecimalFormat myFormatter = new java.text.DecimalFormat("###,##0.00");

String sAnexo = "III.4";
Anexo3IV oAnexo3IV 	= new Anexo3IV();
String sPath = "../";
int numpag = 0;
int numtot = 0;
int iIdAnexo = oAnexo3IV.GetIdAnexo();
AnexoEstatus	oAnexoEstatus		= new AnexoEstatus();
oAnexoEstatus.Get(iIdFuncionario, iIdAnexo);
String sEstatus = oAnexoEstatus.GetEstatus();
%>
<html>
<head>
	<title>Entrega - Recepción : Anexo III.4 (Impresión)</title>
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
	<TR><TD class="TituloParrafo">RESUMEN DE PLAZAS AUTORIZADAS</TD></TR>  
	</TABLE>
	<TABLE cellPadding="0" cellSpacing="0" width="100%" BORDER="1" BORDERCOLOR="white">
		<TR align="middle">
			<td rowspan="2" class="TituloMenuImpr">Categoría</TD>
			<td rowspan="2" class="TituloMenuImpr">Total de Personas</TD>
			<td rowspan="2" class="TituloMenuImpr">Total de Sueldos</TD>
			<td class="TituloMenuImpr" colspan="3">Clasificación de Personal</td>
		</TR>
		<TR align="middle">
			<td class="TituloMenuImpr">Confianza</td>
			<td class="TituloMenuImpr">Base</td>
			<td class="TituloMenuImpr">Otros</td>
		</TR>
<%		
if(!sEstatus.equals("0")){
			int intContador = 0;
			String sBackColor = "";
			oAnexo3IV.GetAll(iIdFuncionario);
			
			// Variables para Paginacion
			int iRowsMax = 0; // POR REGISTRO
			int iRowsCount = 0;
			int iRowsAnt = 0; //posicion anterior
			int iMaxRowXPag = 24; //Numero de Renglones por Pagina
			// Variables para Paginacion
			
		for(int i=0;i<oAnexo3IV.GetAll(iIdFuncionario);i++){
			iRowsCount = iRowsCount +1;
			
			String vIdRenglon 				= oAnexo3IV.GetIdRenglon(i)!=-1?oAnexo3IV.GetIdRenglon(i)+"":"0";
			String vCategoria 			= oAnexo3IV.GetCategoria(i)!=null?oAnexo3IV.GetCategoria(i):"";
			String vTotalPersonas		          = oAnexo3IV.GetTotalPersonas(i)!=null?oAnexo3IV.GetTotalPersonas(i):"";
			String vTotalSueldos 					= oAnexo3IV.GetTotalSueldos(i)!=null?oAnexo3IV.GetTotalSueldos(i):"0";
			try{vTotalSueldos = myFormatter.format(new Double(!vTotalSueldos.trim().equals("")?vTotalSueldos:"0"));} 
			catch(Throwable e){System.out.println("iAnexo3iv.GetTotalSueldos: " + e + " " + oAnexo3IV.GetTotalSueldos(i));}
			String vConfianza 					= oAnexo3IV.GetConfianza(i)!=null?oAnexo3IV.GetConfianza(i):"";
			String vBase 		= oAnexo3IV.GetBase(i)!=null?oAnexo3IV.GetBase(i):"";
			String vOtros 		= oAnexo3IV.GetOtros(i)!=null?oAnexo3IV.GetOtros(i):"";

			intContador = intContador + 1;
		 if (intContador%2 == 0){
					sBackColor = "#ffffff";
				}else{
					sBackColor = "#dddddd";
			  }%>
		<TR align="left" bgcolor="<%=sBackColor%>">
			<TD width="400" class="ContenidoImprL">&nbsp;<%=vCategoria%></TD>
			<TD class="ContenidoImpr" align="center">&nbsp;<%=vTotalPersonas%></TD>
			<TD class="ContenidoImpr" align="right"><%=vTotalSueldos%></TD>
			<td class="ContenidoImpr" align="center"><%=vConfianza%>&nbsp;&nbsp;</td>
			<td width="100" class="ContenidoImpr" align="center"><%=vBase%>&nbsp;&nbsp;</td>
			<td width="100" class="ContenidoImprR" align="center"><%=vOtros%>&nbsp;&nbsp;</td>
		</TR>
		<%
		//Si existe la paginacion debera repetir esto		
		if (iRowsCount>=iMaxRowXPag) {
		%>
		<tr>
			<td colspan="6" class="ContenidoImprB">&nbsp;</td>
		</tr>
	</TABLE>
</td>
	<!-- contenido -->
</tr>
</table>
<!-- Paginacion -->
<p style="page-break-after:always"></p>
<%@include file="HeaderAnexo.jsp"%>
<br>
<table border="0" cellspacing="0" cellpadding="0" width="900">
<tr>
	<td valign="top">
	<TABLE cellPadding="0" cellSpacing="0" width="100%" BORDER="1" BORDERCOLOR="white">
	<TR><TD class="TituloParrafo">RESUMEN DE PLAZAS AUTORIZADAS</TD></TR>  
	</TABLE>
	<TABLE cellPadding="0" cellSpacing="0" width="100%" BORDER="1" BORDERCOLOR="white">
		<TR align="middle">
			<td rowspan="2" class="TituloMenuImpr">Categoría</TD>
			<td rowspan="2" class="TituloMenuImpr">Total de Personas</TD>
			<td rowspan="2" class="TituloMenuImpr">Total de Sueldos</TD>
			<td class="TituloMenuImpr" colspan="3">Clasificación de Personal</td>
		</TR>
		<TR align="middle">
			<td class="TituloMenuImpr">Confianza</td>
			<td class="TituloMenuImpr">Base</td>
			<td class="TituloMenuImpr">Otros</td>
		</TR>
		<%
			
		}
			iRowsCount = iRowsCount>=iMaxRowXPag?1:iRowsCount;
			
		} // FIN DEL FOR
//Si existe la paginacion debera repetir esto
		%>
		<tr>
			<td colspan="6" class="ContenidoImprB">&nbsp;</td>
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