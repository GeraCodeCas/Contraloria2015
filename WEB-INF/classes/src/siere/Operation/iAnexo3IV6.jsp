<%/*********************************************************************************************************
Elaboro:	Claudia Sandoval
Lugar:		Monterrey, NL
Fecha:		29.Oct.2002
Compañia:	CONSISS*/%>
<%@page import="com.consiss.util.tools.*"%>
<%@page import="com.gob.*"%>
<%@page import="java.util.*" %>
<%

int iIdFuncionario =  java.lang.Integer.parseInt(
			(request.getParameter("iIdFuncionario")!= null?request.getParameter("iIdFuncionario"):"0") );

String sAnexo = "III.4.6";
Anexo3IV6 oAnexo3IV6	= new Anexo3IV6();
String sPath = "../";
int numpag = 0;
int numtot = 0;
int iIdAnexo = oAnexo3IV6.GetIdAnexo();
AnexoEstatus	oAnexoEstatus		= new AnexoEstatus();
oAnexoEstatus.Get(iIdFuncionario, iIdAnexo);
String sEstatus = oAnexoEstatus.GetEstatus();
%>
<html>
<head>
	<title>Entrega - Recepción : Anexo III.4.6 (Impresión)</title>
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
<%
int CursosxHoja = 4;

int pagXCurso = oAnexo3IV6.GetCursoAll(iIdFuncionario)/CursosxHoja;
pagXCurso = pagXCurso*CursosxHoja!=oAnexo3IV6.GetCursoAll(iIdFuncionario)?pagXCurso+1:pagXCurso;

