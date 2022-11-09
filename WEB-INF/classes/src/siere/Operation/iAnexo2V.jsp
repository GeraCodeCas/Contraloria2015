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

String sAnexo = "II.5";
java.text.DecimalFormat myFormatter = new java.text.DecimalFormat("###,##0.00");
Anexo2V oAnexo2V 	= new Anexo2V();
String sPath = "../";
int numpag = 0;
int numtot = 0;
int iIdAnexo = oAnexo2V.GetIdAnexo();
AnexoEstatus	oAnexoEstatus		= new AnexoEstatus();
oAnexoEstatus.Get(iIdFuncionario, iIdAnexo);
String sEstatus = oAnexoEstatus.GetEstatus();
%>
<html>
<head>
	<title>Entrega - Recepción : Anexo II.5 (Impresión)</title>
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
	<!-- Contenido -->
	<td valign="top">
	<TABLE cellPadding="0" cellSpacing="0" width="900" BORDER="1" BORDERCOLOR="white">
	<!-- Etiqueta donde se aplican los encabezados de las tablas-->
	<TR><TD class="TituloParrafoImpr">RELACIÓN DE DOCUMENTOS Y CUENTAS POR COBRAR</TD></TR>  
	</TABLE>
	<!-- Datos que se agregaran a la tabla  -->
	<TABLE cellPadding="0" cellSpacing="0" width="900" BORDER="1" BORDERCOLOR="White">
	<!-- Etiqueta donde se aplican los encabezados de las tablas-->
		<TR align="middle">
			<td width="200" class="TituloMenuImpr">Número de Documento</TD>
			<td width="200" class="TituloMenuImpr">Nombre del Deudor</TD>
			<td width="200" class="TituloMenuImpr">Concepto</TD>
			<td class="TituloMenuImpr">Fecha de Vencimiento</TD>
			<td width="100" class="TituloMenuImpr">Importe</TD>
			<td width="100" class="TituloMenuImpr">Saldo</TD>
		</TR>
