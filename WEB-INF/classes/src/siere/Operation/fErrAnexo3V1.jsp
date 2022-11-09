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
if ((String)session.getValue("ok")!="Consiss")	response.sendRedirect("Error.html");

int iIdFuncionario =  java.lang.Integer.parseInt((String)(session.getValue("iIdFuncionario")!= null?session.getValue("iIdFuncionario"):"0") );
ErrAnexo3V1 oAnexo	= new ErrAnexo3V1();
String sPath = "../";

%>
<html>
<head>
	<title>Entrega - Recepción : Anexo III.5.1 (Errores en Carga Masiva)</title>
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
<FORM action="fErrAnexo3V1.jsp" name="forma" method="post" >
	<TABLE align=center border=0 cellPadding=0 cellSpacing=0 width="100%">
		<TR>
			<TD class="TituloParrafo" width="70%">&nbsp;&nbsp;ERRORES DEL ANEXO III.5.1 - CARGA MASIVA&nbsp;&nbsp;</TD>
		</TR>
	</TABLE>		
	<TABLE cellPadding="0" cellSpacing="0" width="100%" BORDER="1" BORDERCOLOR="white">
		<TR align="middle">
			<td class="TituloMenu">No. DE INVENTARIO</TD>
			<td class="TituloMenu">DESCRIPCIÓN DEL ARTÍCULO</TD>
			<td class="TituloMenu">MARCA</TD>
			<td class="TituloMenu">MODELO</TD>
			<td class="TituloMenu">SERIE</TD>
			<td class="TituloMenu">VALOR</TD>
			<td class="TituloMenu">UBICACIÓN</TD>
			<td class="TituloMenu">RESGUARDANTE Y REFERENCIA DE RESGUARDO</TD>
			<td class="TituloMenu">TIPO</TD>
			<td class="TituloMenu">DSCRIPCIÓN DEL ERROR</TD>
		</TR>
<%
		int intContador = 0;
		String sBackColor = "";
		oAnexo.GetAll(iIdFuncionario);
		for(int i=0;i<oAnexo.GetAll(iIdFuncionario);i++){
			String 	sNoInventario	= oAnexo.GetNoInventario(i)!=null?	oAnexo.GetNoInventario(i):"";
			String 	sDescripcion	= oAnexo.GetDescripcion(i)!=null?	oAnexo.GetDescripcion(i):"";
			String 	sMarca 			= oAnexo.GetMarca(i)!=null?			oAnexo.GetMarca(i):"";
			String 	sModelo			= oAnexo.GetModelo(i)!=null?		oAnexo.GetModelo(i):"";
			String 	sSerie 			= oAnexo.GetSerie(i)!=null?			oAnexo.GetSerie(i):"";
			String 	sValor			= oAnexo.GetValor(i)!=null?			oAnexo.GetValor(i):"";
			String 	sUbicacion 		= oAnexo.GetUbicacion(i)!=null?		oAnexo.GetUbicacion(i):"";
			String 	sResguardante	= oAnexo.GetResguardante(i)!=null?	oAnexo.GetResguardante(i):"";
			String 	sTipo 			= oAnexo.GetTipo(i)!=null?			oAnexo.GetTipo(i):"";
			String  sDescrError = oAnexo.GetDescrError(i)!=null?			oAnexo.GetDescrError(i):"";
			intContador = intContador + 1;
			if(intContador%2 == 0){	sBackColor = "#ffffff";	}
			else{				sBackColor = "#eeeeee";	}%>
		<TR align="left" bgcolor="<%=sBackColor%>" onMouseOver = "MouseDentro(this);" onMouseOut  = "MouseFuera(this,'<%=sBackColor%>');">
			<TD align="right"><%=sNoInventario%>&nbsp;</TD>
			<TD>&nbsp;<%=sDescripcion%></TD>
			<TD>&nbsp;<%=sMarca%></TD>
			<TD>&nbsp;<%=sModelo%></TD>
			<TD>&nbsp;<%=sSerie%></TD>
			<TD>&nbsp;<%=sValor%></TD>
			<TD>&nbsp;<%=sUbicacion%></TD>
			<TD>&nbsp;<%=sResguardante%></TD>
			<TD>&nbsp;<%=sTipo%></TD>
			<TD>&nbsp;<%=sDescrError%></TD>
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
