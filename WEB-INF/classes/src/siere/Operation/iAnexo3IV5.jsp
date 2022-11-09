<%/*********************************************************************************************************
Elaboro:	Claudia Sandoval
Lugar:		Monterrey, NL
Fecha:		29.Oct.2002
Compa�ia:	CONSISS*/%>
<%@page import="com.consiss.util.tools.*"%>
<%@page import="com.gob.*"%>
<%@page import="java.util.*" %>
<%
if ((String)session.getValue("ok")!="Consiss" && (String)session.getValue("ok")!="ConsissRH") response.sendRedirect("Error.html");

int iIdUnidad =  java.lang.Integer.parseInt(
			request.getParameter("iIdUnidad")!= null?request.getParameter("iIdUnidad"):"0");

String sUnidad = request.getParameter("sUnidad")!= null?request.getParameter("sUnidad"):"";

String sAnexo = "III.4.5";
Anexo3IV5 oAnexo3IV5	= new Anexo3IV5();
String sPath = "../";
int numpag = 0;
int numtot = 0;
int iIdAnexo = oAnexo3IV5.GetIdAnexo();
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
	<title>Entrega - Recepci�n : Anexo III.4.5 (Impresi�n)</title>
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
	<TR><TD class="TituloParrafoImpr">RELACION DE EXPEDIENTES DE PERSONAL</TD></TR>  
	</TABLE>
	<TABLE id="datos" cellPadding="0" cellSpacing="0" width="100%" BORDER="1" BORDERCOLOR="white">
		<TR align="middle">
			<td class="TituloMenuImpr" width="190">Numero de Empleado</TD>
			<td class="TituloMenuImpr" width="190">Nombre</TD>
			<td class="TituloMenuImpr" width="290">Puesto</TD>
			<td class="TituloMenuImpr" width="190">Unidad Administrativa</TD>
			<td class="TituloMenuImpr" width="40">Tipo de N�mina</td>
		</TR><%
