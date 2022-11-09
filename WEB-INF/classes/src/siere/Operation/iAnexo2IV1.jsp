<%/*********************************************************************************************************
Elaboro:	Julio Enrique Espinosa Torres
Lugar:		Monterrey, NL
Fecha:		29.Oct.2002
Compañia:	CONSISS*/%>
<%@page import="com.consiss.util.tools.*"%>
<%@page import="com.gob.*"%>
<%@page import="java.util.*" %>
<%
//Valida la permanencia del usuario en session
if ((String)session.getValue("ok")!="Consiss") 	response.sendRedirect("Error.html");

int iIdFuncionario =  java.lang.Integer.parseInt( (request.getParameter("iIdFuncionario")!= null?request.getParameter("iIdFuncionario"):"0") );
			
java.text.DecimalFormat myFormatter = new java.text.DecimalFormat("###,##0.00");
String sAnexo = "II.4.1";
		
Anexo2IV1 oAnexo2IV1 	= new Anexo2IV1();
DetalleAnexo2IV1 oDetalleAnexo2IV1 	= new DetalleAnexo2IV1();
int iIdAnexo = oAnexo2IV1.GetIdAnexo();
String sPath = "../";
AnexoEstatus	oAnexoEstatus		= new AnexoEstatus();
oAnexoEstatus.Get(iIdFuncionario, iIdAnexo);
String sEstatus = oAnexoEstatus.GetEstatus();
int numpag =0;
int numtot = 0;
%>
<html>
<head>
	<title>Entrega - Recepción : Anexo II.4.1 (Impresión)</title>
