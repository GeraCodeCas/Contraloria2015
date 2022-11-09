<%/*********************************************************************************************************
Elaboro:	Julio Enrique Espinosa Torres
Lugar:		Monterrey, NL
Fecha:		18.Nov.2002
Compañia:	CONSISS*/%>
<%@page import="com.consiss.util.tools.*"%>
<%@page import="com.gob.*"%>
<%@page import="java.util.*" %>
<%
//Valida la permanencia del usuario en session
if ((String)session.getValue("ok")!="Consiss") response.sendRedirect("Error.html");

int iIdFuncionario =  java.lang.Integer.parseInt(
			(request.getParameter("iIdFuncionario")!= null?request.getParameter("iIdFuncionario"):"0") );

String sAnexo = "II.4.3";
java.text.DecimalFormat myFormatter = new java.text.DecimalFormat("###,##0.00");

Anexo2IV3 oAnexo2IV3 	= new Anexo2IV3();
DetalleAnexo2IV3 oDetalleAnexo2IV3 	= new DetalleAnexo2IV3();

int iIdAnexo = oAnexo2IV3.GetIdAnexo();

String sPath = "../";
int numpag =0;
int numtot = 0;


AnexoEstatus	oAnexoEstatus		= new AnexoEstatus();
oAnexoEstatus.Get(iIdFuncionario, iIdAnexo);
String sEstatus = oAnexoEstatus.GetEstatus();
%>
<html>
<head>
	<title>Entrega - Recepción : Anexo II.4.3 (Impresión)</title>
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
	<TR><TD class="TituloParrafoImpr">DETALLE DE CUENTAS DE INVERSIONES</TD></TR>  
	</TABLE>
	<!-- Datos que se agregaran a la tabla  -->
	<TABLE cellPadding="0" cellSpacing="0" width="900"  BORDER="1" BORDERCOLOR="white">
	<!-- Etiqueta donde se aplican los encabezados de las tablas-->
		<TR align="middle">
			<td width="80" class="TituloMenuImpr">Fecha</TD>
			<td width="200" class="TituloMenuImpr">Número de Cuenta</TD>
			<td width="200" class="TituloMenuImpr">Nombre de la Institución</TD>
			<td width="200" class="TituloMenuImpr">Tipo de Inversión</TD>
			<td width="100" class="TituloMenuImpr">Vencimiento</TD>
			<td width="120" class="TituloMenuImpr">Saldo en Libros</TD>
		</TR>
