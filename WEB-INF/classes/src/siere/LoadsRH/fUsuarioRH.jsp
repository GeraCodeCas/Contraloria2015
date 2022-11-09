<%/*********************************************************************************************************
Elaboro:	Claudia V. Sandoval Pardo
Lugar:		Monterrey, NL
Fecha:		28.May.2003
Compañia:	CONSISS*/%><%
response.setHeader("Cache-Control","no-cache");
response.setHeader("Pragma","no-cache");
response.setDateHeader ("Expires", -1); %>
<%@page import="com.consiss.util.tools.*"%>
<%@page import="com.consiss.util.*"%>
<%@page import="com.gob.*"%>
<%@page import="java.util.*" %><%
if ((String)session.getValue("ok")!="ConsissRH")	response.sendRedirect("../Operation/Error.html");
			
String	sOpcion = request.getParameter("sOpcion")!= null ? request.getParameter("sOpcion"): "";
String	sCodigo = request.getParameter("sCodigo")!= null ? request.getParameter("sCodigo"): "0";
String	sMensaje = request.getParameter("sMensaje")!= null ? request.getParameter("sMensaje"): "";

UsuarioRH	oUsuarioRH	= new UsuarioRH();
Usuario		oUsuario	= new Usuario();
Utilerias	oUtil	 	= new Utilerias();
String sPath = "../";
%>
<html>
<head>
	<title>Entrega - Recepción : Usuarios Recursos Humanos</title>
