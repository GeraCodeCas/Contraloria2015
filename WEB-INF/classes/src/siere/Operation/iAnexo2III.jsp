<%/*********************************************************************************************************
Elaboro:	Julio Enrique Espinosa Torres
Lugar:		Monterrey, NL
Fecha:		8.Nov.2002
Compañia:	CONSISS*/%>
<%@page import="com.consiss.util.tools.*"%>
<%@page import="com.gob.*"%>
<%@page import="java.util.*" %>
<%

int iIdFuncionario =  java.lang.Integer.parseInt(
			(request.getParameter("iIdFuncionario")!= null?request.getParameter("iIdFuncionario"):"0") );

String sAnexo = "II.3";
java.text.DecimalFormat myFormatter = new java.text.DecimalFormat("###,##0.00");
Anexo2III oAnexo2III 	= new Anexo2III();
String sPath = "../";
int numpag =0;
int numtot = 0;

int iIdAnexo = oAnexo2III.GetIdAnexo();
AnexoEstatus	oAnexoEstatus		= new AnexoEstatus();
oAnexoEstatus.Get(iIdFuncionario, iIdAnexo);
String sEstatus = oAnexoEstatus.GetEstatus();
%>
<html>
<head>
	<title>Entrega - Recepción : Anexo II.3 (Impresión)</title>
<script language="JavaScript" src="<%=sPath%>Scripts/Gobierno.js"></script>
<link rel="stylesheet" type="text/css" href="<%=sPath%>Styles/Gobierno.css">
<style type="text/css" media="print">
div.page  { 
	writing-mode: tb-rl;
	height: 100%;
	margin: 10% 0%;
}
</style>

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
<div align="center">
<!-- Datos que se agregaran a la tabla  -->
<%@include file="HeaderAnexo.jsp"%>
<br>
<table border="0" cellspacing="0" cellpadding="0">
<tr>
	<!-- contenido -->
	<td valign="top">
	<TABLE cellPadding="0" width="900" cellSpacing="0" BORDER="1" BORDERCOLOR="white">
	<!-- Etiqueta donde se aplican los encabezados de las tablas-->
	<TR><TD class="TituloParrafoImpr">RELACIÓN DE GASTOS PENDIENTES DE COMPROBAR</TD></TR>  
	</TABLE>
	<!-- Datos que se agregaran a la tabla  -->
	<TABLE cellPadding="0" cellSpacing="0" width="900"  BORDER="1" BORDERCOLOR="white">
	<!-- Etiqueta donde se aplican los encabezados de las tablas-->
		<TR align="middle">
			<td class="TituloMenuImpr" width="200">No. Oficio</TD>
			<td class="TituloMenuImpr"  align="center" width="100">Fecha</TD>
			<td class="TituloMenuImpr" width="200">Concepto</TD>
			<td class="TituloMenuImpr" width="100">Importe Pendiente de Comprobar</TD>
			<td class="TituloMenuImpr" width="300">Observaciones</TD>
		</TR> 