if(!sEstatus.equals("0") || sUnidad.equals("H")){
	int intContador = 0;
	String sBackColor = "";
	if(sUnidad.equals("F"))
		oAnexo3IV5.GetAll(iIdUnidad);
	else
		oAnexo3IV5.GetAllRH(iIdUnidad);
	// Variables para Paginacion
	int iLenCol = 0;
	int iRowsMax = 0; // POR REGISTRO
	int iRowsXCol = 0;
	int iRowsCount = 0;
	int iRowsAnt = 0; //posicion anterior
	int iMaxRowXPag = 25; //Numero de Renglones por Pagina
	// Variables para Paginacion
	TipoNomina oTipoNomina = new TipoNomina();
	for(int i=0;i<oAnexo3IV5.GetAll(iIdUnidad);i++){
		// Variables para Paginacion
		int iRowMaxTemp = 1;
		int iRowCountTemp = 0;
		String vTempCampo1 = "";
		String vTempCampo2 = "";
		String vTempCampo3 = "";
		String vTempCampo4 = "";
		// Variables para Paginacion
		iRowsAnt = iRowsCount;
		
		String vIdRenglon 			= oAnexo3IV5.GetIdRenglon(i)!=-1?oAnexo3IV5.GetIdRenglon(i)+"":"0";
		String vNumero 				= oAnexo3IV5.GetNumero(i)!=null?oAnexo3IV5.GetNumero(i):"";
		//Primer Elemento que su contenido puede llevar a un salto de pagina
		iLenCol = vNumero.length();
		iRowsXCol = 1;
		if(iLenCol > 27){
			if(iLenCol%27 == 0){
				iRowsXCol = iLenCol/27;
			}else{
				iRowsXCol = (iLenCol/27)+1;
			}
			String temp = vNumero;
			vNumero = "";
			iRowCountTemp = 0 ;
			for(int x=1;x<=(iRowsXCol);x++){
				int max = (27*x)<=iLenCol ? (27*x) : iLenCol;
				if( (x + iRowsAnt) <= iMaxRowXPag) {
					vNumero = vNumero + temp.substring((27*(x-1)), max) + "<br>";
					}
				else {
					iRowCountTemp = iRowCountTemp + 1;
					vTempCampo1 = vTempCampo1 + temp.substring((27*(x-1)), max) + "<br>";
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
		
		String vNombre 				= oAnexo3IV5.GetNombre(i)!=null?oAnexo3IV5.GetNombre(i):"";
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
			
		String vPuesto				= oAnexo3IV5.GetPuesto(i)!=null?oAnexo3IV5.GetPuesto(i):"";
		// Elemento que su contenido puede llevar a un salto de pagina
		iLenCol = vPuesto.length();
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
			String temp = vPuesto;
			vPuesto = "";
			iRowCountTemp = 0 ;
			for(int x=1;x<=(iRowsXCol);x++){
				int max = (40*x)<=iLenCol ? (40*x) : iLenCol;
				if( (x + iRowsAnt) <= iMaxRowXPag) {
					vPuesto = vPuesto + temp.substring((40*(x-1)), max) + "<br>";	}
				else {
					iRowCountTemp = iRowCountTemp + 1;
					vTempCampo3 = vTempCampo3 + temp.substring((40*(x-1)), max) + "<br>";	}
			}
			iRowMaxTemp = iRowMaxTemp >= iRowCountTemp ? iRowMaxTemp : iRowCountTemp ;
		}else{
			iRowsXCol = 1;
		}
		// Elemento que su contenido puede llevar a un salto de pagina
			
		String vUnidadAdministrativa= oAnexo3IV5.GetUnidadAdministrativa(i)!=null?oAnexo3IV5.GetUnidadAdministrativa(i):"";
		// Elemento que su contenido puede llevar a un salto de pagina
		iLenCol = vUnidadAdministrativa.length();
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
			String temp = vUnidadAdministrativa;
			vUnidadAdministrativa = "";
			iRowCountTemp = 0 ;
			for(int x=1;x<=(iRowsXCol);x++){
				int max = (27*x)<=iLenCol ? (27*x) : iLenCol;
				if( (x + iRowsAnt) <= iMaxRowXPag) {
					vUnidadAdministrativa = vUnidadAdministrativa + temp.substring((27*(x-1)), max) + "<br>";	}
				else {
					iRowCountTemp = iRowCountTemp + 1;
					vTempCampo4 = vTempCampo4 + temp.substring((27*(x-1)), max) + "<br>";	}
			}
			iRowMaxTemp = iRowMaxTemp >= iRowCountTemp ? iRowMaxTemp : iRowCountTemp ;
		}else{
			iRowsXCol = 1;
		}
		// Elemento que su contenido puede llevar a un salto de pagina
		String vTipoNomina = oAnexo3IV5.GetClaveTipoNomina(i);
		String sDescNomina = oTipoNomina.GetPosClave(vTipoNomina)>=0?oTipoNomina.GetDescripcion(oTipoNomina.GetPosClave(vTipoNomina)):"&nbsp;";
		
		intContador = intContador + 1;
		if (intContador%2 == 0)	{sBackColor = "#ffffff";}
		else					{sBackColor = "#dddddd";}%>
		<TR align="left" bgcolor="<%=sBackColor%>" >
			<TD class="ContenidoImprL"><%=vNumero%></TD>
			<TD class="ContenidoImpr"><%=vNombre%></TD>
			<TD class="ContenidoImpr"><%=vPuesto%></TD>
			<TD class="ContenidoImpr"><%=vUnidadAdministrativa%></TD>
			<td class="ContenidoImprR"><%=sDescNomina%></td>
		</TR>
		<%
		//Si existe la paginacion debera repetir esto		
		if ( (!vTempCampo1.equals("") || !vTempCampo2.equals("") || !vTempCampo3.equals("") || !vTempCampo4.equals(""))
			|| iRowsCount>=iMaxRowXPag ){
		%>
		<tr>
			<td colspan="5" class="ContenidoImprB">&nbsp;</td>
		</tr>
	</TABLE>
</td>
</tr>
</table>
<p style="page-break-after:always"></p>
<%@include file="HeaderAnexo.jsp"%>
<br>
<table border="0" cellspacing="0" cellpadding="0" width="900">
<tr>
	<td valign="top">
	<TABLE cellPadding="0" cellSpacing="0" width="100%" BORDER="1" BORDERCOLOR="white">
	<TR><TD class="TituloParrafoImpr">RELACION DE EXPEDIENTES DE PERSONAL</TD></TR>  
	</TABLE>
	<TABLE id="datos" cellPadding="0" cellSpacing="0" width="100%" BORDER="1" BORDERCOLOR="white">
		<TR align="middle">
			<td class="TituloMenuImpr" width="190">Numero de Empleado</TD>
			<td class="TituloMenuImpr" width="190">Nombre</TD>
			<td class="TituloMenuImpr" width="290">Puesto</TD>
			<td class="TituloMenuImpr" width="190">Unidad Administrativa</TD>
			<td class="TituloMenuImpr" width="40">Tipo de N�mina</td>
		</TR>
		<%if (!vTempCampo1.equals("") || !vTempCampo2.equals("") || !vTempCampo3.equals("") || !vTempCampo4.equals("")){
				if (vTempCampo2.equals("")) vTempCampo2 = "&nbsp;";
				if (vTempCampo3.equals("")) vTempCampo3 = "&nbsp;";%>
		<TR align="left" bgcolor="<%=sBackColor%>" >
			<TD class="ContenidoImprL"><%=vTempCampo1%></TD>
			<TD class="ContenidoImpr"><%=vTempCampo2%></TD>
			<TD class="ContenidoImpr"><%=vTempCampo3%></TD>
			<TD class="ContenidoImpr"><%=vTempCampo4%></TD>
			<TD class="ContenidoImprR">&nbsp;</TD>
		</TR><%
			}
		}
			iRowsCount = iRowsCount>=iMaxRowXPag?iRowMaxTemp:iRowsCount;
			
		} // FIN DEL FOR
//Si existe la paginacion debera repetir esto		
		%>
				<tr>
				<td colspan="5" class="ContenidoImprB">&nbsp;</td>
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