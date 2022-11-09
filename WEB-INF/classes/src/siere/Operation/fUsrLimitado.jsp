<%/*********************************************************************************************************
Elaboro:	Claudia V. Sandoval Pardo
Lugar:		Monterrey, NL
Fecha:		31.Oct.2002
Compañia:	CONSISS*/%><%
response.setHeader("Cache-Control","no-cache");
response.setHeader("Pragma","no-cache");
response.setDateHeader ("Expires", -1); %>
<%@page import="com.consiss.util.tools.*"%>
<%@page import="com.consiss.util.*"%>
<%@page import="com.gob.*"%>
<%@page import="java.util.*" %><%
if ((String)session.getValue("ok")!="Consiss")	response.sendRedirect("Error.html");
			
String	sOpcion = request.getParameter("sOpcion")!= null ? request.getParameter("sOpcion"): "";
String	sCodigo = request.getParameter("sCodigo")!= null ? request.getParameter("sCodigo"): "0";
String	sMensaje = request.getParameter("sMensaje")!= null ? request.getParameter("sMensaje"): "";

int iIdFuncionario =  java.lang.Integer.parseInt(
		(String)(session.getValue("iIdFuncionario")!= null?session.getValue("iIdFuncionario"):"0") );

UsrLimitado oUsrLimitado = new UsrLimitado();
Funcionario oFuncionario = new Funcionario();
Usuario		oUsuario	 = new Usuario();
Utilerias	oUtil	 	 = new Utilerias();
String sPath = "../";
%>
<html>
<head>
	<title>Entrega - Recepción : Usuarios Limitados</title>
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
	<td width="135" valign="top"><%@include file="Menu.jsp"%></td>
	<!-- Menu -->
	<!-- Contenido -->
	<td valign="top">
	
	<FORM action="pUsrLimitado.jsp" name="forma" method="post" >
		<input type="hidden" name="sOpcion" value="">
		<input type="hidden" name="sCodigo" value="<%=sCodigo%>"> 
		<TABLE align=center border=0 cellPadding=0 cellSpacing=0 width="100%">
			<TR>
				<TD class="TituloParrafo">&nbsp;&nbsp;Usuarios Limitados&nbsp;&nbsp;</TD>
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
				<TD class="TituloMenu">Fecha Inicio</TD>
				<TD class="TituloMenu">Fecha Final</TD>
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
					<input name="dFecIni" id="dFecIni" type="Text" size="10" maxlength="10" readonly="yes" 
					value="">&nbsp;<img src="../Images/Fecha.gif" align="top" border=0 onclick="fPopCalendar(dFecIni,dFecIni)"></td>
				</TD>
	        	<TD align="left">
					<input name="dFecFin" id="dFecFin" type="Text" size="10" maxlength="10" readonly
					value="">&nbsp;<img src="../Images/Fecha.gif" align="top" border=0 onclick="fPopCalendar(dFecFin,dFecFin)"></td>
				</TD>
	        	<TD align="left">
					XXXXX
				</TD>
			</TR><%
			}
			int intContador = 0;
			String sBackColor = "";
			for(int i=0;i<oUsrLimitado.GetAll(iIdFuncionario);i++){
				int iIdUsuarioLimitado = oUsrLimitado.GetIdUsuarioLimitado(i);
				intContador = intContador + 1;
				if (intContador%2 == 0){	sBackColor = "#ffffff";	}
				else{						sBackColor = "#eeeeee"; }
				if(sOpcion.equals("EDIT") && sCodigo.equals(iIdUsuarioLimitado+"") ){%>
			<TR valign="top" align="left" bgcolor="<%=sBackColor%>">
				<TD align="center" valign="middle"><%=iIdUsuarioLimitado%></TD>
				<TD align="left">
					<INPUT name="sNombre" id="sNombre" type="Text" size="30" maxlength="30" style="HEIGHT: 19px;" value="<%=oUsrLimitado.GetNombre(i)%>">
				</TD>
				<TD align="left">
					<INPUT name="sApePaterno" id="sApePaterno" type="Text" size="20" maxlength="20" style="HEIGHT: 19px;" value="<%=oUsrLimitado.GetApePaterno(i)%>">
				</TD>
	        	<TD align="left">
					<INPUT name="sApeMaterno" id="sApeMaterno" type="Text" size="20" maxlength="20" style="HEIGHT: 19px;" value="<%=oUsrLimitado.GetApeMaterno(i)%>">
				</TD>
				<TD align="left" valign="top">
					<input name="dFecIni" id="dFecIni" type="Text" size="10" maxlength="10" readonly="yes" 
					value="<%=!oUsrLimitado.GetFecIni(i).equals("")?
							oUtil.sGetNumToDate(oUsrLimitado.GetFecIni(i),"dd/MM/yyyy"):"" %>">&nbsp;<img src="../Images/Fecha.gif" align="top" border=0 onclick="fPopCalendar(dFecIni,dFecIni)"></td>
				</TD>
	        	<TD align="left" valign="top">
					<input name="dFecFin" id="dFecFin" type="Text" size="10" maxlength="10" readonly
					value="<%=!oUsrLimitado.GetFecFin(i).equals("")?
							oUtil.sGetNumToDate(oUsrLimitado.GetFecFin(i),"dd/MM/yyyy"):"" %>">&nbsp;<img src="../Images/Fecha.gif" align="top" border=0 onclick="fPopCalendar(dFecFin,dFecFin)"></td>
				</TD>
	        	<TD align="left" valign="middle">
					<%=oUsuario.GetPos(oUsrLimitado.GetIdUsuario(i))>=0?oUsuario.GetUsuario(oUsuario.GetPos(oUsrLimitado.GetIdUsuario(i))):(oUsrLimitado.GetIdUsuario(i)+"")%>
					<input type="hidden" name="idUsuario" id="idUsuario" value="<%=oUsrLimitado.GetIdUsuario(i)%>">
				</TD>
				<TD align="left">
					<select class="cmbBox" name="sEstatus" id="sEstatus"><%
					for(int m=0;m<2;m++){%>
						<option value="<%=m%>" <%=oUsrLimitado.GetEstatus(i).equals(m+"")?" selected":""%>><%=oFuncionario.GetEstatusDesc(m+"")%></option><%
					}%>
					</select>
				</TD>
			</TR><%
				} else {%>
			<TR align="left" bgcolor="<%=sBackColor%>" 
				onMouseOver = "MouseDentro(this);"
				onMouseOut  = "MouseFuera(this,'<%=sBackColor%>');">
				<TD align="center">	
					<a onmouseover="this.style.cursor='hand'" style="cursor:normal" onclick="edit(<%=iIdUsuarioLimitado%>);">
						<b><%=iIdUsuarioLimitado%></b>
					</a>
				</TD>
				<TD>	
					<a onmouseover="this.style.cursor='hand'" style="cursor:normal" onclick="edit(<%=iIdUsuarioLimitado%>);">
						<%=oUsrLimitado.GetNombre(i)%>
					</a>
				</TD>
				<TD>	
					<a onmouseover="this.style.cursor='hand'" style="cursor:normal" onclick="edit(<%=iIdUsuarioLimitado%>);">
						<%=oUsrLimitado.GetApePaterno(i)%>
					</a>
				</TD>
				<TD>
					<a onmouseover="this.style.cursor='hand'" style="cursor:normal" onclick="edit(<%=iIdUsuarioLimitado%>);">
						<%=oUsrLimitado.GetApeMaterno(i)%>
					</a>
				</TD>
				<TD align="center">	
					<a onmouseover="this.style.cursor='hand'" style="cursor:normal" onclick="edit(<%=iIdUsuarioLimitado%>);">
						<%=!oUsrLimitado.GetFecIni(i).equals("")?
								oUtil.sGetNumToDate(oUsrLimitado.GetFecIni(i),"dd") + "." +
								oUtil.GetMesCorto(java.lang.Integer.parseInt(oUtil.sGetNumToDate(oUsrLimitado.GetFecIni(i),"MM"))) + "." +
								oUtil.sGetNumToDate(oUsrLimitado.GetFecIni(i),"yyyy")
								:""%>
					</a>
				</TD>
				<TD align="center">	
					<a onmouseover="this.style.cursor='hand'" style="cursor:normal" onclick="edit(<%=iIdUsuarioLimitado%>);">
						<%=!oUsrLimitado.GetFecFin(i).equals("")?
								oUtil.sGetNumToDate(oUsrLimitado.GetFecFin(i),"dd") + "." +
								oUtil.GetMesCorto(java.lang.Integer.parseInt(oUtil.sGetNumToDate(oUsrLimitado.GetFecFin(i),"MM"))) + "." +
								oUtil.sGetNumToDate(oUsrLimitado.GetFecFin(i),"yyyy")
								:""%>
					</a>
				</TD>
				<TD>
					<a onmouseover="this.style.cursor='hand'" style="cursor:normal" onclick="edit(<%=iIdUsuarioLimitado%>);">
						<%=oUsuario.GetPos(oUsrLimitado.GetIdUsuario(i))>=0?oUsuario.GetUsuario(oUsuario.GetPos(oUsrLimitado.GetIdUsuario(i))):(oUsrLimitado.GetIdUsuario(i)+"")%>
					</a>
				</TD>
				<TD>
					<a onmouseover="this.style.cursor='hand'" style="cursor:normal" onclick="edit(<%=iIdUsuarioLimitado%>);">
						<%=oFuncionario.GetEstatusDesc(oUsrLimitado.GetEstatus(i))%>
					</a>
				</TD>
				<TD>
					<INPUT onclick="changePsw(<%=oUsrLimitado.GetIdUsuario(i)%>);" name="ChangePsw" type="button" value="Cambiar Contraseña" class="boton">
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