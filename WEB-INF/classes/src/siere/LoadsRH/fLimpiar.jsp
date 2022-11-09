<%/*********************************************************************************************************
Elaboro:	Claudia V. Sandoval Pardo
Lugar:		Monterrey, NL
Fecha:		29.May.2003
Compañia:	CONSISS*/%><%
response.setHeader("Cache-Control","no-cache");
response.setHeader("Pragma","no-cache");
response.setDateHeader ("Expires", -1); %>
<%@page import="com.consiss.util.tools.*"%>
<%@page import="com.consiss.util.*"%>
<%@page import="com.gob.*"%>
<%@page import="java.util.*" %><%
if ((String)session.getValue("ok")!="ConsissRH")	response.sendRedirect("../Operation/Error.html");

String	sMensaje = request.getParameter("sMensaje")!= null ? request.getParameter("sMensaje"): "";

String sSelAnexo = request.getParameter("selAnexo")!= null ? request.getParameter("selAnexo"): "0";
String sSelNivel = request.getParameter("selNivel")!= null ? request.getParameter("selNivel"): "0";
String sSelDependencia = request.getParameter("selDependencia")!= null ? request.getParameter("selDependencia"): "0";
String sSelUAdministrativa = request.getParameter("selUAdministrativa")!= null ? request.getParameter("selUAdministrativa"): "0";

String sSelTipoNomina [] = request.getParameterValues("selTipoNomina"); 

TipoNomina	oTipoNomina	= new TipoNomina();

UnidadGobierno	oUnidadGobierno	= new UnidadGobierno();
UnidadAdministrativa	oUnidadAdministrativa	= new UnidadAdministrativa();
String sPath = "../";%>
<html>
<head>
	<title>Entrega - Recepción : Limpia Anexos</title>