<link rel="stylesheet" type="text/css" href="../Styles/Gobierno.css">
<script language='JavaScript' src="<%=sPath%>Scripts/Calendario.js"></script>
<script language="JavaScript" src="<%=sPath%>Scripts/Gobierno.js"></script>
<script language="JavaScript">
	function valid(){
		if (document.forma.sNombre.value==""){
			alert("No se puede, capture por favor del Nombre");
			document.forma.sNombre.focus();
			return false;
		}
		return true;
	}
	function edit(pCODE){
		document.forma.sCodigo.value = pCODE;
		document.forma.sOpcion.value = 'EDIT';
		document.forma.submit();
	}
	function save(){
		if (valid()) {
			document.forma.sOpcion.value = 'SAVE';
			document.forma.submit();
		}
	}
	function cancel(){
		document.forma.sCodigo.value = 0;
		document.forma.sOpcion.value = 'NORMAL';
		document.forma.submit();
	}
	function news() {
		document.forma.sCodigo.value = 0;
		document.forma.sOpcion.value = 'NEW';
		document.forma.submit();
	}
	function changePsw(pCODE){
		if(confirm("¿Desea Cambiar la Contraseña?")){ 
			document.forma.sCodigo.value = pCODE;
			document.forma.sOpcion.value = 'CHANGEPSW';
			document.forma.submit();
		}
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
	<td width="135" valign="top"><%@include file="MenuRH.jsp"%></td>
	<!-- Menu -->
	<!-- Contenido -->
	<td valign="top">
	
	<FORM action="pUsuarioRH.jsp" name="forma" method="post">
		<input type="hidden" name="sOpcion" value="">
		<input type="hidden" name="sCodigo" value="<%=sCodigo%>"> 
		<TABLE align=center border=0 cellPadding=0 cellSpacing=0 width="100%">
			<TR>
				<TD class="TituloParrafo">&nbsp;&nbsp;Usuarios de Recursos Humanos&nbsp;&nbsp;</TD>
				<TD align=right>
		<%if(sOpcion.equals("SAVE") || sOpcion.equals("NORMAL") || sOpcion.equals("")) {%>						    
					<INPUT onclick="news();" 	name="NEW" 		type="button" value="Nuevo"  class="boton">&nbsp;
		<%} else {%>	
					<INPUT onclick="cancel();" 	name="CANCEL" 	type="button" value="Cancelar" class="boton">&nbsp;
					<INPUT onclick="save();" 	name="SAVE" 	type="button" value="Grabar"  class="boton">&nbsp;
		<%}%>	
				</TD>
			</TR>
		</TABLE>		
		<!-- Datos que se agregaran a la tabla  -->
		<TABLE cellPadding="0" cellSpacing="0" width="100%" BORDER="1" BORDERCOLOR="white">
		<!-- Etiqueta donde se aplican los encabezados de las tablas-->
			<TR align="middle">
				<TD class="TituloMenu">ID</TD>
				<TD class="TituloMenu">Nombre</TD>
				<TD class="TituloMenu">Ap. Paterno</TD>
				<TD class="TituloMenu">Ap. Materno</TD>
				<TD class="TituloMenu">Usuario</TD>
				<TD class="TituloMenu">Estatus</TD>
				<TD class="TituloMenu">&nbsp;</TD>
			</TR>
			<%if(sOpcion.equals("NEW")){%>
			<TR align="middle">
	        	<TD>Automático</TD>
	        	<TD align="left">
					<INPUT name="sNombre" id="sNombre" type="Text" size="20" maxlength="20" value="">
				</TD>
	        	<TD align="left">
					<INPUT name="sApePaterno" id="sApePaterno" type="Text" size="15" maxlength="20" value="">
				</TD>
	        	<TD align="left">
					<INPUT name="sApeMaterno" id="sApeMaterno" type="Text" size="15" maxlength="20" value="">
				</TD>
	        	<TD align="left">
					XXXXX
				</TD>
			</TR><%
			}
			int intContador = 0;
			String sBackColor = "";
			for(int i=0;i<oUsuarioRH.GetAll();i++){
				int iIdUsuarioRH = oUsuarioRH.GetIdUsuarioRH(i);
				intContador = intContador + 1;
				if (intContador%2 == 0){	sBackColor = "#ffffff";	}
				else{						sBackColor = "#eeeeee"; }
				if(sOpcion.equals("EDIT") && sCodigo.equals(iIdUsuarioRH+"") ){%>
			<TR valign="top" align="left" bgcolor="<%=sBackColor%>">
				<TD align="center" valign="middle"><%=iIdUsuarioRH%></TD>
				<TD align="left">
					<INPUT name="sNombre" id="sNombre" type="Text" size="30" maxlength="30" style="HEIGHT: 19px;" value="<%=oUsuarioRH.GetNombre(i)%>">
				</TD>
				<TD align="left">
					<INPUT name="sApePaterno" id="sApePaterno" type="Text" size="20" maxlength="20" style="HEIGHT: 19px;" value="<%=oUsuarioRH.GetApePaterno(i)%>">
				</TD>
	        	<TD align="left">
					<INPUT name="sApeMaterno" id="sApeMaterno" type="Text" size="20" maxlength="20" style="HEIGHT: 19px;" value="<%=oUsuarioRH.GetApeMaterno(i)%>">
				</TD>

	        	<TD align="left" valign="middle">
					<%=oUsuario.GetPos(oUsuarioRH.GetIdUsuario(i))>=0?oUsuario.GetUsuario(oUsuario.GetPos(oUsuarioRH.GetIdUsuario(i))):(oUsuarioRH.GetIdUsuario(i)+"")%>
					<input type="hidden" name="idUsuario" id="idUsuario" value="<%=oUsuarioRH.GetIdUsuario(i)%>">
				</TD>
				<TD align="left">
					<select class="cmbBox" name="sEstatus" id="sEstatus"><%
					for(int m=0;m<2;m++){%>
						<option value="<%=m%>" <%=oUsuarioRH.GetEstatus(i).equals(m+"")?" selected":""%>><%=oUsuario.GetEstatusDesc(m+"")%></option><%
					}%>
					</select>
				</TD>
			</TR><%
				} else {%>
			<TR align="left" bgcolor="<%=sBackColor%>" 
				onMouseOver = "MouseDentro(this);"
				onMouseOut  = "MouseFuera(this,'<%=sBackColor%>');">
				<TD align="center">	
					<a onmouseover="this.style.cursor='hand'" style="cursor:normal" onclick="edit(<%=iIdUsuarioRH%>);">
						<b><%=iIdUsuarioRH%></b>
					</a>
				</TD>
				<TD>	
					<a onmouseover="this.style.cursor='hand'" style="cursor:normal" onclick="edit(<%=iIdUsuarioRH%>);">
						<%=oUsuarioRH.GetNombre(i)%>
					</a>
				</TD>
				<TD>	
					<a onmouseover="this.style.cursor='hand'" style="cursor:normal" onclick="edit(<%=iIdUsuarioRH%>);">
						<%=oUsuarioRH.GetApePaterno(i)%>
					</a>
				</TD>
				<TD>
					<a onmouseover="this.style.cursor='hand'" style="cursor:normal" onclick="edit(<%=iIdUsuarioRH%>);">
						<%=oUsuarioRH.GetApeMaterno(i)%>
					</a>
				</TD>
				<TD>
					<a onmouseover="this.style.cursor='hand'" style="cursor:normal" onclick="edit(<%=iIdUsuarioRH%>);">
						<%=oUsuario.GetPos(oUsuarioRH.GetIdUsuario(i))>=0?oUsuario.GetUsuario(oUsuario.GetPos(oUsuarioRH.GetIdUsuario(i))):(oUsuarioRH.GetIdUsuario(i)+"")%>
					</a>
				</TD>
				<TD>
					<a onmouseover="this.style.cursor='hand'" style="cursor:normal" onclick="edit(<%=iIdUsuarioRH%>);">
						<%=oUsuario.GetEstatusDesc(oUsuarioRH.GetEstatus(i))%>
					</a>
				</TD>
				<TD>
					<INPUT onclick="changePsw(<%=oUsuarioRH.GetIdUsuario(i)%>);" name="ChangePsw" type="button" value="Cambiar Contraseña" class="boton">
				</TD>
			</TR><%
				}
			}
	%>
		</TABLE>
	</FORM>
	</td>
	<!-- Contenido -->
</tr>
</table>
<%if(!sMensaje.trim().equals("")){%>
<script language="JavaScript">alert("<%=sMensaje%>");</script>
<%}%>
<%@include file="Footer.jsp"%>
</body>
</html>