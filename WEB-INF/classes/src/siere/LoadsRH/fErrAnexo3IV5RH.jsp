<%@page import="com.consiss.util.tools.*"%>
<%@page import="com.gob.*"%>
<%@page import="java.util.*" %>
<%
/********************************************************************************************************
'Elaboro:	Jesus Limon
'Lugar:		Monterrey, NL
'Puesto:		22.Ene.2003
'Compa�ia:	CONSISS
'Ultima Modificacion:
'By:
'
'Distintas opciones:
'
'********************************************************************************************************/
%>
<%
//Valida la permanencia del usuario en session
if ((String)session.getValue("ok")!="ConsissRH")	response.sendRedirect("../Operation/Error.html");

String sUsuario =  (String)session.getValue("sUsuario") != null ? (String)session.getValue("sUsuario") : "";
ErrAnexo3IV5 oAnexo	= new ErrAnexo3IV5();
String sPath = "../";

%>
<html>
<head>
	<title>Entrega - Recepci�n : Anexo III.4.5 (Errores en Carga Masiva)</title>
<link rel="stylesheet" type="text/css" href="<%=sPath%>Styles/Gobierno.css">
<script language="JavaScript" src="<%=sPath%>Scripts/Gobierno.js"></script>
<script language="JavaScript" src="<%=sPath%>Scripts/Libreria.js"></script>
<script language="JavaScript">
	function cancel(){
		document.forma.sCodigo.value = 0;
		document.forma.sOpcion.value = 'NORMAL';
		document.forma.submit();
	}
	function imprimir(){
		var ancho = 800;
		var alto = 600;
		var x = (screen.width - ancho) / 2;
		var y = (screen.height - alto)- 150 / 2;		
		var strUrl = "iErrAnexo3IV5RH.jsp?sUsuario=<%=sUsuario%>";
		window.open(strUrl, "Imprimir", "width=" + ancho + ",height=" + alto + ",top=" + y + ",left=" + x + ",toolbar=0,location=0,directories=0,status=0,menubar=0,scrollbars=1,resizable=0");
	}
</script>
</head>
<body topmargin="0" leftmargin="0">
<%@include file="Header.jsp"%>
<!-- Encabezado -->
<table border="0" cellspacing="0" cellpadding="0" width="100%">
<tr>
	<!-- Menu -->
	<td width="135" valign="top"><%@include file="MenuRH.jsp"%></td>
	<!-- Menu -->
	<!-- Contenido -->
	<td valign="top">
	<TABLE align=center border=0 cellPadding=0 cellSpacing=0 width="100%">
		<TR>
			<TD class="TituloParrafo" width="70%">&nbsp;&nbsp;ERRORES DEL ANEXO III.4.5 - CARGA MASIVA&nbsp;&nbsp;</TD>
			<TD align="right"><a onmouseover="this.style.cursor='hand'" style="cursor:normal" onclick="imprimir();"><img alt="Imprimir" src="<%=sPath%>Images/Impresora.jpg"></a>&nbsp;</TD>
		</TR>
	</TABLE>		
	<TABLE cellPadding="0" cellSpacing="0" width="100%" BORDER="1" BORDERCOLOR="white">
		<TR align="middle">
			<td class="TituloMenu">No. de Empleado</TD>
			<td class="TituloMenu">Nombre</TD>
			<td class="TituloMenu">Puesto</TD>
			<td class="TituloMenu">Nombre Unidad Administrativa</TD>
			<td class="TituloMenu">Tipo N�mina</TD>
			<td class="TituloMenu">Unidad Administrativa</TD>
			<td class="TituloMenu">Descripci�n del Error</TD>
		</TR><%
		int intContador = 0;
		String sBackColor = "";
		for(int i=0;i<oAnexo.GetAll(sUsuario);i++){
			String sNumero			= oAnexo.GetNumero(i)!=null?oAnexo.GetNumero(i)+"":"";
			String sNombre			= oAnexo.GetNombre(i)!=null?oAnexo.GetNombre(i)+"":"";
			String sPuesto			= oAnexo.GetPuesto(i)!=null?oAnexo.GetPuesto(i):"";
			String sUAdministrativa	= oAnexo.GetUAdministrativa(i)!=null?oAnexo.GetUAdministrativa(i):"";
			String sDescripcion 	= oAnexo.GetDescripcion(i)!=null?oAnexo.GetDescripcion(i):"";
			String sClaveTipoNomina	= oAnexo.GetClaveTipoNomina(i)!=null?oAnexo.GetClaveTipoNomina(i):"";
			String sIdUAdministrativa= oAnexo.GetIdUAdministrativa(i)!=null?oAnexo.GetIdUAdministrativa(i):"";

			intContador = intContador + 1;
			if(intContador%2 == 0)	{sBackColor = "#ffffff";}
			else					{sBackColor = "#eeeeee";}%>
		<TR align="left" bgcolor="<%=sBackColor%>" onMouseOver = "MouseDentro(this);this.style.cursor='hand'" onMouseOut="MouseFuera(this,'<%=sBackColor%>');" style="cursor:normal">
			<TD align="right"><%=sNumero%>&nbsp;</TD>
			<TD>&nbsp;<%=sNombre%></TD>
			<TD>&nbsp;<%=sPuesto%></TD>
			<TD>&nbsp;<%=sUAdministrativa%></TD>
			<TD>&nbsp;<%=sClaveTipoNomina%></TD>
			<TD>&nbsp;<%=sIdUAdministrativa%></TD>
			<TD>&nbsp;<%=sDescripcion%></TD>
		</TR><%
		}%>
	</TABLE>
</td>
</tr>
</table>
<form method="post" name="forma">
</form>
<%@include file="Footer.jsp"%>
</body>
</html>
