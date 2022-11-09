<%/*********************************************************************************************************
Elaboro:	Julio Enrique Espinosa Torres
Lugar:		Monterrey, NL
Fecha:		18.Nov.2002
Compañia:	CONSISS*/%>
<%@page import="com.consiss.util.tools.*"%>
<%@page import="com.gob.*"%>
<%@page import="java.util.*" %>
<%

int iIdFuncionario =  java.lang.Integer.parseInt(
			(request.getParameter("iIdFuncionario")!= null?request.getParameter("iIdFuncionario"):"0") );

String sAnexo = "II.4.2";
java.text.DecimalFormat myFormatter = new java.text.DecimalFormat("###,##0.00");

Anexo2IV2 oAnexo2IV2 	= new Anexo2IV2();
int iIdAnexo = oAnexo2IV2.GetIdAnexo();
AnexoEstatus 	oAnexoEstatus 	= new AnexoEstatus();
String sPath = "../";
int numpag = 0;
int numtot = 0;
oAnexoEstatus.Get(iIdFuncionario, iIdAnexo);
String sEstatus = oAnexoEstatus.GetEstatus();
%>
<html>
<head>
	<title>Entrega - Recepción : Anexo II.4.2 (Impresión)</title>
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
<body topmargin="2" leftmargin="2" onLoad="javascript:Imprimir();">
<div align="center">
<!-- Datos que se agregaran a la tabla  -->
<%@include file="HeaderAnexo.jsp"%>
<br>
<table border="0" cellspacing="0" cellpadding="0">
<tr>
	<!-- contenido -->
	<td valign="top">
	<TABLE cellPadding="0" cellSpacing="0" width="100%" BORDER="1" BORDERCOLOR="White">
		<!-- Etiqueta donde se aplican los encabezados de las tablas-->
		<TR><TD class="TituloParrafoImpr" colspan="6">RELACIÓN DE CHEQUES EXPEDIDOS SIN ENTREGAR</TD></TR>  
	<table>
	<!-- Datos que se agregaran a la tabla  -->
	<TABLE cellPadding="0" cellSpacing="0" width="900"  BORDER="1" BORDERCOLOR="white">
	<!-- Etiqueta donde se aplican los encabezados de las tablas-->
		<TR align="middle">
			<td width="80" class="TituloMenuImpr">Fecha</TD>
			<td width="200" class="TituloMenuImpr">Numero de Cuenta</TD>
			<td width="100" class="TituloMenuImpr">Banco</TD>
			<td width="200" class="TituloMenuImpr">Beneficiario</TD>
			<td width="200" class="TituloMenuImpr">Numero de Cheque</TD>
			<td width="120" class="TituloMenuImpr">Importe</TD>
		</TR>