<script language="JavaScript" src="<%=sPath%>Scripts/Gobierno.js"></script>
<link rel="stylesheet" type="text/css" href="<%=sPath%>Styles/Gobierno.css">
<SCRIPT LANGUAGE="javascript">
	function closewin(){ 	 window.close();	 }
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
	
	function print(){
		var WebBrowser = '<OBJECT ID="WebBrowser1"  WIDTH=0 HEIGHT=0 CLASSID="CLSID:8856F961-340A-11D0-A96B-00C04FD705A2"></OBJECT>';
		this.document.body.insertAdjacentHTML('afterBegin', WebBrowser); 
		this.focus();
		printVB();
		WebBrowser1.outerHTML = '';
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
<body topmargin="2" leftmargin="2" onLoad="javascript:Imprimir();">
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
		<tr><TD class="TituloParrafoImpr" width="100%">DETALLE DE LA SITUACIÓN DE BANCOS</TD></tr>
	</table>
	<!-- Datos que se agregaran a la tabla  -->
	<TABLE cellPadding="0" cellSpacing="0" width="900"  BORDER="1" BORDERCOLOR="white">
	<!-- Etiqueta donde se aplican los encabezados de las tablas-->
		<TR align="middle">
			<td width="94" rowspan="2" class="TituloMenuImpr">No. Cuenta</TD>
			<td width="94" rowspan="2" class="TituloMenuImpr">Nombre de la Institución</TD>
			<td width="188" class="TituloMenuImpr" colspan="2">Saldo Según</td>
			<td width="188" class="TituloMenuImpr" colspan="2">Relación de Talonarios/Póliza</td>
			<td width="284" class="TituloMenuImpr" colspan="3">Último Cheque Expedido por cada Chequera</td>
		</TR>
		<tr align="middle">
			<td width="120" class="TituloMenuImpr">Chequera</td>
			<td width="120" class="TituloMenuImpr">Banco</td>
			<td width="94" class="TituloMenuImpr">Inicial</td>
			<td width="94" class="TituloMenuImpr">Final</td>
			<td width="94" class="TituloMenuImpr">Número</td>
			<td width="70" class="TituloMenuImpr">Fecha</td>
			<td width="120" class="TituloMenuImpr">Importe</td>
		</tr>
<%
if(!sEstatus.equals("0")){
	int intContador = 0;
	String sBackColor = "";
	oAnexo2IV1.GetAll(iIdFuncionario);
	// Variables para Paginacion
	int iLenCol = 0;
	int iRowsMax = 0; // POR REGISTRO
	int iRowsXCol = 0;
	int iRowsCount = 0;
	int iRowsAnt = 0; //posicion anterior
	int iMaxRowXPag = 20; //Numero de Renglones por Pagina
	// Variables para Paginacion
			
	for(int i=0;i<oAnexo2IV1.GetAll(iIdFuncionario);i++){
		// Variables para Paginacion
		int iRowMaxTemp = 1;
		int iRowCountTemp = 0;
		String vTempCampo1 = "";
		String vTempCampo2 = "";
		String vTempCampo3 = "";
		String vTempCampo4 = "";
		String vTempCampo5 = "";
		String vTempCampo6 = "";
		String vTempCampo7 = "";
		String vTempCampo8 = "";
		// Variables para Paginacion		
		iRowsAnt = iRowsCount;
		
		String vIdRenglon = oAnexo2IV1.GetIdRenglon(i)!=-1?oAnexo2IV1.GetIdRenglon(i)+"":"0";
		String vNoCuenta = oAnexo2IV1.GetNoCuenta(i)!=null?oAnexo2IV1.GetNoCuenta(i):"";
		//Primer Elemento que su contenido puede llevar a un salto de pagina
		iLenCol = vNoCuenta.length();
		iRowsXCol = 1;
			
		if(iLenCol > 12){	
			if(iLenCol%12 == 0)	{	iRowsXCol = iLenCol/12;		}
			else				{	iRowsXCol = (iLenCol/12)+1;	}
				
			String temp = vNoCuenta;
			vNoCuenta = "";
			iRowCountTemp = 0 ;
			for(int x=1;x<=(iRowsXCol);x++){
				int max = (12*x)<=iLenCol ? (12*x) : iLenCol;
				if( (x + iRowsAnt) <= iMaxRowXPag) {
					vNoCuenta = vNoCuenta + temp.substring((12*(x-1)), max) + "<br>";
				} else {
					iRowCountTemp = iRowCountTemp + 1;
					vTempCampo1 = vTempCampo1 + temp.substring((12*(x-1)), max) + "<br>";
				}
			}
			iRowMaxTemp = iRowMaxTemp >= iRowCountTemp ? iRowMaxTemp : iRowCountTemp ;
		}else					{	iRowsMax = 1;	}
		
		iRowsMax = iRowsXCol;
		iRowsCount = iRowsMax + iRowsCount;
		
		iRowsMax = iRowsXCol;
		
		// Primer Elemento que su contenido puede llevar a un salto de pagina
		String vNombre = oAnexo2IV1.GetNombre(i)!=null?oAnexo2IV1.GetNombre(i):"";
		// Elemento que su contenido puede llevar a un salto de pagina
		iLenCol = vNombre.length();
		if(iLenCol > 12){
			if(iLenCol%12 == 0)	{	iRowsXCol = iLenCol/12;	}
			else				{	iRowsXCol = (iLenCol/12)+1;	}
			
			if (iRowsXCol > iRowsMax){
			    iRowsCount = iRowsXCol - iRowsMax + iRowsCount;
				iRowsMax = iRowsXCol;
			}
			String temp = vNombre;
			vNombre = "";
			iRowCountTemp = 0 ;
			for(int x=1;x<=(iRowsXCol);x++){
				int max = (12*x)<=iLenCol ? (12*x) : iLenCol;
				if( (x + iRowsAnt) <= iMaxRowXPag) {
					vNombre = vNombre + temp.substring((12*(x-1)), max) + "<br>";	}
				else {
					iRowCountTemp = iRowCountTemp + 1;
					vTempCampo2 = vTempCampo2 + temp.substring((12*(x-1)), max) + "<br>";	}
			}
			iRowMaxTemp = iRowMaxTemp >= iRowCountTemp ? iRowMaxTemp : iRowCountTemp ;
		}else					{	iRowsXCol = 1;	}	
				
		String vChequera = oAnexo2IV1.GetChequera(i)!=null?oAnexo2IV1.GetChequera(i):"";
		vChequera = myFormatter.format(new Double(!vChequera.trim().equals("")?vChequera:"0"));
		iLenCol = vChequera.length();
		if(iLenCol > 16){
			if(iLenCol%16 == 0)	{	iRowsXCol = iLenCol/16;	}
			else				{	iRowsXCol = (iLenCol/16)+1;	}
			
			if (iRowsXCol > iRowsMax){
			    iRowsCount = iRowsXCol - iRowsMax + iRowsCount;
				iRowsMax = iRowsXCol;
			}
			
			String temp = vChequera;
			vChequera = "";
			iRowCountTemp = 0 ;
			for(int x=1;x<=(iRowsXCol);x++){
				int max = (16*x)<=iLenCol ? (16*x) : iLenCol;
				if( (x + iRowsAnt) <= iMaxRowXPag) {
					vChequera = vChequera + temp.substring((16*(x-1)), max) + "<br>";	}
				else {
					iRowCountTemp = iRowCountTemp + 1;
					vTempCampo6 = vTempCampo6 + temp.substring((16*(x-1)), max) + "<br>";	}
			}
			iRowMaxTemp = iRowMaxTemp >= iRowCountTemp ? iRowMaxTemp : iRowCountTemp ;
		}
		
		String vBanco = oAnexo2IV1.GetBanco(i)!=null?oAnexo2IV1.GetBanco(i):"";
		vBanco = myFormatter.format(new Double(!vBanco.trim().equals("")?vBanco:"0"));
		iLenCol = vBanco.length();
		if(iLenCol > 16){
			if(iLenCol%16 == 0)	{ iRowsXCol = iLenCol/16;	}
			else				{ iRowsXCol = (iLenCol/16)+1;}
			if (iRowsXCol > iRowsMax){
			    iRowsCount = iRowsXCol - iRowsMax + iRowsCount;
				iRowsMax = iRowsXCol;
			}
			String temp = vBanco;
			vBanco = "";
			iRowCountTemp = 0 ;
			for(int x=1;x<=(iRowsXCol);x++){
				int max = (16*x)<=iLenCol ? (16*x) : iLenCol;
				if( (x + iRowsAnt) <= iMaxRowXPag) {
					vBanco = vBanco + temp.substring((16*(x-1)), max) + "<br>";	}
				else {
					iRowCountTemp = iRowCountTemp + 1;
					vTempCampo7 = vTempCampo7 + temp.substring((16*(x-1)), max) + "<br>";	}
			}
				iRowMaxTemp = iRowMaxTemp >= iRowCountTemp ? iRowMaxTemp : iRowCountTemp ;
		}
		
		String vInicial = oAnexo2IV1.GetInicial(i)!=null?oAnexo2IV1.GetInicial(i):"";
		iLenCol = vInicial.length();
		if(iLenCol > 12){
			if(iLenCol%12 == 0)	{ iRowsXCol = iLenCol/12; }
			else				{ iRowsXCol = (iLenCol/12)+1; }
			
			if (iRowsXCol > iRowsMax){
			    iRowsCount = iRowsXCol - iRowsMax + iRowsCount;
				iRowsMax = iRowsXCol;
			}
			
			String temp = vInicial;
			vInicial = "";
			iRowCountTemp = 0 ;
			for(int x=1;x<=(iRowsXCol);x++){
				int max = (12*x)<=iLenCol ? (12*x) : iLenCol;
				if( (x + iRowsAnt) <= iMaxRowXPag) {
					vInicial = vInicial + temp.substring((12*(x-1)), max) + "<br>";	}
				else {
					iRowCountTemp = iRowCountTemp + 1;
					vTempCampo3 = vTempCampo3 + temp.substring((12*(x-1)), max) + "<br>";	}
			}
			iRowMaxTemp = iRowMaxTemp >= iRowCountTemp ? iRowMaxTemp : iRowCountTemp ;
		}else{
			iRowsXCol = 1;
		}	
				
		String vFinal 					= oAnexo2IV1.GetFinal(i)!=null?oAnexo2IV1.GetFinal(i):"";
		iLenCol = vFinal.length();
		if(iLenCol > 12){
			if(iLenCol%12 == 0)	{ iRowsXCol = iLenCol/12; }
			else				{ iRowsXCol = (iLenCol/12)+1;}
			
			if (iRowsXCol > iRowsMax){
			    iRowsCount = iRowsXCol - iRowsMax + iRowsCount;
				iRowsMax = iRowsXCol;
			}
			
			String temp = vFinal;
			vFinal = "";
			iRowCountTemp = 0 ;
			for(int x=1;x<=(iRowsXCol);x++){
				int max = (12*x)<=iLenCol ? (12*x) : iLenCol;
				if( (x + iRowsAnt) <= iMaxRowXPag) {
					vFinal = vFinal + temp.substring((12*(x-1)), max) + "<br>";	}
				else {
					iRowCountTemp = iRowCountTemp + 1;
					vTempCampo4 = vTempCampo4 + temp.substring((12*(x-1)), max) + "<br>";	}
			}
			iRowMaxTemp = iRowMaxTemp >= iRowCountTemp ? iRowMaxTemp : iRowCountTemp ;
		}else{
			iRowsXCol = 1;
		}	
		
		String vNumero		            = oAnexo2IV1.GetNumero(i)!=null?oAnexo2IV1.GetNumero(i):"";
		iLenCol = vNumero.length();
		if(iLenCol > 12){
			if(iLenCol%12 == 0)	{ iRowsXCol = iLenCol/12; }
			else				{ iRowsXCol = (iLenCol/12)+1; }
			
			if (iRowsXCol > iRowsMax){
			    iRowsCount = iRowsXCol - iRowsMax + iRowsCount;
				iRowsMax = iRowsXCol;
			}
			
			String temp = vNumero;
			vNumero = "";
			iRowCountTemp = 0 ;
			for(int x=1;x<=(iRowsXCol);x++){
				int max = (12*x)<=iLenCol ? (12*x) : iLenCol;
				if( (x + iRowsAnt) <= iMaxRowXPag) {
					vNumero = vNumero + temp.substring((12*(x-1)), max) + "<br>";
				} else {
					iRowCountTemp = iRowCountTemp + 1;
					vTempCampo5 = vTempCampo5 + temp.substring((12*(x-1)), max) + "<br>";	}
			}
			iRowMaxTemp = iRowMaxTemp >= iRowCountTemp ? iRowMaxTemp : iRowCountTemp ;
		}else{
			iRowsXCol = 1;
		}	
		// Elemento que su contenido puede llevar a un salto de pagina
		
		String vFecha 				= oAnexo2IV1.GetFecha(i)!=null?oAnexo2IV1.GetFecha(i):"";
		String vImporte 				= oAnexo2IV1.GetImporte(i)!=null?oAnexo2IV1.GetImporte(i):"";
		vImporte = myFormatter.format(new Double(!vImporte.trim().equals("")?vImporte:"0"));
		iLenCol = vImporte.length();
		if(iLenCol > 16){
			if(iLenCol%16 == 0)	{ iRowsXCol = iLenCol/16; }
			else				{ iRowsXCol = (iLenCol/16)+1; }
			
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
					vImporte = vImporte + temp.substring((16*(x-1)), max) + "<br>";	
				} else {
					iRowCountTemp = iRowCountTemp + 1;
					vTempCampo8 = vTempCampo8 + temp.substring((16*(x-1)), max) + "<br>";	}
			}
			iRowMaxTemp = iRowMaxTemp >= iRowCountTemp ? iRowMaxTemp : iRowCountTemp ;
		}
		
		intContador = intContador + 1;
		if (intContador%2 == 0)	{ sBackColor = "#ffffff"; }
		else					{ sBackColor = "#dddddd"; }%>
		<TR valign="top" align="left" bgcolor="<%=sBackColor%>" >
			<TD width="94" class="ContenidoImprL"><%=vNoCuenta%></TD>
			<TD width="94" class="ContenidoImpr"><%=vNombre%></TD>
			<td width="120" class="ContenidoImpr" align="right"><%=vChequera%></td>					
			<td width="120" class="ContenidoImpr" align="right"><%=vBanco%></td>
			<td width="94" class="ContenidoImpr"><%=vInicial%></td>					
			<td width="94" class="ContenidoImpr"><%=vFinal%></td>
			<td width="94" class="ContenidoImpr"><%=vNumero%></td>					
			<td width="70" class="ContenidoImpr"><%=vFecha%></td>
			<td width="120" class="ContenidoImprR" align="right"><%=vImporte%></td>
		</TR>
		<%
		//Si existe la paginacion debera repetir esto		
		if ( (!vTempCampo1.equals("") || !vTempCampo2.equals("") || !vTempCampo3.equals("") || !vTempCampo4.equals("") || !vTempCampo5.equals("")
			|| !vTempCampo6.equals("") || !vTempCampo7.equals("") || !vTempCampo8.equals(""))
			|| iRowsCount>=iMaxRowXPag ){
		%>
    <tr><td colspan="9" class="ContenidoImprB">&nbsp;</td></tr>
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
		<tr><TD class="TituloParrafoImpr" width="100%">DETALLE DE LA SITUACIÓN DE BANCOS</TD></tr>
	</table>
	<!-- Datos que se agregaran a la tabla  -->
	<TABLE cellPadding="0" cellSpacing="0" width="900"  BORDER="1" BORDERCOLOR="white">
	<!-- Etiqueta donde se aplican los encabezados de las tablas-->
		<TR align="middle">
			<td width="94" rowspan="2" class="TituloMenuImpr">No. Cuenta</TD>
			<td width="94" rowspan="2" class="TituloMenuImpr">Nombre de la Institución</TD>
			<td width="188" class="TituloMenuImpr" colspan="2">Saldo Según</td>
			<td width="188" class="TituloMenuImpr" colspan="2">Relación de Talonarios/Póliza</td>
			<td width="284" class="TituloMenuImpr" colspan="3">Último Cheque Expedido por cada Chequera</td>
		</TR>
		<tr align="middle">
			<td width="120" class="TituloMenuImpr">Chequera</td>
			<td width="120" class="TituloMenuImpr">Banco</td>
			<td width="94" class="TituloMenuImpr">Inicial</td>
			<td width="94" class="TituloMenuImpr">Final</td>
			<td width="94" class="TituloMenuImpr">Número</td>
			<td width="70" class="TituloMenuImpr">Fecha</td>
			<td width="120" class="TituloMenuImpr">Importe</td>
		</tr><%
			if (!vTempCampo1.equals("") || !vTempCampo2.equals("") || !vTempCampo3.equals("") || !vTempCampo4.equals("") || !vTempCampo5.equals("")
				 || !vTempCampo6.equals("") || !vTempCampo7.equals("") || !vTempCampo8.equals("") ){
				if (vTempCampo1.equals("")) vTempCampo1 = "&nbsp;";
				if (vTempCampo2.equals("")) vTempCampo2 = "&nbsp;";
				if (vTempCampo3.equals("")) vTempCampo3 = "&nbsp;";
				if (vTempCampo4.equals("")) vTempCampo4 = "&nbsp;";
				if (vTempCampo5.equals("")) vTempCampo5 = "&nbsp;";%>
	<TR valign="top" align="left" bgcolor="<%=sBackColor%>" >
			<TD width="94" class="ContenidoImprL"><%=vTempCampo1%></TD>
			<TD width="94" class="ContenidoImpr"><%=vTempCampo2%></TD>
			<td width="120" class="ContenidoImpr" align="right"><%=vTempCampo6%></td>
			<td width="120" class="ContenidoImpr" align="right"><%=vTempCampo7%></td>
			<td width="94" class="ContenidoImpr"><%=vTempCampo3%></td>					
			<td width="94" class="ContenidoImpr"><%=vTempCampo4%></td>
			<td width="94" class="ContenidoImpr"><%=vTempCampo5%></td>					
			<td width="70" class="ContenidoImpr"><%=vTempCampo8%></td>
			<td width="120" class="ContenidoImprR" align="right">&nbsp;</td>
		</TR>
	<%
			}
		}
		iRowsCount = iRowsCount>=iMaxRowXPag?iRowMaxTemp:iRowsCount;
		
	} // FIN DEL FOR