<%
if(!sEstatus.equals("0")){
			int intContador = 0;
			String sBackColor = "";
			oAnexo2IV3.GetAll(iIdFuncionario);
			// Variables para Paginacion
			int iLenCol = 0;
			int iRowsMax = 0; // POR REGISTRO
			int iRowsXCol = 0;
			int iRowsCount = 0;
			int iRowsAnt = 0; //posicion anterior
			int iMaxRowXPag = 25; //Numero de Renglones por Pagina
			// Variables para Paginacion
		for(int i=0;i<oAnexo2IV3.GetAll(iIdFuncionario);i++){
			// Variables para Paginacion
			int iRowMaxTemp = 1;
			int iRowCountTemp = 0;
			String vTempCampo1 = "";
			String vTempCampo2 = "";
			String vTempCampo3 = "";
			String vTempCampo4 = "";
			// Variables para Paginacion		
			iRowsAnt = iRowsCount;
			
			String vIdRenglon 	= oAnexo2IV3.GetIdRenglon(i)!=-1?oAnexo2IV3.GetIdRenglon(i)+"":"0";
			String vFecha 		= oAnexo2IV3.GetFecha(i)!=null?oAnexo2IV3.GetFecha(i):"";
			String vNoCuenta 	= oAnexo2IV3.GetNoCuenta(i)!=null?oAnexo2IV3.GetNoCuenta(i):"";
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
			String vNombreInstitucion					= oAnexo2IV3.GetNombreInstitucion(i)!=null?oAnexo2IV3.GetNombreInstitucion(i):"";
			// Elemento que su contenido puede llevar a un salto de pagina
			iLenCol = vNombreInstitucion.length();
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
				
				String temp = vNombreInstitucion;
				vNombreInstitucion = "";
				iRowCountTemp = 0 ;
				for(int x=1;x<=(iRowsXCol);x++){
					int max = (27*x)<=iLenCol ? (27*x) : iLenCol;
					if( (x + iRowsAnt) <= iMaxRowXPag) {
						vNombreInstitucion = vNombreInstitucion + temp.substring((27*(x-1)), max) + "<br>";	}
					else {
						iRowCountTemp = iRowCountTemp + 1;
						vTempCampo2 = vTempCampo2 + temp.substring((27*(x-1)), max) + "<br>";	}
				}
				iRowMaxTemp = iRowMaxTemp >= iRowCountTemp ? iRowMaxTemp : iRowCountTemp ;
			}else{
				iRowsXCol = 1;
			}	
			// Elemento que su contenido puede llevar a un salto de pagina
			
			
			String vTipoInversion 				    = oAnexo2IV3.GetTipoInversion(i)!=null?oAnexo2IV3.GetTipoInversion(i):"";
			// Elemento que su contenido puede llevar a un salto de pagina
			iLenCol = vTipoInversion.length();
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
				
				String temp = vTipoInversion;
				vTipoInversion = "";
				iRowCountTemp = 0 ;
				for(int x=1;x<=(iRowsXCol);x++){
					int max = (27*x)<=iLenCol ? (27*x) : iLenCol;
					if( (x + iRowsAnt) <= iMaxRowXPag) {
						vTipoInversion = vTipoInversion + temp.substring((27*(x-1)), max) + "<br>";	}
					else {
						iRowCountTemp = iRowCountTemp + 1;
						vTempCampo3 = vTempCampo3 + temp.substring((27*(x-1)), max) + "<br>";	}
				}
				iRowMaxTemp = iRowMaxTemp >= iRowCountTemp ? iRowMaxTemp : iRowCountTemp ;
			}else{
				iRowsXCol = 1;
			}	
			// Elemento que su contenido puede llevar a un salto de pagina
			
			String vVencimiento 						= oAnexo2IV3.GetVencimiento(i)!=null?oAnexo2IV3.GetVencimiento(i):"";
			String vSaldo 					= oAnexo2IV3.GetSaldo(i)!=null?oAnexo2IV3.GetSaldo(i):"";
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
		<TR valign="top" align="left" bgcolor="<%=sBackColor%>">
			<TD align="center" width="100" class="ContenidoImprL"><%=vFecha%></TD>
			<TD width="200" class="ContenidoImpr"><%=vNoCuenta%></TD>
			<TD width="200" class="ContenidoImpr"><%=vNombreInstitucion%></td>					
			<td width="200" class="ContenidoImpr"><%=vTipoInversion%></td>
		  	<td align="center" width="100" class="ContenidoImpr"><%=vVencimiento%></td>					
			<td width="100" class="ContenidoImprR" align="right"><%=vSaldo%></td>
		</TR>
		<%
		//Si existe la paginacion debera repetir esto		
		if ( (!vTempCampo1.equals("") || !vTempCampo2.equals("") || !vTempCampo3.equals("") || !vTempCampo4.equals(""))
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
	<TABLE cellPadding="0" width="900" cellSpacing="0" BORDER="1" BORDERCOLOR="white">
	<!-- Etiqueta donde se aplican los encabezados de las tablas-->
	<TR><TD class="TituloParrafoImpr">DETALLE DE CUENTAS DE INVERSIONES</TD></TR>  
	</TABLE>
	<!-- Datos que se agregaran a la tabla  -->
	<TABLE cellPadding="0" cellSpacing="0" width="900"  BORDER="1" BORDERCOLOR="white">
	<!-- Etiqueta donde se aplican los encabezados de las tablas-->
		<TR align="middle">
			<td width="80" class="TituloMenuImpr">Fecha</TD>
			<td width="200" class="TituloMenuImpr">Número de Cuenta</TD>
			<td width="200" class="TituloMenuImpr">Nombre de la Institución</TD>
			<td width="200" class="TituloMenuImpr">Tipo de Inversión</TD>
			<td width="100" class="TituloMenuImpr">Vencimiento</TD>
			<td width="120" class="TituloMenuImpr">Saldo en Libros</TD>
		</TR>
		<%if (!vTempCampo1.equals("") || !vTempCampo2.equals("") || !vTempCampo3.equals("") || !vTempCampo4.equals("")){
			if (vTempCampo1.equals("")) vTempCampo1 = "&nbsp;";
			if (vTempCampo2.equals("")) vTempCampo2 = "&nbsp;";
			if (vTempCampo3.equals("")) vTempCampo3 = "&nbsp;";
			if (vTempCampo4.equals("")) vTempCampo4 = "&nbsp;";%>
		<TR valign="top" align="left" bgcolor="<%=sBackColor%>" >
			<TD align="center" width="80" class="ContenidoImprL">&nbsp;</TD>
			<TD width="200" class="ContenidoImpr"><%=vTempCampo1%></TD>
			<TD width="200" class="ContenidoImpr"><%=vTempCampo2%></td>					
			<td width="200" class="ContenidoImpr"><%=vTempCampo3%></td>
			<td align="center" width="100" class="ContenidoImpr">&nbsp;</td>					
			<td width="120" class="ContenidoImprR" align="right"><%=vTempCampo4%></td>
		</TR>
	<%
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
<br>
<%iRowsCount = iRowsCount + 4;
oAnexo2IV3.GetObservaciones(iIdFuncionario);
String vObservaciones = oAnexo2IV3.GetObservaciones();
String vTempCampo5 = "";
int iRowCountTempObs = 0, iRowMaxTempObs = 0;
iLenCol = vObservaciones.length();

if(iLenCol > 150){
	if(iLenCol%150 == 0){
		iRowsXCol = iLenCol/150;
	}else{
		iRowsXCol = (iLenCol/150)+1;
	}
	
	if (iRowsXCol > iRowsMax){
	    iRowsCount = iRowsXCol - iRowsMax + iRowsCount;
		iRowsMax = iRowsXCol;
	}
	
	String temp = vObservaciones;
	vObservaciones = "";
	//out.println("vObservaciones:" + iRowsXCol + " " + vObservaciones.length());
	for(int x=1;x<=(iRowsXCol);x++){
		//out.println("vObservaciones:" + iRowsXCol + " " + vObservaciones.length());
		int max = (150*x)<=iLenCol ? (150*x) : iLenCol;
		if( (x + iRowsAnt) <= iMaxRowXPag) {
			vObservaciones = vObservaciones + temp.substring((150*(x-1)), max) + "<br>";	}
		else {
			iRowCountTempObs = iRowCountTempObs + 1;
			vTempCampo5 = vTempCampo5 + temp.substring((150*(x-1)), max) + "<br>";	}
	}
	iRowMaxTempObs = iRowMaxTempObs >= iRowCountTempObs ? iRowMaxTempObs : iRowCountTempObs ;
}else{
	iRowsXCol = 1;
}
iRowsCount = iRowsCount + iRowMaxTempObs;
%>
<table border="1" cellspacing="0" cellpadding="0" BORDERCOLOR="White">
	<tr>
		<td class="TituloMenuImpr">Observaciones:</td>
	</tr>
	<tr>
		<td class="ContenidoImpr1Col"><%=vObservaciones%></td>
	</tr>
</table><br>

<%iRowsCount = iRowsCount + 2;%>
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
		oDetalleAnexo2IV3.GetAll(iIdFuncionario);
		
		for(int i=0;i<oDetalleAnexo2IV3.GetAll(iIdFuncionario);i++){
		  // Variables para Paginacion
			String vTempCampo1 = "";
			String vTempCampo2 = "";
		
			// Variables para Paginacion		
			iRowsAnt = iRowsCount;
			
			String vIdRenglon 			= oDetalleAnexo2IV3.GetIdRenglon(i)!=-1?oDetalleAnexo2IV3.GetIdRenglon(i)+"":"0";
			String vNombreFirma 		= oDetalleAnexo2IV3.GetNombreFirma(i)!=null?oDetalleAnexo2IV3.GetNombreFirma(i):"";
			// Elemento que su contenido puede llevar a un salto de pagina
			iLenCol = vNombreFirma.length();
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
				
				String temp = vNombreFirma;
				vNombreFirma = "";
				for(int x=1;x<=(iRowsXCol);x++){
					int max = (40*x)<=iLenCol ? (40*x) : iLenCol;
					if( (x + iRowsAnt) <= iMaxRowXPag) {
						vNombreFirma = vNombreFirma + temp.substring((40*(x-1)), max) + "<br>";
						}
					else {
						vTempCampo1= vTempCampo1 + temp.substring((40*(x-1)), max) + "<br>";
						}
				}
			}else{
				iRowsXCol = 1;
			}	
			
			iRowsMax = iRowsXCol;
			iRowsCount = iRowsMax + iRowsCount;
			
			iRowsMax = iRowsXCol;
			// Elemento que su contenido puede llevar a un salto de pagina
			
			String vCargo				= oDetalleAnexo2IV3.GetCargo(i)!=null?oDetalleAnexo2IV3.GetCargo(i):"";
			// Elemento que su contenido puede llevar a un salto de pagina
			iLenCol = vCargo.length();
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
				
				String temp = vCargo;
				vCargo = "";
				for(int x=1;x<=(iRowsXCol);x++){
					int max = (40*x)<=iLenCol ? (40*x) : iLenCol;
					if( (x + iRowsAnt) <= iMaxRowXPag) {
						vCargo = vCargo + temp.substring((40*(x-1)), max) + "<br>";
						}
					else {
						vTempCampo2= vTempCampo2 + temp.substring((40*(x-1)), max) + "<br>";
						}
				}
			}else{
				iRowsXCol = 1;
			}	
			// Elemento que su contenido puede llevar a un salto de pagina
			intContador = intContador + 1;
		 	if (intContador%2 == 0){
					sBackColor = "#ffffff";
				}else{
					sBackColor = "#eeeeee";
			 }
	%>
	<TR align="left" bgcolor="<%=sBackColor%>">
			<TD class="ContenidoImprL" width="300" align="center">&nbsp;<%=vNombreFirma%></TD>
			<TD class="ContenidoImprR" width="300" align="center">&nbsp;<%=vCargo%></TD>
		</TR>
		
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
	<TABLE cellPadding="0" cellSpacing="0" width="600" BORDER="1" BORDERCOLOR="White">
	<!-- Etiqueta donde se aplican los encabezados de las tablas-->
		<TR align="middle">
			<td class="TituloMenuImpr" colspan="2">Firmas Registradas</TD>
		</TR>
		<TR align="middle">
			<td width="300" class="TituloMenuImpr">NoCuenta</TD>
			<td width="300" class="TituloMenuImpr">Cargo</TD>
		</TR>
	<%if (!vTempCampo1.equals("") || !vTempCampo2.equals("")){%>
	<TR align="left" bgcolor="<%=sBackColor%>">
			<TD class="ContenidoImprL" width="300" align="center">&nbsp;<%=vTempCampo1%></TD>
			<TD class="ContenidoImprR" width="300" align="center">&nbsp;<%=vTempCampo2%></TD>
		</TR>
	
	<%
			}
		}
			iRowsCount = iRowsCount>=iMaxRowXPag?1:iRowsCount;
			
		} // FIN DEL FOR
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