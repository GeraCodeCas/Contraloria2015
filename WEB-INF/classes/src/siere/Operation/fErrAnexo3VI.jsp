<%@page import="com.consiss.util.tools.*"%>
<%@page import="com.gob.*"%>
<%@page import="java.util.*" %>
<%
/********************************************************************************************************
'Elaboro:	Sigifredo Vazquez
'Lugar:		Monterrey, NL
'Puesto:		22.Abril.2003
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
ErrAnexo3VI oAnexo	= new ErrAnexo3VI();
String sPath = "../";
%>
<html>
<head>
	<title>Entrega - Recepción : Anexo III.6 (Errores en Carga Masiva)</title>
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
<FORM action="fErrAnexo3VI.jsp" name="forma" method="post" >
	<TABLE align=center border=0 cellPadding=0 cellSpacing=0 width="100%">
		<TR>
			<TD class="TituloParrafo" width="70%">&nbsp;&nbsp;ERRORES DEL ANEXO III.6 - CARGA MASIVA&nbsp;&nbsp;</TD>
		</TR>
	</TABLE>		
	<TABLE cellPadding="0" cellSpacing="0" width="100%" BORDER="1" BORDERCOLOR="white">
		<TR align="middle">
			<td class="TituloMenu">NO NOMBRE </TD>
			<td class="TituloMenu">UNIDAD</TD>
			<td class="TituloMenu">PRECIO UNITARIO</TD>
			<td class="TituloMenu">EXISTENCIA</TD>
			<td class="TituloMenu">IMPORTE</TD>
			<td class="TituloMenu">OBSERVACION</TD>
			<td class="TituloMenu">DESCRIPCIÓN DEL ERROR</TD>
		</TR><%
		int intContador = 0;
		String sBackColor = "";
		oAnexo.GetAll(iIdFuncionario);
		for(int i=0;i<oAnexo.GetAll(iIdFuncionario);i++){
			String 	sNoNombre		= oAnexo.GetNoNombre(i)!=null?oAnexo.GetNoNombre(i)+"":"";
			String 	sUnidad 		= oAnexo.GetUnidad(i)!=null?oAnexo.GetUnidad(i):"";
			String 	sPrecioUnitario	= oAnexo.GetPrecioUnitario(i)!=null?oAnexo.GetPrecioUnitario(i)+"":"";
			String 	sExistencia		= oAnexo.GetExistencia(i)!=null?oAnexo.GetExistencia(i):"";
			String 	sImporte 		= oAnexo.GetImporte(i)!=null?oAnexo.GetImporte(i):"";
			String 	sObservacion 	= oAnexo.GetObservacion(i)!=null?oAnexo.GetObservacion(i):"";
			String 	sDescripcion 	= oAnexo.GetDescripcion(i)!=null?oAnexo.GetDescripcion(i):"";
			intContador = intContador + 1;
			if(intContador%2 == 0){sBackColor = "#ffffff";}
			else{sBackColor = "#eeeeee";}%>
		<TR align="left" bgcolor="<%=sBackColor%>" onMouseOver = "MouseDentro(this);" onMouseOut  = "MouseFuera(this,'<%=sBackColor%>');">
			<TD>&nbsp;<%=sNoNombre%></TD>
			<TD>&nbsp;<%=sUnidad%></TD>
			<TD>&nbsp;<%=sPrecioUnitario%></TD>
			<TD>&nbsp;<%=sExistencia%></TD>
			<TD>&nbsp;<%=sImporte%></TD>
			<TD>&nbsp;<%=sObservacion%></TD>
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
