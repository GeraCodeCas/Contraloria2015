<%/*********************************************************************************************************
Elaboro:	Claudia V. Sandoval Pardo
Lugar:		Monterrey, NL
Fecha:		28.Oct.2002
Compañia:	CONSISS*/%>
<%@page import="com.consiss.util.tools.*"%>
<%@page import="com.gob.*"%>
<%@page import="java.util.*" %>
<%
//Valida la permanencia del usuario en session
if ((String)session.getValue("ok")!="Consiss")
			response.sendRedirect("Error.html");
			
String	sOpcion = request.getParameter("sOpcion")!= null ? request.getParameter("sOpcion"): "";
String	sCodigo = request.getParameter("sCodigo")!= null ? request.getParameter("sCodigo"): "0";
int 	iIdUnidadGobierno = java.lang.Integer.parseInt(request.getParameter("iIdUnidadGobierno")!= null ? request.getParameter("iIdUnidadGobierno"): "-1");
String	sMensage = request.getParameter("sMensage")!= null ? request.getParameter("sMensage"): "";

String	sNombre = request.getParameter("sNombre")!= null ? request.getParameter("sNombre"): "0";
String	sTipoUnidad = request.getParameter("sTipoUnidad")!= null ? request.getParameter("sTipoUnidad"): "";

UnidadAdministrativa oUnidadAdministrativa 	= new UnidadAdministrativa();
UnidadGobierno 		 oUnidadGobierno 		= new UnidadGobierno();
Municipio 		 	 oMunicipio		 		= new Municipio();

String sPath = "../";%>
<html>
<head>
	<title>Entrega - Recepción : Unidades Administrativas</title>