<%		
if(!sEstatus.equals("0")){
			int intContador = 0;
			String sBackColor = "";
			oAnexo2V.GetAll(iIdFuncionario);
			
			// Variables para Paginacion
			int iLenCol = 0;
			int iRowsMax = 0; // POR REGISTRO
			int iRowsXCol = 0;
			int iRowsCount = 0;
			int iRowsAnt = 0; //posicion anterior
			int iMaxRowXPag = 24; //Numero de Renglones por Pagina
			// Variables para Paginacion
			
		for(int i=0;i<oAnexo2V.GetAll(iIdFuncionario);i++){
			// Variables para Paginacion
			int iRowMaxTemp = 1;
			int iRowCountTemp = 0;
			String vTempCampo1 = "";
			String vTempCampo2 = "";
			String vTempCampo3 = "";
			String vTempCampo4 = "";
			String vTempCampo5 = "";
			// Variables para Paginacion
			iRowsAnt = iRowsCount;
			
		    String vIdRenglon 				    = oAnexo2V.GetIdRenglon(i)!=-1?oAnexo2V.GetIdRenglon(i)+"":"0";
			
			String vNumeroDocumento 			= oAnexo2V.GetNumeroDocumento(i)!=null?oAnexo2V.GetNumeroDocumento(i):"";
			//Primer Elemento que su contenido puede llevar a un salto de pagina
			iLenCol = vNumeroDocumento.length();
			iRowsXCol = 1;
			if(iLenCol > 26){
				if(iLenCol%26 == 0){
					iRowsXCol = iLenCol/26;
				}else{
					iRowsXCol = (iLenCol/26)+1;
				}
				
				String temp = vNumeroDocumento;
				vNumeroDocumento = "";
				iRowCountTemp = 0 ;
				for(int x=1;x<=(iRowsXCol);x++){
					int max = (26*x)<=iLenCol ? (26*x) : iLenCol;
					if( (x + iRowsAnt) <= iMaxRowXPag) {
						vNumeroDocumento = vNumeroDocumento + temp.substring((26*(x-1)), max) + "<br>";
						}
					else {
						iRowCountTemp = iRowCountTemp + 1;
						vTempCampo1 = vTempCampo1 + temp.substring((26*(x-1)), max) + "<br>";
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
			
			String vNombreDeudor 				= oAnexo2V.GetNombreDeudor(i)!=null?oAnexo2V.GetNombreDeudor(i):"";
			// Elemento que su contenido puede llevar a un salto de pagina
			iLenCol = vNombreDeudor.length();
			if(iLenCol > 26){
				if(iLenCol%26 == 0){
					iRowsXCol = iLenCol/26;
				}else{
					iRowsXCol = (iLenCol/26)+1;
				}
				
				if (iRowsXCol > iRowsMax){
				    iRowsCount = iRowsXCol - iRowsMax + iRowsCount;
					iRowsMax = iRowsXCol;
				}
				
				String temp = vNombreDeudor;
				vNombreDeudor = "";
				iRowCountTemp = 0 ;
				for(int x=1;x<=(iRowsXCol);x++){
					int max = (26*x)<=iLenCol ? (26*x) : iLenCol;
					if( (x + iRowsAnt) <= iMaxRowXPag) {
						vNombreDeudor = vNombreDeudor + temp.substring((26*(x-1)), max) + "<br>";	}
					else {
						iRowCountTemp = iRowCountTemp + 1;
						vTempCampo2 = vTempCampo2 + temp.substring((26*(x-1)), max) + "<br>";	}
				}
				iRowMaxTemp = iRowMaxTemp >= iRowCountTemp ? iRowMaxTemp : iRowCountTemp ;
			}else{
				iRowsXCol = 1;
			}
			// Elemento que su contenido puede llevar a un salto de pagina
			
			String vConcepto 					= oAnexo2V.GetConcepto(i)!=null?oAnexo2V.GetConcepto(i):"";
			// Elemento que su contenido puede llevar a un salto de pagina
			iLenCol = vConcepto.length();
			if(iLenCol > 26){
				if(iLenCol%26 == 0){
					iRowsXCol = iLenCol/26;
				}else{
					iRowsXCol = (iLenCol/26)+1;
				}
				
				if (iRowsXCol > iRowsMax){
				    iRowsCount = iRowsXCol - iRowsMax + iRowsCount;
					iRowsMax = iRowsXCol;
				}
				
				String temp = vConcepto;
				vConcepto = "";
				iRowCountTemp = 0 ;
				for(int x=1;x<=(iRowsXCol);x++){
					int max = (26*x)<=iLenCol ? (26*x) : iLenCol;
					if( (x + iRowsAnt) <= iMaxRowXPag) {
						vConcepto = vConcepto + temp.substring((26*(x-1)), max) + "<br>";	}
					else {
						iRowCountTemp = iRowCountTemp + 1;
						vTempCampo3 = vTempCampo3 + temp.substring((26*(x-1)), max) + "<br>";	}
				}
				iRowMaxTemp = iRowMaxTemp >= iRowCountTemp ? iRowMaxTemp : iRowCountTemp ;
			}else{
				iRowsXCol = 1;
			}
			// Elemento que su contenido puede llevar a un salto de pagina
			
			String vFechaVencimiento	        = oAnexo2V.GetFechaVencimiento(i)!=null?oAnexo2V.GetFechaVencimiento(i):"";
			String vImporte						= oAnexo2V.GetImporte(i)!=null?oAnexo2V.GetImporte(i):"";
			vImporte = myFormatter.format(new Double(!vImporte.trim().equals("")?vImporte:"0"));
			iLenCol = vImporte.length();
			if(iLenCol > 16){
				if(iLenCol%16 == 0){
					iRowsXCol = iLenCol/16;
				}else{
					iRowsXCol = (iLenCol/16)+1;
				}
				
				if (iRowsXCol > iRowsMax){
				    iRowsCount = iRowsXCol - iRowsMax + iRowsCount;
					iRowsMax = iRowsXCol;
				}
				
				String temp = vImporte;
				vImporte = "";
				iRowCountTemp = 0 ;
				for(int x=1;x<=(iRowsXCol);x++){
					int max = (16*x)<=iLenCol ? (16*x) : iLenCol;
					if( (x + iRowsAnt) <= iMaxRowXPag) {
						vImporte = vImporte + temp.substring((16*(x-1)), max) + "<br>";	}
					else {
						iRowCountTemp = iRowCountTemp + 1;
						vTempCampo4 = vTempCampo4 + temp.substring((16*(x-1)), max) + "<br>";	}
				}
				iRowMaxTemp = iRowMaxTemp >= iRowCountTemp ? iRowMaxTemp : iRowCountTemp ;
			}
			
			String vSaldo 						= oAnexo2V.GetSaldo(i)!=null?oAnexo2V.GetSaldo(i):"";
			vSaldo = myFormatter.format(new Double(!vSaldo.trim().equals("")?vSaldo:"0"));
			iLenCol = vSaldo.length();
			if(iLenCol > 16){
				if(iLenCol%16 == 0){
					iRowsXCol = iLenCol/16;
				}else{
					iRowsXCol = (iLenCol/16)+1;
				}
				
				if (iRowsXCol > iRowsMax){
				    iRowsCount = iRowsXCol - iRowsMax + iRowsCount;
					iRowsMax = iRowsXCol;
				}
				
				String temp = vSaldo;
				vSaldo = "";
				iRowCountTemp = 0 ;
				for(int x=1;x<=(iRowsXCol);x++){
					int max = (16*x)<=iLenCol ? (16*x) : iLenCol;
					if( (x + iRowsAnt) <= iMaxRowXPag) {
						vSaldo = vSaldo + temp.substring((16*(x-1)), max) + "<br>";	}
					else {
						iRowCountTemp = iRowCountTemp + 1;
						vTempCampo5 = vTempCampo5 + temp.substring((16*(x-1)), max) + "<br>";	}
				}
				iRowMaxTemp = iRowMaxTemp >= iRowCountTemp ? iRowMaxTemp : iRowCountTemp ;
			}

			intContador = intContador + 1;
		 if (intContador%2 == 0){
					sBackColor = "#ffffff";
				}else{
					sBackColor = "#dddddd";
			  }%>
		<TR align="left" bgcolor="<%=sBackColor%>">
			<TD valign="top" width="200" class="ContenidoImprL"><%=vNumeroDocumento%></TD>
			<TD valign="top" width="200" class="ContenidoImpr"><%=vNombreDeudor%></TD>
			<TD valign="top" width="200" class="ContenidoImpr"><%=vConcepto%></TD>
			<TD valign="top" class="ContenidoImpr" align="center"><%=vFechaVencimiento%></TD>
			<TD valign="top" width="100" class="ContenidoImpr" align="right"><%=vImporte%></TD>
			<TD valign="top" width="100" class="ContenidoImprR" align="right"><%=vSaldo%></TD>
		</TR>
		<%
		//Si existe la paginacion debera repetir esto		
		if ( (!vTempCampo1.equals("") || !vTempCampo2.equals("") || !vTempCampo3.equals("") || !vTempCampo4.equals("") || !vTempCampo5.equals(""))
			|| iRowsCount>=iMaxRowXPag ){
		%>
		<tr><td colspan="6" class="ContenidoImprB">&nbsp;</td></tr>
	</TABLE>
	</TABLE>
</td>
	<!-- contenido -->
</tr>
</table>
<!-- Paginacion -->
<p style="page-break-after:always"></p>
<%@include file="HeaderAnexo.jsp"%>
<br>
<TABLE cellPadding="0" cellSpacing="0" width="900" BORDER="1" BORDERCOLOR="white">
	<!-- Etiqueta donde se aplican los encabezados de las tablas-->
	<TR><TD class="TituloParrafoImpr">RELACIÓN DE DOCUMENTOS Y CUENTAS POR COBRAR</TD></TR>  
	</TABLE>
	<!-- Datos que se agregaran a la tabla  -->
	<TABLE cellPadding="0" cellSpacing="0" width="900" BORDER="1" BORDERCOLOR="White">
	<!-- Etiqueta donde se aplican los encabezados de las tablas-->
		<TR align="middle">
			<td width="200" class="TituloMenuImpr">Número de Documento</TD>
			<td width="200" class="TituloMenuImpr">Nombre del Deudor</TD>
			<td width="200" class="TituloMenuImpr">Concepto</TD>
			<td class="TituloMenuImpr">Fecha de Vencimiento</TD>
			<td width="100" class="TituloMenuImpr">Importe</TD>
			<td width="100" class="TituloMenuImpr">Saldo</TD>
		</TR>
		
<%if (!vTempCampo1.equals("") || !vTempCampo2.equals("") || !vTempCampo3.equals("") || !vTempCampo4.equals("") || !vTempCampo5.equals("")){
			if (vTempCampo1.equals("")) vTempCampo1 = "&nbsp;";
			if (vTempCampo2.equals("")) vTempCampo2 = "&nbsp;";
			if (vTempCampo3.equals("")) vTempCampo3 = "&nbsp;";
			if (vTempCampo3.equals("")) vTempCampo4 = "&nbsp;";
			if (vTempCampo3.equals("")) vTempCampo5 = "&nbsp;";%>
	<TR align="left" bgcolor="<%=sBackColor%>">
			<TD valign="top" width="200" class="ContenidoImprL">&nbsp;<%=vTempCampo1%></TD>
			<TD valign="top" width="200" class="ContenidoImpr"><%=vTempCampo2%></TD>
			<TD valign="top" width="200" class="ContenidoImpr"><%=vTempCampo3%></TD>
			<TD class="ContenidoImpr" align="center">&nbsp;</TD>
			<TD width="100" class="ContenidoImpr" align="right"><%=vTempCampo4%></TD>
			<TD width="100" class="ContenidoImprR" align="right"><%=vTempCampo5%></TD>
	</TR><%
			}
		}
			iRowsCount = iRowsCount>=iMaxRowXPag?iRowMaxTemp:iRowsCount;
			
		} // FIN DEL FOR
//Si existe la paginacion debera repetir esto		
		%>
		<tr>
			<td colspan="6" class="ContenidoImprB">&nbsp;</td>
		</tr>
	</TABLE>
</td>
	<!-- contenido -->
</tr>
</table>
<TABLE cellPadding="0" cellSpacing="0" width="100%" BORDER="1" BORDERCOLOR="white">
	<!-- Etiqueta donde se aplican los encabezados de las tablas-->
	
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