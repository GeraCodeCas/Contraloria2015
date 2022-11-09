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
if ((String)session.getValue("ok")!="Consiss")
			response.sendRedirect("Error.html");

int iIdFuncionario =  java.lang.Integer.parseInt(
			(request.getParameter("iIdFuncionario")!= null?request.getParameter("iIdFuncionario"):"0") );

String sAnexo = "III.1";
Anexo3I oAnexo3I 	= new Anexo3I();

int iIdAnexo = oAnexo3I.GetIdAnexo();
String sPath = "../";

AnexoEstatus	oAnexoEstatus		= new AnexoEstatus();
oAnexoEstatus.Get(iIdFuncionario, iIdAnexo);
String sEstatus = oAnexoEstatus.GetEstatus();
int numpag =0;
int numtot = 0;
%>
<html>
<head>
	<title>Entrega - Recepción : Anexo III.1 (Impresión)</title>
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
<TABLE align=center border=0 cellPadding=0 cellSpacing=0 width="900">
		<TR>
			<TD  colspan="3" class="TituloParrafoImpr" width="900">ESTRUCTURA ORGANIZACIONAL</TD>
		</TR>
		<TR>
</TABLE>	
<%if(!sEstatus.equals("0")){// STATUS DE ANEXO %>
	<TABLE align="center" cellPadding="0" cellSpacing="0" width="900" BORDER="1" BORDERCOLOR="White">
		<TR>
			<TD width="900" class="TituloMenuImpr" align="center">Estructura Organizacional</TD>
		</TR>
<%
oAnexo3I.Get(iIdFuncionario);
		  // Variables para Paginacion
			int iLenCol = 0;
			int iRowsMax = 0; // POR REGISTRO
			int iRowsXCol = 0;
			int iRowsCount = 0;
			int iRowsAnt = 0; //posicion anterior
			int iMaxRowXPag = 25; //Numero de Renglones por Pagina
			String vTempCampo1 = "";
			// Variables para Paginacion
			int iRowMaxTemp = 1;
			int iRowCountTemp = 0;
		
	    String vEstructuraOrganizacional 			= oAnexo3I.GetEstructuraOrganizacional()!=null?oAnexo3I.GetEstructuraOrganizacional():"";
		  
			//Primer Elemento que su contenido puede llevar a un salto de pagina
			iLenCol = vEstructuraOrganizacional.length();
			iRowsXCol = 1;
			
			if(iLenCol > 130){
				if(iLenCol%130 == 0){
					iRowsXCol = iLenCol/130;
				}else{
					iRowsXCol = (iLenCol/130)+1;
				}
				
				String temp = vEstructuraOrganizacional;
				vEstructuraOrganizacional = "";
				iRowCountTemp = 0 ;
				for(int x=1;x<=(iRowsXCol);x++){
					int max = (130*x)<=iLenCol ? (130*x) : iLenCol;
					if( (x + iRowsAnt) <= iMaxRowXPag) {
						vEstructuraOrganizacional = vEstructuraOrganizacional + temp.substring((130*(x-1)), max) + "<br>";
						}
					else {
						iRowCountTemp = iRowCountTemp + 1;
						vTempCampo1 = vTempCampo1 + temp.substring((130*(x-1)), max) + "<br>";
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
%>
		<TR>
  			<TD width="900" class="ContenidoImpr1Col"><%=vEstructuraOrganizacional%></TD>
		</TR>
		<%
		//Si existe la paginacion debera repetir esto		
		if (!vTempCampo1.equals("")	|| iRowsCount>=iMaxRowXPag ){
		%>
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
	<TABLE align=center border=0 cellPadding=0 cellSpacing=0 width="900">
		<TR>
			<TD  colspan="3" class="TituloParrafoImpr" width="900">ESTRUCTURA ORGANIZACIONAL</TD>
		</TR>
		<TR>
</TABLE>
	<TABLE align="center" cellPadding="0" cellSpacing="0" width="900" BORDER="1" BORDERCOLOR="White">
		<TR>
			<TD class="TituloMenuImpr" width="900" align="center">Estructura Organizacional</TD>
		</TR>
	<%if (!vTempCampo1.equals("")){%>
	<TR>
	<TD valign="top" width="900" class="ContenidoImpr1Col"><%=vTempCampo1%></TD>
	</TR>
	<%
			}
		}
			iRowsCount = iRowsCount>=iMaxRowXPag?iRowMaxTemp:iRowsCount;
//Si existe la paginacion debera repetir esto		
		%>
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
	<TABLE width="100%">
		<TR>
			<TD align="center"><H1 style="size=+2"><br>ESTE ANEXO NO APLICA</H1></TD>
		</TR>
	</TABLE>
<br>
<%@include file="FooterAnexo.jsp"%>	
<%
}
%>	
</td>	<!-- Contenido -->
</tr>
</table>

</body>
</html>
