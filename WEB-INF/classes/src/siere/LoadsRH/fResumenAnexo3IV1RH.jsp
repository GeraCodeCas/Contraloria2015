<%@page import="com.consiss.util.tools.*"%>
<%@page import="com.gob.*"%>
<%@page import="java.util.*" %>
<%
/********************************************************************************************************
'Elaboro:	Claudia Sandoval
'Lugar:		Monterrey, NL
'Puesto:	14.Jul.2003
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
if ((String)session.getValue("ok")!="ConsissRH")	response.sendRedirect("../Operation/Error.html");

String sUsuario =  (String)session.getValue("sUsuario") != null ? (String)session.getValue("sUsuario") : "";
ErrAnexo3IV1 oAnexo	= new ErrAnexo3IV1();
String sPath = "../";
%>
<html>
<head>
	<title>Entrega - Recepción : Anexo III.4.1 (Resumen de Carga Masiva)</title>
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
		var strUrl = "iResumenAnexo3IV1RH.jsp?sUsuario=<%=sUsuario%>";
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
			<TD class="TituloParrafo" width="70%">&nbsp;&nbsp;RESUMEN DE CARGA DEL ANEXO III.4.1&nbsp;&nbsp;</TD>
			<TD align="right"><a onmouseover="this.style.cursor='hand'" style="cursor:normal" onclick="imprimir();"><img alt="Imprimir" src="<%=sPath%>Images/Impresora.jpg"></a>&nbsp;</TD>
		</TR>
	</TABLE>		
	<TABLE cellPadding="0" cellSpacing="0" width="100%" BORDER="1" BORDERCOLOR="white">
		<TR align="middle">           
			<td class="TituloMenu">Dependencia</TD>
			<td class="TituloMenu">Unidad Administrativa</TD>
			<td class="TituloMenu">Id</TD>
			<td class="TituloMenu">Registros Exitosos</TD>
			<td class="TituloMenu">Registros Con Errores</TD>
		</TR><%
		int intContador = 0;
		String sBackColor = "";
		UnidadGobierno oUnidadGobierno = new UnidadGobierno();
		oUnidadGobierno.GetAll();
		UnidadAdministrativa oUnidadAdministrativa = new UnidadAdministrativa();
		oUnidadAdministrativa.GetAll();
		int iRegistrosACargar = 0, iRegistrosError = 0;
		for(int i=0;i<oAnexo.GetResumen(sUsuario);i++){
			String 	sIdUnidadGobierno	= oAnexo.GetRsmIdUnidadGobierno(i)!=null?oAnexo.GetRsmIdUnidadGobierno(i)+"":"0";
			String 	sIdUAdministrativa 	= oAnexo.GetRsmIdUAdministrativa(i)!=null?oAnexo.GetRsmIdUAdministrativa(i):"0";
			String 	sRegistrosACargar	= oAnexo.GetRsmRegACargar(i)!=null?oAnexo.GetRsmRegACargar(i)+"":"0";
			String 	sRegistrosError		= oAnexo.GetRsmRegError(i)!=null?oAnexo.GetRsmRegError(i):"0";
			intContador = intContador + 1;
			if(intContador%2 == 0){sBackColor = "#ffffff";}
			else{sBackColor = "#eeeeee";}
			iRegistrosACargar = iRegistrosACargar + java.lang.Integer.parseInt(sRegistrosACargar);
			iRegistrosError = iRegistrosError + java.lang.Integer.parseInt(sRegistrosError);
			int iIdUAdministrativa = java.lang.Integer.parseInt(sIdUAdministrativa);
			int iPosUnidadAdministrativa = oUnidadAdministrativa.GetPos(iIdUAdministrativa);%>
		<TR align="left" bgcolor="<%=sBackColor%>" onMouseOver = "MouseDentro(this);this.style.cursor='hand';" onMouseOut="MouseFuera(this,'<%=sBackColor%>');" style="cursor:normal">
			<TD>&nbsp;<%=oUnidadGobierno.GetPos(java.lang.Integer.parseInt(sIdUnidadGobierno))>=0?oUnidadGobierno.GetNombre(oUnidadGobierno.GetPos(java.lang.Integer.parseInt(sIdUnidadGobierno))):"(Desconocida)"%></TD>
			<TD>&nbsp;<%=iPosUnidadAdministrativa>=0?(oUnidadAdministrativa.GetNombre(iPosUnidadAdministrativa)):"(Desconocida)"%>
			</TD>
			<TD>&nbsp;<%=sIdUAdministrativa%></TD>
			<TD align="right"><%=java.lang.Integer.parseInt(sRegistrosACargar) - java.lang.Integer.parseInt(sRegistrosError)%>&nbsp;</TD>
			<TD align="right"><%=sRegistrosError%>&nbsp;</TD>
		</TR><%
		}%>
		<TR>
			<TD colspan="3">&nbsp;</TD>
			<TD bgcolor="#dedede" align="right"><%=iRegistrosACargar - iRegistrosError%>&nbsp;</TD>
			<TD bgcolor="#dedede" align="right"><%=iRegistrosError%>&nbsp;</TD>
		</TR>
	</TABLE>
</td>
</tr>
</table>
<form method="post" name="forma">
</form>
<%@include file="Footer.jsp"%>
</body>
</html>
