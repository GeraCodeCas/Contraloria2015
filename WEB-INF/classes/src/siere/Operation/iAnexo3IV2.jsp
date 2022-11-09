<%/*********************************************************************************************************
Elaboro:	Julio Enrique Espinosa Torres
Lugar:		Monterrey, NL
Fecha:		29.Oct.2002
Compañia:	CONSISS*/%>
<%@page import="com.consiss.util.tools.*"%>
<%@page import="com.gob.*"%>
<%@page import="java.util.*" %>
<%
if ((String)session.getValue("ok")!="Consiss" && (String)session.getValue("ok")!="ConsissRH") response.sendRedirect("Error.html");

int iIdUnidad =  java.lang.Integer.parseInt(
			request.getParameter("iIdUnidad")!= null?request.getParameter("iIdUnidad"):"0");

String sUnidad = request.getParameter("sUnidad")!= null?request.getParameter("sUnidad"):"";

String sAnexo = "III.4.2";
Anexo3IV2 oAnexo3IV2 	= new Anexo3IV2();
String sPath = "../";
int numpag = 0;
int numtot = 0;
int iIdAnexo = oAnexo3IV2.GetIdAnexo();
AnexoEstatus	oAnexoEstatus		= new AnexoEstatus();
int iIdFuncionario = 0;
if(sUnidad.equals("F")){
	iIdFuncionario = iIdUnidad;
} else {
	Funcionario oFuncionario = new Funcionario();
	oFuncionario.GetUAdministrativa(iIdUnidad);
	iIdFuncionario = oFuncionario.GetIdFuncionario();
}

oAnexoEstatus.Get(iIdFuncionario, iIdAnexo);
String sEstatus = oAnexoEstatus.GetEstatus();
%>
<html>
<head>
	<title>Entrega - Recepción : Anexo III.4.2 (Impresión)</title>
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
	<TR><TD class="TituloParrafoImpr">PERSONAL CON LICENCIA, PERMISO O COMISIÓN</TD></TR>  
	</TABLE>
	<TABLE cellPadding="0" cellSpacing="0" width="100%" BORDER="1" BORDERCOLOR="white">
		<TR align="middle">
			<td rowspan="2" class="TituloMenuImpr">Nomina</TD>
			<td rowspan="2" class="TituloMenuImpr">Nombre</TD>
			<td rowspan="2" class="TituloMenuImpr">Situación</TD>
			<td class="TituloMenuImpr" colspan="2">Comisionado</td>
			<td class="TituloMenuImpr" colspan="2">Periodo</td>
			<td rowspan="2" class="TituloMenuImpr">Observaciones</TD>
			<td rowspan="2" class="TituloMenuImpr">Tipo de Nómina</td>
		</TR>
		<tr align="middle" >
			<td class="TituloMenuImpr">De</td>
			<td class="TituloMenuImpr">A</td>
			<td class="TituloMenuImpr">De</td>
			<td class="TituloMenuImpr">A</td>
		</tr>
