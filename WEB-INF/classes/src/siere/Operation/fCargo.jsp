<%/*********************************************************************************************************
Elaboro:	Julio Enrique Espinosa Torres
Lugar:		Monterrey, NL
Fecha:		28.Oct.2002
Compañia:	CONSISS*/%>
<%@page import="com.consiss.util.tools.*"%>
<%@page import="com.gob.*"%>
<%@page import="java.util.*" %>
<%
//Valida la permanencia del usuario en session
if ((String)session.getValue("ok")!="Consiss")	response.sendRedirect("Error.html");
			
String	sOpcion = request.getParameter("sOpcion")!= null ? request.getParameter("sOpcion"): "";
String	sCodigo = request.getParameter("sCodigo")!= null ? request.getParameter("sCodigo"): "0";
String	sMensage = request.getParameter("sMensage")!= null ? request.getParameter("sMensage"): "";
int 	iIdUnidadGobierno = java.lang.Integer.parseInt(request.getParameter("iIdUnidadGobierno")!= null ? request.getParameter("iIdUnidadGobierno"): "-1");

Cargo 					oCargo 					= new Cargo();
UnidadAdministrativa 	oUnidadAdministrativa 	= new UnidadAdministrativa();
UnidadGobierno			oUnidadGobierno			= new UnidadGobierno();
String sPath = "../";
%>
<html>
<head>
	<title>Entrega - Recepción : Puesto o Cargo</title>
