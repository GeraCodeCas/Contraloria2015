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

java.text.DecimalFormat myFormatter = new java.text.DecimalFormat("###,##0.00");
int	iPagina = request.getParameter("iPagina")!= null ? java.lang.Integer.parseInt(request.getParameter("iPagina")): 1;

Anexo3IV1 oAnexo3IV1 	= new Anexo3IV1();
int iIdAnexo = oAnexo3IV1.GetIdAnexo();

UnidadGobierno oUnidadGobierno = new UnidadGobierno();
UnidadAdministrativa oUnidadAdministrativa = new UnidadAdministrativa();

%>
<%@include file="..\Operation\fAnexoInicia.jsp"%>


<html>
<head>
	<title>Entrega - Recepción : Anexo III.4.1</title>
<link rel="stylesheet" type="text/css" href="<%=sPath%>Styles/Gobierno.css">
<script language="JavaScript" src="<%=sPath%>Scripts/Libreria.js"></script>
<script language="JavaScript" src="<%=sPath%>Scripts/Gobierno.js"></script>

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
<FORM action="pAnexo3IV1RH.jsp" name="forma" method="post" >
	<input type="hidden" name="sOpcion" value="">
	<input type="hidden" name="sCodigo" value="<%=sCodigo%>">
	<TABLE align=center border=0 cellPadding=0 cellSpacing=0 width="100%">
		<TR>
			<td colspan="3" class="TituloParrafo" width="100%">&nbsp;&nbsp;ANEXO III.4.1 - PLANTILLA DE PERSONAL</td>
		</TR>
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
				<a onmouseover="this.style.cursor='hand'" style="cursor:normal" onclick="imprimirUnidad('<%=selUAdministrativa%>', '../Operation/iAnexo3IV1.jsp', 'H');"><img alt="Imprimir Anexo" src="<%=sPath%>Images/Impresora.jpg" ></a>&nbsp;&nbsp;
				<a onmouseover="this.style.cursor='hand'" style="cursor:normal" onclick="ayuda('../Help/aAnexo3IV1.htm');"><img alt="Ayuda" src="<%=sPath%>Images/Ayuda.jpg" ></a>
			</td>
			<td align=right><%//AGREGADO POR VALIDACION ESTATUS
	oAnexo3IV1.GetAllRH(selUAdministrativa, iItemsPagina, iPagina); 
	long iAllCount = oAnexo3IV1.GetAllCount();
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
		<TR align="middle">
			<td rowspan="2" class="TituloMenu">&nbsp;</td>
			<td rowspan="2" class="TituloMenu">Nombre</td>
			<td rowspan="2" class="TituloMenu">Puesto</td>
			<td rowspan="2" class="TituloMenu">Categoría</td>
			<td rowspan="2" class="TituloMenu">Adscripción</td>
			<td colspan="3" class="TituloMenu">Tipo de Plaza</td>
			<td colspan="4" class="TituloMenu">Percepción Mensual</td>
			<td rowspan="2" class="TituloMenu">Observaciones</td>  
			<td rowspan="2" class="TituloMenu">Tipo de Nómina</td>  
		</TR>
		<TR>
			<td class="TituloMenu">Base</td>
			<td class="TituloMenu">Extr.</td>
			<td class="TituloMenu">Event.</td>
			<td class="TituloMenu" align="center">Sueldo Base</td>
			<td class="TituloMenu" align="center">Compensación</td>
			<td class="TituloMenu" align="center">Otras Prestaciones</td>
			<td class="TituloMenu" align="center">Total</td>
		</TR><%
		TipoNomina oTipoNomina = new TipoNomina();
		if(sOpcion.equals("NEW")){
			oFuncionario.GetUAdministrativa(selUAdministrativa); %>
		<TR align="middle">
			<td><input type="hidden" name="sIdFuncionario" id="sIdFuncionario" value="<%=oFuncionario.GetIdFuncionario()%>"></td>
			<td><INPUT class="txtBox" name="sNombre" id="sNombre" type="Text" size="20" value="" maxlength="50" onKeyPress="isInValid();" onpaste="validaPasteStr(this);"></td>
      		<td><INPUT class="txtBox" name="sPuesto" id="sPuesto" type="Text" size="20" value="" maxlength="100" onKeyPress="isInValid();" onpaste="validaPasteStr(this);"></td>
			<td><INPUT class="txtBox" name="sCategoria" id="sCategoria" type="Text" size="20" value="" maxlength="50" onKeyPress="isInValid();" onpaste="validaPasteStr(this);"></td>
			<td><INPUT class="txtBox" name="sAdscripcion" id="sAdscripcion" type="Text" size="20" value="" maxlength="50" onKeyPress="isInValid();" onpaste="validaPasteStr(this);"></td>
			<td align="center"><INPUT name="sTipoPlaza" id="sTipoPlaza" type="radio" value="1" checked></td>
			<td align="center"><INPUT name="sTipoPlaza" id="sTipoPlaza" type="radio" value="2"></td>
			<td align="center"><INPUT name="sTipoPlaza" id="sTipoPlaza" type="radio" value="3"></td>
			<td><INPUT class="txtNumeric" name="sSueldoBase" id="sSueldoBase" type="Text" size="10" value="" maxlength="20" onkeypress="valida(this);" onpaste="return validaPasteNum(this);"></td>
			<td><INPUT class="txtNumeric" name="sCompensacion" id="sCompensacion" type="Text" size="10" value="" maxlength="20" onkeypress="valida(this);" onpaste="return validaPasteNum(this);"></td>
			<td><INPUT class="txtNumeric" name="sOtrasPrestaciones" id="sOtrasPrestaciones" type="Text" size="10" value="" maxlength="20" onkeypress="valida(this);" onpaste="return validaPasteNum(this);"></td>
			<td><INPUT class="txtNumeric" name="sTotal" id="sTotal" type="Text" size="10" value="" maxlength="20" onkeypress="valida(this);" onpaste="return validaPasteNum(this);"></td>
			<td><INPUT class="txtBox" name="sObservaciones" id="sObservaciones" type="Text" size="20" value="" maxlength="255" onKeyPress="isInValid();" onpaste="validaPasteStr(this);"></td>
			<td><SELECT class="cmbBox" name="sClaveTipoNomina" id="sTipoNomina"><%
				for(int j=0;j<oTipoNomina.GetAll().getNumRows();j++){%>
				<OPTION value="<%=oTipoNomina.GetClave(j)%>"><%=oTipoNomina.GetDescripcion(j)%></OPTION><%
				}%>
			</SELECT></td>
		</TR><%
		}
		int intContador = 0;
		String sBackColor = "";

		long iTotalPaginas = ((iAllCount / iItemsPagina) * iItemsPagina) == iAllCount ? (iAllCount / iItemsPagina) : (iAllCount / iItemsPagina) + 1;
		if(iTotalPaginas<iPagina){ iPagina = java.lang.Integer.parseInt(iTotalPaginas+"") ; }
		if(iPagina==0){iPagina=1;}
		//out.println("selUAdministrativa:" + selUAdministrativa);
		for(int i=0;i<oAnexo3IV1.GetAllRH(selUAdministrativa, iItemsPagina, iPagina);i++){
			String vIdRenglon			= oAnexo3IV1.GetIdRenglon(i)!=-1?oAnexo3IV1.GetIdRenglon(i)+"":"0";
			String vPuesto				= oAnexo3IV1.GetPuesto(i)!=null?oAnexo3IV1.GetPuesto(i):"";
			String vNombre				= oAnexo3IV1.GetNombre(i)!=null?oAnexo3IV1.GetNombre(i):"";
			String vCategoria			= oAnexo3IV1.GetCategoria(i)!=null?oAnexo3IV1.GetCategoria(i):"";
			String vAdscripcion			= oAnexo3IV1.GetAdscripcion(i)!=null?oAnexo3IV1.GetAdscripcion(i):"";
			String vTipoPlaza			= oAnexo3IV1.GetTipoPlaza(i)!=null?oAnexo3IV1.GetTipoPlaza(i):"";
			String vSueldoBase			= oAnexo3IV1.GetSueldoBase(i);
			String vCompensacion		= oAnexo3IV1.GetCompensacion(i);
			String vOtrasPrestaciones	= oAnexo3IV1.GetOtrasPrestaciones(i);
			String vTotal				= oAnexo3IV1.GetTotal(i);
			
			String vObservaciones		= oAnexo3IV1.GetObservaciones(i)!=null?oAnexo3IV1.GetObservaciones(i):"";
			String vTipoNomina			= oAnexo3IV1.GetClaveTipoNomina(i);
			
			String sDescNomina = oTipoNomina.GetPosClave(vTipoNomina)>=0?oTipoNomina.GetDescripcion(oTipoNomina.GetPosClave(vTipoNomina)):"";
			
			
			intContador = intContador + 1;
			if (intContador%2 == 0)	{sBackColor = "#ffffff";}
			else					{sBackColor = "#eeeeee";}
			if(sOpcion.equals("EDIT") && sCodigo.equals(vIdRenglon+"") ){%>
		<TR align="left" bgcolor="<%=sBackColor%>">
			<td><input type="hidden" name="sIdFuncionario" id="sIdFuncionario" value="<%=oAnexo3IV1.GetIdFuncionario(i)%>"></td>
			<td><INPUT class="txtBox" name="sNombre" id="sNombre" type="Text" size="20" value="<%=vNombre%>" maxlength="50" onKeyPress="isInValid();" onpaste="validaPasteStr(this);"></td>
      		<td><INPUT class="txtBox" name="sPuesto" id="sPuesto" type="Text" size="20" value="<%=vPuesto%>" maxlength="100" onKeyPress="isInValid();" onpaste="validaPasteStr(this);"></td>
			<td><INPUT class="txtBox" name="sCategoria" id="sCategoria" type="Text" size="20" value="<%=vCategoria%>" maxlength="50" onKeyPress="isInValid();" onpaste="validaPasteStr(this);"></td>
			<td><INPUT class="txtBox" name="sAdscripcion" id="sAdscripcion" type="Text" size="20" value="<%=vAdscripcion%>" maxlength="50" onKeyPress="isInValid();" onpaste="validaPasteStr(this);"></td>
			<td><INPUT name="sTipoPlaza" id="sTipoPlaza" type="radio" <%if(vTipoPlaza.equals("1")){%>checked<%}%> value="1"></td>
			<td><INPUT name="sTipoPlaza" id="sTipoPlaza" type="radio" <%if(vTipoPlaza.equals("2")){%>checked<%}%> value="2"></td>
			<td><INPUT name="sTipoPlaza" id="sTipoPlaza" type="radio" <%if(vTipoPlaza.equals("3")){%>checked<%}%> value="3"></td>
			<td><INPUT class="txtNumeric" name="sSueldoBase" id="sSueldoBase" type="Text" size="10" value="<%=vSueldoBase%>" maxlength="20" onkeypress="valida(this);" onpaste="return validaPasteNum(this);"></td>
			<td><INPUT class="txtNumeric" name="sCompensacion" id="sCompensacion" type="Text" size="10" value="<%=vCompensacion%>" maxlength="20" onkeypress="valida(this);" onpaste="return validaPasteNum(this);"></td>
			<td><INPUT class="txtNumeric" name="sOtrasPrestaciones" id="sOtrasPrestaciones" type="Text" size="10" value="<%=vOtrasPrestaciones%>" maxlength="20" onkeypress="valida(this);" onpaste="return validaPasteNum(this);"></td>
			<td><INPUT class="txtNumeric" name="sTotal" id="sTotal" type="Text" size="10" value="<%=vTotal%>" maxlength="20" onkeypress="valida(this);" onpaste="return validaPasteNum(this);"></td>
			<td><INPUT class="txtBox" name="sObservaciones" id="sObservaciones" type="Text" size="20" value="<%=vObservaciones%>" maxlength="255" onKeyPress="isInValid();" onpaste="validaPasteStr(this);"></td>
			<td><SELECT class="cmbBox" name="sClaveTipoNomina" id="sTipoNomina"><%
				for(int j=0;j<oTipoNomina.GetAll().getNumRows();j++){%>
				<OPTION value="<%=oTipoNomina.GetClave(j)%>" <%=vTipoNomina.equals(oTipoNomina.GetClave(j))?"selected":""%>><%=oTipoNomina.GetDescripcion(j)%></OPTION><%
				}%>
			</SELECT>
			</td>
		</TR><%
			} else {%>
		<TR align="left" bgcolor="<%=sBackColor%>" onMouseOver = "MouseDentro(this);this.style.cursor='hand';" onMouseOut="MouseFuera(this,'<%=sBackColor%>');" style="cursor:normal">
			<td onClick="del(<%=vIdRenglon%>);"><img src="<%=sPath%>Images/Eliminar.gif"><%
			try{				vSueldoBase	= myFormatter.format(new Double(null!=oAnexo3IV1.GetSueldoBase(i)    &&!oAnexo3IV1.GetSueldoBase(i).equals("")?oAnexo3IV1.GetSueldoBase(i):"0"));}
			catch(Throwable e){	vSueldoBase = oAnexo3IV1.GetSueldoBase(i);	}
			
			try{				vCompensacion = myFormatter.format(new Double(null!=oAnexo3IV1.GetCompensacion(i)  &&!oAnexo3IV1.GetCompensacion(i).equals("")?oAnexo3IV1.GetCompensacion(i):"0"));}
			catch(Throwable e){vCompensacion = oAnexo3IV1.GetCompensacion(i);	}
			
			try{				vOtrasPrestaciones = myFormatter.format(new Double(null!=oAnexo3IV1.GetOtrasPrestaciones(i)&&!oAnexo3IV1.GetOtrasPrestaciones(i).equals("")?oAnexo3IV1.GetOtrasPrestaciones(i):"0"));}
			catch(Throwable e){vOtrasPrestaciones = oAnexo3IV1.GetOtrasPrestaciones(i);	}
			
			try{				vTotal = myFormatter.format(new Double(null!=oAnexo3IV1.GetTotal(i)&&!oAnexo3IV1.GetTotal(i).equals("")?oAnexo3IV1.GetTotal(i):"0"));}
			catch(Throwable e){	vTotal = oAnexo3IV1.GetTotal(i); }
			%>
			</td>
			<td onClick="edit('<%=vIdRenglon%>');">&nbsp;<%=vNombre%></td>
			<td onClick="edit('<%=vIdRenglon%>');">&nbsp;<%=vPuesto%></td>
			<td onClick="edit('<%=vIdRenglon%>');">&nbsp;<%=vCategoria%></td>
			<td onClick="edit('<%=vIdRenglon%>');">&nbsp;<%=vAdscripcion%></td>
			<td onClick="edit('<%=vIdRenglon%>');" align="center">&nbsp;<%if(vTipoPlaza.equals("1")){%><img src="<%=sPath%>/Images/VinetaGde.gif"><%}%></td>
			<td onClick="edit('<%=vIdRenglon%>');" align="center">&nbsp;<%if(vTipoPlaza.equals("2")){%><img src="<%=sPath%>/Images/VinetaGde.gif"><%}%></td>
			<td onClick="edit('<%=vIdRenglon%>');" align="center">&nbsp;<%if(vTipoPlaza.equals("3")){%><img src="<%=sPath%>/Images/VinetaGde.gif"><%}%></td>
			<td onClick="edit('<%=vIdRenglon%>');" align="right">&nbsp;<%=vSueldoBase%></td>
			<td onClick="edit('<%=vIdRenglon%>');" align="right">&nbsp;<%=vCompensacion%></td>
			<td onClick="edit('<%=vIdRenglon%>');" align="right">&nbsp;<%=vOtrasPrestaciones%></td>
			<td onClick="edit('<%=vIdRenglon%>');" align="right">&nbsp;<%=vTotal%></td>
			<td onClick="edit('<%=vIdRenglon%>');">&nbsp;<%=vObservaciones%></td>
			<td onClick="edit('<%=vIdRenglon%>');">&nbsp;<%=sDescNomina%></td>
			</td>
		</TR><%
			}
		}%>
	</TABLE>
<!-- Paginación--><%
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
</td>
	<!-- Contenido -->
</tr>
</table>
<%@include file="Footer.jsp"%>
</body>
</html>
