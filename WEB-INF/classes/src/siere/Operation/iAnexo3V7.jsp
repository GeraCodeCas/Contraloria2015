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

String sAnexo = "III.5.7";
Anexo3V7	 oAnexo3V7	 	= new Anexo3V7();
String sPath = "../";
int numpag = 0;
int numtot = 0;
int iIdAnexo = oAnexo3V7.GetIdAnexo();
AnexoEstatus	oAnexoEstatus		= new AnexoEstatus();
oAnexoEstatus.Get(iIdFuncionario, iIdAnexo);
String sEstatus = oAnexoEstatus.GetEstatus();
%>
<html>
<head>
	<title>Entrega - Recepción : Anexo III.5.7 (Impresión)</title>
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
	<TR><TD class="TituloParrafoImpr">RELACIÓN DE LIBROS, PUBLICACIONES, MATERIAL BIBLIOGRÁFICO E INFORMATIVO</TD></TR>  
	</TABLE>
	<TABLE cellPadding="0" cellSpacing="0" width="100%" BORDER="1" BORDERCOLOR="white">
		<TR align="center">
			<td width="150" class="TituloMenuImpr" rowspan="2">TITULO</TD>
			<td width="100" class="TituloMenuImpr" rowspan="2">FECHA DE<BR>EDICIÓN O<BR>ELABORACIÓN</TD>
			<td width="200" class="TituloMenuImpr" rowspan="2">AUTOR(ES) Y EDITORIAL<BR>(RESPONSABLE DE ELABO-<BR>RACIÓN O PUBLICACIÓN)</TD>
			<td class="TituloMenuImpr" colspan="2">RESPONSABLE DE LA CUSTODIA</TD>
			<td width="150" class="TituloMenuImpr" rowspan="2">Tipo</TD>
		</TR>
		<TR align="center">
			<td width="150" class="TituloMenuImpr">NOMBRE</td>
			<td width="150" class="TituloMenuImpr">DEPARTAMENTO</td>
		</TR><%
