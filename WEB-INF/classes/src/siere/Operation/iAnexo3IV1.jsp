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
if ((String)session.getValue("ok")!="Consiss" && (String)session.getValue("ok")!="ConsissRH") response.sendRedirect("Error.html");

int iIdUnidad =  java.lang.Integer.parseInt(
			request.getParameter("iIdUnidad")!= null?request.getParameter("iIdUnidad"):"0");

String sUnidad = request.getParameter("sUnidad")!= null?request.getParameter("sUnidad"):"";

java.text.DecimalFormat myFormatter = new java.text.DecimalFormat("###,##0.00");
String sAnexo = "III.4.1";
Anexo3IV1 oAnexo3IV1 	= new Anexo3IV1();
int iIdAnexo = oAnexo3IV1.GetIdAnexo();

String sPath = "../";
AnexoEstatus	oAnexoEstatus		= new AnexoEstatus();
int numpag = 0;
int numtot = 0;
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
	<title>Entrega - Recepción : Anexo III.4.1 (Impresión)</title>
<script language="JavaScript" src="<%=sPath%>Scripts/Gobierno.js"></script>
<link rel="stylesheet" type="text/css" href="<%=sPath%>Styles/Gobierno.css">
<script language="JavaScript">
function closewin(){
	 window.close();
}
</script>
<script language="JavaScript">
var da = (document.all) ? 1 : 0;
var pr = (window.print) ? 1 : 0;
var mac = (navigator.userAgent.indexOf("Mac") != -1); 

function Imprimir() {
	if (pr){
		/* NS4, IE5 */
		window.print();
	}else 
		if (da && !mac){ 
	/* IE4 (Windows) */
			print();
		}else /* other browsers */
			alert("Lo siento, su browser no permite esta accion.");
}