<link rel="stylesheet" type="text/css" href="../Styles/Gobierno.css">
<script language="JavaScript" src="<%=sPath%>Scripts/Gobierno.js"></script>
<script language="JavaScript">
	function valid(){
		if (document.forma.sNombre.value==""){
			alert("No se puede, capture por favor del Nombre");
			document.forma.sNombre.setFocus();
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
	function del(pCODE){
		if(confirm("¿Desea Eliminar la Unidad Administrativa?")){ 
			document.forma.sCodigo.value = pCODE;
			document.forma.sOpcion.value = 'DEL';
			document.forma.submit();
		}
	}
	function selecciona(){
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
	<td width="135" valign="top"><%@include file="Menu.jsp"%></td>
	<!-- Menu -->
	<!-- Contenido -->
	<td valign="top">
	<FORM action="pUnidadAdministrativa.jsp" name="forma" method="post" >
		<input type="hidden" name="sOpcion" value="">
		<input type="hidden" name="sCodigo" value="<%=sCodigo%>"> 
		<TABLE align=center border=0 cellPadding=0 cellSpacing=0 width="100%">
			<TR>
				<TD class="TituloParrafo">&nbsp;&nbsp;Unidades Administrativas&nbsp;&nbsp;</TD>
			</tr>
			<tr>
				<td width="230px" class="TituloMenu"><b>Dependencia, Organismo o Tribunal:</b></td>
				<td>
					<select class="cmbBox" name="iIdUnidadGobierno" onchange="selecciona();">
							<option value="-1"> [ SELECCIONE ] </option>
							<option <%=iIdUnidadGobierno==0?"selected":""%> value="0"> [ TODAS ] </option><%
					for(int j=0;j<oUnidadGobierno.GetAll();j++){
						int oIdUnidadGobierno	= oUnidadGobierno.GetIdUnidadGobierno(j);
						String oNombre 			= oUnidadGobierno.GetNombre(j);		%>
							<option <%=iIdUnidadGobierno==oIdUnidadGobierno?"selected":""%> value="<%=oIdUnidadGobierno%>"><%=oNombre%></option><%
					}%>
					</select>
				</td>
				<TD align=right>
		<%if(sOpcion.equals("SAVE") || sOpcion.equals("NORMAL") || sOpcion.equals("DEL") || sOpcion.equals("") ) {%>						    
					<INPUT onclick="news();" 	name="NEW" 		type="button" value="Nuevo" class="boton">&nbsp;
		<%} else {%>	
					<INPUT onclick="cancel();" 	name="CANCEL" 	type="button" value="Cancelar" class="boton">&nbsp;
					<INPUT onclick="save();" 	name="SAVE" 	type="button" value="Grabar"  class="boton">&nbsp;
		<%}%>	
				</TD>
			</TR>
		</TABLE>
		<table><tr><td></td></tr></table>
		<!-- Datos que se agregaran a la tabla  -->
		<TABLE cellPadding="0" cellSpacing="0" width="100%" BORDER="1" BORDERCOLOR="white">
		<!-- Etiqueta donde se aplican los encabezados de las tablas-->
			<TR align="middle">
				<td class="TituloMenu">&nbsp;</td>
				<TD class="TituloMenu">ID</TD>
				<TD class="TituloMenu">Dependencia, Organismo o Tribunal</TD>
				<TD class="TituloMenu">Nombre de Unidad</TD>
				<TD class="TituloMenu">Dirección</TD>
				<TD class="TituloMenu">Municipio</TD>
				<TD class="TituloMenu">Clave</TD>
			</TR>
			<%if(sOpcion.equals("NEW")){%>
			<TR align="middle">
	        	<TD colspan="2">Automático</TD>
				<TD><select class="cmbBox" name="sIdUnidadGobierno"><%
					for(int j=0;j<oUnidadGobierno.GetAll();j++){
						int oIdUnidadGobierno	= oUnidadGobierno.GetIdUnidadGobierno(j);
						String oNombre 			= oUnidadGobierno.GetNombre(j);			 %>
						<option value="<%=oIdUnidadGobierno%>"><%=oNombre%></option><%
					}%>
					</select>
				</TD>
	        	<TD align="center">
					<INPUT class="txtBox" name="sNombre" id="sNombre" type="Text" size="25" maxlength="60" value="">
				</TD>
				<TD align="center">
					<INPUT class="txtBox" name="sDireccion" id="sDireccion" type="Text" size="35" maxlength="50" style="HEIGHT: 19px;" value="">
				</TD>
				<TD align="center">
					<select class="cmbBox" name="sIdMunicipio"><%
					for(int j=0;j<oMunicipio.GetAll().getNumRows();j++){
						int oIdMunicipio	= oMunicipio.GetIdMunicipio(j);
						String oNombre 		= oMunicipio.GetNombre(j);			 %>
						<option value="<%=oIdMunicipio%>"><%=oNombre%></option><%
					}%>
					</select>
				</TD>
				<TD align="center">
					<INPUT class="txtBox" name="sClave" id="sClave" type="Text" size="10" maxlength="10" style="HEIGHT: 19px;" value="">
				</TD>
			</TR><%
			}
			oUnidadGobierno.GetAll();
			oMunicipio.GetAll();
			int intContador = 0;
			String sBackColor = "";
			for(int i=0;i<oUnidadAdministrativa.GetAll(iIdUnidadGobierno);i++){
				int vIdUnidadAdministrativa = oUnidadAdministrativa.GetIdUnidadAdministrativa(i);
				int vIdUnidadGobierno 		= oUnidadAdministrativa.GetIdUnidadGobierno(i);
				String vNombre 				= oUnidadAdministrativa.GetNombre(i)!=null?oUnidadAdministrativa.GetNombre(i):"";
				String vDireccion 			= oUnidadAdministrativa.GetDireccion(i);
				int vIdMunicipio 			= oUnidadAdministrativa.GetIdMunicipio(i);
				String vClave				= oUnidadAdministrativa.GetClave(i);
				intContador = intContador + 1;
				if (intContador%2 == 0){
					sBackColor = "#ffffff";
				}else{
					sBackColor = "#eeeeee";
			 	}
				if(sOpcion.equals("EDIT") && sCodigo.equals(vIdUnidadAdministrativa+"") ){%>
			<TR align="left" bgcolor="<%=sBackColor%>" onMouseOver = "MouseDentro(this);"
			onMouseOut  = "MouseFuera(this,'<%=sBackColor%>');">
				<TD></TD>
				<TD align="center"><SPAN><%=vIdUnidadAdministrativa%></SPAN></TD>
				<TD><select class="cmbBox" name="sIdUnidadGobierno"><%
					for(int j=0;j<oUnidadGobierno.GetAll();j++){
						int oIdUnidadGobierno	= oUnidadGobierno.GetIdUnidadGobierno(j);
						String oNombre 			= oUnidadGobierno.GetNombre(j);			 %>
						<option value="<%=oIdUnidadGobierno%>" <%=vIdUnidadGobierno==oIdUnidadGobierno?" selected":""%>><%=oNombre%></option><%
					}%>
					</select>
				</TD>
				<TD align="center">
					<INPUT class="txtBox" name="sNombre" id="sNombre" type="Text" size="25" maxlength="60" style="HEIGHT: 19px;" value="<%=vNombre%>">
				</TD>
				<TD align="center">
					<INPUT class="txtBox" name="sDireccion" id="sDireccion" type="Text" size="35" maxlength="50" style="HEIGHT: 19px;" value="<%=vDireccion%>">
				</TD>
				<TD align="center">
					<select class="cmbBox" name="sIdMunicipio"><%
					for(int j=0;j<oMunicipio.GetAll().getNumRows();j++){
						int oIdMunicipio	= oMunicipio.GetIdMunicipio(j);
						String oNombre 		= oMunicipio.GetNombre(j);			 %>
						<option value="<%=oIdMunicipio%>" <%=vIdMunicipio==oIdMunicipio?" selected":""%>><%=oNombre%></option><%
					}%>
					</select>
				</TD>
				<TD align="center">
					<INPUT class="txtBox" name="sClave" id="sClave" type="Text" size="10" maxlength="10" style="HEIGHT: 19px;" value="<%=vClave %>">
				</TD>
			</TR><%
				} else {%>
			<TR align="left" bgcolor="<%=sBackColor%>" onMouseOver = "MouseDentro(this);"
			onMouseOut  = "MouseFuera(this,'<%=sBackColor%>');">
				<TD><a onmouseover="this.style.cursor='hand'" style="cursor:normal" onclick="del(<%=vIdUnidadAdministrativa%>);"><img src="<%=sPath%>Images/Eliminar.gif" ></a></TD>
				<TD align="center">	
					<a onmouseover="this.style.cursor='hand'" style="cursor:normal" onclick="edit(<%=vIdUnidadAdministrativa%>);">
						<%=vIdUnidadAdministrativa%>
					</a>
				</TD>
				<TD align="center">	
					<a onmouseover="this.style.cursor='hand'" style="cursor:normal" onclick="edit(<%=vIdUnidadAdministrativa%>);">
						<%=oUnidadGobierno.GetPos(vIdUnidadGobierno)>=0?oUnidadGobierno.GetNombre(oUnidadGobierno.GetPos(vIdUnidadGobierno)):""%>
					</a>
				</TD>				
				<TD align="center">	
					<a onmouseover="this.style.cursor='hand'" style="cursor:normal" onclick="edit(<%=vIdUnidadAdministrativa%>);">
						<%=vNombre%>
					</a>
				</TD>
				<TD align="center">	
					<a onmouseover="this.style.cursor='hand'" style="cursor:normal" onclick="edit(<%=vIdUnidadAdministrativa%>);">
						<%=vDireccion%>
					</a>
				</TD>
				<TD align="center">	
					<a onmouseover="this.style.cursor='hand'" style="cursor:normal" onclick="edit(<%=vIdUnidadAdministrativa%>);">
						<%=oMunicipio.GetPos(vIdMunicipio)>=0?oMunicipio.GetNombre(oMunicipio.GetPos(vIdMunicipio)):""%>
					</a>
				</TD>
				<TD align="center">	
					<a onmouseover="this.style.cursor='hand'" style="cursor:normal" onclick="edit(<%=vIdUnidadAdministrativa%>);">
						<%=vClave%>
					</a>
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
<%=!sMensage.equals("")?"<script language='JavaScript'>alert('"+sMensage+"');</script>":"" %>
<%@include file="Footer.jsp"%>
</body>
</html>
