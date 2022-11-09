<%@page import="com.consiss.util.tools.*"%>
<%@page import="com.gob.*"%>
<%@page import="java.util.*" %>
<%
/********************************************************************************************************
'Elaboro:	Jesus Limon
'Lugar:		Monterrey, NL
'Fecha:		22.Ene.2003
'Compa�ia:	CONSISS
'Ultima Modificacion:
'By:
'
'Distintas opciones:
'
'********************************************************************************************************/
%>
<%
//Valida la permanencia del usuario en session
if ((String)session.getValue("ok")!="Consiss") response.sendRedirect("Error.html");

int iIdFuncionario =  java.lang.Integer.parseInt((String)(session.getValue("iIdFuncionario")!= null?session.getValue("iIdFuncionario"):"0") );
ErrAnexo3XVI oAnexo	= new ErrAnexo3XVI();
String sPath = "../";

%>
<html>
<head>
	<title>Entrega - Recepci�n : Anexo III.16 (Errores en Carga Masiva)</title>
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
<FORM action="fErrAnexo3XVI.jsp" name="forma" method="post" >
	<TABLE align=center border=0 cellPadding=0 cellSpacing=0 width="100%">
		<TR>
			<TD class="TituloParrafo" width="70%">&nbsp;&nbsp;ERRORES DEL ANEXO III.16 - CARGA MASIVA&nbsp;&nbsp;</TD>
		</TR>
	</TABLE>		
	<TABLE cellPadding="0" cellSpacing="0" width="100%" BORDER="1" BORDERCOLOR="white">
		<TR align="middle">
			<td class="TituloMenu">IDENTIFICACI�N</TD>
			<td class="TituloMenu">EXPEDIENTE</TD>
			<td class="TituloMenu">PER�ODO</TD>
			<td class="TituloMenu">UBICACI�N</TD>
			<td class="TituloMenu">DOCUMENTO</TD>
			<td class="TituloMenu">DESCRIPCI�N DEL ERROR</TD>
		</TR><%
		int intContador = 0;
		String sBackColor = "";
		oAnexo.GetAll(iIdFuncionario);
		for(int i=0;i<oAnexo.GetAll(iIdFuncionario);i++){
			String sIdentificacion=oAnexo.GetIdentificacion(i)!=null?oAnexo.GetIdentificacion(i)+"":"";
			String sExpediente	= oAnexo.GetExpediente(i)!=null?oAnexo.GetExpediente(i)+"":"";
			String sPeriodo		= oAnexo.GetPeriodo(i)!=null?oAnexo.GetPeriodo(i):"";
			String sUbicacion	= oAnexo.GetUbicacion(i)!=null?oAnexo.GetUbicacion(i):"";
			String sDocumento 	= oAnexo.GetDocumento(i)!=null?oAnexo.GetDocumento(i):"";
			String sDescripcion	= oAnexo.GetDescripcion(i)!=null?oAnexo.GetDescripcion(i):"";
			intContador = intContador + 1;
			if(intContador%2 == 0){ sBackColor = "#ffffff"; }
			else{sBackColor = "#eeeeee"; }%>
		<TR align="left" bgcolor="<%=sBackColor%>" onMouseOver = "MouseDentro(this);" onMouseOut  = "MouseFuera(this,'<%=sBackColor%>');">
			<TD>&nbsp;<%=sIdentificacion%></TD>
			<TD>&nbsp;<%=sExpediente%></TD>
			<TD>&nbsp;<%=sPeriodo%></TD>
			<TD>&nbsp;<%=sUbicacion%></TD>
			<TD>&nbsp;<%=sDocumento%></TD>
			<TD>&nbsp;<%=sDescripcion%></TD>
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
