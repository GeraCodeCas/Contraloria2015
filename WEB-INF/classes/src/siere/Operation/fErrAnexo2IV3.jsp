<%@page import="com.consiss.util.tools.*"%>
<%@page import="com.gob.*"%>
<%@page import="java.util.*" %>
<%
/********************************************************************************************************
'Elaboro:	Enrique Martinez
'Lugar:		Monterrey, NL
'Puesto:		12.May.2003
'Compañia:	CONSISS
'********************************************************************************************************/
%>
<%
//Valida la permanencia del usuario en session
int iIdFuncionario =  java.lang.Integer.parseInt( request.getParameter("sIdFuncionario") != null ? request.getParameter("sIdFuncionario") : "0");
ErrAnexo2IV3 oAnexo	= new ErrAnexo2IV3();
String sPath = "../";
%>
<html>
<head>
	<title>Entrega - Recepción : Anexo II.4.3 (Errores en Carga Masiva)</title>
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
<FORM action="fErrAnexo2IV3.jsp" name="forma" method="post" >
	<TABLE align=center border=0 cellPadding=0 cellSpacing=0 width="100%">
		<TR>
			<TD class="TituloParrafo" width="70%">&nbsp;&nbsp;ERRORES DEL ANEXO II.4.3 - CARGA MASIVA&nbsp;&nbsp;</TD>
		</TR>
	</TABLE>		
	<TABLE cellPadding="0" cellSpacing="0" width="100%" BORDER="1" BORDERCOLOR="white">
		<TR align="middle">
			<td class="TituloMenu">Fecha</TD>
			<td class="TituloMenu">Número de Cuenta</TD>
			<td class="TituloMenu">Nombre de la Institución</TD>
			<td class="TituloMenu">Tipo de Inversión</TD>
			<td class="TituloMenu">Vencimiento</TD>
			<td class="TituloMenu">Saldo en Libros</TD>
			<td class="TituloMenu">Descripción del Error</TD>
		</TR>
<%
		int intContador = 0;
		String sBackColor = "";
		oAnexo.GetAll(iIdFuncionario);
		for(int i=0;i<oAnexo.GetAll(iIdFuncionario);i++){
			String 	sFecha 		= oAnexo.GetFecha(i)!=null?oAnexo.GetFecha(i):"";
			String 	sCuenta		= oAnexo.GetCuenta(i)!=null?oAnexo.GetCuenta(i)+"":"";
			String 	sInstitucion= oAnexo.GetInstitucion(i)!=null?oAnexo.GetInstitucion(i):"";
			String 	sInversion 	= oAnexo.GetInversion(i)!=null?oAnexo.GetInversion(i):"";
			String 	sVencimiento= oAnexo.GetVencimiento(i)!=null?oAnexo.GetVencimiento(i):"";
			String 	sSaldo 		= oAnexo.GetSaldo(i)!=null?oAnexo.GetSaldo(i):"";
			String 	sDescripcion= oAnexo.GetDescripcion(i)!=null?oAnexo.GetDescripcion(i):"";
			intContador = intContador + 1;
			if(intContador%2 == 0){	sBackColor = "#ffffff";	}
			else{sBackColor = "#eeeeee";}%>
		<TR align="left" bgcolor="<%=sBackColor%>" onMouseOver = "MouseDentro(this);" onMouseOut  = "MouseFuera(this,'<%=sBackColor%>');">
			<TD>&nbsp;<%=sFecha%></TD>
			<TD>&nbsp;<%=sCuenta%></TD>
			<TD>&nbsp;<%=sInstitucion%></TD>
			<TD>&nbsp;<%=sInversion%></TD>
			<TD>&nbsp;<%=sVencimiento%></TD>
			<TD align="right"><%=sSaldo%>>&nbsp;</TD>
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
