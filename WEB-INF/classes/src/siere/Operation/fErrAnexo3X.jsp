<%@page import="com.consiss.util.tools.*"%>
<%@page import="com.gob.*"%>
<%@page import="java.util.*" %>
<%
/********************************************************************************************************
'Elaboro:	Sigifredo Vazquez
'Lugar:		Monterrey, NL
'Puesto:		30.Abril.2003
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
int iIdFuncionario =  java.lang.Integer.parseInt( request.getParameter("sIdFuncionario") != null ? request.getParameter("sIdFuncionario") : "0");
ErrAnexo3X oAnexo	= new ErrAnexo3X();
String sPath = "../";
%>
<html>
<head>
	<title>Entrega - Recepción : Anexo III.10 (Errores en Carga Masiva)</title>
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
<FORM action="fErrAnexo3X.jsp" name="forma" method="post" >
	<TABLE align=center border=0 cellPadding=0 cellSpacing=0 width="100%">
		<TR>
			<TD class="TituloParrafo" width="70%">&nbsp;&nbsp;ERRORES DEL ANEXO III.10 - CARGA MASIVA&nbsp;&nbsp;</TD>
		</TR>
	</TABLE>		
	<TABLE cellPadding="0" cellSpacing="0" width="100%" BORDER="1" BORDERCOLOR="white">
		<TR align="middle">
			<td class="TituloMenu" rowspan="2">Clave</TD>
			<td class="TituloMenu" rowspan="2">Programa<br>Subprograma<br>Obra Localización</TD>
			<td class="TituloMenu" rowspan="2">Contrato ó Admon.</TD>
			<td class="TituloMenu" rowspan="2">Monto Total Aprobado</TD>
			<td class="TituloMenu" rowspan="2">Monto Total Ejercido</TD>
			<td class="TituloMenu" colspan="2">Fecha</TD>
			<td class="TituloMenu" colspan="2">% Avance</TD>
			<td class="TituloMenu" rowspan="2">Observaciones</TD>	
			<td class="TituloMenu" rowspan="2">Tipo de Origen</TD>
			<td class="TituloMenu" rowspan="2">Descripción del Error</TD>
		</TR>
		<TR>
			<td class="TituloMenu" align="center">Inicio</TD>
			<td class="TituloMenu" align="center">Termino</TD>
			<td class="TituloMenu">Físico</TD>
			<td class="TituloMenu">Financ.</TD>
		</TR><%
		int intContador = 0;
		String sBackColor = "";
		oAnexo.GetAll(iIdFuncionario);
		for(int i=0;i<oAnexo.GetAll(iIdFuncionario);i++){
			String 	sClave				= oAnexo.GetClave(i)!=null?				oAnexo.GetClave(i)+"":"";
			String 	sPrograma 			= oAnexo.GetPrograma(i)!=null?			oAnexo.GetPrograma(i):"";
			String 	sTipo				= oAnexo.GetTipo(i)!=null?				oAnexo.GetTipo(i)+"":"";
			String 	sMontoAprobado		= oAnexo.GetMontoAprobado(i)!=null?		oAnexo.GetMontoAprobado(i):"";
			String 	sMontoEjercido		= oAnexo.GetMontoEjercido(i)!=null?		oAnexo.GetMontoEjercido(i):"";
			String 	sFechaInicial		= oAnexo.GetFechaInicial(i)!=null?		oAnexo.GetFechaInicial(i):"";
			String 	sFechaFinal			= oAnexo.GetFechaFinal(i)!=null?		oAnexo.GetFechaFinal(i):"";
			String 	sAvanceFisico		= oAnexo.GetAvanceFisico(i)!=null?		oAnexo.GetAvanceFisico(i):"";
			String 	sAvanceFinanciero	= oAnexo.GetAvanceFinanciero(i)!=null?	oAnexo.GetAvanceFinanciero(i):"";
			String 	sObservacion 		= oAnexo.GetObservacion(i)!=null?		oAnexo.GetObservacion(i):"";
			String 	sTipoOrigen			= oAnexo.GetTipoOrigen(i)!=null?		oAnexo.GetTipoOrigen(i):"";
			String 	sDescripcion 		= oAnexo.GetDescripcion(i)!=null?		oAnexo.GetDescripcion(i):"";
			intContador = intContador + 1;
			if(intContador%2 == 0){sBackColor = "#ffffff";}
			else{sBackColor = "#eeeeee";}%>
		<TR align="left" bgcolor="<%=sBackColor%>" onMouseOver = "MouseDentro(this);" onMouseOut  = "MouseFuera(this,'<%=sBackColor%>');">
			<TD>&nbsp;<%=sClave%></TD>
			<TD>&nbsp;<%=sPrograma%></TD>
			<TD>&nbsp;<%=sTipo%></TD>
			<TD>&nbsp;<%=sMontoAprobado%></TD>
			<TD>&nbsp;<%=sMontoEjercido%></TD>
			<TD>&nbsp;<%=sFechaInicial%></TD>
			<TD>&nbsp;<%=sFechaFinal%></TD>
			<TD>&nbsp;<%=sAvanceFisico%></TD>
			<TD>&nbsp;<%=sAvanceFinanciero%></TD>
			<TD>&nbsp;<%=sObservacion%></TD>
			<TD>&nbsp;<%=sTipoOrigen%></TD>
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
