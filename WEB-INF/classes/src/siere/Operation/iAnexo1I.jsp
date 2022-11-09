<%/*********************************************************************************************************
Elaboro:	Julio Enrique Espinosa Torres
Lugar:		Monterrey, NL
Fecha:		29.Oct.2002
Compañia:	CONSISS*/%>
<%@page import="com.consiss.util.tools.*"%>
<%@page import="com.gob.*"%>
<%@page import="java.util.*" %>
<%
String	sCodigo = request.getParameter("sCodigo")!= null?request.getParameter("sCodigo"): "0";
int iIdFuncionario =  java.lang.Integer.parseInt(
			(request.getParameter("iIdFuncionario")!= null?request.getParameter("iIdFuncionario"):"0") );

Anexo1I oAnexo1I 	= new Anexo1I();
String sAnexo = "I.1";
DetalleAnexo1I oDetalleAnexo1I 	= new DetalleAnexo1I();
String sPath = "../";
int numpag =0;
int numtot = 0;

int iIdAnexo = oAnexo1I.GetIdAnexo();
AnexoEstatus	oAnexoEstatus		= new AnexoEstatus();
oAnexoEstatus.Get(iIdFuncionario, iIdAnexo);
String sEstatus = oAnexoEstatus.GetEstatus();
%>
<html>
<head>
<title>Entrega - Recepción : Anexo I.1 (Impresión)</title>
<link rel="stylesheet" type="text/css" href="<%=sPath%>Styles/Gobierno.css">
<script language="JavaScript" src="<%=sPath%>Scripts/Gobierno.js"></script>
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
	<TABLE cellPadding="0" width="900" cellSpacing="0" BORDER="1" BORDERCOLOR="white">
	<!-- Etiqueta donde se aplican los encabezados de las tablas-->
	<tr><td class="TituloParrafoImpr">DOCUMENTOS DE CREACIÓN, INTEGRACIÓN DEL ORGANO DE GOBIERNO Y ACTAS DE SESIONES</td>
	</tr>
	</table>
	<!-- Datos que se agregaran a la tabla  -->
	<TABLE cellPadding="0" cellSpacing="0" width="900"  BORDER="1" BORDERCOLOR="white">
	<!-- Etiqueta donde se aplican los encabezados de las tablas-->
			<TR align="middle">
			<td width="100" class="TituloMenuImpr" rowspan="2">Ley, Decreto, Acuerdo, Contrato de Fideicomiso, Acta Constitutiva</TD>
			<td width="100" class="TituloMenuImpr" rowspan="2">Nombre</TD>
			<td width="100" class="TituloMenuImpr" rowspan="2">Objetivo General</TD>
			<td width="100" class="TituloMenuImpr" rowspan="2">Fideicomitente</TD>
			<td width="100" class="TituloMenuImpr" rowspan="2">Fiduciario</TD>
			<td width="100" class="TituloMenuImpr" rowspan="2">Fideicomisario</TD>
			<td width="100" class="TituloMenuImpr" rowspan="2">Fecha de Creación</TD>
			<td width="200" class="TituloMenuImpr" colspan="2">Publicación</TD>
			</tr>
			<tr>
			<td width="100" class="TituloMenuImpr" align="center">Fecha</TD>
			<td width="100" class="TituloMenuImpr" align="center">Periodico Oficial No.</TD>
			</tr>
			
	<%		
	if(!sEstatus.equals("0")){
			int intContador = 0;
			String sBackColor = "";
			oAnexo1I.GetAll(iIdFuncionario);
			// Variables para Paginacion
			int iLenCol = 0;
			int iRowsMax = 0; // POR REGISTRO
			int iRowsXCol = 0;
			int iRowsCount = 0;
			int iRowsAnt = 0; //posicion anterior
			int iMaxRowXPag = 18; //Numero de Renglones por Pagina
			// Variables para Paginacion
			
		for(int i=0;i<oAnexo1I.GetAll(iIdFuncionario);i++){
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
			
			String vIdRenglon 						= oAnexo1I.GetIdRenglon(i)!=-1?oAnexo1I.GetIdRenglon(i)+"":"0";
			String vLey 									= oAnexo1I.GetLey(i)!=null?oAnexo1I.GetLey(i):"";
			//Primer Elemento que su contenido puede llevar a un salto de pagina
			iLenCol = vLey.length();
			iRowsXCol = 1;
			
			if(iLenCol > 13){
				if(iLenCol%13 == 0){
					iRowsXCol = iLenCol/13;
				}else{
					iRowsXCol = (iLenCol/13)+1;
				}
				
				String temp = vLey;
				vLey = "";
				iRowCountTemp = 0 ;
				for(int x=1;x<=(iRowsXCol);x++){
					int max = (13*x)<=iLenCol ? (13*x) : iLenCol;
					if( (x + iRowsAnt) <= iMaxRowXPag) {
						vLey = vLey + temp.substring((13*(x-1)), max) + "<br>";
						}
					else {
						iRowCountTemp = iRowCountTemp + 1;
						vTempCampo1 = vTempCampo1 + temp.substring((13*(x-1)), max) + "<br>";
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
			
			String vNombre 								= oAnexo1I.GetNombre(i)!=null?oAnexo1I.GetNombre(i):"";
			// Elemento que su contenido puede llevar a un salto de pagina
			iLenCol = vNombre.length();
			if(iLenCol > 13){
				if(iLenCol%13 == 0){
					iRowsXCol = iLenCol/13;
				}else{
					iRowsXCol = (iLenCol/13)+1;
				}
				
				if (iRowsXCol > iRowsMax){
				    iRowsCount = iRowsXCol - iRowsMax + iRowsCount;
					iRowsMax = iRowsXCol;
				}
				
				String temp = vNombre;
				vNombre = "";
				iRowCountTemp = 0 ;
				for(int x=1;x<=(iRowsXCol);x++){
					int max = (13*x)<=iLenCol ? (13*x) : iLenCol;
					if( (x + iRowsAnt) <= iMaxRowXPag) {
						vNombre = vNombre + temp.substring((13*(x-1)), max) + "<br>";	}
					else {
						iRowCountTemp = iRowCountTemp + 1;
						vTempCampo2 = vTempCampo2 + temp.substring((13*(x-1)), max) + "<br>";	}
				}
				iRowMaxTemp = iRowMaxTemp >= iRowCountTemp ? iRowMaxTemp : iRowCountTemp ;
			}else{
				iRowsXCol = 1;
			}	
			// Elemento que su contenido puede llevar a un salto de pagina
			
			
			String vObjetivoGeneral				= oAnexo1I.GetObjetivoGeneral(i)!=null?oAnexo1I.GetObjetivoGeneral(i):"";
			// Elemento que su contenido puede llevar a un salto de pagina
			iLenCol = vObjetivoGeneral.length();
			if(iLenCol > 13){
				if(iLenCol%13 == 0){
					iRowsXCol = iLenCol/13;
				}else{
					iRowsXCol = (iLenCol/13)+1;
				}
				
				if (iRowsXCol > iRowsMax){
				    iRowsCount = iRowsXCol - iRowsMax + iRowsCount;
					iRowsMax = iRowsXCol;
				}
				
				String temp = vObjetivoGeneral;
				vObjetivoGeneral = "";
				iRowCountTemp = 0 ;
				for(int x=1;x<=(iRowsXCol);x++){
					int max = (13*x)<=iLenCol ? (13*x) : iLenCol;
					if( (x + iRowsAnt) <= iMaxRowXPag) {
						vObjetivoGeneral = vObjetivoGeneral + temp.substring((13*(x-1)), max) + "<br>";	}
					else {
						iRowCountTemp = iRowCountTemp + 1;
						vTempCampo3 = vTempCampo3 + temp.substring((13*(x-1)), max) + "<br>";	}
				}
				iRowMaxTemp = iRowMaxTemp >= iRowCountTemp ? iRowMaxTemp : iRowCountTemp ;
			}else{
				iRowsXCol = 1;
			}	
			// Elemento que su contenido puede llevar a un salto de pagina
			
			String vFideicomitente 				= oAnexo1I.GetFideicomitente(i)!=null?oAnexo1I.GetFideicomitente(i):"";
			// Elemento que su contenido puede llevar a un salto de pagina
			iLenCol = vFideicomitente.length();
			if(iLenCol > 13){
				if(iLenCol%13 == 0){
					iRowsXCol = iLenCol/13;
				}else{
					iRowsXCol = (iLenCol/13)+1;
				}
				
				if (iRowsXCol > iRowsMax){
				    iRowsCount = iRowsXCol - iRowsMax + iRowsCount;
					iRowsMax = iRowsXCol;
				}
				
				String temp = vFideicomitente;
				vFideicomitente = "";
				iRowCountTemp = 0 ;
				for(int x=1;x<=(iRowsXCol);x++){
					int max = (13*x)<=iLenCol ? (13*x) : iLenCol;
					if( (x + iRowsAnt) <= iMaxRowXPag) {
						vFideicomitente = vFideicomitente + temp.substring((13*(x-1)), max) + "<br>";	}
					else {
						iRowCountTemp = iRowCountTemp + 1;
						vTempCampo4 = vTempCampo4 + temp.substring((13*(x-1)), max) + "<br>";	}
				}
				iRowMaxTemp = iRowMaxTemp >= iRowCountTemp ? iRowMaxTemp : iRowCountTemp ;
			}else{
				iRowsXCol = 1;
			}	
			// Elemento que su contenido puede llevar a un salto de pagina
			
			String vFiduciario 						= oAnexo1I.GetFiduciario(i)!=null?oAnexo1I.GetFiduciario(i):"";
			// Elemento que su contenido puede llevar a un salto de pagina
			iLenCol = vFiduciario.length();
			if(iLenCol > 13){
				if(iLenCol%13 == 0){
					iRowsXCol = iLenCol/13;
				}else{
					iRowsXCol = (iLenCol/13)+1;
				}
				
				if (iRowsXCol > iRowsMax){
				    iRowsCount = iRowsXCol - iRowsMax + iRowsCount;
					iRowsMax = iRowsXCol;
				}
				
				String temp = vFiduciario;
				vFiduciario = "";
				iRowCountTemp = 0 ;
				for(int x=1;x<=(iRowsXCol);x++){
					int max = (13*x)<=iLenCol ? (13*x) : iLenCol;
					if( (x + iRowsAnt) <= iMaxRowXPag) {
						vFiduciario = vFiduciario + temp.substring((13*(x-1)), max) + "<br>";	}
					else {
						iRowCountTemp = iRowCountTemp + 1;
						vTempCampo5 = vTempCampo5 + temp.substring((13*(x-1)), max) + "<br>";	}
				}
				iRowMaxTemp = iRowMaxTemp >= iRowCountTemp ? iRowMaxTemp : iRowCountTemp ;
			}else{
				iRowsXCol = 1;
			}	
			// Elemento que su contenido puede llevar a un salto de pagina
			
			String vFideicomisario 				= oAnexo1I.GetFideicomisario(i)!=null?oAnexo1I.GetFideicomisario(i):"";
			// Elemento que su contenido puede llevar a un salto de pagina
			iLenCol = vFideicomisario.length();
			if(iLenCol > 13){
				if(iLenCol%13 == 0){
					iRowsXCol = iLenCol/13;
				}else{
					iRowsXCol = (iLenCol/13)+1;
				}
				
				if (iRowsXCol > iRowsMax){
				    iRowsCount = iRowsXCol - iRowsMax + iRowsCount;
					iRowsMax = iRowsXCol;
				}
				
				String temp = vFideicomisario;
				vFideicomisario = "";
				iRowCountTemp = 0 ;
				for(int x=1;x<=(iRowsXCol);x++){
					int max = (13*x)<=iLenCol ? (13*x) : iLenCol;
					if( (x + iRowsAnt) <= iMaxRowXPag) {
						vFideicomisario = vFideicomisario + temp.substring((13*(x-1)), max) + "<br>";	}
					else {
						iRowCountTemp = iRowCountTemp + 1;
						vTempCampo6 = vTempCampo6 + temp.substring((13*(x-1)), max) + "<br>";	}
				}
				iRowMaxTemp = iRowMaxTemp >= iRowCountTemp ? iRowMaxTemp : iRowCountTemp ;
			}else{
				iRowsXCol = 1;
			}	
			// Elemento que su contenido puede llevar a un salto de pagina
			
			String vFechaCreacion		      = oAnexo1I.GetFechaCreacion(i)!=null?oAnexo1I.GetFechaCreacion(i):"";
			String vFechaPublicacion 			= oAnexo1I.GetFechaPublicacion(i)!=null?oAnexo1I.GetFechaPublicacion(i):"";
			String vPeriodicoOficial 			= oAnexo1I.GetPeriodicoOficial(i)!=null?oAnexo1I.GetPeriodicoOficial(i):"";
			// Elemento que su contenido puede llevar a un salto de pagina
			iLenCol = vPeriodicoOficial.length();
			if(iLenCol > 13){
				if(iLenCol%13 == 0){
					iRowsXCol = iLenCol/13;
				}else{
					iRowsXCol = (iLenCol/13)+1;
				}
				
				if (iRowsXCol > iRowsMax){
				    iRowsCount = iRowsXCol - iRowsMax + iRowsCount;
					iRowsMax = iRowsXCol;
				}
				
				String temp = vPeriodicoOficial;
				vPeriodicoOficial = "";
				iRowCountTemp = 0 ;
				for(int x=1;x<=(iRowsXCol);x++){
					int max = (13*x)<=iLenCol ? (13*x) : iLenCol;
					if( (x + iRowsAnt) <= iMaxRowXPag) {
						vPeriodicoOficial = vPeriodicoOficial + temp.substring((13*(x-1)), max) + "<br>";	}
					else {
						iRowCountTemp = iRowCountTemp + 1;
						vTempCampo7 = vTempCampo7 + temp.substring((13*(x-1)), max) + "<br>";	}
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
<TR valign="top" align="left" bgcolor="<%=sBackColor%>">
			<TD class="ContenidoImprL"><%=vLey%></TD>
			<TD class="ContenidoImpr"><%=vNombre%></TD>
			<TD class="ContenidoImpr"><%=vObjetivoGeneral%></TD>
			<TD class="ContenidoImpr"><%=vFideicomitente==null || vFideicomitente.trim().equals("")?"&nbsp;":vFideicomitente%></TD>
			<TD class="ContenidoImpr"><%=vFiduciario == null || vFiduciario.trim().equals("")?"&nbsp;":vFiduciario%></TD>
			<TD class="ContenidoImpr"><%=vFideicomisario == null || vFideicomisario.trim().equals("")?"&nbsp;":vFideicomisario%></TD>
			<TD width="100" class="ContenidoImpr"><%=vFechaCreacion == null || vFechaCreacion.trim().equals("")?"&nbsp;":vFechaCreacion%></TD>
			<td width="100" class="ContenidoImpr"><%=vFechaPublicacion == null || vFechaPublicacion.trim().equals("")?"&nbsp;":vFechaPublicacion%></TD>
			<td class="ContenidoImprR"><%=vPeriodicoOficial == null || vPeriodicoOficial.trim().equals("")?"&nbsp;":vPeriodicoOficial%></TD>
		</TR>
		<%
		//Si existe la paginacion debera repetir esto		
		if ( (!vTempCampo1.equals("") || !vTempCampo2.equals("") || !vTempCampo3.equals("") || !vTempCampo4.equals("") || !vTempCampo5.equals("") || !vTempCampo6.equals("") || !vTempCampo7.equals("") )
			|| iRowsCount>=iMaxRowXPag ){		%>
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
	<tr><td class="TituloParrafoImpr">DOCUMENTOS DE CREACIÓN, INTEGRACIÓN DEL ORGANO DE GOBIERNO Y ACTAS DE SESIONES</td>
	</tr>
	</table>
	<!-- Datos que se agregaran a la tabla  -->
	<TABLE cellPadding="0" cellSpacing="0" width="900"  BORDER="1" BORDERCOLOR="white">
	<!-- Etiqueta donde se aplican los encabezados de las tablas-->
			<TR align="middle">
			<td width="100" class="TituloMenuImpr" rowspan="2">Ley, Decreto, Acuerdo, Contrato de Fideicomiso, Acta Constitutiva</TD>
			<td width="100" class="TituloMenuImpr" rowspan="2">Nombre</TD>
			<td width="100" class="TituloMenuImpr" rowspan="2">Objetivo General</TD>
			<td width="100" class="TituloMenuImpr" rowspan="2">Fideicomitente</TD>
			<td width="100" class="TituloMenuImpr" rowspan="2">Fiduciario</TD>
			<td width="100" class="TituloMenuImpr" rowspan="2">Fideicomisario</TD>
			<td width="100" class="TituloMenuImpr" rowspan="2">Fecha de Creación</TD>
			<td width="200" class="TituloMenuImpr" colspan="2">Publicación</TD>
			</tr>
			<tr>
			<td width="100" class="TituloMenuImpr" align="center">Fecha</TD>
			<td width="100" class="TituloMenuImpr" align="center">Periodico Oficial No.</TD>
			</tr><%
			if (!vTempCampo1.equals("") || !vTempCampo2.equals("") || !vTempCampo3.equals("") || !vTempCampo4.equals("") || !vTempCampo5.equals("") || !vTempCampo6.equals("") || !vTempCampo7.equals("") ){
				if (vTempCampo1.equals("")) vTempCampo1 = "&nbsp;";
				if (vTempCampo2.equals("")) vTempCampo2 = "&nbsp;";
				if (vTempCampo3.equals("")) vTempCampo3 = "&nbsp;";
				if (vTempCampo4.equals("")) vTempCampo4 = "&nbsp;";
				if (vTempCampo5.equals("")) vTempCampo5 = "&nbsp;";
				if (vTempCampo6.equals("")) vTempCampo6 = "&nbsp;";
				if (vTempCampo7.equals("")) vTempCampo7 = "&nbsp;";			%>
	<TR valign="top" align="left" bgcolor="<%=sBackColor%>">
			<TD class="ContenidoImprL"><%=vTempCampo1%></TD>
			<TD class="ContenidoImpr"><%=vTempCampo2%></TD>
			<TD class="ContenidoImpr"><%=vTempCampo3%></TD>
			<TD class="ContenidoImpr"><%=vTempCampo4%></TD>
			<TD class="ContenidoImpr"><%=vTempCampo5%></TD>
			<TD class="ContenidoImpr"><%=vTempCampo6%></TD>
			<TD width="100" class="ContenidoImpr">&nbsp;</TD>
			<td width="100" class="ContenidoImpr">&nbsp;</td>
			<td class="ContenidoImprR"><%=vTempCampo7%></td>
		</TR>	<%
			}
		}
		iRowsCount = iRowsCount>=iMaxRowXPag?iRowMaxTemp:iRowsCount;
			
		} // FIN DEL FOR
//Si existe la paginacion debera repetir esto				%>
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
	<TABLE cellPadding="0" cellSpacing="0" width="900" BORDER="1" BORDERCOLOR="black" align="center">
	<!-- Etiqueta donde se aplican los encabezados de las tablas-->
		<TR align="middle">
			<td width="450" class="TituloMenuImpr">Integración del Organo de Gobierno</TD>
			<td width="450" class="TituloMenuImpr">Actas de Sesión: Octubre 1997</TD>
		</TR>
		<%
			oDetalleAnexo1I.Get(iIdFuncionario);
			// Variables para Paginacion
			String vTempCampo1 = "";
			String vTempCampo2 = "";
			// Variables para Paginacion	
				
			iRowsAnt = iRowsCount;
			
			String vIntegracion 		= oDetalleAnexo1I.GetIntegracion()!=null?oDetalleAnexo1I.GetIntegracion():"";
			// Elemento que su contenido puede llevar a un salto de pagina
			iLenCol = vIntegracion.length();
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
				
				String temp = vIntegracion;
				vIntegracion = "";
				for(int x=1;x<=(iRowsXCol);x++){
					int max = (60*x)<=iLenCol ? (60*x) : iLenCol;
					if( (x + iRowsAnt) <= iMaxRowXPag) {
						vIntegracion = vIntegracion + temp.substring((60*(x-1)), max) + "<br>";
						}
					else {
						vTempCampo1= vTempCampo1 + temp.substring((60*(x-1)), max) + "<br>";
						}
				}
			}else{
				iRowsXCol = 1;
			}	
			
			iRowsMax = iRowsXCol;
			iRowsCount = iRowsMax + iRowsCount;
			
			iRowsMax = iRowsXCol;
			// Elemento que su contenido puede llevar a un salto de pagina
			
			
			
			String vActasSesion 		= oDetalleAnexo1I.GetActasSesion()!=null?oDetalleAnexo1I.GetActasSesion():"";
			// Elemento que su contenido puede llevar a un salto de pagina
			iLenCol = vActasSesion.length();
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
				
				String temp = vActasSesion;
				vActasSesion = "";
				for(int x=1;x<=(iRowsXCol);x++){
					int max = (60*x)<=iLenCol ? (60*x) : iLenCol;
					if( (x + iRowsAnt) <= iMaxRowXPag) {
						vActasSesion = vActasSesion + temp.substring((60*(x-1)), max) + "<br>";
						}
					else {
						vTempCampo2= vTempCampo2 + temp.substring((60*(x-1)), max) + "<br>";
						}
				}
			}else{
				iRowsXCol = 1;
			}	
			// Elemento que su contenido puede llevar a un salto de pagina
			
					sBackColor = "#ffffff";
					
					%>
	<TR valign="top" align="left" bgcolor="<%=sBackColor%>">
				<TD width="450" bordercolor="#000000" class="ContenidoImpr">&nbsp;<%=vIntegracion%></TD>
				<TD width="450" bordercolor="#000000" class="ContenidoImpr">&nbsp;<%=vActasSesion%></TD>
			</tr>
	<%
	//Si existe la paginacion debera repetir esto		
		if ( (!vTempCampo1.equals("") || !vTempCampo2.equals(""))
			|| iRowsCount>=iMaxRowXPag ){
		%>
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
	<TABLE cellPadding="0" cellSpacing="0" width="900" BORDER="1" BORDERCOLOR="black" align="center">
	<!-- Etiqueta donde se aplican los encabezados de las tablas-->
		<TR align="middle">
			<td width="450" class="TituloMenuImpr">Integración del Organo de Gobierno</TD>
			<td width="450" class="TituloMenuImpr">Actas de Sesión: Octubre 1997</TD>
		</TR>
	<%if (!vTempCampo1.equals("") || !vTempCampo2.equals("")){%>
	<TR align="left" bgcolor="<%=sBackColor%>">
			<TD class="ContenidoImprL" width="450" align="center">&nbsp;<%=vTempCampo1%></TD>
			<TD class="ContenidoImprR" width="450" align="center">&nbsp;<%=vTempCampo2%></TD>
		</TR>
	<%
			}
		}
			iRowsCount = iRowsCount>=iMaxRowXPag?1:iRowsCount;
			
		
//Si existe la paginacion debera repetir esto		
		%>
				<tr>
				<td colspan="2" class="ContenidoImprB">&nbsp;</td>
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