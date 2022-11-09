<%@page import="com.consiss.util.tools.*"%>
<%@page import="com.gob.*"%>
<%@page import="java.util.*" %>
<%
/********************************************************************************************************
'Elaboro:	Enrique Martinez
'Lugar:		Monterrey, NL
'Puesto:		22.Abr.2003
'Compañia:	CONSISS
'Distintas opciones:
'
'********************************************************************************************************/
%>
<%
//Valida la permanencia del usuario en session
int iIdFuncionario =  java.lang.Integer.parseInt( request.getParameter("sIdFuncionario") != null ? request.getParameter("sIdFuncionario") : "0");
ErrAnexo2IV2 oAnexo	= new ErrAnexo2IV2();
String sPath = "../";
%>
<html>
<head>
	<title>Entrega - Recepción : Anexo II.4.2 (Errores en Carga Masiva)</title>
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
<FORM action="fErrAnexo2IV2.jsp" name="forma" method="post" >
	<TABLE align=center border=0 cellPadding=0 cellSpacing=0 width="100%">
		<TR>
			<TD class="TituloParrafo" width="70%">&nbsp;&nbsp;ERRORES DEL ANEXO II.4.2 - CARGA MASIVA&nbsp;&nbsp;</TD>
		</TR>
	</TABLE>		
	<TABLE cellPadding="0" cellSpacing="0" width="100%" BORDER="1" BORDERCOLOR="white">
		<TR align="middle">
			<td class="TituloMenu">&nbsp;</td>
			<td class="TituloMenu">Fecha</TD>
			<td class="TituloMenu">Número de Cuenta</TD>
			<td class="TituloMenu">Banco</TD>
			<td class="TituloMenu">Beneficiario</TD>
			<td class="TituloMenu">Número de Cheque</TD>
			<td class="TituloMenu">Importe</TD>
			<td class="TituloMenu">Descripcion del Error</TD>
		</TR>
<%
		int intContador = 0;
		String sBackColor = "";
		oAnexo.GetAll(iIdFuncionario);
		for(int i=0;i<oAnexo.GetAll(iIdFuncionario);i++){
			String 	sFecha 		= oAnexo.GetFecha(i)!=null?oAnexo.GetFecha(i):"";
			String 	sCuenta		= oAnexo.GetCuenta(i)!=null?oAnexo.GetCuenta(i)+"":"";
			String 	sBanco	= oAnexo.GetBanco(i)!=null?oAnexo.GetBanco(i):"";
			String 	sBeneficiario= oAnexo.GetBeneficiario(i)!=null?oAnexo.GetBeneficiario(i):"";
			String 	sNoCheque 	= oAnexo.GetNoCheque(i)!=null?oAnexo.GetNoCheque(i):"";
			String 	sImporte 	= oAnexo.GetImporte(i)!=null?oAnexo.GetImporte(i):"";
			String 	sDescrErr 	= oAnexo.GetDescrErr(i)!=null?oAnexo.GetDescrErr(i):"";
			intContador = intContador + 1;
			if(intContador%2 == 0){sBackColor = "#ffffff";}
			else{sBackColor = "#eeeeee";}%>
		<TR align="left" bgcolor="<%=sBackColor%>" onMouseOver = "MouseDentro(this);" onMouseOut  = "MouseFuera(this,'<%=sBackColor%>');">
			<td>&nbsp;</td>
			<TD>&nbsp;<%=sFecha%></TD>
			<TD>&nbsp;<%=sCuenta%></TD>
			<TD>&nbsp;<%=sBanco%></TD>
			<TD>&nbsp;<%=sBeneficiario%></TD>
			<TD>&nbsp;<%=sNoCheque%></TD>
			<TD align="right"><%=sImporte%></TD>
			<TD>&nbsp;<%=sDescrErr%></TD>
		</TR><%
		}
%>
	</TABLE>
</FORM>
</td>
</tr>
</table>
<%@include file="Footer.jsp"%>
</body>
</html>