<%		
if(!sEstatus.equals("0")){
			int intContador = 0;
			String sBackColor = "";
			oAnexo2IV2.GetAll(iIdFuncionario);
			
			// Variables para Paginacion
			int iLenCol = 0;
			int iRowsMax = 0; // POR REGISTRO
			int iRowsXCol = 0;
			int iRowsCount = 0;
			int iRowsAnt = 0; //posicion anterior
			int iMaxRowXPag = 24; //Numero de Renglones por Pagina
			// Variables para Paginacion
			
		for(int i=0;i<oAnexo2IV2.GetAll(iIdFuncionario);i++){
		  // Variables para Paginacion
			int iRowMaxTemp = 1;
			int iRowCountTemp = 0;
			String vTempCampo1 = "";
			String vTempCampo2 = "";
			String vTempCampo3 = "";
			String vTempCampo4 = "";
			// Variables para Paginacion		
			iRowsAnt = iRowsCount; 	
			
			String vIdRenglon 					= oAnexo2IV2.GetIdRenglon(i)!=-1?oAnexo2IV2.GetIdRenglon(i)+"":"0";
			String vFecha 							= oAnexo2IV2.GetFecha(i)!=null?oAnexo2IV2.GetFecha(i):"";
			String vNoCuenta						= oAnexo2IV2.GetNoCuenta(i)!=null?oAnexo2IV2.GetNoCuenta(i):"";
			//Primer Elemento que su contenido puede llevar a un salto de pagina
			iLenCol = vNoCuenta.length();
			iRowsXCol = 1;
			
			if(iLenCol > 27){
				if(iLenCol%27 == 0){
					iRowsXCol = iLenCol/27;
				}else{
					iRowsXCol = (iLenCol/27)+1;
				}
				
				String temp = vNoCuenta;
				vNoCuenta = "";
				iRowCountTemp = 0 ;
				for(int x=1;x<=(iRowsXCol);x++){
					int max = (27*x)<=iLenCol ? (27*x) : iLenCol;
					if( (x + iRowsAnt) <= iMaxRowXPag) {
						vNoCuenta = vNoCuenta + temp.substring((27*(x-1)), max) + "<br>";
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
			
			
			String vBanco 							= oAnexo2IV2.GetBanco(i)!=null?oAnexo2IV2.GetBanco(i):"";
			String vBeneficiario 					= oAnexo2IV2.GetBeneficiario(i)!=null?oAnexo2IV2.GetBeneficiario(i):"";
			// Elemento que su contenido puede llevar a un salto de pagina
			iLenCol = vBeneficiario.length();
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
				
				String temp = vBeneficiario;
				vBeneficiario = "";
				iRowCountTemp = 0 ;
				for(int x=1;x<=(iRowsXCol);x++){
					int max = (27*x)<=iLenCol ? (27*x) : iLenCol;
					if( (x + iRowsAnt) <= iMaxRowXPag) {
						vBeneficiario = vBeneficiario + temp.substring((27*(x-1)), max) + "<br>";	}
					else {
						iRowCountTemp = iRowCountTemp + 1;
						vTempCampo2 = vTempCampo2 + temp.substring((27*(x-1)), max) + "<br>";	}
				}
				iRowMaxTemp = iRowMaxTemp >= iRowCountTemp ? iRowMaxTemp : iRowCountTemp ;
			}else{
				iRowsXCol = 1;
			}	
			// Elemento que su contenido puede llevar a un salto de pagina
			
			String vNoCheque 						= oAnexo2IV2.GetNoCheque(i)!=null?oAnexo2IV2.GetNoCheque(i):"";
			// Elemento que su contenido puede llevar a un salto de pagina
			iLenCol = vNoCheque.length();
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
				
				String temp = vNoCheque;
				vNoCheque = "";
				iRowCountTemp = 0 ;
				for(int x=1;x<=(iRowsXCol);x++){
					int max = (27*x)<=iLenCol ? (27*x) : iLenCol;
					if( (x + iRowsAnt) <= iMaxRowXPag) {
						vNoCheque = vNoCheque + temp.substring((27*(x-1)), max) + "<br>";	}
					else {
						iRowCountTemp = iRowCountTemp + 1;
						vTempCampo3 = vTempCampo3 + temp.substring((27*(x-1)), max) + "<br>";	}
				}
				iRowMaxTemp = iRowMaxTemp >= iRowCountTemp ? iRowMaxTemp : iRowCountTemp ;
			}else{
				iRowsXCol = 1;
			}	
			// Elemento que su contenido puede llevar a un salto de pagina
			
			String vImporte							= oAnexo2IV2.GetImporte(i)!=null?oAnexo2IV2.GetImporte(i):"";
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
			
			intContador = intContador + 1;
		 if (intContador%2 == 0){
					sBackColor = "#ffffff";
				}else{
					sBackColor = "#dddddd";
			  }%>
		<TR align="left" bgcolor="<%=sBackColor%>">
			<TD width="80" class="ContenidoImprL" align="center"><%=vFecha%></TD>
			<TD width="200" class="ContenidoImpr"><%=vNoCuenta%></TD>
			<TD width="100" class="ContenidoImpr"><%=vBanco%></TD>
			<TD width="200" class="ContenidoImpr"><%=vBeneficiario%></TD>
			<TD width="200" class="ContenidoImpr"><%=vNoCheque%></TD>
			<TD width="120" class="ContenidoImprR" align="right"><%=vImporte%></TD>
		</TR>
		<%
		//Si existe la paginacion debera repetir esto		
		if ( (!vTempCampo1.equals("") || !vTempCampo2.equals("") || !vTempCampo3.equals("") || !vTempCampo4.equals("") )
			|| iRowsCount>=iMaxRowXPag ){
		%>
		<tr><td colspan="6" class="ContenidoImprB">&nbsp;</td></tr>
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
	<TABLE cellPadding="0" cellSpacing="0" width="100%" BORDER="1" BORDERCOLOR="White">
		<!-- Etiqueta donde se aplican los encabezados de las tablas-->
		<TR><TD class="TituloParrafoImpr" colspan="6">RELACIÓN DE CHEQUES EXPEDIDOS SIN ENTREGAR</TD></TR>  
	<table>
	<!-- Datos que se agregaran a la tabla  -->
	<TABLE cellPadding="0" cellSpacing="0" width="900"  BORDER="1" BORDERCOLOR="white">
	<!-- Etiqueta donde se aplican los encabezados de las tablas-->
		<TR align="middle">
			<td width="80" class="TituloMenuImpr">Fecha</TD>
			<td width="200" class="TituloMenuImpr">Numero de Cuenta</TD>
			<td width="100" class="TituloMenuImpr">Banco</TD>
			<td width="200" class="TituloMenuImpr">Beneficiario</TD>
			<td width="200" class="TituloMenuImpr">Numero de Cheque</TD>
			<td width="120" class="TituloMenuImpr">Importe</TD>
		</TR>
<%if (!vTempCampo1.equals("") || !vTempCampo2.equals("") || !vTempCampo3.equals("") || !vTempCampo4.equals("")){
			if (vTempCampo1.equals("")) vTempCampo1 = "&nbsp;";
			if (vTempCampo2.equals("")) vTempCampo2 = "&nbsp;";
			if (vTempCampo3.equals("")) vTempCampo3 = "&nbsp;";
			if (vTempCampo4.equals("")) vTempCampo4 = "&nbsp;";%>
	<TR align="left" bgcolor="<%=sBackColor%>">
			<TD width="80" class="ContenidoImprL" align="center">&nbsp;</TD>
			<TD width="200" class="ContenidoImpr"><%=vTempCampo1%></TD>
			<TD width="100" class="ContenidoImpr">&nbsp;</TD>
			<TD width="200" class="ContenidoImpr"><%=vTempCampo2%></TD>
			<TD width="200" class="ContenidoImpr"><%=vTempCampo3%></TD>
			<TD width="120" class="ContenidoImprR" align="right"><%=vTempCampo4%></TD>
		</TR>
<%
			}
		}
			iRowsCount = iRowsCount>=iMaxRowXPag?iRowMaxTemp:iRowsCount;
			
		} // FIN DEL FOR
//Si existe la paginacion debera repetir esto		
		%>
	<tr>
				<td colspan="7" class="ContenidoImprB">&nbsp;</td>
				</tr>
	</TABLE>
</td>
	<!-- contenido -->
</tr>
</table>
<br>
</div>
<%		
				oAnexoEstatus.Get(iIdFuncionario, iIdAnexo);
			String vChequesObran 		= oAnexoEstatus.GetObservacion()!=null?oAnexoEstatus.GetObservacion():"";
					sBackColor = "#ffffff";%>
<table width="900" border="0">
<tr>
<td class="TituloMenuImpr">Los Cheques de la presente relación son todos los que obran en poder de esta Unidad Administrativa al&nbsp;<b><%=vChequesObran%></b></TD>
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
