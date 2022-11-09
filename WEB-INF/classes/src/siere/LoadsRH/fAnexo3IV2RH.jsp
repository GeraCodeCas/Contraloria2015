<%/*********************************************************************************************************
Elaboro:	Julio Enrique Espinosa Torres
Lugar:		Monterrey, NL
Fecha:		29.Oct.2002
Compañia:	CONSISS*/%>
<%@page import="com.consiss.util.tools.*"%>
<%@page import="com.gob.*"%>
<%@page import="java.util.*" %>
<%
//Valida la permanencia del usuario en session
if ((String)session.getValue("ok")!="ConsissRH")	response.sendRedirect("../Operation/Error.html");

String	sOpcion = request.getParameter("sOpcion")!= null ? request.getParameter("sOpcion"): "";
String	sCodigo = request.getParameter("sCodigo")!= null ? request.getParameter("sCodigo"): "";
int	selDependencia = java.lang.Integer.parseInt(
	request.getParameter("selDependencia")!= null ? request.getParameter("selDependencia"): "0");
int	selUAdministrativa = java.lang.Integer.parseInt(
	request.getParameter("selUAdministrativa")!= null ? request.getParameter("selUAdministrativa"): "0");

int	iPagina = request.getParameter("iPagina")!= null ? java.lang.Integer.parseInt(request.getParameter("iPagina")): 1;

Anexo3IV2 oAnexo3IV2 	= new Anexo3IV2();
int iIdAnexo = oAnexo3IV2.GetIdAnexo();

UnidadGobierno oUnidadGobierno = new UnidadGobierno();
UnidadAdministrativa oUnidadAdministrativa = new UnidadAdministrativa();
%>
<%@include file="..\Operation\fAnexoInicia.jsp"%>
<html>
<head>
	<title>Entrega - Recepción : Anexo III.4.2</title>
<link rel="stylesheet" type="text/css" href="<%=sPath%>Styles/Gobierno.css">
<script language="JavaScript" src="<%=sPath%>Scripts/Libreria.js"></script>
<script language="JavaScript" src="<%=sPath%>Scripts/Gobierno.js"></script>
<script language="JavaScript" src="<%=sPath%>Scripts/Calendario.js"></script>

<script language="JavaScript">
	function edit(pCODE){
		document.forma.sCodigo.value = pCODE;
 		document.forma.sOpcion.value = 'EDIT';
   		document.forma.submit();
	 }
	
	function save(){
		document.forma.sOpcion.value = 'SAVE';
		document.forma.submit();
	 }
	
	function cancel(){
	   document.forma.sCodigo.value = 0;
	   document.forma.sOpcion.value = 'NORMAL';
	   document.forma.submit();
	}
	function irPag(pPagina){
		document.forma.iPagina.value = pPagina;
		document.forma.sOpcion.value = 'NORMAL';
		document.forma.submit();
	}
	function news() {
		document.forma.sCodigo.value = 0;
		document.forma.sOpcion.value = 'NEW';
		document.forma.submit();
	}
	
	function del(pCODE){
	   if(confirm("¿Desea Eliminar el Registro?")){ 
		    document.forma.sCodigo.value = pCODE;
		    document.forma.sOpcion.value = 'DEL';
			document.forma.submit();
	   }
	}
	function delAll(){
	   if(confirm("¿Desea Eliminar Todo el contenido de este Anexo?")){ 
		    document.forma.sOpcion.value = 'DELALL';
			document.forma.submit();
	   }
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
		document.forma.selUAdministrativa.options[document.forma.selUAdministrativa.length] = nuevaOption;
	}
	if(document.forma.selUAdministrativa.length > 0 ) { document.forma.selUAdministrativa.options[0].selected = true; }
}

function limpiaCombo(){
	while (document.forma.selUAdministrativa.length > 0 ) {
		document.forma.selUAdministrativa.options[document.forma.selUAdministrativa.length-1] = null;  
	
	}
}

function chgUAdministrativa(){
	document.forma.submit();
}
</script>
</head>

<body topmargin="0" leftmargin="0">
<table border="0" cellspacing="0" cellpadding="0" width="100%">
<!-- Encabezado -->
<tr>
<td colspan="3"><%@include file="Header.jsp"%></td>
<tr>
<!-- Encabezado -->
<tr>
	<!-- Menu -->
	<td width="135" valign="top"><%@include file="MenuRH.jsp"%></td>
	<!-- Menu -->
	<td width="2px" valign="top" class="TextoOculto">.</td>
	<!-- Contenido -->
	<td valign="top" width="100%">
