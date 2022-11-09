<%@page import="com.consiss.util.tools.*"%>
<%@page import="com.gob.*"%>
<%@page import="java.util.*" %>
<%
/********************************************************************************************************
'Elaboro:	Jesus Limon
'Lugar:		Monterrey, NL
'Fecha:		22.Ene.2003
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
if ((String)session.getValue("ok")!="Consiss") response.sendRedirect("Error.html");

int iIdFuncionario =  java.lang.Integer.parseInt((String)(session.getValue("iIdFuncionario")!= null?session.getValue("iIdFuncionario"):"0") );
ErrAnexo3V4 oAnexo	= new ErrAnexo3V4();
String sPath = "../";

%>
<html>
<head>
	<title>Entrega - Recepción : Anexo III.5.4 (Errores en Carga Masiva)</title>
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
<FORM action="fErrAnexo3V4.jsp" name="forma" method="post" >
	<TABLE align=center border=0 cellPadding=0 cellSpacing=0 width="100%">
		<TR>
			<TD class="TituloParrafo" width="70%">&nbsp;&nbsp;ERRORES DEL ANEXO III.5.4 - CARGA MASIVA&nbsp;&nbsp;</TD>
		</TR>
	</TABLE>		
	<TABLE cellPadding="0" cellSpacing="0" width="100%" BORDER="1" BORDERCOLOR="white">
		<TR align="middle">
			<td class="TituloMenu">No. DE INVENTARIO</TD>
			<td class="TituloMenu">No. ECONÓMICO</TD>
			<td class="TituloMenu">MARCA</TD>
			<td class="TituloMenu">MODELO</TD>
			<td class="TituloMenu">COLOR</TD>
			<td class="TituloMenu">PLACAS</TD>
			<td class="TituloMenu">TIPO</TD>
			<td class="TituloMenu">SERIE MOTOR</TD>
			<td class="TituloMenu">NOMBRE Y CARGO DEL RESGUARDANTE</TD>
			<td class="TituloMenu">OBSERVACIONES</TD>
			<td class="TituloMenu">DESCRIPCIÓN DEL ERROR</TD>
		</TR><%
		int intContador = 0;
		String sBackColor = "";
		oAnexo.GetAll(iIdFuncionario);
		for(int i=0;i<oAnexo.GetAll(iIdFuncionario);i++){
			String 	sNoInventario=oAnexo.GetNoInventario(i)!=null?oAnexo.GetNoInventario(i)+"":"";
			String 	sNoEconomico= oAnexo.GetNoEconomico(i)!=null?oAnexo.GetNoEconomico(i)+"":"";
			String 	sMarca 		= oAnexo.GetMarca(i)!=null?oAnexo.GetMarca(i):"";
			String 	sModelo	  	= oAnexo.GetModelo(i)!=null?oAnexo.GetModelo(i):"";
			String 	sColor 		= oAnexo.GetColor(i)!=null?oAnexo.GetColor(i):"";
			String 	sPlacas 	= oAnexo.GetPlacas(i)!=null?oAnexo.GetPlacas(i):"";
			String 	sTipo 		= oAnexo.GetTipo(i)!=null?oAnexo.GetTipo(i):"";
			String 	sSerie 		= oAnexo.GetSerie(i)!=null?oAnexo.GetSerie(i):"";
			String 	sResguardante=oAnexo.GetResguardante(i)!=null?oAnexo.GetResguardante(i):"";
			String 	sObservacion= oAnexo.GetObservacion(i)!=null?oAnexo.GetObservacion(i):"";
			String 	sDescripcion= oAnexo.GetDescripcion(i)!=null?oAnexo.GetDescripcion(i):"";
			intContador = intContador + 1;
			if(intContador%2 == 0){sBackColor = "#ffffff";}
			else{sBackColor = "#eeeeee";}%>
		<TR align="left" bgcolor="<%=sBackColor%>" onMouseOver = "MouseDentro(this);" onMouseOut  = "MouseFuera(this,'<%=sBackColor%>');">
			<TD align="right"><%=sNoInventario%>&nbsp;</TD>
			<TD>&nbsp;<%=sNoEconomico%></TD>
			<TD>&nbsp;<%=sMarca%></TD>
			<TD>&nbsp;<%=sModelo%></TD>
			<TD>&nbsp;<%=sColor%></TD>
			<TD>&nbsp;<%=sPlacas%></TD>
			<TD>&nbsp;<%=sTipo%></TD>
			<TD>&nbsp;<%=sSerie%></TD>
			<TD>&nbsp;<%=sResguardante%></TD>
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
