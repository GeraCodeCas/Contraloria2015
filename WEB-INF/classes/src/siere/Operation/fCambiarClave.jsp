<%/*********************************************************************************************************
Elaboro:	Claudia V. Sandoval Pardo
Lugar:		Monterrey, NL
Fecha:		01.Nov.2002
Compañia:	CONSISS*/%>
<%@page import="com.consiss.util.tools.*"%>
<%@page import="com.consiss.util.*"%>
<%@page import="com.gob.*"%>
<%@page import="java.util.*" %>
<%
//Valida la permanencia del usuario en session
if ((String)session.getValue("ok")!="Consiss" && (String)session.getValue("ok")!="ConsissRH") response.sendRedirect("Error.html");

String	sOpcion = request.getParameter("sOpcion")!= null ? request.getParameter("sOpcion"): "";
String	sMensage = request.getParameter("sMensage")!= null ? request.getParameter("sMensage"): "";

int iIdUsuario =  java.lang.Integer.parseInt(
		(String)(session.getValue("iIdUsuario")!= null?session.getValue("iIdUsuario"):"0") );

Usuario oUsuario = new Usuario();
oUsuario.Get(iIdUsuario);

String sUsuario = oUsuario.GetUsuario();
String sPath = "../";%>
<html>
<head>
<title>Entrega - Recepción : Cambia Clave de Acceso</title>
<link rel="stylesheet" type="text/css" href="<%=sPath%>Styles/Gobierno.css">
<script language="JavaScript" src="<%=sPath%>Scripts/Gobierno.js"></script>
<script language="JavaScript" src="<%=sPath%>Scripts/Libreria.js"></script>
<script language="JavaScript">
	function valid(){
		if (document.forma.sClaveActual.value.toString().replace(' ', '') == "") {
			alert("Capture la Clave Actual del Usuario");
			document.forma.sClaveActual.focus();
			return false;
		}
		if (document.forma.sClaveNueva.value.toString().replace(' ', '') == "") {
			alert("Capture la Clave Nueva del Usuario");
			document.forma.sClaveNueva.focus();
			return false;
		}
		if (document.forma.sConfirmaClave.value.toString().replace(' ', '') == "") {
			alert("Capture la Confirmación de Clave Nueva del Usuario");
			document.forma.sConfirmaClave.focus();
			return false;
		}
		if (document.forma.sConfirmaClave.value != document.forma.sClaveNueva.value) {
			alert("La Confirmación de Clave Nueva es diferente a la Clave Nueva");
			document.forma.sConfirmaClave.focus();
			return false;
		}
		if(confirm("¿Desea Cambiar la contraseña de usuario?"))
			return true;
		else
			return false;
	}
	function save(){
		if (valid()) {
			document.forma.sOpcion.value = 'SAVE';
			document.forma.submit();
		}
	}
	function cancel(){
		document.forma.sOpcion.value = 'NORMAL';
		document.forma.submit();
	}

</script>
</head>

<body topmargin="0" leftmargin="0">
<!-- Encabezado -->
<%@include file="Header.jsp"%>
<!-- Encabezado -->
<table border="0" cellspacing="0" cellpadding="0" width="100%">
  <tr>
  <!-- Menu -->
<%if ((String)session.getValue("ok")=="Consiss"){ %>
	 	<td width="135" valign="top"><%@include file="Menu.jsp"%></td>
<%} else {%>
	 	<td width="135" valign="top"><%@include file="..\\loadsRH\\MenuRH.jsp"%></td>
<%} %>
  <!-- Menu -->
  <!-- Contenido -->
  	<td valign="top" align="center">
	<FORM action="pCambiarClave.jsp" name="forma" method="post" >
		<input type="hidden" name="sOpcion" value="">
		<input type="hidden" name="sMensage" value="<%=sMensage%>"> 
		<TABLE align=center border=0 cellPadding=0 cellSpacing=0 width="100%">
			<TR>
				<TD class="TituloParrafo">&nbsp;&nbsp;Cambio de Clave&nbsp;&nbsp;</TD>
				<TD align=right>
					<INPUT onclick="cancel();" 	name="CANCEL" 	type="button" value="Cancelar" class="boton">&nbsp;
					<INPUT onclick="save();" 	name="SAVE" 	type="button" value="Grabar"  class="boton">&nbsp;
				</TD>
			</TR>
		</TABLE>	
		
		<table>
			<tr>
				<td class="TituloMenu">Usuario:</td>
				<td><%=oUsuario.GetNombre() %> / <%=sUsuario%></td>
			</tr>
			<tr>
				<td class="TituloMenu">Clave Actual del Usuario:</td>
				<td><input type="Password" name="sClaveActual" id="sClaveActual" maxlength="10" onKeyPress="isAlfa();"></td>
			</tr>
			<tr>
				<td class="TituloMenu">Clave Nueva:</td>
				<td><input type="Password" name="sClaveNueva" id="sClaveNueva" maxlength="10" onKeyPress="isAlfa();"></td>
				<TD rowspan="2" width="60px">(Max. 10. Solo 0-9 y Aa-Zz)</TD>
			</tr>
			<tr>
				<td class="TituloMenu">Confirma Clave Nueva:</td>
				<td><input type="Password" name="sConfirmaClave" id="sConfirmaClave" maxlength="10" onKeyPress="isAlfa();"></td>
			</tr>
		</table>
	</FORM>
	</td>
  <!-- Contenido -->
  </tr>
</table>
<%if(!sMensage.equals("")){ %>
<script language="JavaScript">alert("<%=sMensage%>");</script>
<%}%>
<%@include file="Footer.jsp"%>
</body>
</html>