if(!sEstatus.equals("0")){ 
	int [] iHorasEmpleados = new int[oAnexo3IV6.GetEmpleadoAll(iIdFuncionario)];

	if(pagXCurso == 0){%>
<%@include file="HeaderAnexo.jsp"%>
<br>
<table border="0" cellspacing="0" cellpadding="0">
<tr>
	<!-- contenido -->
	<td valign="top">
	<TABLE cellPadding="0" width="900" cellSpacing="0" BORDER="1" BORDERCOLOR="white">
	<!-- Etiqueta donde se aplican los encabezados de las tablas-->
	<TR><TD class="TituloParrafoImpr">PROGRAMA DE AVANCE Y CAPACITACIÓN DE PERSONAL</TD></TR>  
	</TABLE>
	<!-- Datos que se agregaran a la tabla  -->
	<TABLE cellPadding="0" cellSpacing="0" width="100%" BORDER="1" BORDERCOLOR="white">
	<!-- Etiqueta donde se aplican los encabezados de las tablas-->
		<TR align="middle">
			<td width="200" class="TituloMenuImpr" rowspan="2">Nombre del Empleado</TD>
			<td width="600" class="TituloMenuImpr" >Horas Invertidas En Cada Curso</TD>
			<td width="100" class="TituloMenuImpr" rowspan="2">Horas Totales Capacitación</TD>
		</TR>
		<TR>
			<TD class="TituloMenuImpr" align="center">Curso</TD>
		</TR>
		<TR>
			<TD class="TituloMenuImpr">Total Horas Capacitación</TD>
		</TR>
	</table><%
	}
	for(int iPag=1;iPag <= pagXCurso; iPag++) { 

		int cursoInicial = CursosxHoja * (iPag - 1) ; 
		int cursoFinal = oAnexo3IV6.GetCursoAll(iIdFuncionario)> (CursosxHoja * iPag) ? (CursosxHoja * iPag) :oAnexo3IV6.GetCursoAll(iIdFuncionario) ; 
		%>
		<%if(iPag>1){%><p style="page-break-after:always"></p><%}%>
<%@include file="HeaderAnexo.jsp"%>
<br>
<table border="0" cellspacing="0" cellpadding="0">
<tr>
	<!-- contenido -->
	<td valign="top">
	<TABLE cellPadding="0" width="900" cellSpacing="0" BORDER="1" BORDERCOLOR="white">
	<!-- Etiqueta donde se aplican los encabezados de las tablas-->
	<TR><TD class="TituloParrafoImpr">PROGRAMA DE AVANCE Y CAPACITACIÓN DE PERSONAL</TD></TR>  
	</TABLE>
	<!-- Datos que se agregaran a la tabla  -->
	<TABLE cellPadding="0" cellSpacing="0" width="100%" BORDER="1" BORDERCOLOR="white">
	<!-- Etiqueta donde se aplican los encabezados de las tablas-->
		<TR align="middle">
			<td width="200" class="TituloMenuImpr" rowspan="2">Nombre del Empleado</TD>
			<td width="600" class="TituloMenuImpr" <%=oAnexo3IV6.GetCursoAll(iIdFuncionario)>0?("colspan="+(cursoFinal - cursoInicial) ) :""%>>Horas Invertidas En Cada Curso</TD>
			<td width="100" class="TituloMenuImpr" rowspan="2"><%=oAnexo3IV6.GetCursoAll(iIdFuncionario)>CursosxHoja?"Horas Parciales Capacitación":"Horas Totales Capacitación" %></TD>
			<%if(iPag >= pagXCurso){%><td width="100" class="TituloMenuImpr" rowspan="2">Horas Totales Capacitación</TD><%}%>
		</TR>
		<TR align="top"><%
if(oAnexo3IV6.GetCursoAll(iIdFuncionario)>0){
	for(int i=cursoInicial ;i< cursoFinal ;i++){
	%>
			<td width="150" class="ContenidoImprB341" align="center"><b><%=oAnexo3IV6.GetNombreCurso(i)%></b></TD><%
	}
} else {%>
			<td width="600" class="TituloMenuImpr" align="center">Curso</TD><%
}%>
		</TR>
<%
oAnexo3IV6.GetAll(iIdFuncionario);
int intContador = 0;
String sBackColor = "";
int [] iHorasCursos = new int[oAnexo3IV6.GetCursoAll(iIdFuncionario)];


			// Variables para Paginacion
			int iLenCol = 0;
			int iRowsMax = 0; // POR REGISTRO
			int iRowsXCol = 0;
			int iRowsCount = 0;
			int iRowsAnt = 0; //posicion anterior
			int iMaxRowXPag = 22; //Numero de Renglones por Pagina
			// Variables para Paginacion
			

//Inicia For
for(int w=0;w<oAnexo3IV6.GetEmpleadoAll(iIdFuncionario);w++){
			// Variables para Paginacion
			int iRowMaxTemp = 1;
			int iRowCountTemp = 0;
			String vTempCampo1 = "";
			// Variables para Paginacion		
			iRowsAnt = iRowsCount;
		
	String vIdEmpleado 			= oAnexo3IV6.GetIdEmpleado(w)!=-1?oAnexo3IV6.GetIdEmpleado(w)+"":"0";
	String vNombreEmpleado		= oAnexo3IV6.GetNombreEmpleado(w)!=null?oAnexo3IV6.GetNombreEmpleado(w):"";
	//Primer Elemento que su contenido puede llevar a un salto de pagina
			iLenCol = vNombreEmpleado.length();
			iRowsXCol = 1;
			
			if(iLenCol > 27){
				if(iLenCol%27 == 0){
					iRowsXCol = iLenCol/27;
				}else{
					iRowsXCol = (iLenCol/27)+1;
				}
				
				String temp = vNombreEmpleado;
				vNombreEmpleado = "";
				iRowCountTemp = 0 ;
				for(int x=1;x<=(iRowsXCol);x++){
					int max = (27*x)<=iLenCol ? (27*x) : iLenCol;
					if( (x + iRowsAnt) <= iMaxRowXPag) {
						vNombreEmpleado = vNombreEmpleado + temp.substring((27*(x-1)), max) + "<br>";
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
	intContador = intContador + 1;
	if (intContador%2 == 0){	sBackColor = "#ffffff";	}
	else{						sBackColor = "#dddddd"; }%>
		<TR align="left" bgcolor="<%=sBackColor%>">
			<TD class="ContenidoImprL341">&nbsp;<%=vNombreEmpleado%></TD><%
	if(oAnexo3IV6.GetCursoAll(iIdFuncionario)>0){
		int horas = 0;
		for(int j=cursoInicial ;j< cursoFinal ;j++){
			int iPos = oAnexo3IV6.GetPos(iIdFuncionario, oAnexo3IV6.GetIdCurso(j), oAnexo3IV6.GetIdEmpleado(w));
			horas = horas + (iPos>=0?java.lang.Integer.parseInt(oAnexo3IV6.GetHoras(iPos)):0);
			iHorasCursos[j] = iHorasCursos[j] + (iPos>=0?java.lang.Integer.parseInt(oAnexo3IV6.GetHoras(iPos)):0);
			iHorasEmpleados[w] = iHorasEmpleados[w] + (iPos>=0?java.lang.Integer.parseInt(oAnexo3IV6.GetHoras(iPos)):0); %>
			<TD class="ContenidoImpr" align="center">&nbsp;<%=iPos>=0?oAnexo3IV6.GetHoras(iPos):""%></TD><%
		}%>
			<TD class="ContenidoImprR" align="center"><%=horas%></TD>
			<%if(iPag >= pagXCurso){%><TD class="ContenidoImprR" align="center"><%=iHorasEmpleados[w]%></TD><%}%>
		</TR><%
	}
%>	

<%
		//Si existe la paginacion debera repetir esto		
		if ( !vTempCampo1.equals("") || iRowsCount>=iMaxRowXPag ){
		%>
		<tr>
		<td colspan="6" class="ContenidoImprB">&nbsp;</td>
	</tr>
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
	<TR><TD class="TituloParrafoImpr">PROGRAMA DE AVANCE Y CAPACITACIÓN DE PERSONAL</TD></TR>  
	</TABLE>
	<!-- Datos que se agregaran a la tabla  -->
	<TABLE cellPadding="0" cellSpacing="0" width="100%" BORDER="1" BORDERCOLOR="white">
	<!-- Etiqueta donde se aplican los encabezados de las tablas-->
		<TR align="middle">
			<td width="200" class="TituloMenuImpr" rowspan="2">Nombre del Empleado</TD>
			<td width="600" class="TituloMenuImpr" <%=oAnexo3IV6.GetCursoAll(iIdFuncionario)>0?("colspan="+(cursoFinal - cursoInicial) ) :""%>>Horas Invertidas En Cada Curso</TD>
			<td width="100" class="TituloMenuImpr" rowspan="2"><%=oAnexo3IV6.GetCursoAll(iIdFuncionario)>CursosxHoja?"Horas Parciales Capacitación":"Horas Totales Capacitación" %></TD>
			<%if(iPag >= pagXCurso){%><td width="100" class="TituloMenuImpr" rowspan="2">Horas Totales Capacitación</TD><%}%>
		</TR>
		<TR align="top"><%
if(oAnexo3IV6.GetCursoAll(iIdFuncionario)>0){
	for(int i=cursoInicial ;i< cursoFinal ;i++){
	%>
			<td class="ContenidoImprB341" align="center"><b><%=oAnexo3IV6.GetNombreCurso(i)%></b></TD><%
	}
} else {%>
			<td width="600" class="TituloMenuImpr" align="center">Curso</TD><%
}%>
		</TR>
		<%if (!vTempCampo1.equals("")){%>
		<TR align="left" bgcolor="<%=sBackColor%>">
			<TD class="ContenidoImprL" width="200" class="ContenidoImpr"><%=vTempCampo1%></TD>
			<TD width="150" class="ContenidoImpr">&nbsp;</TD>
			<TD width="150" class="ContenidoImpr">&nbsp;</TD>
			<TD width="150" class="ContenidoImpr">&nbsp;</TD>
			<TD width="150" class="ContenidoImpr">&nbsp;</TD>
			<TD width="100" class="ContenidoImprR">&nbsp;</TD>
		</TR>
	<%
			}
		}
			iRowsCount = iRowsCount>=iMaxRowXPag?iRowMaxTemp:iRowsCount;
			
		} // FIN DEL FOR
//Si existe la paginacion debera repetir esto		
		%>
	<tr>
		<td <%=oAnexo3IV6.GetCursoAll(iIdFuncionario)>0?("colspan="+((cursoFinal - cursoInicial) + 2) ) :""%> class="ContenidoImprB">&nbsp;</td>
		<%if(iPag >= pagXCurso){%><TD class="ContenidoImprB" align="center">&nbsp;</TD><%}%>
	</tr>
<TR>
	<TD class="TituloMenuImpr">TOTAL HORAS CAPACITACION</TD><%
if(oAnexo3IV6.GetCursoAll(iIdFuncionario)>0){
 	int horas = 0; int horasTotal = 0;
	for(int j=cursoInicial ;j< cursoFinal;j++){
		horas = horas + iHorasCursos[j];%>
			<TD class="ContenidoImpr1Col" align="center">&nbsp;<%=iHorasCursos[j]%></TD><%
	}
	if(iPag >= pagXCurso){ for(int w=0;w<oAnexo3IV6.GetEmpleadoAll(iIdFuncionario);w++){horasTotal = horasTotal + iHorasEmpleados[w];} }%>
			<TD width="100" class="ContenidoImpr1Col" align="center"><%=horas%></TD>
			<%if(iPag >= pagXCurso){%><TD class="ContenidoImpr1Col" align="center"><%=horasTotal%></TD><%}%><%
}%>
		</TR>
	</TABLE>
<%@include file="FooterAnexo.jsp"%>
<%}%>
<%} else {%>
<%@include file="HeaderAnexo.jsp"%>
<br>
<table border="0" cellspacing="0" cellpadding="0">
<tr>
	<!-- contenido -->
	<td valign="top">
	<TABLE cellPadding="0" width="900" cellSpacing="0" BORDER="1" BORDERCOLOR="white">
	<!-- Etiqueta donde se aplican los encabezados de las tablas-->
	<TR><TD class="TituloParrafoImpr">PROGRAMA DE AVANCE Y CAPACITACIÓN DE PERSONAL</TD></TR>  
	</TABLE>
	<!-- Datos que se agregaran a la tabla  -->
	<TABLE cellPadding="0" cellSpacing="0" width="100%" BORDER="1" BORDERCOLOR="white">
	<!-- Etiqueta donde se aplican los encabezados de las tablas-->
		<TR align="middle">
			<td width="200" class="TituloMenuImpr" rowspan="2">Nombre del Empleado</TD>
			<td width="600" class="TituloMenuImpr">Horas Invertidas En Cada Curso</TD>
			<td width="100" class="TituloMenuImpr" rowspan="2">Horas Totales Capacitación</TD>
		</TR>
	</table>
	<TABLE width="100%">
		<TR>
			<TD align="center"><H1 style="size=+2"><br>ESTE ANEXO NO APLICA</H1></TD>
		</TR>
	</TABLE>
</TD>
</TR>
</table>
<br>
<%@include file="FooterAnexo.jsp"%>
<%}%>
	<BR><BR>
</td>
	<!-- Contenido -->
</tr>
</table>
<br>
</body>
</html>