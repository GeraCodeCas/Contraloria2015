<%/*********************************************************************************************************
Elaboro:	Julio Enrique Espinosa Torres
Lugar:		Monterrey, NL
Fecha:		06.Nov.2002
Compañia:	CONSISS*/%>
<%@page import="com.consiss.util.tools.*"%>
<%@page import="com.gob.*"%>
<%@page import="java.util.*" %>
<%

int iIdFuncionario =  java.lang.Integer.parseInt(
			(request.getParameter("iIdFuncionario")!= null?request.getParameter("iIdFuncionario"):"0") );

java.text.DecimalFormat myFormatter = new java.text.DecimalFormat("###,##0.00");

String sAnexo = "II.2";
Anexo2II oAnexo2II 	= new Anexo2II();
int iIdAnexo = oAnexo2II.GetIdAnexo();
AnexoEstatus 	oAnexoEstatus 	= new AnexoEstatus();
String sPath = "../";
int numpag = 0;
int numtot = 0;

oAnexoEstatus.Get(iIdFuncionario, iIdAnexo);
String sEstatus = oAnexoEstatus.GetEstatus();
%>
<html>
<head>
	<title>Entrega - Recepción : Anexo II.2 (Impresión)</title>
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
<body topmargin="2" leftmargin="2" onLoad="javascript:Imprimir();">
<div align="center">
<!-- Datos que se agregaran a la tabla  -->
<%@include file="HeaderAnexo.jsp"%>
<br>
<table border="0" cellspacing="0" cellpadding="0">
<tr>
	<!-- contenido -->
	<td valign="top">
	<TABLE cellPadding="0" cellSpacing="0" width="100%" BORDER="1" BORDERCOLOR="white">
	<!-- Etiqueta donde se aplican los encabezados de las tablas-->
	<TR><TD class="TituloParrafoImpr" colspan="7">SITUACIÓN DE FONDOS REVOLVENTES</TD></TR>  
	</TABLE>
	<!-- Datos que se agregaran a la tabla  -->
	<TABLE cellPadding="0" cellSpacing="0" width="900"  BORDER="1" BORDERCOLOR="white">
	<!-- Etiqueta donde se aplican los encabezados de las tablas-->
		<TR align="middle">
			<td width="150" class="TituloMenuImpr">Departamento</TD>
			<td width="120" class="TituloMenuImpr">Monto Total Fondo</TD>
			<td width="120" class="TituloMenuImpr">Efectivo</TD>
			<td width="120" class="TituloMenuImpr">Comprobantes</TD>
			<td width="120" class="TituloMenuImpr">Vales Provisionales</TD>
			<td width="120" class="TituloMenuImpr">Otros</TD>
			<td width="150" class="TituloMenuImpr">Responsable del Fondo</TD>
	</TR>
