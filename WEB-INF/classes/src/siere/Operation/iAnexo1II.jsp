<%/*********************************************************************************************************
Elaboro:	Julio Enrique Espinosa Torres
Lugar:		Monterrey, NL
Fecha:		29.Oct.2002
Compañia:	CONSISS
*********************************************************************************************************/%>
<%@page import="com.consiss.util.tools.*"%>
<%@page import="com.gob.*"%>
<%@page import="java.util.*" %>
<%

int iIdFuncionario =  java.lang.Integer.parseInt(
			(request.getParameter("iIdFuncionario")!= null?request.getParameter("iIdFuncionario"):"0") );

java.text.DecimalFormat myFormatter = new java.text.DecimalFormat("###,##0.00");
String sAnexo = "I.2";
Anexo1II oAnexo1II 	= new Anexo1II();
String sPath = "../";
int numpag = 0;
int numtot = 0;
int iIdAnexo = oAnexo1II.GetIdAnexo();
AnexoEstatus	oAnexoEstatus		= new AnexoEstatus();
oAnexoEstatus.Get(iIdFuncionario, iIdAnexo);
String sEstatus = oAnexoEstatus.GetEstatus();
%>
<html>
<head>
	<title>Entrega - Recepción : Anexo I.2 (Impresión)</title>
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
<!-- Datos que se agregaran a la tabla  -->
<%@include file="HeaderAnexo.jsp"%>
<br>
<table border="0" cellspacing="0" cellpadding="0" width="900">
<tr>
	<!-- Contenido -->
	<td valign="top">
	<TABLE cellPadding="0" cellSpacing="0" width="100%" BORDER="1" BORDERCOLOR="white">
	<!-- Etiqueta donde se aplican los encabezados de las tablas-->
	<TR><TD class="TituloParrafoImpr">RELACIÓN DE ACUERDOS, CONVENIOS, CONTRATOS Y DOCUMENTOS LEGALES</TD></TR>  
	</TABLE>
	<!-- Datos que se agregaran a la tabla  -->
	<TABLE cellPadding="0" cellSpacing="0" width="900" BORDER="1" BORDERCOLOR="White">
	<!-- Etiqueta donde se aplican los encabezados de las tablas-->
		<TR align="middle">
			<td width="20" class="TituloMenuImpr">Tipo</TD>
			<td width="100" class="TituloMenuImpr">No.</TD>
			<td width="80" class="TituloMenuImpr">Fecha de Suscripción</TD>
			<td width="100" class="TituloMenuImpr">Duración</TD>
			<td width="200" class="TituloMenuImpr">Descripción</TD>
			<td width="100" class="TituloMenuImpr">Importe Total</TD>
			<td width="100" class="TituloMenuImpr">Entidad</TD>
			<td width="200" class="TituloMenuImpr">Observaciones</TD>
		</TR>
