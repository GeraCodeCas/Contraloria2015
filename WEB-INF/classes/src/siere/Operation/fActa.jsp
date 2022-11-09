<%
/*********************************************************************************************************
Elaboro:	Julio Enrique Espinosa Torres
Lugar:		Monterrey, NL
Fecha:		25.Oct.2002
Compañia:	CONSISS*/
%><%@page import="com.consiss.util.tools.*"%>
<%@page import="com.gob.*"%>
<%@page import="java.util.*" %><%
if ((String)session.getValue("ok")!="Consiss") response.sendRedirect("Error.html");
String sPath ="../";

String	iIdFuncionario = request.getParameter("iIdFuncionario")!= null ? request.getParameter("iIdFuncionario"): "0";
int	iIdUnidadAdministrativa = java.lang.Integer.parseInt(
		request.getParameter("sIdUnidadAdministrativa")!= null ? request.getParameter("sIdUnidadAdministrativa"): "0");


int	selDependencia = java.lang.Integer.parseInt(
		request.getParameter("selDependencia")!= null ? request.getParameter("selDependencia"): "0");

String	sOpcion = request.getParameter("sOpcion")!= null ? request.getParameter("sOpcion"): "";
int tempIdUnidadGobierno =  java.lang.Integer.parseInt(
		(String)(session.getValue("iIdUnidadGobierno")!= null?session.getValue("iIdUnidadGobierno"):"0") );

String	sObservaciones = request.getParameter("sObservaciones")!= null ? request.getParameter("sObservaciones"): "";
int		iTipoUsuario		= session.getValue("iTipoUsuario")!=null?java.lang.Integer.parseInt((String)session.getValue("iTipoUsuario")):0;
Usuario oUsuario = new Usuario();

Acta oActa = new Acta();
Funcionario oFuncionario = new Funcionario();
Cargo oCargo = new Cargo();
UnidadAdministrativa oUnidadAdministrativa = new UnidadAdministrativa();
UnidadGobierno oUnidadGobierno = new UnidadGobierno();
Municipio oMunicipio = new Municipio();
//oActa.Get(1);
oActa.Get(java.lang.Integer.parseInt(iIdFuncionario));
//out.println( request.getParameter("iTipoActa") + "<br>");
String	iTipoActa = request.getParameter("iTipoActa")!= null ? request.getParameter("iTipoActa"): "1";
//out.println( oActa.GetTipoActa() + "");
if(sOpcion.equals("CARGA")){
	//iTipoActa = oActa.GetTipoActa()!=null && !(oActa.GetTipoActa()+"").equals("") ? oActa.GetTipoActa() : iTipoActa;
	iTipoActa = oActa.GetTipoActa()!=null ? oActa.GetTipoActa() : iTipoActa;
} 

String vNombreUnidadGobierno			= "";
String vNombreFuncionario				= ""; 
String vApePaterno						= "";
String vApeMaterno						= "";
String vNombreCargo		       	 		= "";
String vNombreUnidadAdministrativa		= "";
String vDireccionUnidadAdministrativa	= "";
String vNombreMunicipio 				= "";
%>
<html>
<head>
	<title>Entrega - Recepción : Acta Administrativa</title>
	<link rel="stylesheet" type="text/css" href="<%=sPath%>Styles/Gobierno.css">
	<script language='JavaScript' src="<%=sPath%>Scripts/Calendario.js"></script>
	<script language="JavaScript" src="<%=sPath%>Scripts/Gobierno.js"></script>
	<script language="JavaScript" src="<%=sPath%>Scripts/Libreria.js"></script>