<link rel="stylesheet" type="text/css" href="<%=sPath%>Styles/Gobierno.css">
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
		if(confirm("¿Desea Eliminar el Puesto o Cargo?")){ 
			document.forma.sCodigo.value = pCODE;
			document.forma.sOpcion.value = 'DEL';
			document.forma.submit();
		}
	}
	
	function chgUGobierno(idSel){
		if(idSel<0) return;
		limpiaCombo();
		var sUnidadesAdmon = document.forma.sIdUnidadGobierno.options[idSel].title;
		while ( sUnidadesAdmon.length > 0) {
			x1 = sUnidadesAdmon.substr(0, sUnidadesAdmon.indexOf(":"));
			x2 = sUnidadesAdmon.substr(sUnidadesAdmon.indexOf(":")+1, sUnidadesAdmon.indexOf(";") - (sUnidadesAdmon.indexOf(":")+1) );
			sUnidadesAdmon = sUnidadesAdmon.indexOf(";")<=0 ? "" : sUnidadesAdmon.substr(sUnidadesAdmon.indexOf(";")+1 );
			var nuevaOption = new Option(x2, x1, false, true);
			document.forma.sIdUnidadAdministrativa.options[document.forma.sIdUnidadAdministrativa.length] = nuevaOption;
		}
		if(document.forma.sIdUnidadAdministrativa.length > 0 ) { document.forma.sIdUnidadAdministrativa.options[0].selected = true; }
	}

	function limpiaCombo(){
		while (document.forma.sIdUnidadAdministrativa.length > 0 ) {
			document.forma.sIdUnidadAdministrativa.options[document.forma.sIdUnidadAdministrativa.length-1] = null;  
		
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
<FORM action="pCargo.jsp" name="forma" method="post" >
	<input type="hidden" name="sOpcion" value="">
	<input type="hidden" name="sCodigo" value="<%=sCodigo%>"> 
	<TABLE align=center border=0 cellPadding=0 cellSpacing=0 width="100%">
		<TR>
			<TD class="TituloParrafo">&nbsp;Puestos o Cargos&nbsp;&nbsp;</TD>
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
	<%if(sOpcion.equals("SAVE") || sOpcion.equals("NORMAL") || sOpcion.equals("") ) {%>						    
				<INPUT class="boton" onclick="news();" 	name="NEW" 		type="button" value="Nuevo">&nbsp;
	<%} else {%>	
				<INPUT class="boton" onclick="cancel();" 	name="CANCEL" 	type="button" value="Cancelar">&nbsp;
				<INPUT class="boton" onclick="save();" 	name="SAVE" 	type="button" value="Grabar"  >&nbsp;
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
			<td class="TituloMenu">ID</TD>
			<td class="TituloMenu">Nombre de Puesto</TD>
			<td class="TituloMenu">Dependencia, Organismo o Tribunal</TD>
			<td class="TituloMenu">Unidad Administrativa</TD>
		</TR>
		<%if(sOpcion.equals("NEW")){%>
		<TR align="middle">
			<TD colspan="2">Automático</TD>
			<TD><INPUT class="txtBox" name="sNombre" id="sNombre" type="Text" size="20" maxlength="20" value=""></TD>
			<TD align="center">
				<select class="cmbBox" name="sIdUnidadGobierno" onchange="chgUGobierno(this.selectedIndex);"><%
				String sPaso			= "";
				int oIdUnidadGobiernoIni = 0;
				for(int j=0;j<oUnidadGobierno.GetAll();j++){
					oIdUnidadGobiernoIni	= oUnidadGobierno.GetIdUnidadGobierno(0);
					int oIdUnidadGobierno	= oUnidadGobierno.GetIdUnidadGobierno(j);
					String oNombre 			= oUnidadGobierno.GetNombre(j);
					sPaso			= "";
					for(int k=0;k<oUnidadAdministrativa.GetAll();k++){
						if(oUnidadAdministrativa.GetIdUnidadGobierno(k)==oIdUnidadGobierno){
							int oIdUnidadAdministrativa	= oUnidadAdministrativa.GetIdUnidadAdministrativa(k);
							sPaso						= sPaso + oIdUnidadAdministrativa + ":" + oUnidadAdministrativa.GetNombre(k) + ";";
						}
					}%>
					<option title="<%=sPaso%>" value="<%=oIdUnidadGobierno%>"><%=oNombre%></option><%
				}%>
				</select></TD>
			<TD align="center">
				<select class="cmbBox" name="sIdUnidadAdministrativa"><%
				for(int k=0;k<oUnidadAdministrativa.GetAll();k++){
					if(oUnidadAdministrativa.GetIdUnidadGobierno(k)==oIdUnidadGobiernoIni){
						int oIdUnidadAdministrativa	= oUnidadAdministrativa.GetIdUnidadAdministrativa(k);
						String oNombre 				= oUnidadAdministrativa.GetNombre(k);%>
					<option value="<%=oIdUnidadAdministrativa%>"><%=oNombre%></option><%
					}
				}%>
				</select></TD>
		</TR><%
		}
		int intContador = 0;
		String sBackColor = "";
		oUnidadAdministrativa.GetAll();
		for(int i=0;i<oCargo.GetAll(iIdUnidadGobierno);i++){
			int vIdCargo = oCargo.GetIdCargo(i);
			int vIdUnidadAdministrativa 		= oCargo.GetIdUnidadAdministrativa(i);
			int vIdUnidadGobierno 	= oUnidadAdministrativa.GetPos(vIdUnidadAdministrativa)>=0?
						oUnidadAdministrativa.GetIdUnidadGobierno(oUnidadAdministrativa.GetPos(vIdUnidadAdministrativa)):0 ;
			String vNombre 				= oCargo.GetNombre(i)!=null?oCargo.GetNombre(i):"";
			intContador = intContador + 1;
		 	if (intContador%2 == 0){
				sBackColor = "#ffffff";
			}else{
				sBackColor = "#eeeeee";
			}
			if(sOpcion.equals("EDIT") && sCodigo.equals(vIdCargo+"") ){%>
		<TR align="left" bgcolor="<%=sBackColor%>">
		<TD></TD>
			<TD align="center"><SPAN><%=vIdCargo%></SPAN></TD>
			<TD>&nbsp;
				<INPUT class="txtBox" name="sNombre" id="sNombre" type="Text" size="30" maxlength="30" style="HEIGHT: 19px;" value="<%=vNombre%>"></TD>
			<TD align="center">
				<select class="cmbBox" name="sIdUnidadGobierno" onchange="chgUGobierno(this.selectedIndex);">
					<option value="0" selected>[ SELECCIONE ]</option><%
				String sPaso			= "";
				for(int j=0;j<oUnidadGobierno.GetAll();j++){
					int oIdUnidadGobierno	= oUnidadGobierno.GetIdUnidadGobierno(j);
					String oNombre 			= oUnidadGobierno.GetNombre(j);
					sPaso			= "";
					for(int k=0;k<oUnidadAdministrativa.GetAll();k++){
						if(oUnidadAdministrativa.GetIdUnidadGobierno(k)==oIdUnidadGobierno){
							int oIdUnidadAdministrativa	= oUnidadAdministrativa.GetIdUnidadAdministrativa(k);
							sPaso						= sPaso + oIdUnidadAdministrativa + ":" + oUnidadAdministrativa.GetNombre(k) + ";";
						}
					}%>
					<option title="<%=sPaso%>" value="<%=oIdUnidadGobierno%>" <%=vIdUnidadGobierno==oIdUnidadGobierno?" selected":""%>><%=oNombre%></option><%
				}%>
				</select></TD>	
			<TD align="center">
				<select class="cmbBox" name="sIdUnidadAdministrativa">
					<option value="0" selected>[ SELECCIONE ]</option><%
				for(int k=0;k<oUnidadAdministrativa.GetAll();k++){
					if(oUnidadAdministrativa.GetIdUnidadGobierno(k)==vIdUnidadGobierno){
						int oIdUnidadAdministrativa	= oUnidadAdministrativa.GetIdUnidadAdministrativa(k);
						String oNombre 				= oUnidadAdministrativa.GetNombre(k);%>
					<option value="<%=oIdUnidadAdministrativa%>" <%=vIdUnidadAdministrativa==oIdUnidadAdministrativa?" selected":""%>><%=oNombre%></option><%
					}
				}%>
				</select></TD>
		</TR><%
			} else {%>
		<TR align="left" bgcolor="<%=sBackColor%>" 
			onMouseOver = "MouseDentro(this);"
			onMouseOut  = "MouseFuera(this,'<%=sBackColor%>');">
			<TD><a onmouseover="this.style.cursor='hand'" style="cursor:normal" onclick="del(<%=vIdCargo%>);"><img src="<%=sPath%>Images/Eliminar.gif" ></a></TD>
			<TD align="center">	
				<a onmouseover="this.style.cursor='hand'" style="cursor:normal" onclick="edit(<%=vIdCargo%>);">
					<%=vIdCargo%>
				</a>
			</TD>
			<TD >&nbsp;	
				<a onmouseover="this.style.cursor='hand'" style="cursor:normal" onclick="edit(<%=vIdCargo%>);">
					<%=vNombre%>
				</a>
			</TD>
			<TD align="center">	
				<a onmouseover="this.style.cursor='hand'" style="cursor:normal" onclick="edit(<%=vIdCargo%>);">
					<%=oUnidadGobierno.GetPos(vIdUnidadGobierno)>=0?oUnidadGobierno.GetNombre(oUnidadGobierno.GetPos(vIdUnidadGobierno)):vIdUnidadGobierno+""%>
				</a>
			</TD>
			<TD align="center">	
				<a onmouseover="this.style.cursor='hand'" style="cursor:normal" onclick="edit(<%=vIdCargo%>);">
					<%=oUnidadAdministrativa.GetPos(vIdUnidadAdministrativa)>=0?oUnidadAdministrativa.GetNombre(oUnidadAdministrativa.GetPos(vIdUnidadAdministrativa)):vIdUnidadAdministrativa+""%>
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