%>
	<tr>
		<td colspan="9" class="ContenidoImprB">&nbsp;</td>
		</tr>
	</TABLE>
</td>
	<!-- contenido -->
</tr>
</table>
<br>
<%iRowsCount = iRowsCount + 4;%>
<table border="0" cellspacing="0" cellpadding="0">
<tr>
	<!-- contenido -->
	<td valign="top">
	<TABLE cellPadding="0" cellSpacing="0" width="600" BORDER="1" BORDERCOLOR="White">
	<!-- Etiqueta donde se aplican los encabezados de las tablas-->
		<TR align="middle">
			<td class="TituloMenuImpr" colspan="2">Firmas Registradas</TD>
		</TR>
		<TR align="middle">
			<td width="300" class="TituloMenuImpr">NoCuenta</TD>
			<td width="300" class="TituloMenuImpr">Cargo</TD>
		</TR><%		
	intContador = 0;
	sBackColor = "";
	oDetalleAnexo2IV1.GetAll(iIdFuncionario);
	
	for(int i=0;i<oDetalleAnexo2IV1.GetAll(iIdFuncionario);i++){
	  // Variables para Paginacion
		String vTempCampo1 = "";
		String vTempCampo2 = "";
	
		// Variables para Paginacion		
		iRowsAnt = iRowsCount;
		
		String vIdRenglon 			= oDetalleAnexo2IV1.GetIdRenglon(i)!=-1?oDetalleAnexo2IV1.GetIdRenglon(i)+"":"0";
		String vNombreFirma 		= oDetalleAnexo2IV1.GetNombreFirma(i)!=null?oDetalleAnexo2IV1.GetNombreFirma(i):"";
		// Elemento que su contenido puede llevar a un salto de pagina
		iLenCol = vNombreFirma.length();
		if(iLenCol > 40){
			if(iLenCol%40 == 0)	{ iRowsXCol = iLenCol/40; }
			else				{ iRowsXCol = (iLenCol/40)+1; }
			
			if (iRowsXCol > iRowsMax){
			    iRowsCount = iRowsXCol - iRowsMax + iRowsCount;
				iRowsMax = iRowsXCol;
			}
			
			String temp = vNombreFirma;
			vNombreFirma = "";
			for(int x=1;x<=(iRowsXCol);x++){
				int max = (40*x)<=iLenCol ? (40*x) : iLenCol;
				if( (x + iRowsAnt) <= iMaxRowXPag) {
					vNombreFirma = vNombreFirma + temp.substring((40*(x-1)), max) + "<br>";
				} else {
					vTempCampo1= vTempCampo1 + temp.substring((40*(x-1)), max) + "<br>";
				}
			}
		}else{
			iRowsXCol = 1;
		}	
		
		iRowsMax = iRowsXCol;
		iRowsCount = iRowsMax + iRowsCount;
		
		iRowsMax = iRowsXCol;
		String vCargo = oDetalleAnexo2IV1.GetCargo(i)!=null?oDetalleAnexo2IV1.GetCargo(i):"";
		iLenCol = vCargo.length();
		if(iLenCol > 40){
			if(iLenCol%40 == 0) { iRowsXCol = iLenCol/40;	}
			else				{ iRowsXCol = (iLenCol/40)+1; }
			
			if (iRowsXCol > iRowsMax){
			    iRowsCount = iRowsXCol - iRowsMax + iRowsCount;
				iRowsMax = iRowsXCol;
			}
			
			String temp = vCargo;
			vCargo = "";
			for(int x=1;x<=(iRowsXCol);x++){
				int max = (40*x)<=iLenCol ? (40*x) : iLenCol;
				if( (x + iRowsAnt) <= iMaxRowXPag) {
					vCargo = vCargo + temp.substring((40*(x-1)), max) + "<br>";
				} else {
					vTempCampo2= vTempCampo2 + temp.substring((40*(x-1)), max) + "<br>";
				}
			}
		}else{
			iRowsXCol = 1;
		}	
		// Elemento que su contenido puede llevar a un salto de pagina
		intContador = intContador + 1;
	 	if (intContador%2 == 0)	{ sBackColor = "#ffffff"; }
		else					{ sBackColor = "#dddddd"; }
	%>
	<TR align="left" bgcolor="<%=sBackColor%>">
		<TD class="ContenidoImprL" width="300" align="center">&nbsp;<%=vNombreFirma%></TD>
		<TD class="ContenidoImprR" width="300" align="center">&nbsp;<%=vCargo%></TD>
	</TR><%
	//Si existe la paginacion debera repetir esto		
	if ( (!vTempCampo1.equals("") || !vTempCampo2.equals("")) || iRowsCount>=iMaxRowXPag ){%>
	<tr><td colspan="2" class="ContenidoImprB">&nbsp;</td></tr>
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
	<TABLE cellPadding="0" cellSpacing="0" width="600" BORDER="1" BORDERCOLOR="White">
	<!-- Etiqueta donde se aplican los encabezados de las tablas-->
		<TR align="middle">
			<td class="TituloMenuImpr" colspan="2">Firmas Registradas</TD>
		</TR>
		<TR align="middle">
			<td width="300" class="TituloMenuImpr">NoCuenta</TD>
			<td width="300" class="TituloMenuImpr">Cargo</TD>
		</TR><%
	if (!vTempCampo1.equals("") || !vTempCampo2.equals("")){
		if (vTempCampo1.equals("")) vTempCampo1 = "&nbsp;";
		if (vTempCampo2.equals("")) vTempCampo2 = "&nbsp;";%>
	<TR align="left" bgcolor="<%=sBackColor%>">
			<TD class="ContenidoImprL" width="300" align="center">&nbsp;<%=vTempCampo1%></TD>
			<TD class="ContenidoImprR" width="300" align="center">&nbsp;<%=vTempCampo2%></TD>
		</TR>
	
	<%
		}
	}
	iRowsCount = iRowsCount>=iMaxRowXPag?1:iRowsCount;
	
} // FIN DEL FOR
%>
				<tr>
				<td colspan="2" class="ContenidoImprB">&nbsp;</td>
				</tr>
	</TABLE>
	
	
</td>
	<!-- contenido -->
</tr>
</table><%	
	oAnexoEstatus.Get(iIdFuncionario, iIdAnexo);
	String vChequesSinEntregar = oAnexoEstatus.GetObservacion()!=null?oAnexoEstatus.GetObservacion():"";%>
<table width="900" border="0">
<tr>
<td class="TituloMenuImpr">Cantidad de Cheques sin Entregar:&nbsp;<b><%=vChequesSinEntregar%></b></TD>
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