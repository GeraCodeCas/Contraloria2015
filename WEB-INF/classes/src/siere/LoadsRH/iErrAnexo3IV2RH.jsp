<%@page import="com.consiss.util.tools.*"%>
<%@page import="com.gob.*"%>
<%@page import="java.util.*" %>
<%
/********************************************************************************************************
'Elaboro:	Jesus Limon
'Lugar:		Monterrey, NL
'Puesto:		22.Ene.2003
'Compañia:	CONSISS
'Ultima Modificacion:
'By:
'
'Distintas opciones:
'
'********************************************************************************************************/
%>
<%
//Valida la permanencia del usuario en session
if ((String)session.getValue("ok")!="ConsissRH")	response.sendRedirect("../Operation/Error.html");

String sUsuario =  (String)session.getValue("sUsuario") != null ? (String)session.getValue("sUsuario") : "";
ErrAnexo3IV2 oAnexo	= new ErrAnexo3IV2();
String sPath = "../";
%>
<html>
<head>
	<title>Entrega - Recepción : Anexo III.4.2 (Errores en Carga Masiva, Impresión)</title>
<link rel="stylesheet" type="text/css" href="<%=sPath%>Styles/Gobierno.css">
<script language="JavaScript" src="<%=sPath%>Scripts/Gobierno.js"></script>
<script language="JavaScript" src="<%=sPath%>Scripts/Libreria.js"></script>
<script language="JavaScript">
	function cancel(){
		document.forma.sCodigo.value = 0;
		document.forma.sOpcion.value = 'NORMAL';
		document.forma.submit();
	}
</script>
<SCRIPT LANGUAGE="javascript">
var da = (document.all) ? 1 : 0;
var pr = (window.print) ? 1 : 0;
var mac = (navigator.userAgent.indexOf("Mac") != -1); 

function Imprimir() {
	if (pr){/* NS4, IE5 */
		window.print();
	}else if (da && !mac){ /* IE4 (Windows) */
		print();
	}else /* other browsers */
		alert("Lo siento, su browser no permite esta accion.");
}

function print(){
	var WebBrowser = '<OBJECT ID="WebBrowser1"  WIDTH=0 HEIGHT=0 CLASSID="CLSID:8856F961-340A-11D0-A96B-00C04FD705A2"></OBJECT>';
	this.document.body.insertAdjacentHTML('afterBegin', WebBrowser); 
	this.focus();
	printVB();
	WebBrowser1.outerHTML = '';
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
</head>
<body topmargin="2" leftmargin="2" onLoad="javascript:Imprimir();">
<%@include file="..\Operation\HeaderAvance.jsp"%>
<!-- Encabezado -->
<table border="0" cellspacing="0" cellpadding="0" width="100%">
<tr>
	<td valign="top">
	<TABLE align=center border=0 cellPadding=0 cellSpacing=0 width="100%">
		<TR>
			<TD class="TituloParrafo" width="70%">&nbsp;&nbsp;ERRORES DEL ANEXO III.4.2 - CARGA MASIVA&nbsp;&nbsp;</TD>
		</TR>
	</TABLE>		
	<TABLE cellPadding="0" cellSpacing="0" width="100%" BORDER="1" BORDERCOLOR="white">
		<TR align="middle">
			<td class="TituloMenu" rowspan="2">Nómina</TD>
			<td class="TituloMenu" rowspan="2">Nombre</TD>
			<td class="TituloMenu" rowspan="2">Situación</TD>
			<td class="TituloMenu" colspan="2">Comisión</TD>
			<td class="TituloMenu" colspan="2">Período</TD>
			<td class="TituloMenu" rowspan="2">Observaciones</TD>
			<td class="TituloMenu" rowspan="2">Tipo Nómina</TD>
			<td class="TituloMenu" rowspan="2">Unidad Administrativa</TD>
			<td class="TituloMenu" rowspan="2">Descripción del Error</TD>
		</TR>
		<TR align="middle">
			<td class="TituloMenu">De</TD>
			<td class="TituloMenu">A</TD>
			<td class="TituloMenu">De</TD>
			<td class="TituloMenu">A</TD>
		</TR><%
		int intContador = 0;
		String sBackColor = "";
		for(int i=0;i<oAnexo.GetAll(sUsuario);i++){
			String 	sNomina			= oAnexo.GetNomina(i)!=null?oAnexo.GetNomina(i)+"":"";
			String 	sNombre			= oAnexo.GetNombre(i)!=null?oAnexo.GetNombre(i)+"":"";
			String 	sSituacion 		= oAnexo.GetSituacion(i)!=null?oAnexo.GetSituacion(i):"";
			String 	sComisionadoDE	= oAnexo.GetComisionadoDE(i)!=null?oAnexo.GetComisionadoDE(i)+"":"";
			String 	sComisionadoA	= oAnexo.GetComisionadoA(i)!=null?oAnexo.GetComisionadoA(i):"";
			String 	sPeriodoDE 		= oAnexo.GetPeriodoDE(i)!=null?oAnexo.GetPeriodoDE(i):"";
			String 	sPeriodoA 		= oAnexo.GetPeriodoA(i)!=null?oAnexo.GetPeriodoA(i):"";
			String 	sObservacion 	= oAnexo.GetObservacion(i)!=null?oAnexo.GetObservacion(i):"";
			String 	sDescripcion 	= oAnexo.GetDescripcion(i)!=null?oAnexo.GetDescripcion(i):"";
			String 	sClaveTipoNomina= oAnexo.GetClaveTipoNomina(i)!=null?oAnexo.GetClaveTipoNomina(i):"";
			String 	sIdUAdministrativa= oAnexo.GetIdUAdministrativa(i)!=null?oAnexo.GetIdUAdministrativa(i):"";

			intContador = intContador + 1;
			if(intContador%2 == 0)	{sBackColor = "#ffffff";}
			else					{sBackColor = "#eeeeee";}%>
		<TR align="left" bgcolor="<%=sBackColor%>" onMouseOver = "MouseDentro(this);this.style.cursor='hand';" onMouseOut="MouseFuera(this,'<%=sBackColor%>');" style="cursor:normal">
			<TD>&nbsp;<%=sNomina%></TD>
			<TD>&nbsp;<%=sNombre%></TD>
			<TD align="center"><%=sSituacion%></TD>
			<TD>&nbsp;<%=sComisionadoDE%></TD>
			<TD>&nbsp;<%=sComisionadoA%></TD>
			<TD>&nbsp;<%=sPeriodoDE%></TD>
			<TD>&nbsp;<%=sPeriodoA%></TD>
			<TD>&nbsp;<%=sObservacion%></TD>
			<TD>&nbsp;<%=sClaveTipoNomina%></TD>
			<TD>&nbsp;<%=sIdUAdministrativa%></TD>
			<TD>&nbsp;<%=sDescripcion%></TD>
		</TR><%
		}%>
	</TABLE>
</td>
</tr>
</table>
</body>
</html>