<%		
if(!sEstatus.equals("0")){
			int Contador = 0;
			String sBackColor = "";
			oAnexo2III.GetAll(iIdFuncionario);
			
			// Variables para Paginacion
			int iLenCol = 0;
			int iRowsMax = 0; // POR REGISTRO
			int iRowsXCol = 0;
			int iRowsCount = 0;
			int iRowsAnt = 0; //posicion anterior
			int iMaxRowXPag = 22; //Numero de Renglones por Pagina
			// Variables para Paginacion
		
		
		for(int i=0;i<oAnexo2III.GetAll(iIdFuncionario);i++){
			// Variables para Paginacion
			int iRowMaxTemp = 1;
			int iRowCountTemp = 0;
			String vTempCampo1 = "";
			String vTempCampo2 = "";
			String vTempCampo3 = "";	
			// Variables para Paginacion		
			iRowsAnt = iRowsCount;
		
		    String vIdRenglon 				= oAnexo2III.GetIdRenglon(i)!=-1?oAnexo2III.GetIdRenglon(i)+"":"0";
			
			String vNumeroOficio 			= oAnexo2III.GetNumeroOficio(i)!=null?oAnexo2III.GetNumeroOficio(i):"";
     		//Primer Elemento que su contenido puede llevar a un salto de pagina
			iLenCol = vNumeroOficio.length();
			iRowsXCol = 1;
			
			if(iLenCol > 27){
				if(iLenCol%27 == 0){
					iRowsXCol = iLenCol/27;
				}else{
					iRowsXCol = (iLenCol/27)+1;
				}
				
				String temp = vNumeroOficio;
				vNumeroOficio = "";
				iRowCountTemp = 0 ;
				for(int x=1;x<=(iRowsXCol);x++){
					int max = (27*x)<=iLenCol ? (27*x) : iLenCol;
					if( (x + iRowsAnt) <= iMaxRowXPag) {
						vNumeroOficio = vNumeroOficio + temp.substring((27*(x-1)), max) + "<br>";
						}
					else {
						iRowCountTemp = iRowCountTemp + 1;
						vTempCampo1 = vTempCampo1 + temp.substring((27*(x-1)), max) + "<br>";
						}
					//System.out.println("(x + iRowsAnt):" + (x + iRowsAnt) + " iMaxRowXPag:" + iMaxRowXPag + " vTempCampo1:" + vTempCampo1);
				}
				iRowMaxTemp = iRowMaxTemp >= iRowCountTemp ? iRowMaxTemp : iRowCountTemp ;
			}else{
				iRowsMax = 1;
			}	
			
			iRowsMax = iRowsXCol;
			iRowsCount = iRowsMax + iRowsCount;
			
			iRowsMax = iRowsXCol;
			
			// Primer Elemento que su contenido puede llevar a un salto de pagina
			
			
			String vFecha		          	= oAnexo2III.GetFecha(i)!=null?oAnexo2III.GetFecha(i):"";

			
			String vConcepto 				= oAnexo2III.GetConcepto(i)!=null?oAnexo2III.GetConcepto(i):"";
			// Elemento que su contenido puede llevar a un salto de pagina
			iLenCol = vConcepto.length();
			if(iLenCol > 27){
				if(iLenCol%27 == 0){
					iRowsXCol = iLenCol/27;
				}else{
					iRowsXCol = (iLenCol/27)+1;
				}
				
				if (iRowsXCol > iRowsMax){
				    iRowsCount = iRowsXCol - iRowsMax + iRowsCount;
					iRowsMax = iRowsXCol;
				}
				
				String temp = vConcepto;
				vConcepto = "";
				iRowCountTemp = 0 ;
				for(int x=1;x<=(iRowsXCol);x++){
					int max = (27*x)<=iLenCol ? (27*x) : iLenCol;
					if( (x + iRowsAnt) <= iMaxRowXPag) {
						vConcepto = vConcepto + temp.substring((27*(x-1)), max) + "<br>";	}
					else {
						iRowCountTemp = iRowCountTemp + 1;
						vTempCampo2 = vTempCampo2 + temp.substring((27*(x-1)), max) + "<br>";	}
				}
				iRowMaxTemp = iRowMaxTemp >= iRowCountTemp ? iRowMaxTemp : iRowCountTemp ;
			}else{
				iRowsXCol = 1;
			}	
			// Elemento que su contenido puede llevar a un salto de pagina
			
			String vImporte 				= oAnexo2III.GetImporte(i)!=null?oAnexo2III.GetImporte(i):"";
			
			String vObservaciones 			= oAnexo2III.GetObservaciones(i)!=null?oAnexo2III.GetObservaciones(i):"";
			// Elemento que su contenido puede llevar a un salto de pagina
			iLenCol = vObservaciones.length();
			if(iLenCol > 40){
				if(iLenCol%40 == 0){
					iRowsXCol = iLenCol/40;
				}else{
					iRowsXCol = (iLenCol/40)+1;
				}
				
				if (iRowsXCol > iRowsMax){
				    iRowsCount = iRowsXCol - iRowsMax + iRowsCount;
					iRowsMax = iRowsXCol;
				}
				
				String temp = vObservaciones;
				vObservaciones = "";
				iRowCountTemp = 0 ;
				for(int x=1;x<=(iRowsXCol);x++){
					int max = (40*x)<=iLenCol ? (40*x) : iLenCol;
					if( (x + iRowsAnt) <= iMaxRowXPag) {
						vObservaciones = vObservaciones + temp.substring((40*(x-1)), max) + "<br>";
					}
					else {
						iRowCountTemp = iRowCountTemp + 1;
						vTempCampo3= vTempCampo3 + temp.substring((40*(x-1)), max) + "<br>";
					}
				}
				iRowMaxTemp = iRowMaxTemp >= iRowCountTemp ? iRowMaxTemp : iRowCountTemp ;
			}else{
				iRowsXCol = 1;
			}	
			// Elemento que su contenido puede llevar a un salto de pagina
			%>
			
			<%Contador = Contador + 1;
		 if (Contador%2 == 0){
					sBackColor = "#ffffff";
				}else{
					sBackColor = "#dddddd";
			  }%>
		<TR align="left" bgcolor="<%=sBackColor%>">
			<TD valign="top" width="200" class="ContenidoImprL"><%=vNumeroOficio%></TD>
			<TD width="100" align="center" class="ContenidoImpr"><%=vFecha%></TD>
			<TD valign="top" width="200" class="ContenidoImpr"><%=vConcepto%></TD>
			<TD width="100" class="ContenidoImpr" align="right"><%=myFormatter.format(new Float(!vImporte.equals("")?vImporte:"0"))%>&nbsp;&nbsp;</TD>
			<TD valign="top" width="300" class="ContenidoImprR"><%=vObservaciones%></TD>
		</TR>
		<%
		//Si existe la paginacion debera repetir esto		
		if ( (!vTempCampo1.equals("") || !vTempCampo2.equals("") || !vTempCampo3.equals(""))
			|| iRowsCount>=iMaxRowXPag ){
		%>
		<tr>
			<td colspan="5" class="ContenidoImprB" height="2px">&nbsp;</td>
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
<table border="0" cellspacing="0" cellpadding="0">
<tr>
	<!-- contenido -->
	<td valign="top">
	<TABLE cellPadding="0" width="900" cellSpacing="0" BORDER="1" BORDERCOLOR="white">
	<!-- Etiqueta donde se aplican los encabezados de las tablas-->
	<TR><TD class="TituloParrafoImpr">RELACIÓN DE GASTOS PENDIENTES DE COMPROBAR</TD></TR>  
	</TABLE>
	
	<!-- Datos que se agregaran a la tabla  -->
	<TABLE cellPadding="0" cellSpacing="0" width="900"  BORDER="1" BORDERCOLOR="white">
	<!-- Etiqueta donde se aplican los encabezados de las tablas-->
		<TR align="middle">
			<td class="TituloMenuImpr" width="200">No. Oficio</TD>
			<td class="TituloMenuImpr"  align="center" width="100">Fecha</TD>
			<td class="TituloMenuImpr" width="200">Concepto</TD>
			<td class="TituloMenuImpr" width="100">Importe Pendiente de Comprobar</TD>
			<td class="TituloMenuImpr" width="300">Observaciones</TD>
	</TR> 
		<%if (!vTempCampo1.equals("") || !vTempCampo2.equals("") || !vTempCampo3.equals("")){
			if (vTempCampo1.equals("")) vTempCampo1 = "&nbsp;";
			if (vTempCampo2.equals("")) vTempCampo2 = "&nbsp;";
			if (vTempCampo3.equals("")) vTempCampo3 = "&nbsp;";%>
	<TR align="left" bgcolor="<%=sBackColor%>">
			<TD valign="top" width="200" class="ContenidoImprL">&nbsp;<%=vTempCampo1%></TD>
			<TD width="100" align="center" class="ContenidoImpr">&nbsp;</TD>
			<TD valign="top" width="200" class="ContenidoImpr"><%=vTempCampo2%></TD>
			<TD width="100" class="ContenidoImpr" align="right">&nbsp;</TD>
			<TD valign="top" width="300" class="ContenidoImprR">&nbsp;<%=vTempCampo3%></TD>
		</TR>
		<%
			}
		}
			iRowsCount = iRowsCount>=iMaxRowXPag?iRowMaxTemp:iRowsCount;
			
		} // FIN DEL FOR
//Si existe la paginacion debera repetir esto		
		%>
				<tr>
				<td colspan="5" class="ContenidoImprB" height="2px">&nbsp;</td>
				</tr>
	</TABLE>
</td>
	<!-- contenido -->
</tr>
</table>
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