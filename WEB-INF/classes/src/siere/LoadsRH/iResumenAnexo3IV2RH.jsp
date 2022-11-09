<%@page import="com.consiss.util.tools.*"%>
<%@page import="com.gob.*"%>
<%@page import="java.util.*" %>
<%
/********************************************************************************************************
'Elaboro:	Claudia Sandoval
'Lugar:		Monterrey, NL
'Puesto:	14.Jul.2003
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
			<TD class="TituloParrafo" width="70%">&nbsp;&nbsp;RESUMEN DE CARGA DEL ANEXO III.4.2&nbsp;&nbsp;</TD>
		</TR>
	</TABLE>		
	<TABLE cellPadding="0" cellSpacing="0" width="100%" BORDER="1" BORDERCOLOR="white">
		<TR align="middle">           
			<td class="TituloMenu">Dependencia</TD>
			<td class="TituloMenu">Unidad Administrativa</TD>
			<td class="TituloMenu">Id</TD>
			<td class="TituloMenu">Registros Exitosos</TD>
			<td class="TituloMenu">Registros Con Errores</TD>
		</TR><%
		int intContador = 0;
		String sBackColor = "";
		UnidadGobierno oUnidadGobierno = new UnidadGobierno();
		oUnidadGobierno.GetAll();
		UnidadAdministrativa oUnidadAdministrativa = new UnidadAdministrativa();
		oUnidadAdministrativa.GetAll();
		int iRegistrosACargar = 0, iRegistrosError = 0;
		for(int i=0;i<oAnexo.GetResumen(sUsuario);i++){
			String 	sIdUnidadGobierno	= oAnexo.GetRsmIdUnidadGobierno(i)!=null?oAnexo.GetRsmIdUnidadGobierno(i)+"":"0";
			String 	sIdUAdministrativa 	= oAnexo.GetRsmIdUAdministrativa(i)!=null?oAnexo.GetRsmIdUAdministrativa(i):"0";
			String 	sRegistrosACargar	= oAnexo.GetRsmRegACargar(i)!=null?oAnexo.GetRsmRegACargar(i)+"":"0";
			String 	sRegistrosError		= oAnexo.GetRsmRegError(i)!=null?oAnexo.GetRsmRegError(i):"0";
			intContador = intContador + 1;
			if(intContador%2 == 0){sBackColor = "#ffffff";}
			else{sBackColor = "#eeeeee";}
			iRegistrosACargar = iRegistrosACargar + java.lang.Integer.parseInt(sRegistrosACargar);
			iRegistrosError = iRegistrosError + java.lang.Integer.parseInt(sRegistrosError);
		<TR align="left" bgcolor="<%=sBackColor%>"  style="cursor:normal">
			<TD>&nbsp;<%=oUnidadGobierno.GetPos(java.lang.Integer.parseInt(sIdUnidadGobierno))>=0?oUnidadGobierno.GetNombre(oUnidadGobierno.GetPos(java.lang.Integer.parseInt(sIdUnidadGobierno))):"(Desconocida)"%></TD>
			<TD>&nbsp;<%=iPosUnidadAdministrativa>=0?(oUnidadAdministrativa.GetNombre(iPosUnidadAdministrativa)):"(Desconocida)"%>
			</TD>
			<TD>&nbsp;<%=sIdUAdministrativa%></TD>
			<TD align="right"><%=java.lang.Integer.parseInt(sRegistrosACargar) - java.lang.Integer.parseInt(sRegistrosError)%>&nbsp;</TD>
			<TD align="right"><%=sRegistrosError%>&nbsp;</TD>
		</TR><%
		}%>
		<TR>
			<TD colspan="3">&nbsp;</TD>
			<TD bgcolor="#dedede" align="right"><%=iRegistrosACargar - iRegistrosError%>&nbsp;</TD>
			<TD bgcolor="#dedede" align="right"><%=iRegistrosError%>&nbsp;</TD>
		</TR>
	</TABLE>
</td>
</tr>
</table>
</body>
</html>