<link rel="stylesheet" type="text/css" href="../Styles/Gobierno.css">
<script language='JavaScript' src="<%=sPath%>Scripts/Calendario.js"></script>
<script language="JavaScript" src="<%=sPath%>Scripts/Gobierno.js"></script>
<script language="JavaScript">
	function chgUGobierno(idSel){
		if(idSel<0) return;
		limpiaCombo();
		var sUnidadesAdmon = document.forma.selDependencia.options[idSel].title;
		while ( sUnidadesAdmon.length > 0) {
			x1 = sUnidadesAdmon.substr(0, sUnidadesAdmon.indexOf(":"));
			x2 = sUnidadesAdmon.substr(sUnidadesAdmon.indexOf(":")+1, sUnidadesAdmon.indexOf(";") - (sUnidadesAdmon.indexOf(":")+1) );
			sUnidadesAdmon = sUnidadesAdmon.indexOf(";")<=0 ? "" : sUnidadesAdmon.substr(sUnidadesAdmon.indexOf(";")+1 );
			var nuevaOption = new Option(x2, x1, false, true);
			document.forma.selUAdministrativa.options[document.forma.selUAdministrativa.length] = nuevaOption;
		}
		if(document.forma.selUAdministrativa.length > 0 ) { document.forma.selUAdministrativa.options[0].selected = true; }
	}

	function limpiaCombo(){
		while (document.forma.selUAdministrativa.length > 0 ) {
			document.forma.selUAdministrativa.options[document.forma.selUAdministrativa.length-1] = null;  
		
		}
	}
	
	function delAll(){
		if(!document.forma.selAnexo[0].checked && !document.forma.selAnexo[1].checked &&
			!document.forma.selAnexo[2].checked){
			alert("Por favor seleccione el Anexo a Limpiar");
			document.forma.selAnexo[0].focus();
			return false;
		}
		if(!document.forma.selNivel[0].checked && !document.forma.selNivel[1].checked &&
			!document.forma.selNivel[2].checked){
			alert("Por favor seleccione el Nivel al que desea Limpiar");
			document.forma.selNivel[0].focus();
			return false;
		}
		var bReturn = 0;
		
		for(var i=0;i<document.forma.selTipoNomina.length;i++){
			if(document.forma.selTipoNomina[i].checked) bReturn = 1;
		}
		if(bReturn == 0){
			alert("Por favor seleccione el(los) Tipo(s) de Nómina que desea Limpiar");
			document.forma.selTipoNomina[0].focus();
			return false;
		}
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
	<td width="135" valign="top"><%@include file="MenuRH.jsp"%></td>
	<!-- Menu -->
	<!-- Contenido -->
	<td valign="top">
	
	<FORM action="pLimpiar.jsp" name="forma" method="post">
		<TABLE align=center border=0 cellPadding=0 cellSpacing=0 width="100%">
			<TR>
				<TD class="TituloParrafo">&nbsp;&nbsp;Elimina Información de Anexos&nbsp;&nbsp;</TD>
				<TD align="right"><INPUT onclick="delAll();" 	name="DELALL" 	type="button" value="Limpiar"  class="boton">&nbsp;</TD>
			</TR>
		</TABLE>		
		<!-- Datos que se agregaran a la tabla  -->
		<TABLE cellPadding="0" cellSpacing="0" width="100%" BORDER="1" BORDERCOLOR="white">
		<!-- Etiqueta donde se aplican los encabezados de las tablas-->
			<TR align="middle">
				<TD class="TituloMenu">Anexo</TD>
				<TD class="TituloMenu">Nivel</TD>
				<TD class="TituloMenu">&nbsp;</TD>
				<TD class="TituloMenu">Tipo de Nómina</TD>
			</TR>
			<TR align="left" valign="middle">
				<TD><input type="radio" name="selAnexo" value="1" <%=sSelAnexo.equals("1")?"checked":""%>>III.4.1 Plantilla de Personal</TD>
				<TD><input type="radio" name="selNivel" value="1" <%=sSelNivel.equals("1")?"checked":""%>>Gobierno Central</TD>
				<TD>&nbsp;</TD>
				<TD rowspan="3">
					<table><%
						
						for(int i=0;i<oTipoNomina.GetAll().getNumRows();i++){%>
						<tr>
							<td><input type="checkbox" name="selTipoNomina" value="<%=oTipoNomina.GetClave(i)%>" <%
							for(int n=0;null!= sSelTipoNomina && n<sSelTipoNomina.length;n++){
								if(sSelTipoNomina[n].equals(oTipoNomina.GetClave(i))){
									out.println("checked");
								}
							}%>><%=oTipoNomina.GetDescripcion(i)%></td>
						</tr><%
						}%>
					</table>
				</TD>
			</TR>
			<TR>
				<TD><input type="radio" name="selAnexo" value="2" <%=sSelAnexo.equals("2")?"checked":""%>>III.4.2 Personal con licencia, permiso o comisión</TD>
				<TD><input type="radio" name="selNivel" value="2" <%=sSelNivel.equals("2")?"checked":""%>>Dependencia</TD>
				<TD><select class="cmbBox" name="selDependencia" id="selDependencia" onchange="chgUGobierno(this.selectedIndex);"><%
					String sPaso			= "";
					int oIdUnidadGobiernoIni = 0;
					for(int j=0;j<oUnidadGobierno.GetAll('1').getNumRows();j++){
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
						<option title="<%=sPaso%>" value="<%=oIdUnidadGobierno%>" <%=sSelDependencia.equals(oIdUnidadGobierno+"")?"selected":""%>><%=oNombre%></option><%
					}%>
					</select></TD>
			</TR>
			<TR> 
				<TD><input type="radio" name="selAnexo" value="3" <%=sSelAnexo.equals("3")?"checked":""%>>III.4.5 Relación de Expedientes de Personal</TD>
				<TD><input type="radio" name="selNivel" value="3" <%=sSelNivel.equals("3")?"checked":""%>>Unidad Administrativa</TD>
				<TD><select class="cmbBox" name="selUAdministrativa"><%
					oIdUnidadGobiernoIni = sSelDependencia.equals("0")?oIdUnidadGobiernoIni:java.lang.Integer.parseInt(sSelDependencia);
					for(int k=0;k<oUnidadAdministrativa.GetAll();k++){
						if(oUnidadAdministrativa.GetIdUnidadGobierno(k)==oIdUnidadGobiernoIni){
							int oIdUnidadAdministrativa	= oUnidadAdministrativa.GetIdUnidadAdministrativa(k);
							String oNombre 				= oUnidadAdministrativa.GetNombre(k);%>
						<option value="<%=oIdUnidadAdministrativa%>" <%=sSelUAdministrativa.equals(oIdUnidadAdministrativa+"")?"selected":""%>><%=oNombre%></option><%
						}
					}%>
					</select></TD>
			</TR>
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