<script language="JavaScript">

	function CargaDatos(){
		document.forma.action = "fActa.jsp";
		document.forma.sOpcion.value = 'CARGA';
		document.forma.submit()
	}
	
	function TipoActa(){
		document.forma.action = "fActa.jsp";
		document.forma.sOpcion.value = 'ACTA';
		document.forma.submit()
	}
	
	function valid(){
		if (document.forma.iIdFuncionario.value==""){
			alert("No se puede");
			return false;
		}
		
		if (document.forma.sFechaActa.value==""){
			document.forma.sFechaActa.focus();		
			alert("Proporcionar Fecha del Acta");
			document.forma.sFechaActa.focus();
			return false;
		}
		
		return true;
	}

	function save(){
		if (valid()) {
			document.forma.sFechaEntrante.value = EnviaDate(document.forma.sFechaEntrante.value);
			document.forma.sFechaFirma.value	= EnviaDate(document.forma.sFechaFirma.value);
			document.forma.sFechaActa.value		= EnviaDate(document.forma.sFechaActa.value);
			if(confirm ("¿Desea Guardar el Acta Administrativa?")){
				document.forma.action="pActa.jsp"; 
				document.forma.submit();}
			else{
				document.forma.sFechaEntrante.value = RecibeDate(document.forma.sFechaEntrante.value);
				document.forma.sFechaFirma.value	= RecibeDate(document.forma.sFechaFirma.value);
				document.forma.sFechaActa.value 	= RecibeDate(document.forma.sFechaActa.value);
			}
		}
	}

	function preActa(){
		//document.forma.iIdFuncionario.value = pIdFuncionario;
		document.forma.action="rActa.jsp"; 
		document.forma.submit();
	}

	
	function EnviaDate(fecha){
		//Recibe una fecha en formato string dd/mm/aa
		if(fecha=="") { return ""; }
		var arrfecha = fecha.split("/");
		var dia = arrfecha[0];
		var mes = arrfecha[1];
		var anio = arrfecha[2];
		var fecha = anio+mes+dia;
		return (fecha);
	}

	function RecibeDate(fecha){
		//Recibe una fecha en formato string dd/mm/aa
		var anio
		var mes
		var dia
		var fechanew
		if(fecha=="") { return ""; }
		anio = fecha.substring(0,4);
		mes = fecha.substring(4,6);
		dia = fecha.substring(6,8);
		fechanew = dia+"/"+mes+"/"+anio;
		return (fechanew);
	}



function chgUGobierno(idSel){
		
		if(idSel<0) return;
		limpiaCombo();
		var sUnidadesAdmon = document.forma.selDependencia.options[idSel].title;
		
		while ( sUnidadesAdmon.length > 0) {
			x1 = sUnidadesAdmon.substr(0, sUnidadesAdmon.indexOf(":"));
			x2 = sUnidadesAdmon.substr(sUnidadesAdmon.indexOf(":")+1, sUnidadesAdmon.indexOf(";") - (sUnidadesAdmon.indexOf(":")+1) );
			sUnidadesAdmon = sUnidadesAdmon.indexOf(";")<=0 ? "" : sUnidadesAdmon.substr(sUnidadesAdmon.indexOf(";")+1 );
			var nuevaOption = new Option(x2, x1, false, true);
			document.forma.sIdUnidadAdministrativa.options[document.forma.sIdUnidadAdministrativa.length] = nuevaOption;
			
		
		}
		if(document.forma.sIdUnidadAdministrativa.length > 0 ) { document.forma.sIdUnidadAdministrativa.options[0].selected = true; }
	}



function chgUAdministrativa(){
		document.forma.action = "fActa.jsp";
		document.forma.submit()

	}



function limpiaCombo(){
	while (document.forma.sIdUnidadAdministrativa.length > 0 ) {
		document.forma.sIdUnidadAdministrativa.options[document.forma.sIdUnidadAdministrativa.length-1] = null;  
	}
	var nuevaOption = new Option('[ SELECCIONE ]', 0, false, true);
			document.forma.sIdUnidadAdministrativa.options[document.forma.sIdUnidadAdministrativa.length] = nuevaOption;
}


</script>

</head>

<body topmargin="0" leftmargin="0" onfocus=fReload();>
<!-- Encabezado -->
<%@include file="Header.jsp"%>
<!-- Encabezado -->
<br>
<table border="0" cellspacing="0" cellpadding="0" width="100%">
<tr>
<!-- Menu -->
 	<td width="135" valign="top"><%@include file="Menu.jsp"%></td>
<!-- Menu -->
<!-- Contenido -->
	<td valign="top">
