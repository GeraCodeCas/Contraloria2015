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
if ((String)session.getValue("ok")!="Consiss")
			response.sendRedirect("Error.html");

int iIdFuncionario =  java.lang.Integer.parseInt((String)(session.getValue("iIdFuncionario")!= null?session.getValue("iIdFuncionario"):"0") );
ErrAnexo3IV2 oAnexo	= new ErrAnexo3IV2();
String sPath = "../";

%>
<html>
<head>
	<title>Entrega - Recepción : Anexo III.4.2 (Errores en Carga Masiva)</title>
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
<FORM action="fErrAnexo3IV2.jsp" name="forma" method="post" >
	<TABLE align=center border=0 cellPadding=0 cellSpacing=0 width="100%">
		<TR>
			<TD class="TituloParrafo" width="70%">&nbsp;&nbsp;ERRORES DEL ANEXO III.4.2 - CARGA MASIVA&nbsp;&nbsp;</TD>
		</TR>
	</TABLE>		
	<TABLE cellPadding="0" cellSpacing="0" width="100%" BORDER="1" BORDERCOLOR="white">
		<TR align="middle">
			<td class="TituloMenu" rowspan="2">NOMINA</TD>
			<td class="TituloMenu" rowspan="2">NOMBRE</TD>
			<td class="TituloMenu" rowspan="2">SITUACIÓN</TD>
			<td class="TituloMenu" colspan="2">COMISIÓN</TD>
			<td class="TituloMenu" colspan="2">PERÍODO</TD>
			<td class="TituloMenu" rowspan="2">OBSERVACIONES</TD>
			<td class="TituloMenu" rowspan="2">DESCRIPCIÓN DEL ERROR</TD>
		</TR>
		<TR align="middle">
			<td class="TituloMenu">DE</TD>
			<td class="TituloMenu">A</TD>
			<td class="TituloMenu">DE</TD>
			<td class="TituloMenu">A</TD>
		</TR>
<%
		int intContador = 0;
		String sBackColor = "";
		oAnexo.GetAll(iIdFuncionario);
		for(int i=0;i<oAnexo.GetAll(iIdFuncionario);i++){
			String 	sNomina		= oAnexo.GetNomina(i)!=null?oAnexo.GetNomina(i)+"":"";
			String 	sNombre		= oAnexo.GetNombre(i)!=null?oAnexo.GetNombre(i)+"":"";
			String 	sSituacion 	= oAnexo.GetSituacion(i)!=null?oAnexo.GetSituacion(i):"";
			String 	sComisionadoDE=oAnexo.GetComisionadoDE(i)!=null?oAnexo.GetComisionadoDE(i)+"":"";
			String 	sComisionadoA= oAnexo.GetComisionadoA(i)!=null?oAnexo.GetComisionadoA(i):"";
			String 	sPeriodoDE 	= oAnexo.GetPeriodoDE(i)!=null?oAnexo.GetPeriodoDE(i):"";
			String 	sPeriodoA 	= oAnexo.GetPeriodoA(i)!=null?oAnexo.GetPeriodoA(i):"";
			String 	sObservacion= oAnexo.GetObservacion(i)!=null?oAnexo.GetObservacion(i):"";
			String 	sDescripcion= oAnexo.GetDescripcion(i)!=null?oAnexo.GetDescripcion(i):"";
			intContador = intContador + 1;
			if(intContador%2 == 0){	sBackColor = "#ffffff";	}
			else{sBackColor = "#eeeeee";}%>
		<TR align="left" bgcolor="<%=sBackColor%>" onMouseOver = "MouseDentro(this);" onMouseOut  = "MouseFuera(this,'<%=sBackColor%>');">
			<TD>&nbsp;<%=sNomina%></TD>
			<TD>&nbsp;<%=sNombre%></TD>
			<TD align="center"><%=sSituacion%></TD>
			<TD>&nbsp;<%=sComisionadoDE%></TD>
			<TD>&nbsp;<%=sComisionadoA%></TD>
			<TD>&nbsp;<%=sPeriodoDE%></TD>
			<TD>&nbsp;<%=sPeriodoA%></TD>
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
