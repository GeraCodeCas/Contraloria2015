<%@page import="com.consiss.util.tools.*"%>
<%@page import="com.gob.*"%>
<%@page import="java.util.*" %>
<%
/********************************************************************************************************
'Elaboro:	Jesus Limon
'Lugar:		Monterrey, NL
'Matricula:		22.Ene.2003
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
ErrAnexo3V5 oAnexo	= new ErrAnexo3V5();
String sPath = "../";

%>
<html>
<head>
	<title>Entrega - Recepción : Anexo III.5.5 (Errores en Carga Masiva)</title>
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
<FORM action="fErrAnexo3V5.jsp" name="forma" method="post" >
	<TABLE align=center border=0 cellPadding=0 cellSpacing=0 width="100%">
		<TR>
			<TD class="TituloParrafo" width="70%">&nbsp;&nbsp;ERRORES DEL ANEXO III.5.5 - CARGA MASIVA&nbsp;&nbsp;</TD>
		</TR>
	</TABLE>		
	<TABLE cellPadding="0" cellSpacing="0" width="100%" BORDER="1" BORDERCOLOR="white">
		<TR align="middle">
			<td class="TituloMenu">No. DE INVENTARIO</TD>
			<td class="TituloMenu">CALIBRE</TD>
			<td class="TituloMenu">MATRICULA</TD>
			<td class="TituloMenu">NOMBRE DEL RESGUARDANTE</TD>
			<td class="TituloMenu">CARGO DEL RESGUARDANTE</TD>
			<td class="TituloMenu">DESCRIPCIÓN DEL ERROR</TD>
		</TR><%
		int intContador = 0;
		String sBackColor = "";
		oAnexo.GetAll(iIdFuncionario);
		for(int i=0;i<oAnexo.GetAll(iIdFuncionario);i++){
			String sClave		= oAnexo.GetClave(i)!=null?oAnexo.GetClave(i)+"":"";
			String sCalibre	= oAnexo.GetCalibre(i)!=null?oAnexo.GetCalibre(i)+"":"";
			String sMatricula 	= oAnexo.GetMatricula(i)!=null?oAnexo.GetMatricula(i):"";
			String sNombre	  	= oAnexo.GetNombre(i)!=null?oAnexo.GetNombre(i):"";
			String sCargo 		= oAnexo.GetCargo(i)!=null?oAnexo.GetCargo(i):"";
			String sDescripcion= oAnexo.GetDescripcion(i)!=null?oAnexo.GetDescripcion(i):"";
			intContador = intContador + 1;
			if(intContador%2 == 0){sBackColor = "#ffffff";}
			else{sBackColor = "#eeeeee";}%>
		<TR align="left" bgcolor="<%=sBackColor%>" onMouseOver = "MouseDentro(this);" onMouseOut  = "MouseFuera(this,'<%=sBackColor%>');">
			<TD align="right"><%=sClave%>&nbsp;</TD>
			<TD>&nbsp;<%=sCalibre%></TD>
			<TD>&nbsp;<%=sMatricula%></TD>
			<TD>&nbsp;<%=sNombre%></TD>
			<TD>&nbsp;<%=sCargo%></TD>
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