<form name="forma" method="post">
	<input type="hidden" name="sOpcion" value="">
	<table align="center" border="0" cellPadding="0" cellSpacing="0" width="600">
		<tr>
			<td align="center" class="TituloParrafo">&nbsp;&nbsp;ACTA ADMINISTRATIVA DE ENTREGA - RECEPCION&nbsp;&nbsp;</td>
			<td align="right">
			<%if(iTipoUsuario != oUsuario.GetTipoRepresentante()) {%>
				<input class="boton" onclick="save();" 	name="SAVE" 	type="button" value=" Grabar "  >&nbsp;
			<%}%>
			</td>
		</tr>
	</table>	
	<br>
	<br>
	<table border="0" cellPadding="1" cellSpacing="1" width="600">
	<%if(tempIdUnidadGobierno == 0){%>	
		<tr>
			<td align="left" class="Etiquetafrm">Dependencia, Organismo o Tribunal:</td>
			<td align="left" class="cmbBox">
				<select class="cmbBox" name="selDependencia" onchange="chgUGobierno(this.selectedIndex);">
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
					<option title="<%=sPaso%>" value="<%=oIdUnidadGobierno%>" <%=selDependencia==oIdUnidadGobierno?" selected":""%>><%=oNombre%></option><%
				}%>
				</select>
			</td>
		</tr>
	<%} else {%>
			<input type="hidden" name="selDependencia" id="selDependencia" value="<%=tempIdUnidadGobierno%>">
	<%	selDependencia = tempIdUnidadGobierno;
	} %>

		<tr style="display:''">
			<td align="right" class="Etiquetafrm">Unidad Administrativa:</td>
			<td align="left" class="cmbBox">
				<select class="cmbBox" name="sIdUnidadAdministrativa" onchange="chgUAdministrativa(this.selectedIndex);">
						<option value="0" selected>[ SELECCIONE ]</option><%

				String sPaso2	= "";
				for(int k=0;k<oUnidadAdministrativa.GetAll();k++){
					if(oUnidadAdministrativa.GetIdUnidadGobierno(k)==selDependencia){

						int oIdUnidadAdministrativa	= oUnidadAdministrativa.GetIdUnidadAdministrativa(k);
						String oNombre 			= oUnidadAdministrativa.GetNombre(k);
					/*	
						sPaso2				= "";

						for(int w=0;w<oFuncionario.GetUnidadesAll();w++){
						
							if(oFuncionario.GetIdUnidadAdministrativa(w)==oIdUnidadAdministrativa){
							int oIdFunc	= oFuncionario.GetIdFuncionario(w);
							sPaso2		= sPaso2 + oIdFunc + ":" + oFuncionario.GetNombre(w) + " " + oFuncionario.GetApePaterno(w) + " " + oFuncionario.GetApeMaterno(w) + ";";
							}

					}*/

					%>
					<option value="<%=oIdUnidadAdministrativa%>" <%=iIdUnidadAdministrativa==oIdUnidadAdministrativa?" selected":""%>><%=oNombre%></option>
					<%}
					
				}%>
				</select></TD></td>
		</tr>
		<tr>
			<td align="right" class="Etiquetafrm">Funcionario:</td>
			<td align="left" class="cmbBox"><select class="cmbBox" name="iIdFuncionario" onchange="CargaDatos();">
			<option value="0" selected>[ SELECCIONE ]</option><%
			for(int j=0;j<oFuncionario.GetAll();j++){
				if(oFuncionario.GetIdUnidadAdministrativa(j)==iIdUnidadAdministrativa){
					int oIdFuncionario	= oFuncionario.GetIdFuncionario(j);
					String oNombre 		= oFuncionario.GetNombre(j);
					String oApePaterno 	= oFuncionario.GetApePaterno(j);
					String oApeMaterno 	= oFuncionario.GetApeMaterno(j);%>
				<option value="<%=oIdFuncionario%>" <%=java.lang.Integer.parseInt(iIdFuncionario)==oIdFuncionario?" selected":""%>><%=oNombre + " " + oApePaterno + " " + oApeMaterno%></option><%
				}
			}%>
			</select></td>
		</tr>
		<tr>
			<td align="right" class="Etiquetafrm">Tipo de Acta:</td>
			<td align="left" class="cmbBox">
			<select class="cmbBox" name="iTipoActa" onchange="TipoActa();">
				<option <%if(iTipoActa.equals("1")){%>selected<%}%> value="1">Acta Administrativa Individual</option>
				<option <%if(iTipoActa.equals("2")){%>selected<%}%> value="2">Acta Administrativa General</option>
			</select>
			</td>
		</tr>
	</table>
	<br><%
	if(java.lang.Integer.parseInt(iIdFuncionario) != 0){ 
		if (oFuncionario.Get(java.lang.Integer.parseInt(iIdFuncionario))){
			vNombreFuncionario			= oFuncionario.GetNombre()!=null?oFuncionario.GetNombre():""; 
			vApePaterno					= oFuncionario.GetApePaterno()!=null?oFuncionario.GetApePaterno():"";
			vApeMaterno					= oFuncionario.GetApeMaterno()!=null?oFuncionario.GetApeMaterno():"";
			int vIdCargo				= oFuncionario.GetIdCargo()!=0?oFuncionario.GetIdCargo():0;
			if(oCargo.Get(vIdCargo)){
				vNombreCargo					= oCargo.GetNombre()!=null?oCargo.GetNombre():"";
				int  vIdUnidadAdministrativa	= oCargo.GetIdUnidadAdministrativa()!=0?oCargo.GetIdUnidadAdministrativa():0;
				
				if(oUnidadAdministrativa.Get(vIdUnidadAdministrativa)){
					vNombreUnidadAdministrativa     = oUnidadAdministrativa.GetNombre()!=null?oUnidadAdministrativa.GetNombre():"";
					//vDireccionUnidadAdministrativa  = oUnidadAdministrativa.GetDireccion()!=null?oUnidadAdministrativa.GetDireccion():"";
					vDireccionUnidadAdministrativa  = oActa.GetDireccion()!=null?oActa.GetDireccion():"";
					vDireccionUnidadAdministrativa  = vDireccionUnidadAdministrativa.trim().equals("")?(oUnidadAdministrativa.GetDireccion()!=null?oUnidadAdministrativa.GetDireccion():""):vDireccionUnidadAdministrativa.trim();
					
					int vIdUnidadGobierno	                = oUnidadAdministrativa.GetIdUnidadGobierno()!=0?oUnidadAdministrativa.GetIdUnidadGobierno():0;
					int vIdMunicipio	                    = oUnidadAdministrativa.GetIdMunicipio()!=0?oUnidadAdministrativa.GetIdMunicipio():0;
					
					if(oUnidadGobierno.Get(vIdUnidadGobierno)){
						vNombreUnidadGobierno = oUnidadGobierno.GetNombre()!=null?oUnidadGobierno.GetNombre():"";
					}
					if(oMunicipio.Get(vIdMunicipio)){
						//vNombreMunicipio = oMunicipio.GetNombre()!=null?oMunicipio.GetNombre():"";
						vNombreMunicipio = oActa.GetCiudad()!=null?oActa.GetCiudad():"";
						vNombreMunicipio = vNombreMunicipio.trim().equals("")?(oMunicipio.GetNombre()!=null?oMunicipio.GetNombre():""):vNombreMunicipio;
					}
					
				}
			}
		}%>
	
	
	<table width="100%" cellpadding="0" cellspacing="0" border="0">
		<tr>
		<td align="left"><%if(iTipoUsuario != oUsuario.GetTipoRepresentante()) {%><img onmouseover="this.style.cursor='hand'" border="0" alt="Adjuntar Archivo" onclick="Adjuntar('<%=iIdFuncionario%>','99');" src="<%=sPath%>Images/Attach.jpg"><%}%></td>
		<td align="left" width="99%">
		<%
		VMatrix vArchivoA;
		AnexoArchivo oArchivoA 	= new AnexoArchivo();
		vArchivoA = oArchivoA.GetAll(99, java.lang.Integer.parseInt(iIdFuncionario));
		String sSep = "";
		if(vArchivoA.getNumRows()>0){%><b>Archivos Adjuntos (Attachment):</b><% 
			for(int i=0;i<vArchivoA.getNumRows();i++){
				String	sAnexoArchivo = (((Vector)vArchivoA.getVMatrixAll().elementAt(0)).elementAt(i)+"").trim();
				String  sRuta 		= (((Vector)vArchivoA.getVMatrixAll().elementAt(3)).elementAt(i)+"").trim();
				String 	sArchivo 	= (((Vector)vArchivoA.getVMatrixAll().elementAt(4)).elementAt(i)+"").trim();
				String	sLink		= (((Vector)vArchivoA.getVMatrixAll().elementAt(5)).elementAt(i)+"").trim() + (((Vector)vArchivoA.getVMatrixAll().elementAt(4)).elementAt(i)+"").trim();
				%><%=sSep%><a target="new" onmouseover="this.style.cursor='hand'" style="cursor:normal" onclick="ArchivoAdjunto('<%=sLink%>');"><font color="Blue"><%=sArchivo%></font></a><%
				sSep = ", ";
			}
		}%>
		</td>
	</tr></table>
<%if(iTipoUsuario != oUsuario.GetTipoRepresentante()) {%>
	<!-- Datos que se agregaran a la tabla  -->
	<table cellPadding="1" cellSpacing="1" width="575">
		<tr>
			<td Colspan="2" class="TituloMenu">Datos Generales del Acta</td>
		</tr>
		<tr>
			<td class="Etiquetafrm" width="250">Nombre Dependencia ó Unidad Administrativa:</td>
			<td>
				<input class="txtBox" name="sUnidadGobierno" id="sUnidadGobierno" type="Text" size="55" maxlength="50" value="<%=vNombreUnidadGobierno%>"></td>
		</tr>
		<tr>
			<td class="Etiquetafrm">Ciudad de Ubicaci&oacute;n U. Admva.:</td>
			<td><input class="txtBox" name="sCiudad" id="sCiudad" type="Text" size="55" maxlength="50" value="<%=vNombreMunicipio%>"></td>
		</tr>
		<tr>
			<td class="Etiquetafrm">Hora Levantamiento:</td>
			<td><input class="txtBox" name="sHora" id="sHora" type="Text" size="5" maxlength="10" value="<%=oActa.GetHora()%>"> hrs.</td>
		</tr>
		<tr>
			<td class="Etiquetafrm">Fecha Levantamiento:</td>
			<td><input readonly class="txtBox" name="sFechaActa" id="sFechaActa" type="Text" size="10" maxlength="10" value="<%=oActa.RegresaFecha(oActa.GetFechaActa())%>">&nbsp;<img src="<%=sPath%>Images/Fecha.gif" align="top" border=0 onclick="fPopCalendar(sFechaActa,sFechaActa)"></td>
		</tr>
		<tr>
			<td class="Etiquetafrm">Domicilio Unidad Admva.:</td>
			<td><input class="txtBox" name="sDireccion" id="sDireccion" type="Text" size="55" maxlength="100" value="<%=vDireccionUnidadAdministrativa%>"></td>
		</tr>
		<tr>
			<td class="Etiquetafrm">Puesto o Cargo (Saliente):</td>
			<td><input readonly style="border:0;" class="txtBox" name="sNombreCargo" id="sNombreCargo" type="Text" size="55" maxlength="50" value="<%=vNombreCargo%>"></td>
		</tr>
		<tr>
			<td class="Etiquetafrm">Hora Conclusión Acta:</td>
			<td><input class="txtBox" name="sHoraConclusionActa" id="sHoraConclusionActa" type="Text" size="5" maxlength="10" value="<%=oActa.GetHoraConclusionActa()%>"> hrs.</td>
		</tr>
		<tr>
			<td class="Etiquetafrm">Fecha de Terminación y Firma:</td>
			<td><input readonly class="txtBox" name="sFechaFirma" id="sFechaFirma" type="Text" size="10" maxlength="10" value="<%=oActa.RegresaFecha(oActa.GetFechaFirma())%>">&nbsp;<img src="<%=sPath%>Images/Fecha.gif" align="top" border=0 onclick="fPopCalendar(sFechaFirma, sFechaFirma)"></td>
		</tr>
		<tr>
			<td colspan="2" class="TituloMenu">Datos del Responsable del Órgano de Control Interno</td>
		</tr>
		<tr>
			<td class="Etiquetafrm">Nombre:</td>
			<td><input class="txtBox" name="sResponsableOrgano" id="sResponsableOrgano" type="Text" size="55" maxlength="50" value="<%=oActa.GetResponsableOrgano()%>"></td>
		</tr>
		<tr>
			<td colspan="2" class="TituloMenu">Datos del Responsable de la Coordinación Administrativa</td>
		</tr>
		<tr>
			<td class="Etiquetafrm">Nombre:</td>
			<td><input class="txtBox" name="sResponsableCoordinacion" id="sResponsableCoordinacion" type="Text" size="55" maxlength="50" value="<%=oActa.GetResponsableCoordinacion()%>"></td>
		</tr>
		<tr>
			<td colspan="2" class="TituloMenu">Datos del Funcionario que Entrega</td>
		</tr>
		<tr>
			<td class="Etiquetafrm">Nombre:</td>
			<td><input readonly  style="border:0;" class="txtBox"name="sNombreEntrega" id="sNombreEntrega" type="Text" size="55" maxlength="100" value="<%=vNombreFuncionario + " " + vApePaterno + " " + vApeMaterno%>"></td>
		</tr>
		<tr>
			<td class="Etiquetafrm">Testigo:</td>
			<td><input class="txtBox" name="sTestigoEntrega" id="sTestigoEntrega" type="Text" size="55" maxlength="50" value="<%=oActa.GetTestigoEntrega()%>"></td>
		</tr>
		<tr>
			<td class="Etiquetafrm">Unidad Admva. Testigo:</td>
			<td><input class="txtBox" name="sUnidadTestigoEntrega" id="sUnidadTestigoEntrega" type="Text" size="55" maxlength="50" value="<%=oActa.GetUnidadTestigoEntrega()%>"></td>
		</tr>
		<tr>
			<td class="Etiquetafrm">Puesto Testigo:</td>
			<td><input class="txtBox" name="sPuestoTestigoEntrega" id="sPuestoTestigoEntrega" type="Text" size="55" maxlength="50" value="<%=oActa.GetPuestoTestigoEntrega()%>"></td>
		</tr>
		<tr>
			<td class="Etiquetafrm">Domicilio Particular Testigo:</td>
			<td><input class="txtBox" name="sDireccionTestigoEntrega" id="sDireccionTestigoEntrega" type="Text" size="55" maxlength="100" value="<%=oActa.GetDireccionTestigoEntrega()%>"></td>
		</tr>
		<tr>
			<td colspan="2" class="TituloMenu">Datos del Funcionario que Recibe</td>
		</tr>
		<tr>
			<td class="Etiquetafrm">Nombre:</td>
			<td><input class="txtBox" name="sNombreRecibe" id="sNombreRecibe" type="Text" size="55" maxlength="100" value="<%=oActa.GetNombreRecibe()%>"></td>
		</tr>
		<tr>
			<td class="Etiquetafrm">Fecha en que surte efecto el Nombramiento:</td>
			<td><input readonly class="txtBox" name="sFechaEntrante" id="sFechaEntrante" type="Text" size="10" maxlength="10" value="<%=oActa.RegresaFecha(oActa.GetFechaEntrante())%>">&nbsp;<img src="<%=sPath%>Images/Fecha.gif" align="top" border=0 onclick="fPopCalendar(sFechaEntrante, sFechaEntrante)"></td>
		</tr>
		<tr>
			<td class="Etiquetafrm">Testigo:</td>
			<td><input class="txtBox" name="sTestigoRecibe" id="sTestigoRecibe" type="Text" size="55" maxlength="50" value="<%=oActa.GetTestigoRecibe()%>"></td>
		</tr>
		<tr>
			<td class="Etiquetafrm">Unidad Admva. Testigo:</td>
			<td><input class="txtBox" name="sUnidadTestigoRecibe" id="sUnidadTestigoRecibe" type="Text" size="55" maxlength="50" value="<%=oActa.GetUnidadTestigoRecibe()%>"></td>
		</tr>
		<tr>
			<td class="Etiquetafrm">Puesto Testigo:</td>
			<td><input class="txtBox" name="sPuestoTestigoRecibe" id="sPuestoTestigoRecibe" type="Text" size="55" maxlength="50" value="<%=oActa.GetPuestoTestigoRecibe()%>"></td>
		</tr>
		<tr>
			<td class="Etiquetafrm">Domicilio Particular Testigo:</td>
			<td><input class="txtBox" name="sDireccionTestigoRecibe" id="sDireccionTestigoRecibe" type="Text" size="55" maxlength="100" value="<%=oActa.GetDireccionTestigoRecibe()%>"></td>
		</tr>
		<tr>
			<td colspan="2" class="TituloMenu">Datos de la Secretaría de Contraloría</td>
		</tr>
		<tr>
			<td class="Etiquetafrm">Nombre del Representante:</td>
			<td><input class="txtBox" name="sResponsableSecretaria" id="sResponsableSecretaria" type="Text" size="55" maxlength="50" value="<%=oActa.GetResponsableSecretaria()%>"></td>
		</tr>
		<tr>
			<td class="Etiquetafrm">Puesto del Representante:</td>
			<td><input class="txtBox" name="sPuestoRepresentante" id="sPuestoRepresentante" type="Text" size="55" maxlength="50" value="<%=oActa.GetPuestoRepresentante()%>"></td>
		</tr>
		<tr>
			<td colspan="2" class="TituloMenu">Datos del Funcionario que Expide el Nombramiento</td>
		</tr>
		<tr>
			<td class="Etiquetafrm">Nombre:</td>
			<td><input class="txtBox" name="sNombreExpide" id="sNombreExpide" type="Text" size="55" maxlength="100" value="<%=oActa.GetNombreExpide()!=null?oActa.GetNombreExpide():""%>"></td>
		</tr>
		<tr>
			<td class="Etiquetafrm">Puesto:</td>
			<td><input class="txtBox" name="sPuestoExpide" id="sPuestoExpide" type="Text" size="55" maxlength="100" value="<%=oActa.GetPuestoExpide()!=null?oActa.GetPuestoExpide():""%>"></td>
		</tr>
		<%if (iTipoActa.equals("2")) {%>
		<tr><td align="center" colspan="2" class="TituloMenu">Responsables de Área</td></tr>
		<tr><td colspan="2"><textarea class="txtBox" name="sObservaciones" id="sObservaciones" rows="25" cols="90"><%=oActa.GetObservaciones()%></textarea></td></tr>
		<%} else {%>
			<input type="Hidden" name="sObservaciones" id="sObservaciones" value="">
		<%}%>
	</table>
	<br>
	<table align="center" border=0 cellPadding=0 cellSpacing=0 width="600">
		<tr>
			<td align="center" class="TituloParrafo">&nbsp;&nbsp;ACTA ADMINISTRATIVA DE ENTREGA - RECEPCIÓN&nbsp;&nbsp;</td>
			<td align="right">
				<%if(iTipoUsuario != oUsuario.GetTipoRepresentante()) {%>
				<input class="boton" onclick="save();" 	name="SAVE" 	type="button" value=" Grabar "  >&nbsp;
				<%}%>
			</td>
		</tr>
	</table>
<%} else {%>
<br>&nbsp;<br>&nbsp;<br>&nbsp;
<div align =center><input class="boton" onclick="preActa();" 	name="preliminar" 	type="button" value=" Vista Preliminar "  >&nbsp;</div>
<%}%>
<%}%>
</form></td>


<!-- Contenido -->
</tr>
</table>
<%@include file="Footer.jsp"%>
<!--ESTA ES LA ACTUALIZACION DEL 25-03-2003-->
</body>
</html>