function print(){
	var WebBrowser = '<OBJECT ID="WebBrowser1"  WIDTH=0 HEIGHT=0 CLASSID="CLSID:8856F961-340A-11D0-A96B-00C04FD705A2"></OBJECT>';
	// insert object
	this.document.body.insertAdjacentHTML('afterBegin', WebBrowser); 
	this.focus();
	//if (confirm("Seguro que desea imprimir?"))
	//{
		printVB();
	//}
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
<TABLE cellPadding="0" cellSpacing="0" width="900" BORDER="1" BORDERCOLOR="white">
	<tr>
		<TD colspan="12" class="TituloParrafo" width="100%">PLANTILLA DE PERSONAL</TD>
	</tr>
	<TR align="middle">
		<td rowspan="2" class="TituloMenuImpr" width="95">Nombre</td>
		<td rowspan="2" class="TituloMenuImpr" width="95">Puesto</td>
		<td rowspan="2" class="TituloMenuImpr" width="85">Categoria</td>
		<td rowspan="2" class="TituloMenuImpr" width="95">Adscripción</td>
		<td class="TituloMenuImpr" colspan="3" align="center">Tipo de Plaza</td>
		<td class="TituloMenuImpr" colspan="4" align="center">Percepcion Mensual</td>
		<td rowspan="2" class="TituloMenuImpr" width="95">Observaciones</td>
		<td rowspan="2" class="TituloMenuImpr" width="35">Tipo de Nómina</td>
	</TR>
	<TR align="middle" align="center">
		<td align="center" width="28" class="TituloMenuImpr">Base</td>
		<td align="center" width="28" class="TituloMenuImpr">Extr.</td>
		<td align="center" width="28" class="TituloMenuImpr">Event.</td>
		<td class="TituloMenuImpr" width="79">Sueldo<br> Base</td>
		<td class="TituloMenuImpr" width="79">Compensación</td>
		<td class="TituloMenuImpr" width="79">Otras<br> Prestaciones</td>
		<td class="TituloMenuImpr" width="79">Total</td>
	</TR><%	
if(!sEstatus.equals("0") || sUnidad.equals("H")){
	int intContador = 0;
	String sBackColor = "";
	if(sUnidad.equals("F"))
		oAnexo3IV1.GetAll(iIdUnidad);
	else
		oAnexo3IV1.GetAllRH(iIdUnidad);
	// Variables para Paginacion
	int iLenCol = 0;
	int iRowsMax = 0; // POR REGISTRO
	int iRowsXCol = 0;
	int iRowsCount = 0;
	int iRowsAnt = 0; //posicion anterior
	int iMaxRowXPag = 19; //Numero de Renglones por Pagina
	// Variables para Paginacion
	TipoNomina oTipoNomina = new TipoNomina();
	for(int i=0;i<oAnexo3IV1.GetAll(iIdUnidad);i++){
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
			
		String vIdRenglon = oAnexo3IV1.GetIdRenglon(i)!=-1?oAnexo3IV1.GetIdRenglon(i)+"":"0";
		String vPuesto = oAnexo3IV1.GetPuesto(i)!=null?oAnexo3IV1.GetPuesto(i):"";
		//Primer Elemento que su contenido puede llevar a un salto de pagina
		iLenCol = vPuesto.length();
		iRowsXCol = 1;
		if(iLenCol > 17){
			if(iLenCol%17 == 0)	{iRowsXCol = iLenCol/17;}
			else				{iRowsXCol = (iLenCol/17)+1;}
			String temp = vPuesto;
			vPuesto = "";
			iRowCountTemp = 0 ;
			for(int x=1;x<=(iRowsXCol);x++){
				int max = (17*x)<=iLenCol ? (17*x) : iLenCol;
				if( (x + iRowsAnt) <= iMaxRowXPag) {
					vPuesto = vPuesto + temp.substring((17*(x-1)), max) + "<br>";
				} else {
					iRowCountTemp = iRowCountTemp + 1;
					vTempCampo1 = vTempCampo1 + temp.substring((17*(x-1)), max) + "<br>";
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
		
		String vNombre 	= oAnexo3IV1.GetNombre(i)!=null?oAnexo3IV1.GetNombre(i):"";
		// Elemento que su contenido puede llevar a un salto de pagina
		iLenCol = vNombre.length();
		if(iLenCol > 17){
			if(iLenCol%17 == 0)	{iRowsXCol = iLenCol/17;}
			else				{iRowsXCol = (iLenCol/17)+1;}
			if (iRowsXCol > iRowsMax){
				iRowsCount = iRowsXCol - iRowsMax + iRowsCount;
				iRowsMax = iRowsXCol;
			}
			String temp = vNombre;
			vNombre = "";
			iRowCountTemp = 0 ;
			for(int x=1;x<=(iRowsXCol);x++){
				int max = (17*x)<=iLenCol ? (17*x) : iLenCol;
				if( (x + iRowsAnt) <= iMaxRowXPag) {
					vNombre = vNombre + temp.substring((17*(x-1)), max) + "<br>";
				} else {
					iRowCountTemp = iRowCountTemp + 1;
					vTempCampo2 = vTempCampo2 + temp.substring((17*(x-1)), max) + "<br>";
				}
			}
			iRowMaxTemp = iRowMaxTemp >= iRowCountTemp ? iRowMaxTemp : iRowCountTemp ;
		}else{
			iRowsXCol = 1;
		}
		// Elemento que su contenido puede llevar a un salto de pagina
		
		String vCategoria = oAnexo3IV1.GetCategoria(i)!=null?oAnexo3IV1.GetCategoria(i):"";
		// Elemento que su contenido puede llevar a un salto de pagina
		iLenCol = vCategoria.length();
		if(iLenCol > 16){
			if(iLenCol%16 == 0)	{iRowsXCol = iLenCol/16;}
			else				{iRowsXCol = (iLenCol/16)+1;}
			if (iRowsXCol > iRowsMax){
				iRowsCount = iRowsXCol - iRowsMax + iRowsCount;
				iRowsMax = iRowsXCol;
			}
			String temp = vCategoria;
			vCategoria = "";
			iRowCountTemp = 0 ;
			for(int x=1;x<=(iRowsXCol);x++){
				int max = (16*x)<=iLenCol ? (16*x) : iLenCol;
				if( (x + iRowsAnt) <= iMaxRowXPag) {
					vCategoria = vCategoria + temp.substring((16*(x-1)), max) + "<br>";
				} else {
					iRowCountTemp = iRowCountTemp + 1;
					vTempCampo3 = vTempCampo3 + temp.substring((16*(x-1)), max) + "<br>";
				}
			}
			iRowMaxTemp = iRowMaxTemp >= iRowCountTemp ? iRowMaxTemp : iRowCountTemp ;
		}else{
			iRowsXCol = 1;
		}
		// Elemento que su contenido puede llevar a un salto de pagina
		
		String vAdscripcion = oAnexo3IV1.GetAdscripcion(i)!=null?oAnexo3IV1.GetAdscripcion(i):"";
		// Elemento que su contenido puede llevar a un salto de pagina
		iLenCol = vAdscripcion.length();
		if(iLenCol > 15){
			if(iLenCol%15 == 0)	{iRowsXCol = iLenCol/15;}
			else				{iRowsXCol = (iLenCol/15)+1;}
			if (iRowsXCol > iRowsMax){
				iRowsCount = iRowsXCol - iRowsMax + iRowsCount;
				iRowsMax = iRowsXCol;
			}
			String temp = vAdscripcion;
			vAdscripcion = "";
			iRowCountTemp = 0 ;
			for(int x=1;x<=(iRowsXCol);x++){
				int max = (15*x)<=iLenCol ? (15*x) : iLenCol;
				if( (x + iRowsAnt) <= iMaxRowXPag) {
					vAdscripcion = vAdscripcion + temp.substring((15*(x-1)), max) + "<br>";	}
				else {
					iRowCountTemp = iRowCountTemp + 1;
					vTempCampo4 = vTempCampo4 + temp.substring((15*(x-1)), max) + "<br>";	}
			}
			iRowMaxTemp = iRowMaxTemp >= iRowCountTemp ? iRowMaxTemp : iRowCountTemp ;
		}else{
			iRowsXCol = 1;
		}
		// Elemento que su contenido puede llevar a un salto de pagina
		
		String vTipoPlaza = oAnexo3IV1.GetTipoPlaza(i)!=null?oAnexo3IV1.GetTipoPlaza(i):"";
		String vSueldoBase = oAnexo3IV1.GetSueldoBase(i)!=null?oAnexo3IV1.GetSueldoBase(i):"";
		String vCompensacion = oAnexo3IV1.GetCompensacion(i)!=null?oAnexo3IV1.GetCompensacion(i):"";
		String vOtrasPrestaciones = oAnexo3IV1.GetOtrasPrestaciones(i)!=null?oAnexo3IV1.GetOtrasPrestaciones(i):"";
		String vTotal = oAnexo3IV1.GetTotal(i)!=null?oAnexo3IV1.GetTotal(i):"";
		String vObservaciones = oAnexo3IV1.GetObservaciones(i)!=null?oAnexo3IV1.GetObservaciones(i):"";
		// Elemento que su contenido puede llevar a un salto de pagina
		iLenCol = vObservaciones.length();
		if(iLenCol > 17){
			if(iLenCol%17 == 0)	{iRowsXCol = iLenCol/17;}
			else				{iRowsXCol = (iLenCol/17)+1;}
			if (iRowsXCol > iRowsMax){
				iRowsCount = iRowsXCol - iRowsMax + iRowsCount;
				iRowsMax = iRowsXCol;
			}
			String temp = vObservaciones;
			vObservaciones = "";
			iRowCountTemp = 0 ;
			for(int x=1;x<=(iRowsXCol);x++){
				int max = (17*x)<=iLenCol ? (17*x) : iLenCol;
				if( (x + iRowsAnt) <= iMaxRowXPag) {
					vObservaciones = vObservaciones + temp.substring((17*(x-1)), max) + "<br>";	}
				else {
					iRowCountTemp = iRowCountTemp + 1;
					vTempCampo5 = vTempCampo5 + temp.substring((17*(x-1)), max) + "<br>";	}
			}
			iRowMaxTemp = iRowMaxTemp >= iRowCountTemp ? iRowMaxTemp : iRowCountTemp ;
		}else{
			iRowsXCol = 1;
		}
		// Elemento que su contenido puede llevar a un salto de pagina

		intContador = intContador + 1;
		if (intContador%2 == 0)	{sBackColor = "#ffffff";}
		else					{sBackColor = "#dddddd";}
		
		String vTipoNomina = oAnexo3IV1.GetClaveTipoNomina(i);
		String sDescNomina = oTipoNomina.GetPosClave(vTipoNomina)>=0?oTipoNomina.GetDescripcion(oTipoNomina.GetPosClave(vTipoNomina)):"&nbsp;";
		vObservaciones = (null==vObservaciones||vObservaciones.equals(""))?"&nbsp;":vObservaciones;
		vCategoria= (null==vCategoria||vCategoria.equals(""))?"&nbsp;":vCategoria;
		vAdscripcion = (null==vAdscripcion||vAdscripcion.equals(""))?"&nbsp;":vAdscripcion;
		%>
		<TR valign="top" align="left" bgcolor="<%=sBackColor%>">
			<td class="ContenidoImprL341" width="95"><%=vNombre%></td>
			<td class="ContenidoImpr341" width="95"><%=vPuesto%></td>
			<td class="ContenidoImpr341" width="85"><%=vCategoria%></td>
			<td class="ContenidoImpr341" width="95"><%=vAdscripcion%></td>
			<td align="center" width="28"><%if(vTipoPlaza.equals("1")){%><img width="10" height="10" src="<%=sPath%>/Images/VinetaGde.gif"><%}else{%>&nbsp;<%}%></td>
			<td align="center" width="28"><%if(vTipoPlaza.equals("2")){%><img width="10" height="10" src="<%=sPath%>/Images/VinetaGde.gif"><%}else{%>&nbsp;<%}%></td>
			<td align="center" width="28"><%if(vTipoPlaza.equals("3")){%><img width="10" height="10" src="<%=sPath%>/Images/VinetaGde.gif"><%}else{%>&nbsp;<%}%></td>
			<td align="right" class="ContenidoImpr341" width="79"><%=myFormatter.format(new Double(!vSueldoBase.equals("")?vSueldoBase:"0"))%></td>					
			<td align="right" class="ContenidoImpr341" width="79"><%=myFormatter.format(new Double(!vCompensacion.equals("")?vCompensacion:"0"))%></td>
			<td align="right" class="ContenidoImpr341" width="79"><%=myFormatter.format(new Double(!vOtrasPrestaciones.equals("")?vOtrasPrestaciones:"0"))%></td>
			<td align="right" class="ContenidoImpr341" width="79"><%=myFormatter.format(new Double(!vTotal.equals("")?vTotal:"0"))%></td>
			<td align="left" class="ContenidoImpr341" width="95"><%=vObservaciones%></td>
			<td class="ContenidoImprR341" width="35"><%=sDescNomina%></td>
		</TR>
		<%
		//Si existe la paginacion debera repetir esto		
		if ( (!vTempCampo1.equals("") || !vTempCampo2.equals("") || !vTempCampo3.equals("") || !vTempCampo4.equals("") || !vTempCampo5.equals(""))
			|| iRowsCount>=iMaxRowXPag ){%>
		<tr>
			<td colspan="13" class="ContenidoImprB">&nbsp;</td>
		</tr>
	</TABLE>
</td>
</tr>
</table>
<p style="page-break-after:always"></p>
<%@include file="HeaderAnexo.jsp"%>
<br>
<TABLE cellPadding="0" cellSpacing="0" width="900" BORDER="1" BORDERCOLOR="white">
		<tr>
		<TD colspan="12" class="TituloParrafo" width="100%">PLANTILLA DE PERSONAL</TD>
		</tr>
		<TR align="middle">
			<td rowspan="2" class="TituloMenuImpr" width="95">Nombre</td>
			<td rowspan="2" class="TituloMenuImpr" width="95">Puesto</td>
			<td rowspan="2" class="TituloMenuImpr" width="85">Categoria</td>
			<td rowspan="2" class="TituloMenuImpr" width="95">Adscripción</td>
			<td class="TituloMenuImpr" colspan="3" align="center">Tipo de Plaza</td>
			<td class="TituloMenuImpr" colspan="4" align="center">Percepcion Mensual</td>
			<td rowspan="2" class="TituloMenuImpr" width="95">Observaciones</td>
			<td rowspan="2" class="TituloMenuImpr" width="35">Tipo de Nómina</td>
		</TR>
		<tr align="middle" align="center">
			<td align="center" width="28" class="TituloMenuImpr">Base</td>
			<td align="center" width="28" class="TituloMenuImpr">Extr.</td>
			<td align="center" width="28" class="TituloMenuImpr">Event.</td>
			<td class="TituloMenuImpr" width="79">Sueldo<br> Base</td>
			<td class="TituloMenuImpr" width="79">Compensación</td>
			<td class="TituloMenuImpr" width="79">Otras<br> Prestaciones</td>
			<td class="TituloMenuImpr" width="79">Total</td>
		</tr>
	<%if (!vTempCampo1.equals("") || !vTempCampo2.equals("") || !vTempCampo3.equals("") || !vTempCampo4.equals("") || !vTempCampo5.equals("")){
		if (vTempCampo1.equals("")) vTempCampo1 = "&nbsp;";
		if (vTempCampo2.equals("")) vTempCampo2 = "&nbsp;";
		if (vTempCampo3.equals("")) vTempCampo3 = "&nbsp;";
		if (vTempCampo4.equals("")) vTempCampo4 = "&nbsp;";
		if (vTempCampo5.equals("")) vTempCampo5 = "&nbsp;";%>
	<TR valign="top" align="left" bgcolor="<%=sBackColor%>">
			<td class="ContenidoImprL341" width="95">&nbsp;<%=vTempCampo1%></td>
			<td class="ContenidoImpr341" width="95"><%=vTempCampo2%></td>
			<td class="ContenidoImpr341" width="85"><%=vTempCampo3%></td>
			<td class="ContenidoImpr341" width="95"><%=vTempCampo4%></td>
			<td align="center" width="28">&nbsp;</td>
			<td align="center" width="28">&nbsp;</td>
			<td align="center" width="28">&nbsp;</td>
			<td align="right" class="ContenidoImpr341" width="79">&nbsp;</td>
			<td align="right" class="ContenidoImpr341" width="79">&nbsp;</td>
			<td align="right" class="ContenidoImpr341" width="79">&nbsp;</td>
			<td align="right" class="ContenidoImpr341" width="79">&nbsp;</td>
			<td align="left" class="ContenidoImpr341" width="95"><%=vTempCampo5%></td>
			<td class="ContenidoImprR341" width="95">&nbsp;</td>
			
		</TR><%
			}
		}
			iRowsCount = iRowsCount>=iMaxRowXPag?iRowMaxTemp:iRowsCount;
			
		} // FIN DEL FOR
//Si existe la paginacion debera repetir esto
		%>
		<tr>
			<td colspan="13" class="ContenidoImprB">&nbsp;</td>
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
</html><%
} else {%>
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