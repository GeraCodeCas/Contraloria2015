<%@page import="com.consiss.util.tools.*"%>
<%@page import="com.gob.*"%>
<%@page import="java.util.*" %>
<%
/********************************************************************************************************
'Elaboro:	Enrique Martinez
'Lugar:		Monterrey, NL
'Puesto:		21.Abr.2003
'Compañia:	CONSISS
'Distintas opciones:
'
'********************************************************************************************************/
%>
<%
//Valida la permanencia del usuario en session
//if ((String)session.getValue("ok")!="Consiss") response.sendRedirect("Error.html");
//int iIdFuncionario =  java.lang.Integer.parseInt((String)(session.getValue("iIdFuncionario")!= null?session.getValue("iIdFuncionario"):"0") );
int iIdFuncionario =  java.lang.Integer.parseInt( request.getParameter("sIdFuncionario") != null ? request.getParameter("sIdFuncionario") : "0");
ErrAnexo2IV1 oAnexo	= new ErrAnexo2IV1();
String sPath = "../";
%>
<html>
<head>
	<title>Entrega - Recepción : Anexo II.4.1 (Errores en Carga Masiva)</title>
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
<FORM action="fErrAnexo2IV1.jsp" name="forma" method="post" >
	<TABLE align=center border=0 cellPadding=0 cellSpacing=0 width="100%">
		<TR>
			<TD class="TituloParrafo" width="70%">&nbsp;&nbsp;ERRORES DEL ANEXO II.4.1 - CARGA MASIVA&nbsp;&nbsp;</TD>
		</TR>
	</TABLE>		
	<TABLE cellPadding="0" cellSpacing="0" width="100%" BORDER="1" BORDERCOLOR="white">
		<TR align="center" valign="middle">
			<td class="TituloMenu" rowspan="2">&nbsp;</td>
			<td class="TituloMenu" rowspan="2">No. Cuenta</TD>
			<td class="TituloMenu" rowspan="2">Nombre de la Institución</TD>
			<td class="TituloMenu" colspan="2">Saldo Según</td>
			<td class="TituloMenu" colspan="2">Relación de Talonarios/Póliza</td>
			<td class="TituloMenu" colspan="3">Último Cheque Expedido por cada Chequera</td>
			<td class="TituloMenu" rowspan="2">Descripción del Error</TD>
		</TR>
		<TR align="center" valign="middle">
			<td class="TituloMenu">Chequera</td>
			<td class="TituloMenu">Banco</td>
			<td class="TituloMenu">Inicial</td>
			<td class="TituloMenu">Final</td>
			<td class="TituloMenu">Número</td>
			<td class="TituloMenu">Fecha</td>
			<td class="TituloMenu">Importe</td>
		</TR>
<%
		int intContador = 0;
		String sBackColor = "";
		oAnexo.GetAll(iIdFuncionario);
		for(int i=0;i<oAnexo.GetAll(iIdFuncionario);i++){
			String 	sCuenta				= oAnexo.GetCuenta(i)!=null?			oAnexo.GetCuenta(i)+"":"";
			String 	sNombre 			= oAnexo.GetNombre(i)!=null?			oAnexo.GetNombre(i):"";
			String 	sChequera				= oAnexo.GetChequera(i)!=null?			oAnexo.GetChequera(i)+"":"";
			String 	sBanco	= oAnexo.GetBanco(i)!=null?	oAnexo.GetBanco(i):"";
			String 	sInicial 			= oAnexo.GetInicial(i)!=null?			oAnexo.GetInicial(i):"";
			String 	sFinal 			= oAnexo.GetFinal(i)!=null?			oAnexo.GetFinal(i):"";
			String 	sNumero 				= oAnexo.GetNumero(i)!=null?				oAnexo.GetNumero(i):"";
			String 	sFecha 			= oAnexo.GetFecha(i)!=null?			oAnexo.GetFecha(i):"";
			String 	sImporte 			= oAnexo.GetImporte(i)!=null?			oAnexo.GetImporte(i):"";
			String 	sDescrErr 			= oAnexo.GetDescrErr(i)!=null?			oAnexo.GetDescrErr(i):"";
			intContador = intContador + 1;
			if(intContador%2 == 0){sBackColor = "#ffffff";}
			else{sBackColor = "#eeeeee";}%>
		<TR align="left" bgcolor="<%=sBackColor%>" onMouseOver = "MouseDentro(this);" onMouseOut  = "MouseFuera(this,'<%=sBackColor%>');">
			<td>&nbsp;</td>
			<TD>&nbsp;<%=sCuenta%></TD>
			<TD>&nbsp;<%=sNombre%></TD>
			<TD align="right"><%=sChequera%></TD>
			<TD align="right"><%=sBanco%></TD>
			<TD>&nbsp;<%=sInicial%></TD>
			<TD>&nbsp;<%=sFinal%></TD>
			<TD>&nbsp;<%=sNumero%></TD>
			<TD>&nbsp;<%=sFecha%></TD>
			<TD align="right"><%=sImporte%>&nbsp;</TD>
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
