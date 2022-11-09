<%@page import="com.consiss.util.tools.*"%>
<%@page import="com.gob.*"%>
<%@page import="java.util.*" %>
<%
/********************************************************************************************************
'Elaboro:	Enrique Martinez
'Lugar:		Monterrey, NL
'Fecha:		23.Abr.2003
'Compañia:	CONSISS
'********************************************************************************************************/
%>
<%
//Valida la permanencia del usuario en session
if ((String)session.getValue("ok")!="Consiss") 	response.sendRedirect("Error.html");

int iIdFuncionario =  java.lang.Integer.parseInt((String)(session.getValue("iIdFuncionario")!= null?session.getValue("iIdFuncionario"):"0") );
ErrAnexo3V7 oAnexo	= new ErrAnexo3V7();
String sPath = "../";
%>
<html>
<head>
	<title>Entrega - Recepción : Anexo III.5.7 (Errores en Carga Masiva)</title>
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
<FORM action="fErrAnexo3V7.jsp" name="forma" method="post" >
	<TABLE align=center border=0 cellPadding=0 cellSpacing=0 width="100%">
		<TR>
			<TD class="TituloParrafo" width="70%">&nbsp;&nbsp;ERRORES DEL ANEXO III.5.7 - CARGA MASIVA&nbsp;&nbsp;</TD>
		</TR>
	</TABLE>		
	<TABLE cellPadding="0" cellSpacing="0" width="100%" BORDER="1" BORDERCOLOR="white">
		<TR align="center">
			<td class="TituloMenu" rowspan="2">&nbsp;</td>
			<td class="TituloMenu" rowspan="2">Título</TD>
			<td class="TituloMenu" rowspan="2">Fecha de<BR>Edición o<BR>Elaboración</TD>
			<td class="TituloMenu" rowspan="2">Autor(es) y Editorial<BR>(Responsable de Elabo-<BR>ración o Publicación)</TD>
			<td class="TituloMenu" colspan="2">Responsable de la Custodia</TD>
			<td class="TituloMenu" rowspan="2">Tipo</TD>
			<td class="TituloMenu" rowspan="2">Descripción del Error</TD>
		</TR>
		<TR align="center">
			<td class="TituloMenu">Nombre</td>
			<td class="TituloMenu">Departamento</td>
		</TR>
<%
		int intContador = 0;
		String sBackColor = "";
		oAnexo.GetAll(iIdFuncionario);
		for(int i=0;i<oAnexo.GetAll(iIdFuncionario);i++){
			String 	sTitulo		= oAnexo.GetTitulo(i)!=null?oAnexo.GetTitulo(i)+"":"";
			String 	sFecha 		= oAnexo.GetFecha(i)!=null?oAnexo.GetFecha(i):"";
			String 	sAutores	= oAnexo.GetAutores(i)!=null?oAnexo.GetAutores(i):"";
			String 	sNombre 	= oAnexo.GetNombre(i)!=null?oAnexo.GetNombre(i):"";
			String 	sDepartamento=oAnexo.GetDepartamento(i)!=null?oAnexo.GetDepartamento(i):"";
			String 	sTipo 		= oAnexo.GetTipo(i)!=null?oAnexo.GetTipo(i):"";
			String sDescrErr	= oAnexo.GetDescrErr(i)!=null?oAnexo.GetDescrErr(i):"";
			intContador = intContador + 1;
			if(intContador%2 == 0){sBackColor = "#ffffff";}
			else{sBackColor = "#eeeeee";}%>
		<TR align="left" bgcolor="<%=sBackColor%>" onMouseOver = "MouseDentro(this);" onMouseOut  = "MouseFuera(this,'<%=sBackColor%>');">
			<td>&nbsp;</td>
			<TD>&nbsp;<%=sTitulo%></TD>
			<TD>&nbsp;<%=sFecha%></TD>
			<TD>&nbsp;<%=sAutores%></TD>
			<TD>&nbsp;<%=sNombre%></TD>
			<TD>&nbsp;<%=sDepartamento%></TD>
			<TD>&nbsp;<%=sTipo%></TD>
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