<%		
if(!sEstatus.equals("0") || sUnidad.equals("H")){
	int intContador = 0;
	String sBackColor = "";
	if(sUnidad.equals("F"))
		oAnexo3IV2.GetAll(iIdUnidad);
	else
		oAnexo3IV2.GetAllRH(iIdUnidad);
			
	// Variables para Paginacion
	int iLenCol = 0;
	int iRowsMax = 0; // POR REGISTRO
	int iRowsXCol = 0;
	int iRowsCount = 0;
	int iRowsAnt = 0; //posicion anterior
	int iMaxRowXPag = 20; //Numero de Renglones por Pagina
	// Variables para Paginacion
	TipoNomina oTipoNomina = new TipoNomina();
		for(int i=0;i<oAnexo3IV2.GetAll(iIdUnidad);i++){
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
			
		    String vIdRenglon 				= oAnexo3IV2.GetIdRenglon(i)!=-1?oAnexo3IV2.GetIdRenglon(i)+"":"0";
			String vNomina 					= oAnexo3IV2.GetNomina(i)!=null?oAnexo3IV2.GetNomina(i)+"":"0";
			//Primer Elemento que su contenido puede llevar a un salto de pagina
			iLenCol = vNomina.length();
			iRowsXCol = 1;
			if(iLenCol > 12){
				if(iLenCol%12 == 0){
					iRowsXCol = iLenCol/12;
				}else{
					iRowsXCol = (iLenCol/12)+1;
				}
				String temp = vNomina;
				vNomina = "";
				iRowCountTemp = 0 ;
				for(int x=1;x<=(iRowsXCol);x++){
					int max = (12*x)<=iLenCol ? (12*x) : iLenCol;
					if( (x + iRowsAnt) <= iMaxRowXPag) {
						vNomina = vNomina + temp.substring((12*(x-1)), max) + "<br>";
						}
					else {
						iRowCountTemp = iRowCountTemp + 1;
						vTempCampo1 = vTempCampo1 + temp.substring((12*(x-1)), max) + "<br>";
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
			
			String vNombre 					= oAnexo3IV2.GetNombre(i)!=null?oAnexo3IV2.GetNombre(i):"";
			// Elemento que su contenido puede llevar a un salto de pagina
			iLenCol = vNombre.length();
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
				String temp = vNombre;
				vNombre = "";
				iRowCountTemp = 0 ;
				for(int x=1;x<=(iRowsXCol);x++){
					int max = (27*x)<=iLenCol ? (27*x) : iLenCol;
					if( (x + iRowsAnt) <= iMaxRowXPag) {
						vNombre = vNombre + temp.substring((27*(x-1)), max) + "<br>";	}
					else {
						iRowCountTemp = iRowCountTemp + 1;
						vTempCampo2 = vTempCampo2 + temp.substring((27*(x-1)), max) + "<br>";	}
				}
				iRowMaxTemp = iRowMaxTemp >= iRowCountTemp ? iRowMaxTemp : iRowCountTemp ;
			}else{
				iRowsXCol = 1;
			}
			// Elemento que su contenido puede llevar a un salto de pagina
			
			String vSituacion				= oAnexo3IV2.GetSituacion(i)!=null?oAnexo3IV2.GetSituacion(i):"";
			String vDeComisionado 		= oAnexo3IV2.GetDeComisionado(i)!=null?oAnexo3IV2.GetDeComisionado(i):"";
			// Elemento que su contenido puede llevar a un salto de pagina
			iLenCol = vDeComisionado.length();
			if(iLenCol > 12){
				if(iLenCol%12 == 0){
					iRowsXCol = iLenCol/12;
				}else{
					iRowsXCol = (iLenCol/12)+1;
				}
				if (iRowsXCol > iRowsMax){
				    iRowsCount = iRowsXCol - iRowsMax + iRowsCount;
					iRowsMax = iRowsXCol;
				}
				String temp = vDeComisionado;
				vDeComisionado = "";
				iRowCountTemp = 0 ;
				for(int x=1;x<=(iRowsXCol);x++){
					int max = (12*x)<=iLenCol ? (12*x) : iLenCol;
					if( (x + iRowsAnt) <= iMaxRowXPag) {
						vDeComisionado = vDeComisionado + temp.substring((12*(x-1)), max) + "<br>";	}
					else {
						iRowCountTemp = iRowCountTemp + 1;
						vTempCampo3 = vTempCampo3 + temp.substring((12*(x-1)), max) + "<br>";	}
				}
				iRowMaxTemp = iRowMaxTemp >= iRowCountTemp ? iRowMaxTemp : iRowCountTemp ;
			}else{
				iRowsXCol = 1;
			}
			// Elemento que su contenido puede llevar a un salto de pagina
			
			String vAComisionado 		= oAnexo3IV2.GetAComisionado(i)!=null?oAnexo3IV2.GetAComisionado(i):"";
			// Elemento que su contenido puede llevar a un salto de pagina
			iLenCol = vAComisionado.length();
			if(iLenCol > 12){
				if(iLenCol%12 == 0){
					iRowsXCol = iLenCol/12;
				}else{
					iRowsXCol = (iLenCol/12)+1;
				}
				if (iRowsXCol > iRowsMax){
				    iRowsCount = iRowsXCol - iRowsMax + iRowsCount;
					iRowsMax = iRowsXCol;
				}
				String temp = vAComisionado;
				vAComisionado = "";
				iRowCountTemp = 0 ;
				for(int x=1;x<=(iRowsXCol);x++){
					int max = (12*x)<=iLenCol ? (12*x) : iLenCol;
					if( (x + iRowsAnt) <= iMaxRowXPag) {
						vAComisionado = vAComisionado + temp.substring((12*(x-1)), max) + "<br>";	}
					else {
						iRowCountTemp = iRowCountTemp + 1;
						vTempCampo4 = vTempCampo4 + temp.substring((12*(x-1)), max) + "<br>";	}
				}
				iRowMaxTemp = iRowMaxTemp >= iRowCountTemp ? iRowMaxTemp : iRowCountTemp ;
			}else{
				iRowsXCol = 1;
			}
			// Elemento que su contenido puede llevar a un salto de pagina
			
			String vFechaDePeriodo 			= oAnexo3IV2.GetFechaDePeriodo(i)!=null?oAnexo3IV2.GetFechaDePeriodo(i):"";
			String vFechaAPeriodo 			= oAnexo3IV2.GetFechaAPeriodo(i)!=null?oAnexo3IV2.GetFechaAPeriodo(i):"";
			String vObservaciones 			= oAnexo3IV2.GetObservaciones(i)!=null?oAnexo3IV2.GetObservaciones(i):"";
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
		String vTipoNomina = oAnexo3IV2.GetClaveTipoNomina(i);
		String sDescNomina = oTipoNomina.GetPosClave(vTipoNomina)>=0?oTipoNomina.GetDescripcion(oTipoNomina.GetPosClave(vTipoNomina)):"&nbsp;";
		
		intContador = intContador + 1;
		if (intContador%2 == 0)	{sBackColor = "#ffffff";}
		else					{sBackColor = "#dddddd";}%>
		<TR align="left" bgcolor="<%=sBackColor%>">
			<TD valign="top" class="ContenidoImprL" width="95"><%=vNomina%></TD>
			<TD valign="top" class="ContenidoImpr" width="195"><%=vNombre%></TD>
			<TD valign="top" class="ContenidoImpr" align="center" width="50"><%=vSituacion%></TD>
			<td valign="top" class="ContenidoImpr" width="90"><%=vDeComisionado%></td>
			<td valign="top" class="ContenidoImpr" width="90"><%=vAComisionado%></td>
			<td valign="top" class="ContenidoImpr" width="78" align="center"><%=vFechaDePeriodo%></td>
			<td valign="top" class="ContenidoImpr" width="78" align="center"><%=vFechaAPeriodo%></td>
			<TD valign="top" class="ContenidoImpr" width="195"><%=vObservaciones%></TD>
			<td class="ContenidoImprR" width="35"><%=sDescNomina%></td>
		</tr>
				<%
		//Si existe la paginacion debera repetir esto		
		if ( (!vTempCampo1.equals("") || !vTempCampo2.equals("") || !vTempCampo3.equals("") || !vTempCampo4.equals("") || !vTempCampo5.equals(""))
			|| iRowsCount>=iMaxRowXPag ){
		%>
		<tr>
			<td colspan="9" class="ContenidoImprB">&nbsp;</td>
		</tr>
		<TR><td colspan="2" ></td><TD colspan="2"  class="ContenidoImpr">SITUACIÓN:</TD><td colspan="4" ></td></TR>
		<TR><td colspan="2" ></td><TD colspan="2" class="ContenidoImpr">L = Licencia</TD><td colspan="4" ></td></TR>
		<TR><td colspan="2" ></td><TD colspan="2" class="ContenidoImpr">P = Permiso</TD><td colspan="4" ></td></TR>
		<TR><td colspan="2" ></td><TD colspan="2" class="ContenidoImpr">C = Comisión</TD><td colspan="4" ></td></TR>
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
	<TR><TD class="TituloParrafoImpr">PERSONAL CON LICENCIA, PERMISO O COMISIÓN</TD></TR>  
	</TABLE>
	<TABLE cellPadding="0" cellSpacing="0" width="100%" BORDER="1" BORDERCOLOR="white">
		<TR align="middle">
			<td rowspan="2" class="TituloMenuImpr">Nomina</TD>
			<td rowspan="2" class="TituloMenuImpr">Nombre</TD>
			<td rowspan="2" class="TituloMenuImpr">Situación</TD>
			<td class="TituloMenuImpr" colspan="2">Comisión</td>
			<td class="TituloMenuImpr" colspan="2">Periodo</td>
			<td rowspan="2" class="TituloMenuImpr">Observaciones</TD>
			<td rowspan="2" class="TituloMenuImpr">Tipo de Nómina</td>
		</TR>
		<tr align="middle" >
			<td class="TituloMenuImpr">De</td>
			<td class="TituloMenuImpr">A</td>
			<td class="TituloMenuImpr">De</td>
			<td class="TituloMenuImpr">A</td>
		</tr>
		<%if (!vTempCampo1.equals("") || !vTempCampo2.equals("") || !vTempCampo3.equals("") || !vTempCampo4.equals("") || !vTempCampo5.equals("")){
				if (vTempCampo1.equals("")) vTempCampo1 = "&nbsp;";
				if (vTempCampo2.equals("")) vTempCampo2 = "&nbsp;";
				if (vTempCampo3.equals("")) vTempCampo3 = "&nbsp;";
				if (vTempCampo4.equals("")) vTempCampo4 = "&nbsp;";
				if (vTempCampo5.equals("")) vTempCampo5 = "&nbsp;";%>
		<TR align="left" bgcolor="<%=sBackColor%>">
			<TD valign="top" class="ContenidoImprL" width="95"><%=vTempCampo1%></TD>
			<TD valign="top" class="ContenidoImpr" width="195"><%=vTempCampo2%></TD>
			<TD valign="top" class="ContenidoImpr" align="center" width="50">&nbsp;</TD>
			<td valign="top" class="ContenidoImpr" width="90"><%=vTempCampo3%></td>
			<td valign="top" class="ContenidoImpr" width="90"><%=vTempCampo4%></td>
			<td valign="top" class="ContenidoImpr" width="78" align="center">&nbsp;</td>
			<td valign="top" class="ContenidoImpr" width="78" align="center">&nbsp;</td>
			<TD valign="top" class="ContenidoImpr" width="195"><%=vTempCampo5%></TD>
			<td class="ContenidoImprR" width="35">&nbsp;</td>
		</tr><%
			}
		}
			iRowsCount = iRowsCount>=iMaxRowXPag?iRowMaxTemp:iRowsCount;
			
		} // FIN DEL FOR
//Si existe la paginacion debera repetir esto		
		%>
				<tr>
				<td colspan="9" class="ContenidoImprB">&nbsp;</td>
				</tr>
		<TR><td colspan="2" ></td><TD colspan="2"  class="ContenidoImpr">SITUACIÓN:</TD><td colspan="4" ></td></TR>
		<TR><td colspan="2" ></td><TD colspan="2" class="ContenidoImpr">L = Licencia</TD><td colspan="4" ></td></TR>
		<TR><td colspan="2" ></td><TD colspan="2" class="ContenidoImpr">P = Permiso</TD><td colspan="4" ></td></TR>
		<TR><td colspan="2" ></td><TD colspan="2" class="ContenidoImpr">C = Comisión</TD><td colspan="4" ></td></TR>
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