<FORM action="pAnexo3IV2RH.jsp" name="forma" method="post" >
	<input type="hidden" name="sOpcion" value="">
	<input type="hidden" name="sCodigo" value="<%=sCodigo%>"> 
	<TABLE align=center border=0 cellPadding=0 cellSpacing=0 width="100%">
		<TR>
			<TD  colspan="3" class="TituloParrafo" width="70%">&nbsp;&nbsp;ANEXO III.4.2 - PERSONAL CON LICENCIA, PERMISO O COMISIÓN</TD>
		</TR>
		<TR>
		<tr>
			<td><b>Dependencia:</b></td>
			<td>
				<select class="cmbBox" name="selDependencia" onchange="chgUGobierno(this.selectedIndex);">
					<option title="0:[ SELECCIONE ];" value="0"> [ SELECCIONE ] </option><%
				String sPaso = "";
				int oIdUnidadGobiernoIni = 0;
				for(int j=0;j<oUnidadGobierno.GetAll('1').getNumRows();j++){
					oIdUnidadGobiernoIni	= oUnidadGobierno.GetIdUnidadGobierno(0);
					int oIdUnidadGobierno	= oUnidadGobierno.GetIdUnidadGobierno(j);
					String oNombre 			= oUnidadGobierno.GetNombre(j);
					sPaso			= "0:[ SELECCIONE ];";
					for(int k=0;k<oUnidadAdministrativa.GetAll();k++){
						if(oUnidadAdministrativa.GetIdUnidadGobierno(k)==oIdUnidadGobierno){
							int oIdUnidadAdministrativa	= oUnidadAdministrativa.GetIdUnidadAdministrativa(k);
							sPaso						= sPaso + oIdUnidadAdministrativa + ":" + oUnidadAdministrativa.GetNombre(k) + ";";
						}
					}%>
					<option title="<%=sPaso%>" value="<%=oIdUnidadGobierno%>"<%=selDependencia==oIdUnidadGobierno?" selected":""%>><%=oNombre%></option><%
				}%>
				</select>
			</td>
		</tr>
		<tr>
			<td><b>Unidad Administrativa:<b></td>
			<td><select class="cmbBox" name="selUAdministrativa" onchange="chgUAdministrativa();">
					<option value="0">[ SELECCIONE ]</option><%
					oIdUnidadGobiernoIni = selDependencia == 0?oIdUnidadGobiernoIni:selDependencia;
					for(int k=0;k<oUnidadAdministrativa.GetAll();k++){
						if(oUnidadAdministrativa.GetIdUnidadGobierno(k)==oIdUnidadGobiernoIni){
							int oIdUnidadAdministrativa	= oUnidadAdministrativa.GetIdUnidadAdministrativa(k);
							String oNombre 				= oUnidadAdministrativa.GetNombre(k);%>
						<option value="<%=oIdUnidadAdministrativa%>" <%=selUAdministrativa==oIdUnidadAdministrativa?"selected":""%>><%=oNombre%></option><%
						}
					}%>
				</select>
			</td>
			<td>
				<a onmouseover="this.style.cursor='hand'" style="cursor:normal" onclick="delAll();"><img alt="Elimina Anexo" src="<%=sPath%>Images/Eliminar.jpg"></a>&nbsp;&nbsp;
				<a onmouseover="this.style.cursor='hand'" style="cursor:normal" onclick="imprimirUnidad('<%=selUAdministrativa%>', '../Operation/iAnexo3IV2.jsp', 'H');"><img alt="Imprimir Anexo" src="<%=sPath%>Images/Impresora.jpg" ></a>&nbsp;&nbsp;
				<a onmouseover="this.style.cursor='hand'" style="cursor:normal" onclick="ayuda('../Help/aAnexo3IV1.htm');"><img alt="Ayuda" src="<%=sPath%>Images/Ayuda.jpg" ></a>
			</td>
			<td align=right><%//AGREGADO POR VALIDACION ESTATUS
	oAnexo3IV2.GetAllRH(selUAdministrativa, iItemsPagina, iPagina); 
	long iAllCount = oAnexo3IV2.GetAllCount();
	if(sOpcion.equals("SAVE") || sOpcion.equals("NORMAL") || sOpcion.equals("") || (iAllCount == 0 && (!sOpcion.equals("NEW")))) {%>
			<INPUT class="boton" type="button" onclick="news();" name="NEW" value="Nuevo">&nbsp;<%	
	} else {%>	
			<INPUT class="boton" type="button" onclick="cancel();" name="CANCEL" value="Cancelar">&nbsp;
			<INPUT class="boton" type="button" onclick="save();" name="SAVE" value="Grabar">&nbsp;<%
	}%>
			</td>
		</TR>
	</TABLE>
	<!-- Datos que se agregaran a la tabla  -->
		
	<TABLE cellPadding="0" cellSpacing="0" width="100%" BORDER="1" BORDERCOLOR="white">
	<!-- Etiqueta donde se aplican los encabezados de las tablas-->
		<TR align="center" valign="middle">
			<td class="TituloMenu" rowspan="2">&nbsp;</td>
			<td class="TituloMenu" rowspan="2">Nómina</TD>
			<td class="TituloMenu" rowspan="2">Nombre</TD>
			<td class="TituloMenu" rowspan="2">Situación</TD>
			<td class="TituloMenu" colspan="2">Comisionado</td>
			<td class="TituloMenu" colspan="2">Período</td>
			<td class="TituloMenu" rowspan="2">Observaciones</TD>
			<td class="TituloMenu" rowspan="2">Tipo de Nómina</td>
		</TR>
		<tr align="center">
			<td class="TituloMenu">De</td>
			<td class="TituloMenu">A</td>
			<td class="TituloMenu">De</td>
			<td class="TituloMenu">A</td>
		</tr><%
		TipoNomina oTipoNomina = new TipoNomina();
		if(sOpcion.equals("NEW")){
			oFuncionario.GetUAdministrativa(selUAdministrativa); %>
		<TR align="middle">
        	<TD><input type="hidden" name="sIdFuncionario" id="sIdFuncionario" value="<%=oFuncionario.GetIdFuncionario()%>"></TD>
			<td><INPUT class="txtBox" name="sNomina" id="sNomina" type="Text" size="20" value=""  maxlength="20" onKeyPress="isInValid();" onpaste="validaPasteStr(this);"></TD>
			<td><INPUT class="txtBox" name="sNombre" id="sNombre" type="Text" size="20" value=""  maxlength="50" onKeyPress="isInValid();" onpaste="validaPasteStr(this);"></TD>
			<TD><select class="cmbBox" name="sSituacion">
					<option value="L" selected>LICENCIA</option>
					<option value="P">PERMISO</option>
					<option value="C">COMISIÓN</option>
				</select></TD>
			<TD><INPUT class="txtBox" name="sDeComisionado" id="sDeComisionado" type="Text" size="9" maxlength="50" value="" onKeyPress="isInValid();" onpaste="validaPasteStr(this);"></td>
			<td><INPUT class="txtBox" name="sAComisionado" id="sAComisionado" type="Text" size="9" maxlength="50" value="" onKeyPress="isInValid();" onpaste="validaPasteStr(this);"></td>
			<TD><INPUT class="txtBox" name="sFechaDePeriodo" id="sFechaDePeriodo" type="Text" size="9" maxlength="10" value="" readonly>&nbsp;<img src="<%=sPath%>Images/Fecha.gif" align="top" border=0 onclick="fPopCalendar(sFechaDePeriodo,sFechaDePeriodo)"></td>
			<td><INPUT class="txtBox" name="sFechaAPeriodo" id="sFechaAPeriodo" type="Text" size="9" maxlength="10" value="" readonly>&nbsp;<img src="<%=sPath%>Images/Fecha.gif" align="top" border=0 onclick="fPopCalendar(sFechaAPeriodo,sFechaAPeriodo)"></td>
			<TD><INPUT class="txtBox" name="sObservaciones" id="sObservaciones" type="Text" size="30"  value="" maxlength="255" onKeyPress="isInValid();" onpaste="validaPasteStr(this);"></TD>
			<TD><SELECT class="cmbBox" name="sClaveTipoNomina" id="sTipoNomina"><%
				for(int j=0;j<oTipoNomina.GetAll().getNumRows();j++){%>
				<OPTION value="<%=oTipoNomina.GetClave(j)%>"><%=oTipoNomina.GetDescripcion(j)%></OPTION><%
				}%>
			</SELECT></TD>
		</TR><%
		}
		int intContador = 0;
		String sBackColor = "";

		long iTotalPaginas = ((iAllCount / iItemsPagina) * iItemsPagina) == iAllCount ? (iAllCount / iItemsPagina) : (iAllCount / iItemsPagina) + 1;
		if(iTotalPaginas<iPagina){ iPagina = java.lang.Integer.parseInt(iTotalPaginas+"") ; }
		if(iPagina==0){iPagina=1;}
		for(int i=0;i<oAnexo3IV2.GetAllRH(iIdFuncionario, iItemsPagina, iPagina);i++){
			String vIdRenglon		= oAnexo3IV2.GetIdRenglon(i)!=-1?oAnexo3IV2.GetIdRenglon(i)+"":"0";
			String vNomina			= oAnexo3IV2.GetNomina(i)!=null?oAnexo3IV2.GetNomina(i):"";
			String vNombre			= oAnexo3IV2.GetNombre(i)!=null?oAnexo3IV2.GetNombre(i):"";
			String vSituacion		= oAnexo3IV2.GetSituacion(i)!=null?oAnexo3IV2.GetSituacion(i):"";
			String vDeComisionado	= oAnexo3IV2.GetDeComisionado(i)!=null?oAnexo3IV2.GetDeComisionado(i):"";
			String vAComisionado	= oAnexo3IV2.GetAComisionado(i)!=null?oAnexo3IV2.GetAComisionado(i):"";
			String vFechaDePeriodo	= oAnexo3IV2.GetFechaDePeriodo(i)!=null?oAnexo3IV2.GetFechaDePeriodo(i):"";
			String vFechaAPeriodo	= oAnexo3IV2.GetFechaAPeriodo(i)!=null?oAnexo3IV2.GetFechaAPeriodo(i):"";
			String vObservaciones	= oAnexo3IV2.GetObservaciones(i)!=null?oAnexo3IV2.GetObservaciones(i):"";
			String vTipoNomina		= oAnexo3IV2.GetClaveTipoNomina(i);
			
			String sDescNomina = oTipoNomina.GetPosClave(vTipoNomina)>=0?oTipoNomina.GetDescripcion(oTipoNomina.GetPosClave(vTipoNomina)):"";
			
			intContador = intContador + 1;
			if (intContador%2 == 0)	{sBackColor = "#ffffff";}
			else					{sBackColor = "#eeeeee";}
			if(sOpcion.equals("EDIT") && sCodigo.equals(vIdRenglon+"") ){%>
		<TR align="left" bgcolor="<%=sBackColor%>">
			<TD><input type="hidden" name="sIdFuncionario" id="sIdFuncionario" value="<%=oAnexo3IV2.GetIdFuncionario(i)%>"></TD>
			<td><INPUT class="txtBox" name="sNomina" id="sNomina" type="Text" size="20" value="<%=vNomina%>" maxlength="20" onKeyPress="isInValid();" onpaste="validaPasteStr(this);"></TD>
			<td><INPUT class="txtBox" name="sNombre" id="sNombre" type="Text" size="20" value="<%=vNombre%>" maxlength="50" onKeyPress="isInValid();" onpaste="validaPasteStr(this);"></TD>
			<TD><select class="cmbBox" name="sSituacion">
					<option value="L" <%if(vSituacion.equals("L")){%>selected<%}%>>LICENCIA</option>
					<option value="P" <%if(vSituacion.equals("P")){%>selected<%}%>>PERMISO</option>
					<option value="C" <%if(vSituacion.equals("C")){%>selected<%}%>>COMISIÓN</option>
				</select></TD>
			<TD><INPUT class="txtBox" name="sDeComisionado" id="sDeComisionado" type="Text" size="9" maxlength="50" value="<%=vDeComisionado%>" onKeyPress="isInValid();" onpaste="validaPasteStr(this);"></td>
			<td><INPUT class="txtBox" name="sAComisionado" id="sAComisionado" type="Text" size="9" maxlength="50" value="<%=vAComisionado%>" onKeyPress="isInValid();" onpaste="validaPasteStr(this);"></td>
			<TD><INPUT class="txtBox" name="sFechaDePeriodo" id="sFechaDePeriodo" type="Text" size="9" maxlength="10" value="<%=vFechaDePeriodo%>" readonly>&nbsp;<img src="<%=sPath%>Images/Fecha.gif" align="top" border=0 onclick="fPopCalendar(sFechaDePeriodo,sFechaDePeriodo)"></td>
			<td><INPUT class="txtBox" name="sFechaAPeriodo" id="sFechaAPeriodo" type="Text" size="9" maxlength="10" value="<%=vFechaAPeriodo%>" readonly>&nbsp;<img src="<%=sPath%>Images/Fecha.gif" align="top" border=0 onclick="fPopCalendar(sFechaAPeriodo,sFechaAPeriodo)"></td>
			<TD><INPUT class="txtBox" name="sObservaciones" id="sObservaciones" type="Text" size="30"  value="<%=vObservaciones%>" maxlength="255" onKeyPress="isInValid();" onpaste="validaPasteStr(this);"></TD>
			<TD><SELECT class="cmbBox" name="sClaveTipoNomina" id="sTipoNomina"><%
				for(int j=0;j<oTipoNomina.GetAll().getNumRows();j++){%>
				<OPTION value="<%=oTipoNomina.GetClave(j)%>" <%=vTipoNomina.equals(oTipoNomina.GetClave(j))?"selected":""%>><%=oTipoNomina.GetDescripcion(j)%></OPTION><%
				}%>
			</SELECT></TD>
		</TR><%
			} else {%>
		<TR align="left" bgcolor="<%=sBackColor%>" onMouseOver = "MouseDentro(this);this.style.cursor='hand';" onMouseOut="MouseFuera(this,'<%=sBackColor%>');" style="cursor:normal">
			<td onClick="del(<%=vIdRenglon%>);"><img src="<%=sPath%>Images/Eliminar.gif"></TD>
			<TD onClick="edit('<%=vIdRenglon%>');">&nbsp;<%=vNomina%></TD>
			<TD onClick="edit('<%=vIdRenglon%>');">&nbsp;<%=vNombre%></TD>
			<TD align="center">&nbsp;<%=vSituacion%></TD>
			<TD onClick="edit('<%=vIdRenglon%>');">&nbsp;<%=vDeComisionado%></td>
			<td onClick="edit('<%=vIdRenglon%>');">&nbsp;<%=vAComisionado%></td>
			<TD onClick="edit('<%=vIdRenglon%>');">&nbsp;<%=vFechaDePeriodo%></td>
			<td onClick="edit('<%=vIdRenglon%>');">&nbsp;<%=vFechaAPeriodo%></td>
			<TD onClick="edit('<%=vIdRenglon%>');">&nbsp;<%=vObservaciones%></TD>
			<td onClick="edit('<%=vIdRenglon%>');">&nbsp;<%=sDescNomina%></td>
		</TR><%
			}
		}%>
	<TR><td colspan="4" ></td><TD colspan="2" class="ContenidoParrafo">SITUACIÓN:</TD><td colspan="4"></td></TR>
	<TR><td colspan="4" ></td><TD colspan="2" class="ContenidoParrafo">L = LICENCIA</TD><td colspan="4" ></td></TR>
	<TR><td colspan="4" ></td><TD colspan="2" class="ContenidoParrafo">P = PERMISO</TD><td colspan="4" ></td></TR>
	<TR><td colspan="4" ></td><TD colspan="2" class="ContenidoParrafo">C = COMISION</TD><td colspan="4" ></td></TR>
	</TABLE><%
		if(iTotalPaginas>1){%>
	<TABLE cellPadding="0" cellSpacing="0" width="100%" BORDER="1" BORDERCOLOR="white">
		<TR><TD width="50%">&nbsp;</TD>
			<TD width="50%" align="right"><%
			String sSep = "<b>Pág: </b>";
			for(int i=1;i<=iTotalPaginas;i++){ 
				if(i!=iPagina){
					%><a onmouseover="this.style.cursor='hand'" onClick='irPag(<%=i%>);'><%=sSep + i%></a><%
				} else out.print(sSep + "<b><font size='2'>" + i + "</font></b>");
				sSep = ", ";
			}%>
			</TD>
		</TR>
	</TABLE><%
		}%>	
	<input type="hidden" name="iPagina" value="<%=iPagina%>"> 
</FORM>
</td>	<!-- Contenido -->
</tr>
</table>
<%@include file="Footer.jsp"%>
</body>
</html>
