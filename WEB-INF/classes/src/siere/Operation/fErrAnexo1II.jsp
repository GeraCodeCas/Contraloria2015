<%@page import="com.consiss.util.tools.*"%>
<%@page import="com.gob.*"%>
<%@page import="java.util.*" %>
<%
/********************************************************************************************************
'Elaboro:	Enrique Martinez
'Lugar:		Monterrey, NL
'Puesto:		21.Abr.2003
'Compañia:	CONSISS
'Ultima Modificacion:
'By:
'
'********************************************************************************************************/
%>
<%
//Valida la permanencia del usuario en session
int iIdFuncionario =  java.lang.Integer.parseInt( request.getParameter("sIdFuncionario") != null ? request.getParameter("sIdFuncionario") : "0");
ErrAnexo1II oAnexo	= new ErrAnexo1II();
String sPath = "../";
%>
<html>
<head>
	<title>Entrega - Recepción : Anexo I.2 (Errores en Carga Masiva)</title>
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
<FORM action="fErrAnexo1II.jsp" name="forma" method="post" >
	<TABLE align=center border=0 cellPadding=0 cellSpacing=0 width="100%">
		<TR>
			<TD class="TituloParrafo" width="70%">&nbsp;&nbsp;ERRORES DEL ANEXO I.2 - CARGA MASIVA&nbsp;&nbsp;</TD>
		</TR>
	</TABLE>		
	<TABLE cellPadding="0" cellSpacing="0" width="100%" BORDER="1" BORDERCOLOR="white">
		<TR align="middle">
			<td class="TituloMenu">TIPO</TD>
			<td class="TituloMenu">NO.</TD>
			<td class="TituloMenu">FECHA DE SUSCRIPCIÓN</TD>
			<td class="TituloMenu">DURACIÓN</TD>
			<td class="TituloMenu">DESCRIPCIÓN</TD>
			<td class="TituloMenu">IMPORTE TOTAL</TD>
			<td class="TituloMenu">ENTIDAD CON QUIEN SUSCRIBE</TD>
			<td class="TituloMenu">OBSERVACIONES</TD>
			<td class="TituloMenu">DESCRIPCIÓN DEL ERROR</TD>
		</TR><%
		int intContador = 0;
		String sBackColor = "";
		oAnexo.GetAll(iIdFuncionario);
		for(int i=0;i<oAnexo.GetAll(iIdFuncionario);i++){
			String 	sTipo 		= oAnexo.GetTipo(i)!=null?oAnexo.GetTipo(i):"";
			String 	sNumero		= oAnexo.GetNumero(i)!=null?oAnexo.GetNumero(i)+"":"";
			String 	sFecha 		= oAnexo.GetFecha(i)!=null?oAnexo.GetFecha(i):"";
			String 	sDuracion	= oAnexo.GetDuracion(i)!=null?oAnexo.GetDuracion(i)+"":"";
			String 	sDescripcion= oAnexo.GetDescripcion(i)!=null?oAnexo.GetDescripcion(i):"";
			String 	sImporte 	= oAnexo.GetImporte(i)!=null?oAnexo.GetImporte(i):"";
			String 	sEntidad 	= oAnexo.GetEntidad(i)!=null?oAnexo.GetEntidad(i):"";
			String 	sObservacion= oAnexo.GetObservacion(i)!=null?oAnexo.GetObservacion(i):"";
			String sDescrErr 	= oAnexo.GetDescrErr(i)!=null?oAnexo.GetDescrErr(i):"";
			intContador = intContador + 1;
			if(intContador%2 == 0){	sBackColor = "#ffffff";	}
			else{sBackColor = "#eeeeee";}%>
		<TR align="left" bgcolor="<%=sBackColor%>" onMouseOver = "MouseDentro(this);" onMouseOut  = "MouseFuera(this,'<%=sBackColor%>');">
			<TD>&nbsp;<%=sTipo%></TD>
			<TD>&nbsp;<%=sNumero%></TD>
			<TD >&nbsp;<%=sFecha%></TD>
			<TD>&nbsp;<%=sDuracion%></TD>
			<TD>&nbsp;<%=sDescripcion%></TD>
			<TD align="right"><%=sImporte%></TD>
			<TD>&nbsp;<%=sEntidad%></TD>
			<TD>&nbsp;<%=sObservacion%></TD>
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