<%		
if(!sEstatus.equals("0")){
			int intContador = 0;
			String sBackColor = "";
			oAnexo1II.GetAll(iIdFuncionario);
			
			// Variables para Paginacion
			int iLenCol = 0;
			int iRowsMax = 0; // POR REGISTRO
			int iRowsXCol = 0;
			int iRowsCount = 0;
			int iRowsAnt = 0; //posicion anterior
			int iMaxRowXPag = 18; //Numero de Renglones por Pagina
			// Variables para Paginacion
		
		for(int i=0;i<oAnexo1II.GetAll(iIdFuncionario);i++){
			// Variables para Paginacion
			int iRowMaxTemp = 1;
			int iRowCountTemp = 0;
			String vTempCampo1 = "";
			String vTempCampo2 = "";
			String vTempCampo3 = "";
			String vTempCampo4 = "";
			String vTempCampo5 = "";
			String vTempCampo6 = "";
			// Variables para Paginacion		
			iRowsAnt = iRowsCount;
			
			String vIdRenglon 						= oAnexo1II.GetIdRenglon(i)!=-1?oAnexo1II.GetIdRenglon(i)+"":"0";
			String vIdTipo 								= oAnexo1II.GetIdTipo(i)!=-1?oAnexo1II.GetIdTipo(i)+"":"0";
			String vNumero 							  = oAnexo1II.GetNumero(i)!=null?oAnexo1II.GetNumero(i):"";
			
			//Primer Elemento que su contenido puede llevar a un salto de pagina
			iLenCol = vNumero.length();
			iRowsXCol = 1;
			
			if(iLenCol > 13){
				if(iLenCol%13 == 0){
					iRowsXCol = iLenCol/13;
				}else{
					iRowsXCol = (iLenCol/13)+1;
				}
				
				String temp = vNumero;
				vNumero = "";
				iRowCountTemp = 0 ;
				for(int x=1;x<=(iRowsXCol);x++){
					int max = (13*x)<=iLenCol ? (13*x) : iLenCol;
					if( (x + iRowsAnt) <= iMaxRowXPag) {
						vNumero = vNumero + temp.substring((13*(x-1)), max) + "<br>";
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
			
			String vFechaSuscripcion		  = oAnexo1II.GetFechaSuscripcion(i)!=null?oAnexo1II.GetFechaSuscripcion(i):"";
			String vDuracion 				      = oAnexo1II.GetDuracion(i)!=null?oAnexo1II.GetDuracion(i):"";
			// Elemento que su contenido puede llevar a un salto de pagina
			iLenCol = vDuracion.length();
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
				
				String temp = vDuracion;
				vDuracion = "";
				iRowCountTemp = 0 ;
				for(int x=1;x<=(iRowsXCol);x++){
					int max = (13*x)<=iLenCol ? (13*x) : iLenCol;
					if( (x + iRowsAnt) <= iMaxRowXPag) {
						vDuracion = vDuracion + temp.substring((13*(x-1)), max) + "<br>";	}
					else {
						iRowCountTemp = iRowCountTemp + 1;
						vTempCampo2 = vTempCampo2 + temp.substring((13*(x-1)), max) + "<br>";	}
				}
				iRowMaxTemp = iRowMaxTemp >= iRowCountTemp ? iRowMaxTemp : iRowCountTemp ;
			}else{
				iRowsXCol = 1;
			}	
			// Elemento que su contenido puede llevar a un salto de pagina
			
			
			String vDescripcion 					= oAnexo1II.GetDescripcion(i)!=null?oAnexo1II.GetDescripcion(i):"";
			// Elemento que su contenido puede llevar a un salto de pagina
			iLenCol = vDescripcion.length();
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
				
				String temp = vDescripcion;
				vDescripcion = "";
				iRowCountTemp = 0 ;
				for(int x=1;x<=(iRowsXCol);x++){
					int max = (27*x)<=iLenCol ? (27*x) : iLenCol;
					if( (x + iRowsAnt) <= iMaxRowXPag) {
						vDescripcion = vDescripcion + temp.substring((27*(x-1)), max) + "<br>";	}
					else {
						iRowCountTemp = iRowCountTemp + 1;
						vTempCampo3 = vTempCampo3 + temp.substring((27*(x-1)), max) + "<br>";	}
				}
				iRowMaxTemp = iRowMaxTemp >= iRowCountTemp ? iRowMaxTemp : iRowCountTemp ;
			}else{
				iRowsXCol = 1;
			}	
			// Elemento que su contenido puede llevar a un salto de pagina
			
			String vImporteTotal 			= oAnexo1II.GetImporteTotal(i)!=null?oAnexo1II.GetImporteTotal(i):"0";
			vImporteTotal = myFormatter.format(new Double(!vImporteTotal.trim().equals("")?vImporteTotal:"0"));
			iLenCol = vImporteTotal.length();
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
				
				String temp = vImporteTotal;
				vImporteTotal = "";
				iRowCountTemp = 0 ;
				for(int x=1;x<=(iRowsXCol);x++){
					int max = (16*x)<=iLenCol ? (16*x) : iLenCol;
					if( (x + iRowsAnt) <= iMaxRowXPag) {
						vImporteTotal = vImporteTotal + temp.substring((16*(x-1)), max) + "<br>";	}
					else {
						iRowCountTemp = iRowCountTemp + 1;
						vTempCampo6 = vTempCampo6 + temp.substring((16*(x-1)), max) + "<br>";	}
				}
				iRowMaxTemp = iRowMaxTemp >= iRowCountTemp ? iRowMaxTemp : iRowCountTemp ;
			}
			
			
			String vEntidad		            = oAnexo1II.GetEntidad(i)!=null?oAnexo1II.GetEntidad(i):"";
			// Elemento que su contenido puede llevar a un salto de pagina
			iLenCol = vEntidad.length();
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
				
				String temp = vEntidad;
				vEntidad = "";
				iRowCountTemp = 0 ;
				for(int x=1;x<=(iRowsXCol);x++){
					int max = (13*x)<=iLenCol ? (13*x) : iLenCol;
					if( (x + iRowsAnt) <= iMaxRowXPag) {
						vEntidad = vEntidad + temp.substring((13*(x-1)), max) + "<br>";	}
					else {
						iRowCountTemp = iRowCountTemp + 1;
						vTempCampo4 = vTempCampo4 + temp.substring((13*(x-1)), max) + "<br>";	}
				}
				iRowMaxTemp = iRowMaxTemp >= iRowCountTemp ? iRowMaxTemp : iRowCountTemp ;
			}else{
				iRowsXCol = 1;
			}	
			// Elemento que su contenido puede llevar a un salto de pagina
			
			
			String vObservaciones 				= oAnexo1II.GetObservaciones(i)!=null?oAnexo1II.GetObservaciones(i):"";
			// Elemento que su contenido puede llevar a un salto de pagina
			iLenCol = vObservaciones.length();
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
				
				String temp = vObservaciones;
				vObservaciones = "";
				iRowCountTemp = 0 ;
				for(int x=1;x<=(iRowsXCol);x++){
					int max = (27*x)<=iLenCol ? (27*x) : iLenCol;
					if( (x + iRowsAnt) <= iMaxRowXPag) {
						vObservaciones = vObservaciones + temp.substring((27*(x-1)), max) + "<br>";	}
					else {
						iRowCountTemp = iRowCountTemp + 1;
						vTempCampo5 = vTempCampo5 + temp.substring((27*(x-1)), max) + "<br>";	}
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
			<TD width="20" align="center" class="ContenidoImprL"><%=vIdTipo%></TD>
			<TD width="100" class="ContenidoImpr"><%=vNumero%></TD>
			<TD width="80" class="ContenidoImpr" align="center"><%=vFechaSuscripcion%></TD>
			<TD width="100" class="ContenidoImpr"><%=vDuracion%></TD>
			<TD width="200" class="ContenidoImpr"><%=vDescripcion%></TD>
			<TD width="100" class="ContenidoImpr" align="right"><%=vImporteTotal%></TD>
			<TD width="100" class="ContenidoImpr"><%=vEntidad%></TD>
			<TD width="200" class="ContenidoImprR"><%=vObservaciones%></TD>
		</TR>
		<%
		//Si existe la paginacion debera repetir esto		
		if ( (!vTempCampo1.equals("") || !vTempCampo2.equals("") || !vTempCampo3.equals("") || !vTempCampo4.equals("") 
			|| !vTempCampo5.equals("") || !vTempCampo6.equals(""))
			|| iRowsCount>=iMaxRowXPag ){
		%>
		<tr><td colspan="8" class="ContenidoImprB">&nbsp;</td></tr>
	</TABLE><br>
	<table cellPadding="0" cellSpacing="0" width="100%" BORDER="0" BORDERCOLOR="white">
		<TR><TD class="ContenidoParrafo">&nbsp;<b>TIPO:</b></TD></TR>
		<TR><TD class="ContenidoParrafo">&nbsp;<b>1. Acuerdos</b></TD></TR>
		<TR><TD class="ContenidoParrafo">&nbsp;<b>2. Convenios</b></TD></TR>
		<TR><TD class="ContenidoParrafo">&nbsp;<b>3. Contratos</b></TD></TR>
		<TR><TD class="ContenidoParrafo">&nbsp;<b>4. Otros Documentos Legales</b></TD></TR>
	</table>
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
	<!-- Contenido -->
	<td valign="top">
	<TABLE cellPadding="0" cellSpacing="0" width="100%" BORDER="1" BORDERCOLOR="white">
	<!-- Etiqueta donde se aplican los encabezados de las tablas-->
	<TR><TD class="TituloParrafoImpr">RELACIÓN DE ACUERDOS, CONVENIOS, CONTRATOS Y DOCUMENTOS LEGALES</TD></TR>  
	</TABLE>
	<!-- Datos que se agregaran a la tabla  -->
	<TABLE cellPadding="0" cellSpacing="0" width="900" BORDER="1" BORDERCOLOR="White">
	<!-- Etiqueta donde se aplican los encabezados de las tablas-->
		<TR align="middle">
			<td width="20" class="TituloMenuImpr">Tipo</TD>
			<td width="100" class="TituloMenuImpr">No.</TD>
			<td width="80" class="TituloMenuImpr">Fecha de Suscripción</TD>
			<td width="100" class="TituloMenuImpr">Duración</TD>
			<td width="200" class="TituloMenuImpr">Descripción</TD>
			<td width="100" class="TituloMenuImpr">Importe Total</TD>
			<td width="100" class="TituloMenuImpr">Entidad</TD>
			<td width="200" class="TituloMenuImpr">Observaciones</TD>
		</TR><%
		if (!vTempCampo1.equals("") || !vTempCampo2.equals("") || !vTempCampo3.equals("") || !vTempCampo4.equals("") 
			|| !vTempCampo5.equals("") || !vTempCampo6.equals("") ){
				if (vTempCampo1.equals("")) vTempCampo1 = "&nbsp;";
				if (vTempCampo2.equals("")) vTempCampo2 = "&nbsp;";
				if (vTempCampo3.equals("")) vTempCampo3 = "&nbsp;";
				if (vTempCampo4.equals("")) vTempCampo4 = "&nbsp;";
				if (vTempCampo5.equals("")) vTempCampo5 = "&nbsp;";
				if (vTempCampo6.equals("")) vTempCampo6 = "&nbsp;";%>
		<TR valign="top" align="left" bgcolor="<%=sBackColor%>">
			<TD width="20" class="ContenidoImprL">&nbsp;</TD>
			<TD width="100" class="ContenidoImpr"><%=vTempCampo1%></TD>
			<TD width="80" class="ContenidoImpr" align="center"></TD>
			<TD width="100" class="ContenidoImpr"><%=vTempCampo2%></TD>
			<TD width="200" class="ContenidoImpr"><%=vTempCampo3%></TD>
			<TD width="100" class="ContenidoImpr" align="right"><%=vTempCampo6%></TD>
			<TD width="100" class="ContenidoImpr"><%=vTempCampo4%></TD>
			<TD width="200" class="ContenidoImprR"><%=vTempCampo5%></TD>
		</TR>
		<%
			}
		}
			iRowsCount = iRowsCount>=iMaxRowXPag?iRowMaxTemp:iRowsCount;
			
		} // FIN DEL FOR
//Si existe la paginacion debera repetir esto		
		%>
		<tr><td colspan="8" class="ContenidoImprB">&nbsp;</td></tr>
	</TABLE><br>
	<table cellPadding="0" cellSpacing="0" width="100%" BORDER="0" BORDERCOLOR="white">
		<TR><TD class="ContenidoParrafo">&nbsp;<b>TIPO:</b></TD></TR>
		<TR><TD class="ContenidoParrafo">&nbsp;<b>1 = Acuerdos</b></TD></TR>
		<TR><TD class="ContenidoParrafo">&nbsp;<b>2 = Convenios</b></TD></TR>
		<TR><TD class="ContenidoParrafo">&nbsp;<b>3 = Contratos</b></TD></TR>
		<TR><TD class="ContenidoParrafo">&nbsp;<b>4 = Otros Documentos Legales</b></TD></TR>
	</table>
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