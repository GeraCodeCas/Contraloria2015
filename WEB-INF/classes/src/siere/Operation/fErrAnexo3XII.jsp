<%@page import="com.consiss.util.tools.*"%>
<%@page import="com.gob.*"%>
<%@page import="java.util.*" %>
<%
/********************************************************************************************************
'Elaboro:	Enrique Martinez
'Lugar:		Monterrey, NL
'Puesto:		01.Mayo.2003
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
ErrAnexo3XII oAnexo	= new ErrAnexo3XII();
String sPath = "../";
%>
<html>
<head>
	<title>Entrega - Recepción : Anexo III.12 (Errores en Carga Masiva)</title>
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
			<TD class="TituloParrafo" width="70%">&nbsp;&nbsp;ERRORES DEL ANEXO III.12 - CARGA MASIVA&nbsp;&nbsp;</TD>
		</TR>
	</TABLE>		
	<TABLE cellPadding="0" cellSpacing="0" width="100%" BORDER="1" BORDERCOLOR="white">
		<TR align="center" valign="middle">
			<td class="TituloMenu" rowspan="2">Clave</TD>
			<td class="TituloMenu" rowspan="2">Obra</TD>
			<td class="TituloMenu" rowspan="2">No. Contrato</TD>
			<td class="TituloMenu" rowspan="2">Nombre del Contratista</TD>
			<td class="TituloMenu" rowspan="2">Costo Total</TD>
			<td class="TituloMenu" colspan="2">Importe</td>
			<td class="TituloMenu" rowspan="2">Saldo Anticipo por Amortizar</TD>
			<td class="TituloMenu" rowspan="2">Observaciones</TD>
			<td class="TituloMenu" rowspan="2">Tipo de Origen</TD>
			<td class="TituloMenu" rowspan="2">Descripción del Error</TD>
		</TR>
		<TR align="center" valign="middle">
			<td class="TituloMenu">Anticipos Otorgados</td>
			<td class="TituloMenu">Anticipos Amortizados</td>
		</TR><%
		int intContador = 0;
		String sBackColor = "";
		oAnexo.GetAll(iIdFuncionario);
		for(int i=0;i<oAnexo.GetAll(iIdFuncionario);i++){
			String 	sClave			= oAnexo.GetClave(i)!=null?oAnexo.GetClave(i)+"":"";
			String 	sObra 			= oAnexo.GetObra(i)!=null?oAnexo.GetObra(i):"";
			String 	sNoContrato		= oAnexo.GetNoContrato(i)!=null?oAnexo.GetNoContrato(i)+"":"";
			String 	sNomContratista	= oAnexo.GetNomContratista(i)!=null?oAnexo.GetNomContratista(i):"";
			String 	sCostoTotal		= oAnexo.GetCostoTotal(i)!=null?oAnexo.GetCostoTotal(i):"";
			String 	sAnticipoO		= oAnexo.GetAnticipoO(i)!=null?oAnexo.GetAnticipoO(i):"";
			String 	sAnticipoA		= oAnexo.GetAnticipoA(i)!=null?oAnexo.GetAnticipoA(i):"";
			String 	sObservacion 	= oAnexo.GetObservacion(i)!=null?oAnexo.GetObservacion(i):"";
			String 	sTipoOrigen		= oAnexo.GetTipoOrigen(i)!=null?oAnexo.GetTipoOrigen(i):"";
			String 	sSaldo			= oAnexo.GetSaldo(i)!=null?oAnexo.GetSaldo(i):"";
			String 	sDescripcion 	= oAnexo.GetDescripcion(i)!=null?oAnexo.GetDescripcion(i):"";
			intContador = intContador + 1;
			if(intContador%2 == 0){sBackColor = "#ffffff";}
			else{sBackColor = "#eeeeee";}%>
		<TR align="left" bgcolor="<%=sBackColor%>" onMouseOver = "MouseDentro(this);" onMouseOut  = "MouseFuera(this,'<%=sBackColor%>');">
			<TD>&nbsp;<%=sClave%></TD>
			<TD>&nbsp;<%=sObra%></TD>
			<TD>&nbsp;<%=sNoContrato%></TD>
			<TD>&nbsp;<%=sNomContratista%></TD>
			<TD>&nbsp;<%=sCostoTotal%></TD>
			<TD align="right"><%=sAnticipoO%>&nbsp;</TD>
			<TD align="right"><%=sAnticipoA%>&nbsp;</TD>
			<TD>&nbsp;<%=sSaldo%></TD>
			<TD>&nbsp;<%=sObservacion%></TD>
			<TD align="right"><%=sTipoOrigen%>&nbsp;</TD>
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
