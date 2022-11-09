<%@page import="com.consiss.util.tools.*"%>
<%@page import="com.gob.*"%>
<%@page import="java.util.*" %>
<%
/********************************************************************************************************
'Elaboro:	Sigifredo Vazquez
'Lugar:		Monterrey, NL
'Puesto:		1.Mayo.2003
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
ErrAnexo3XI oAnexo	= new ErrAnexo3XI();
String sPath = "../";
%>
<html>
<head>
	<title>Entrega - Recepción : Anexo III.11 (Errores en Carga Masiva)</title>
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
<FORM action="fErrAnexo3XI.jsp" name="forma" method="post" >
	<TABLE align=center border=0 cellPadding=0 cellSpacing=0 width="100%">
		<TR>
			<TD class="TituloParrafo" width="70%">&nbsp;&nbsp;ERRORES DEL ANEXO III.11 - CARGA MASIVA&nbsp;&nbsp;</TD>
		</TR>
	</TABLE>		
	<TABLE cellPadding="0" cellSpacing="0" width="100%" BORDER="1" BORDERCOLOR="white">
		<TR align="center" valign="middle">
			<td class="TituloMenu" rowspan="2">Clave</TD>
			<td class="TituloMenu" rowspan="2">Programa<br>Subprograma<br>Obra Localización</TD>
			<td class="TituloMenu" rowspan="2">Núm. Oficio Aprobación</TD>
			<td class="TituloMenu" rowspan="2">Inversión Aprobada</TD>
			<td class="TituloMenu" rowspan="2">Inversión Ejercida</TD>
			<td class="TituloMenu" colspan="2">Metas</td>
			<td class="TituloMenu" colspan="2">Num. Obras</td>
			<td class="TituloMenu" rowspan="2">Observaciones</TD>
			<td class="TituloMenu" rowspan="2">Tipo de Origen</TD>
			<td class="TituloMenu" rowspan="2">Descripción del Error</TD>
		</TR>
		<TR align="center" valign="middle">
			<td class="TituloMenu">Unidad de Medida</td>
			<td class="TituloMenu">Cantidad Total</td>
			<td class="TituloMenu">Entregadas</td>
			<td class="TituloMenu">Por Entregar</td>
		</TR>
<%
		int intContador = 0;
		String sBackColor = "";
		oAnexo.GetAll(iIdFuncionario);
		for(int i=0;i<oAnexo.GetAll(iIdFuncionario);i++){
			String 	sClave				= oAnexo.GetClave(i)!=null?				oAnexo.GetClave(i)+"":"";
			String 	sPrograma 			= oAnexo.GetPrograma(i)!=null?			oAnexo.GetPrograma(i):"";
			String 	sNoAprobacion		= oAnexo.GetNoAprobacion(i)!=null?		oAnexo.GetNoAprobacion(i)+"":"";
			String 	sInversionAprobada	= oAnexo.GetInversionAprobada(i)!=null?	oAnexo.GetInversionAprobada(i):"";
			String 	sInversionEjercida	= oAnexo.GetInversionEjercida(i)!=null?	oAnexo.GetInversionEjercida(i):"";
			
			String 	sUnidadMedida		= oAnexo.GetUnidadMedida(i)!=null?		oAnexo.GetUnidadMedida(i):"";
			String 	sCantidadTotal		= oAnexo.GetCantidadTotal(i)!=null?		oAnexo.GetCantidadTotal(i):"";
			
			String 	sObrasEntregadas	= oAnexo.GetObrasEntregadas(i)!=null?	oAnexo.GetObrasEntregadas(i):"";
			String 	sObrasPorEntregar	= oAnexo.GetObrasPorEntregar(i)!=null?	oAnexo.GetObrasPorEntregar(i):"";
			
			String 	sObservacion 		= oAnexo.GetObservacion(i)!=null?		oAnexo.GetObservacion(i):"";
			String 	sTipoOrigen			= oAnexo.GetTipoOrigen(i)!=null?		oAnexo.GetTipoOrigen(i):"";
			String 	sDescripcion 		= oAnexo.GetDescripcion(i)!=null?		oAnexo.GetDescripcion(i):"";
			intContador = intContador + 1;
			if(intContador%2 == 0){sBackColor = "#ffffff";}
			else{sBackColor = "#eeeeee";}%>
		<TR align="left" bgcolor="<%=sBackColor%>" onMouseOver = "MouseDentro(this);" onMouseOut  = "MouseFuera(this,'<%=sBackColor%>');">
			<TD>&nbsp;<%=sClave%></TD>
			<TD>&nbsp;<%=sPrograma%></TD>
			<TD>&nbsp;<%=sNoAprobacion%></TD>
			<TD>&nbsp;<%=sInversionAprobada%></TD>
			<TD>&nbsp;<%=sInversionEjercida%></TD>
			<TD>&nbsp;<%=sUnidadMedida%></TD>
			<TD>&nbsp;<%=sCantidadTotal%></TD>
			<TD>&nbsp;<%=sObrasEntregadas%></TD>
			<TD>&nbsp;<%=sObrasPorEntregar%></TD>
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
