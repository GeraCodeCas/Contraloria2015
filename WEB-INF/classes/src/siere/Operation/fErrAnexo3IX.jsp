<%@page import="com.consiss.util.tools.*"%>
<%@page import="com.gob.*"%>
<%@page import="java.util.*" %>
<%
/********************************************************************************************************
'Elaboro:	Sigifredo Vazquez
'Lugar:		Monterrey, NL
'Puesto:		29.Abril.2003
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
ErrAnexo3IX oAnexo	= new ErrAnexo3IX();
String sPath = "../";
%>
<html>
<head>
	<title>Entrega - Recepción : Anexo III.9 (Errores en Carga Masiva)</title>
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
<FORM action="fErrAnexo3IX.jsp" name="forma" method="post" >
	<TABLE align=center border=0 cellPadding=0 cellSpacing=0 width="100%">
		<TR>
			<TD class="TituloParrafo" width="70%">&nbsp;&nbsp;ERRORES DEL ANEXO III.9 - CARGA MASIVA&nbsp;&nbsp;</TD>
		</TR>
	</TABLE>		
	<TABLE cellPadding="0" cellSpacing="0" width="100%" BORDER="1" BORDERCOLOR="white">
		<TR align="middle">
			
			<td class="TituloMenu">NO. EXPEDIENTE</TD>
			<td class="TituloMenu">NO. PROGRESIVO</TD>
			<td class="TituloMenu">NOMBRE</TD>
			<td class="TituloMenu">DESTINO</TD>
			<td class="TituloMenu">ESTADO DE INMUEBLE</TD>
			<td class="TituloMenu">TIPO DE INMUEBLE</TD>
			<td class="TituloMenu">TIPO DE ACCION</TD>
			<td class="TituloMenu">OBSERVACIONES</TD>
			<td class="TituloMenu">DESCRIPCIÓN DEL ERROR</TD>
		</TR><%
		int intContador = 0;
		String sBackColor = "";
		oAnexo.GetAll(iIdFuncionario);
		for(int i=0;i<oAnexo.GetAll(iIdFuncionario);i++){
			String 	sNoExpediente	= oAnexo.GetNoExpediente(i)!=null?oAnexo.GetNoExpediente(i)+"":"";
			String 	sNoProgresivo 	= oAnexo.GetNoProgresivo(i)!=null?oAnexo.GetNoProgresivo(i):"";
			String 	sNombre			= oAnexo.GetNombre(i)!=null?oAnexo.GetNombre(i)+"":"";
			String 	sDestino		= oAnexo.GetDestino(i)!=null?oAnexo.GetDestino(i):"";
			String 	sEstadoInmueble	= oAnexo.GetEstadoInmueble(i)!=null?oAnexo.GetEstadoInmueble(i):"";
			String 	sTipoInmueble	= oAnexo.GetTipoInmueble(i)!=null?oAnexo.GetTipoInmueble(i):"";
			String 	sTipoAccion		= oAnexo.GetTipoAccion(i)!=null?oAnexo.GetTipoAccion(i):"";
			String 	sObservacion 	= oAnexo.GetObservacion(i)!=null?oAnexo.GetObservacion(i):"";
			String 	sDescripcion 	= oAnexo.GetDescripcion(i)!=null?oAnexo.GetDescripcion(i):"";
			intContador = intContador + 1;
			if(intContador%2 == 0){	sBackColor = "#ffffff";	}
			else{	sBackColor = "#eeeeee";	}%>
		<TR align="left" bgcolor="<%=sBackColor%>" onMouseOver = "MouseDentro(this);" onMouseOut  = "MouseFuera(this,'<%=sBackColor%>');">
			<TD>&nbsp;<%=sNoExpediente%></TD>
			<TD>&nbsp;<%=sNoProgresivo%></TD>
			<TD>&nbsp;<%=sNombre%></TD>
			<TD>&nbsp;<%=sDestino%></TD>
			<TD>&nbsp;<%=sEstadoInmueble%></TD>
			<TD>&nbsp;<%=sTipoInmueble%></TD>
			<TD>&nbsp;<%=sTipoAccion%></TD>
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