if(!sEstatus.equals("0")){
		int intContador = 0;
		String sBackColor = "";
		oAnexo3V7.GetAll(iIdFuncionario);
		// Variables para Paginacion
		int iLenCol = 0;
		int iRowsMax = 0; // POR REGISTRO
		int iRowsXCol = 0;
		int iRowsCount = 0;
		int iRowsAnt = 0; //posicion anterior
		int iMaxRowXPag = 25; //Numero de Renglones por Pagina
		// Variables para Paginacion
		
		for(int i=0;i<oAnexo3V7.GetAll(iIdFuncionario);i++){
		// Variables para Paginacion
		int iRowMaxTemp = 1;
		int iRowCountTemp = 0;
		String vTempCampo1 = "";
		String vTempCampo2 = "";
		String vTempCampo3 = "";
		String vTempCampo4 = "";
		// Variables para Paginacion
		iRowsAnt = iRowsCount;
		
		String vTitulo = oAnexo3V7.GetTitulo(i)!=null?oAnexo3V7.GetTitulo(i):"";
		//Primer Elemento que su contenido puede llevar a un salto de pagina
		iLenCol = vTitulo.length();
		iRowsXCol = 1;
		if(iLenCol > 20){
			if(iLenCol%20 == 0){
				iRowsXCol = iLenCol/20;
			}else{
				iRowsXCol = (iLenCol/20)+1;
			}
			String temp = vTitulo;
			vTitulo = "";
			iRowCountTemp = 0 ;
			for(int x=1;x<=(iRowsXCol);x++){
				int max = (20*x)<=iLenCol ? (20*x) : iLenCol;
				if( (x + iRowsAnt) <= iMaxRowXPag) {
					vTitulo = vTitulo + temp.substring((20*(x-1)), max) + "<br>";
					}
				else {
					iRowCountTemp = iRowCountTemp + 1;
					vTempCampo1 = vTempCampo1 + temp.substring((20*(x-1)), max) + "<br>";
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
		
		String vFecha = oAnexo3V7.GetFecha(i)!=null?oAnexo3V7.GetFecha(i):"";
		String vAutores = oAnexo3V7.GetAutores(i)!=null?oAnexo3V7.GetAutores(i):"";
		// Elemento que su contenido puede llevar a un salto de pagina
		iLenCol = vAutores.length();
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
			String temp = vAutores;
			vAutores = "";
			iRowCountTemp = 0 ;
			for(int x=1;x<=(iRowsXCol);x++){
				int max = (27*x)<=iLenCol ? (27*x) : iLenCol;
				if( (x + iRowsAnt) <= iMaxRowXPag) {
					vAutores = vAutores + temp.substring((27*(x-1)), max) + "<br>";	}
				else {
					iRowCountTemp = iRowCountTemp + 1;
					vTempCampo2 = vTempCampo2 + temp.substring((27*(x-1)), max) + "<br>";	}
			}
			iRowMaxTemp = iRowMaxTemp >= iRowCountTemp ? iRowMaxTemp : iRowCountTemp ;
		}else{
			iRowsXCol = 1;
		}
		// Elemento que su contenido puede llevar a un salto de pagina
		
		String vNombre = oAnexo3V7.GetNombre(i)!=null?oAnexo3V7.GetNombre(i):"";
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
					vTempCampo3 = vTempCampo3 + temp.substring((27*(x-1)), max) + "<br>";	}
			}
			iRowMaxTemp = iRowMaxTemp >= iRowCountTemp ? iRowMaxTemp : iRowCountTemp ;
		}else{
			iRowsXCol = 1;
		}
		// Elemento que su contenido puede llevar a un salto de pagina
		
		String vDepartamento = oAnexo3V7.GetDepartamento(i)!=null?oAnexo3V7.GetDepartamento(i):"";
		// Elemento que su contenido puede llevar a un salto de pagina
		iLenCol = vDepartamento.length();
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
			String temp = vDepartamento;
			vDepartamento = "";
			iRowCountTemp = 0 ;
			for(int x=1;x<=(iRowsXCol);x++){
				int max = (27*x)<=iLenCol ? (27*x) : iLenCol;
				if( (x + iRowsAnt) <= iMaxRowXPag) {
					vDepartamento = vDepartamento + temp.substring((27*(x-1)), max) + "<br>";	}
				else {
					iRowCountTemp = iRowCountTemp + 1;
					vTempCampo4 = vTempCampo4 + temp.substring((27*(x-1)), max) + "<br>";	}
			}
			iRowMaxTemp = iRowMaxTemp >= iRowCountTemp ? iRowMaxTemp : iRowCountTemp ;
		}else{
			iRowsXCol = 1;
		}
		// Elemento que su contenido puede llevar a un salto de pagina
		
		//String vDesTipo = oAnexo3V7.GetDesTipo(oAnexo3V7.GetTipoPos(oAnexo3V7.GetTipo(i)));
		String vDesTipo = "";
		try{
			vDesTipo = oAnexo3V7.GetDesTipo(oAnexo3V7.GetTipoPos(oAnexo3V7.GetTipo(i)));
		}catch(Throwable e){
			System.out.println("fAnexo3v7.GetTipo: " + e + " " + oAnexo3V7.GetTipo(i)); 
			vDesTipo = oAnexo3V7.GetTipo(i);
		}
		
			intContador = intContador + 1;
			if (intContador%2 == 0){	sBackColor = "#ffffff";	}
			else{						sBackColor = "#dddddd"; }
		 %>
		<TR valign="top" align="left" bgcolor="<%=sBackColor%>");">
			<TD class="ContenidoImprL"><%=vTitulo%></TD>
			<TD class="ContenidoImpr" align="center"><%=vFecha%></TD>
			<TD class="ContenidoImpr"><%=vAutores%></TD>
			<TD class="ContenidoImpr"><%=vNombre%></TD>
			<TD class="ContenidoImpr"><%=vDepartamento%></TD>
			<TD class="ContenidoImprR" width="150"><%=vDesTipo%></TD>
		</TR><%
		if ( (!vTempCampo1.equals("") || !vTempCampo2.equals("") || !vTempCampo3.equals("") || !vTempCampo4.equals("")) 
		|| iRowsCount>=iMaxRowXPag ){
		%>
		<tr><td colspan="6" class="ContenidoImprB">&nbsp;</td></tr>
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
	<TR><TD class="TituloParrafoImpr">RELACIÓN DE LIBROS, PUBLICACIONES, MATERIAL BIBLIOGRÁFICO E INFORMATIVO</TD></TR>  
	</TABLE>
	<TABLE cellPadding="0" cellSpacing="0" width="100%" BORDER="1" BORDERCOLOR="white">
		<TR align="center">
			<td width="150" class="TituloMenuImpr" rowspan="2">TITULO</TD>
			<td width="100" class="TituloMenuImpr" rowspan="2">FECHA DE<BR>EDICIÓN O<BR>ELABORACIÓN</TD>
			<td width="200" class="TituloMenuImpr" rowspan="2">AUTOR(ES) Y EDITORIAL<BR>(RESPONSABLE DE ELABO-<BR>RACIÓN O PUBLICACIÓN)</TD>
			<td class="TituloMenuImpr" colspan="2">RESPONSABLE DE LA CUSTODIA</TD>
			<td width="150" class="TituloMenuImpr" rowspan="2">Tipo</TD>
		</TR>
		<TR align="center">
			<td width="150" class="TituloMenuImpr">NOMBRE</td>
			<td width="150" class="TituloMenuImpr">DEPARTAMENTO</td>
		</TR>
		<%if (!vTempCampo1.equals("") || !vTempCampo2.equals("") || !vTempCampo3.equals("") || !vTempCampo4.equals("")){
				if (vTempCampo2.equals("")) vTempCampo2 = "&nbsp;";
				if (vTempCampo3.equals("")) vTempCampo3 = "&nbsp;";
				if (vTempCampo4.equals("")) vTempCampo4 = "&nbsp;";%>
		<TR valign="top" align="left" bgcolor="<%=sBackColor%>");">
			<TD class="ContenidoImprL">&nbsp;<%=vTempCampo1%></TD>
			<TD class="ContenidoImpr" align="center">&nbsp;</TD>
			<TD class="ContenidoImpr"><%=vTempCampo2%></TD>
			<TD class="ContenidoImpr"><%=vTempCampo3%></TD>
			<TD class="ContenidoImpr"><%=vTempCampo4%></TD>
			<TD class="ContenidoImprR" width="150">&nbsp;</TD>
		</TR>
<%
			}
		}
			iRowsCount = iRowsCount>=iMaxRowXPag?iRowMaxTemp:iRowsCount;
			
		} // FIN DEL FOR
//Si existe la paginacion debera repetir esto
		%>
		<tr><td colspan="6" class="ContenidoImprB">&nbsp;</td></tr>
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