<%		
if(!sEstatus.equals("0")){
			int intContador = 0;
			String sBackColor = "";
			oAnexo2II.GetAll(iIdFuncionario);
				// Variables para Paginacion
			int iLenCol = 0;
			int iRowsMax = 0; // POR REGISTRO
			int iRowsXCol = 0;
			int iRowsCount = 0;
			int iRowsAnt = 0; //posicion anterior
			int iMaxRowXPag = 24; //Numero de Renglones por Pagina
			// Variables para Paginacion
			
		for(int i=0;i<oAnexo2II.GetAll(iIdFuncionario);i++){
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
			// Variables para Paginacion		
			iRowsAnt = iRowsCount; 	

			String vIdRenglon 	= oAnexo2II.GetIdRenglon(i)!=-1?oAnexo2II.GetIdRenglon(i)+"":"0";
			String vDepartamento 					= oAnexo2II.GetDepartamento(i)!=null?oAnexo2II.GetDepartamento(i):"";
			//Primer Elemento que su contenido puede llevar a un salto de pagina
			iLenCol = vDepartamento.length();
			iRowsXCol = 1;
			
			if(iLenCol > 20){
				if(iLenCol%20 == 0){
					iRowsXCol = iLenCol/20;
				}else{
					iRowsXCol = (iLenCol/20)+1;
				}
				
				String temp = vDepartamento;
				vDepartamento = "";
				iRowCountTemp = 0 ;
				for(int x=1;x<=(iRowsXCol);x++){
					int max = (20*x)<=iLenCol ? (20*x) : iLenCol;
					if( (x + iRowsAnt) <= iMaxRowXPag) {
						vDepartamento = vDepartamento + temp.substring((20*(x-1)), max) + "<br>";
						}
					else {
						iRowCountTemp = iRowCountTemp + 1;
						vTempCampo1 = vTempCampo1 + temp.substring((20*(x-1)), max) + "<br>";
						}
					//System.out.println("(x + iRowsAnt):" + (x + iRowsAnt) + " iMaxRowXPag:" + iMaxRowXPag + " vTempCampo1:" + vTempCampo1);
					iRowMaxTemp = iRowMaxTemp >= iRowCountTemp ? iRowMaxTemp : iRowCountTemp ;
				}
				
			}else{
				iRowsMax = 1;
			}	
			
			iRowsMax = iRowsXCol;
			iRowsCount = iRowsMax + iRowsCount;
			
			iRowsMax = iRowsXCol;
			
			// Primer Elemento que su contenido puede llevar a un salto de pagina
			
			String vMontoTotal						= oAnexo2II.GetMontoTotal(i)!=null?oAnexo2II.GetMontoTotal(i):"";
			vMontoTotal = myFormatter.format(new Double(!vMontoTotal.trim().equals("")?vMontoTotal:"0"));
			vMontoTotal = vMontoTotal.trim();
			iLenCol = vMontoTotal.length();
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
				
				String temp = vMontoTotal;
				vMontoTotal = "";
				iRowCountTemp = 0 ;
				for(int x=1;x<=(iRowsXCol);x++){
					int max = (16*x)<=iLenCol ? (16*x) : iLenCol;
					if( (x + iRowsAnt) <= iMaxRowXPag) {
						vMontoTotal = vMontoTotal + temp.substring((16*(x-1)), max) + "<br>";	}
					else {
						iRowCountTemp = iRowCountTemp + 1;
						vTempCampo3 = vTempCampo3 + temp.substring((16*(x-1)), max) + "<br>";	}
				}
				iRowMaxTemp = iRowMaxTemp >= iRowCountTemp ? iRowMaxTemp : iRowCountTemp ;
			}
			
			String vEfectivo 						= oAnexo2II.GetEfectivo(i)!=null?oAnexo2II.GetEfectivo(i):"";
			vEfectivo = myFormatter.format(new Double(!vEfectivo.trim().equals("")?vEfectivo:"0"));
			vEfectivo = vEfectivo.trim();
			iLenCol = vEfectivo.length();
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
				
				String temp = vEfectivo;
				vEfectivo = "";
				iRowCountTemp = 0 ;
				for(int x=1;x<=(iRowsXCol);x++){
					int max = (16*x)<=iLenCol ? (16*x) : iLenCol;
					if( (x + iRowsAnt) <= iMaxRowXPag) {
						vEfectivo = vEfectivo + temp.substring((16*(x-1)), max) + "<br>";	}
					else {
						iRowCountTemp = iRowCountTemp + 1;
						vTempCampo4 = vTempCampo4 + temp.substring((16*(x-1)), max) + "<br>";	}
				}
				iRowMaxTemp = iRowMaxTemp >= iRowCountTemp ? iRowMaxTemp : iRowCountTemp ;
			}
			
			String vComprobantes 					= oAnexo2II.GetComprobantes(i)!=null?oAnexo2II.GetComprobantes(i):"";
			vComprobantes = myFormatter.format(new Double(!vComprobantes.trim().equals("")?vComprobantes:"0"));
			vComprobantes = vComprobantes.trim();
			iLenCol = vComprobantes.length();
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
				
				String temp = vComprobantes;
				vComprobantes = "";
				iRowCountTemp = 0 ;
				for(int x=1;x<=(iRowsXCol);x++){
					int max = (16*x)<=iLenCol ? (16*x) : iLenCol;
					if( (x + iRowsAnt) <= iMaxRowXPag) {
						vComprobantes = vComprobantes + temp.substring((16*(x-1)), max) + "<br>";	}
					else {
						iRowCountTemp = iRowCountTemp + 1;
						vTempCampo5 = vTempCampo5 + temp.substring((16*(x-1)), max) + "<br>";	}
				}
				iRowMaxTemp = iRowMaxTemp >= iRowCountTemp ? iRowMaxTemp : iRowCountTemp ;
			}
			
			String vValesProvisionales 				= oAnexo2II.GetValesProvisionales(i)!=null?oAnexo2II.GetValesProvisionales(i):"";
			vValesProvisionales = myFormatter.format(new Double(!vValesProvisionales.trim().equals("")?vValesProvisionales:"0"));
			vValesProvisionales = vValesProvisionales.trim();
			iLenCol = vValesProvisionales.length();
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
				
				String temp = vValesProvisionales;
				vValesProvisionales = "";
				iRowCountTemp = 0 ;
				for(int x=1;x<=(iRowsXCol);x++){
					int max = (16*x)<=iLenCol ? (16*x) : iLenCol;
					if( (x + iRowsAnt) <= iMaxRowXPag) {
						vValesProvisionales = vValesProvisionales + temp.substring((16*(x-1)), max) + "<br>";	}
					else {
						iRowCountTemp = iRowCountTemp + 1;
						vTempCampo6 = vTempCampo6 + temp.substring((16*(x-1)), max) + "<br>";	}
				}
				iRowMaxTemp = iRowMaxTemp >= iRowCountTemp ? iRowMaxTemp : iRowCountTemp ;
			}
			
			String vOtros							= oAnexo2II.GetOtros(i)!=null?oAnexo2II.GetOtros(i):"";
			vOtros = myFormatter.format(new Double(!vOtros.trim().equals("")?vOtros:"0"));
			vOtros = vOtros.trim();
			iLenCol = vOtros.length();
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
				
				String temp = vOtros;
				vOtros = "";
				iRowCountTemp = 0 ;
				for(int x=1;x<=(iRowsXCol);x++){
					int max = (16*x)<=iLenCol ? (16*x) : iLenCol;
					if( (x + iRowsAnt) <= iMaxRowXPag) {
						vOtros = vOtros + temp.substring((16*(x-1)), max) + "<br>";	}
					else {
						iRowCountTemp = iRowCountTemp + 1;
						vTempCampo7 = vTempCampo7 + temp.substring((16*(x-1)), max) + "<br>";	}
				}
				iRowMaxTemp = iRowMaxTemp >= iRowCountTemp ? iRowMaxTemp : iRowCountTemp ;
			}
			
			String vResponsableFondo 				= oAnexo2II.GetResponsableFondo(i)!=null?oAnexo2II.GetResponsableFondo(i):"";
			// Elemento que su contenido puede llevar a un salto de pagina
			iLenCol = vResponsableFondo.length();
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
				
				String temp = vResponsableFondo;
				vResponsableFondo = "";
				iRowCountTemp = 0 ;
				for(int x=1;x<=(iRowsXCol);x++){
					int max = (20*x)<=iLenCol ? (20*x) : iLenCol;
					if( (x + iRowsAnt) <= iMaxRowXPag) {
						vResponsableFondo = vResponsableFondo + temp.substring((20*(x-1)), max) + "<br>";	}
					else {
						iRowCountTemp = iRowCountTemp + 1;
						vTempCampo2 = vTempCampo2 + temp.substring((20*(x-1)), max) + "<br>";	}
					iRowMaxTemp = iRowMaxTemp >= iRowCountTemp ? iRowMaxTemp : iRowCountTemp ;
				}
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
			<TD width="150" class="ContenidoImprL">&nbsp;<%=vDepartamento%></TD>
			<TD width="120" class="ContenidoImpr" align="right"><%=vMontoTotal%></TD>
			<TD width="120" class="ContenidoImpr" align="right"><%=vEfectivo%></TD>
			<TD width="120" class="ContenidoImpr" align="right"><%=vComprobantes%></TD>
			<TD width="120" class="ContenidoImpr" align="right"><%=vValesProvisionales%></TD>
			<TD width="120" class="ContenidoImpr" align="right"><%=vOtros%></TD>
			<TD width="150" class="ContenidoImprR">&nbsp;<%=vResponsableFondo%></TD>
		</TR>
		<%
		//Si existe la paginacion debera repetir esto		
		if ( (!vTempCampo1.equals("") || !vTempCampo2.equals("")  || !vTempCampo3.equals("")  || !vTempCampo4.equals("")
			 || !vTempCampo5.equals("")  || !vTempCampo6.equals("")  || !vTempCampo7.equals(""))
			|| iRowsCount>=iMaxRowXPag ){
			
		%>
		<tr><td colspan="7" class="ContenidoImprB">&nbsp;</td></tr>
	</TABLE></td>
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
<TABLE cellPadding="0" cellSpacing="0" width="100%" BORDER="1" BORDERCOLOR="white">
	<!-- Etiqueta donde se aplican los encabezados de las tablas-->
	<TR><TD class="TituloParrafoImpr" colspan="7">SITUACIÓN DE FONDOS REVOLVENTES</TD></TR>  
	</TABLE>
	<!-- Datos que se agregaran a la tabla  -->
	<TABLE cellPadding="0" cellSpacing="0" width="900"  BORDER="1" BORDERCOLOR="white">
	<!-- Etiqueta donde se aplican los encabezados de las tablas-->
		<TR align="middle">
			<td width="150" class="TituloMenuImpr">Departamento</TD>
			<td width="120" class="TituloMenuImpr">Monto Total Fondo</TD>
			<td width="120" class="TituloMenuImpr">Efectivo</TD>
			<td width="120" class="TituloMenuImpr">Comprobantes</TD>
			<td width="120" class="TituloMenuImpr">Vales Provisionales</TD>
			<td width="120" class="TituloMenuImpr">Otros</TD>
			<td width="150" class="TituloMenuImpr">Responsable del Fondo</TD>
	</TR><%
	if (!vTempCampo1.equals("") || !vTempCampo2.equals("") || !vTempCampo3.equals("")  || !vTempCampo4.equals("")
		 || !vTempCampo5.equals("")  || !vTempCampo6.equals("")  || !vTempCampo7.equals("")){
		if (vTempCampo1.equals("")) vTempCampo1 = "&nbsp;";
		if (vTempCampo2.equals("")) vTempCampo2 = "&nbsp;";
		if (vTempCampo3.equals("")) vTempCampo3 = "&nbsp;";
		if (vTempCampo4.equals("")) vTempCampo4 = "&nbsp;";
		if (vTempCampo5.equals("")) vTempCampo5 = "&nbsp;";
		if (vTempCampo6.equals("")) vTempCampo6 = "&nbsp;";
		if (vTempCampo7.equals("")) vTempCampo7 = "&nbsp;";%>	
	<TR align="left" bgcolor="<%=sBackColor%>">
			<TD width="150" class="ContenidoImprL"><%=vTempCampo1%></TD>
			<TD width="120" class="ContenidoImpr" align="right"><%=vTempCampo3%></TD>
			<TD width="120" class="ContenidoImpr" align="right"><%=vTempCampo4%></TD>
			<TD width="120" class="ContenidoImpr" align="right"><%=vTempCampo4%></TD>
			<TD width="120" class="ContenidoImpr" align="right"><%=vTempCampo6%></TD>
			<TD width="120" class="ContenidoImpr" align="right"><%=vTempCampo7%></TD>
			<TD width="150" class="ContenidoImprR"><%=vTempCampo2%></TD>
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
			String vFechaCorte 		= oAnexoEstatus.GetObservacion()!=null?oAnexoEstatus.GetObservacion():"";
					sBackColor = "#ffffff";%>
<table width="200" border="0">
<tr>
<td class="TituloMenuImpr">Fecha de Corte</TD>
<TD align="left" class="ContenidoImpr">&nbsp;<%=vFechaCorte%></TD>
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