<%@page import="com.consiss.util.tools.*"%>
<%@page import="com.gob.*"%>
<%@page import="java.util.*" %>
<%
/********************************************************************************************************
'Elaboro:	Enrique Martinez
'Lugar:		Monterrey, NL
'Fecha:		23.Abr.2003
'Compañia:	CONSISS
'********************************************************************************************************/
%>
<%
//Valida la permanencia del usuario en session
if ((String)session.getValue("ok")!="Consiss") response.sendRedirect("Error.html");

int iIdFuncionario =  java.lang.Integer.parseInt((String)(session.getValue("iIdFuncionario")!= null?session.getValue("iIdFuncionario"):"0") );
ErrAnexo3XVII oAnexo	= new ErrAnexo3XVII();
String sPath = "../";

%>
<html>
<head>
	<title>Entrega - Recepción : Anexo III.17 (Errores en Carga Masiva)</title>
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
</head>
<body topmargin="0" leftmargin="0">
<table border="0" cellspacing="0" cellpadding="0" width="100%">
	<tr>
		<td colspan="2"><%@include file="Header.jsp"%></td>
	</tr>
<tr>
	<!-- Menu -->
	<!-- Menu -->
	<!-- Contenido -->
	<td valign="top">
<FORM action="fErrAnexo3XVII.jsp" name="forma" method="post" >
	<TABLE align=center border=0 cellPadding=0 cellSpacing=0 width="100%">
		<TR>
			<TD class="TituloParrafo" width="70%">&nbsp;&nbsp;ERRORES DEL ANEXO III.17 - CARGA MASIVA&nbsp;&nbsp;</TD>
		</TR>
	</TABLE>		
	<TABLE cellPadding="0" cellSpacing="0" width="100%" BORDER="1" BORDERCOLOR="white">
		<TR align="middle">
			<td class="TituloMenu" colspan="2">&nbsp;</td>
			<td class="TituloMenu">Número de Expediente</TD>
			<td class="TituloMenu">Nombre del Asunto</TD>
			<td class="TituloMenu">Fecha de Inicio</TD>
			<td class="TituloMenu">Situación del Trámite</TD>
			<td class="TituloMenu">Fecha Probable de Solución</TD>
		</TR><%
		int intContador = 0;
		String sBackColor = "";
		oAnexo.GetAll(iIdFuncionario);
		for(int i=0;i<oAnexo.GetAll(iIdFuncionario);i++){
			String sExpediente=oAnexo.GetExpediente(i)!=null?oAnexo.GetExpediente(i)+"":"";
			String sAsunto 	= oAnexo.GetAsunto(i)!=null?oAnexo.GetAsunto(i):"";
			String sFechaIni= oAnexo.GetFechaIni(i)!=null?oAnexo.GetFechaIni(i):"";
			String sSituacion=oAnexo.GetSituacion(i)!=null?oAnexo.GetSituacion(i):"";
			String sFechaFin= oAnexo.GetFechaFin(i)!=null?oAnexo.GetFechaFin(i):"";
			String sDescrErr= oAnexo.GetDescrErr(i)!=null?oAnexo.GetDescrErr(i):"";
			intContador = intContador + 1;
			if(intContador%2 == 0){sBackColor = "#ffffff";}
			else{sBackColor = "#eeeeee";}%>
		<TR align="left" bgcolor="<%=sBackColor%>" onMouseOver = "MouseDentro(this);" onMouseOut  = "MouseFuera(this,'<%=sBackColor%>');">
			<TD>&nbsp;<%=sExpediente%></TD>
			<TD>&nbsp;<%=sAsunto%></TD>
			<TD>&nbsp;<%=sFechaIni%></TD>
			<TD>&nbsp;<%=sSituacion%></TD>
			<TD>&nbsp;<%=sFechaFin%></TD>
			<TD>&nbsp;<%=sDescrErr%></TD>
		</TR><%
		}%>
	</TABLE>
</FORM>
</td>
</tr>
</table>
<%@include file="Footer.jsp"%>
</body>
</html>
