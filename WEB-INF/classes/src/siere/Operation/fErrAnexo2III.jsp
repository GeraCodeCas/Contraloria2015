<%@page import="com.consiss.util.tools.*"%>
<%@page import="com.gob.*"%>
<%@page import="java.util.*" %>
<%
/********************************************************************************************************
'Elaboro:	Sigifredo Vazquez
'Lugar:		Monterrey, NL
'Puesto:		21.Abril.2003
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
//if ((String)session.getValue("ok")!="Consiss") response.sendRedirect("Error.html");
//int iIdFuncionario =  java.lang.Integer.parseInt((String)(session.getValue("iIdFuncionario")!= null?session.getValue("iIdFuncionario"):"0") );
int iIdFuncionario =  java.lang.Integer.parseInt( request.getParameter("sIdFuncionario") != null ? request.getParameter("sIdFuncionario") : "0");
ErrAnexo2III oAnexo	= new ErrAnexo2III();
String sPath = "../";
%>
<html>
<head>
	<title>Entrega - Recepción : Anexo II.3 (Errores en Carga Masiva)</title>
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
<FORM action="fErrAnexo2III.jsp" name="forma" method="post" >
	<TABLE align=center border=0 cellPadding=0 cellSpacing=0 width="100%">
		<TR>
			<TD class="TituloParrafo" width="70%">&nbsp;&nbsp;ERRORES DEL ANEXO II.3 - CARGA MASIVA&nbsp;&nbsp;</TD>
		</TR>
	</TABLE>		
	<TABLE cellPadding="0" cellSpacing="0" width="100%" BORDER="1" BORDERCOLOR="white">
		<TR align="middle">
			
			<td class="TituloMenu">NUM. OFICIO</TD>
			<td class="TituloMenu">FECHA</TD>
			<td class="TituloMenu">CONCEPTO</TD>
			<td class="TituloMenu">IMPORTE</TD>
			<td class="TituloMenu">OBSERVACIONES</TD>
			<td class="TituloMenu">DESCRIPCIÓN DEL ERROR</TD>
		</TR>
<%
		int intContador = 0;
		String sBackColor = "";
		oAnexo.GetAll(iIdFuncionario);
		for(int i=0;i<oAnexo.GetAll(iIdFuncionario);i++){
			String 	sNumeroOficio	= oAnexo.GetNumeroOficio(i)!=null?		oAnexo.GetNumeroOficio(i)+"":"";
			String 	sFecha 			= oAnexo.GetFecha(i)!=null?				oAnexo.GetFecha(i):"";
			String 	sConcepto		= oAnexo.GetConcepto(i)!=null?			oAnexo.GetConcepto(i)+"":"";
			String 	sImporte		= oAnexo.GetImporte(i)!=null?			oAnexo.GetImporte(i):"";
			String 	sObservacion 	= oAnexo.GetObservacion(i)!=null?		oAnexo.GetObservacion(i):"";
			String 	sDescripcion 	= oAnexo.GetDescripcion(i)!=null?		oAnexo.GetDescripcion(i):"";
			intContador = intContador + 1;
			if(intContador%2 == 0){
				sBackColor = "#ffffff";
			}else{
				sBackColor = "#eeeeee";
			}
%>
		<TR align="left" bgcolor="<%=sBackColor%>" onMouseOver = "MouseDentro(this);" onMouseOut  = "MouseFuera(this,'<%=sBackColor%>');">
			<TD>&nbsp;<%=sNumeroOficio%></TD>
			<TD>&nbsp;<%=sFecha%></TD>
			<TD>&nbsp;<%=sConcepto%></TD>
			<TD>&nbsp;<%=sImporte%></TD>
			<TD>&nbsp;<%=sObservacion%></TD>
			<TD>&nbsp;<%=sDescripcion%></TD>
		</TR><%
		}
%>
	</TABLE>
</FORM>
</td>
</tr>
</table>
<%@include file="Footer.jsp"%>
</body>
</html>
