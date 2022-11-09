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
if ((String)session.getValue("ok")!="Consiss")	response.sendRedirect("Error.html");

String	sOpcion = request.getParameter("sOpcion")!= null ? request.getParameter("sOpcion"): "";
String	sCodigo = request.getParameter("sCodigo")!= null ? request.getParameter("sCodigo"): "";

String	sOpt = request.getParameter("sOpt")!= null ? request.getParameter("sOpt"): "0";
java.text.DecimalFormat myFormatter = new java.text.DecimalFormat("###,##0.00");
int	iPagina = request.getParameter("iPagina")!= null ? java.lang.Integer.parseInt(request.getParameter("iPagina")): 1;

Anexo3IV1 oAnexo3IV1 	= new Anexo3IV1();
int iIdAnexo = oAnexo3IV1.GetIdAnexo();
%>
<%@include file="fAnexoInicia.jsp"%>
<html>
<head>
	<title>Entrega - Recepción : Anexo III.4.1</title>
<link rel="stylesheet" type="text/css" href="<%=sPath%>Styles/Gobierno.css">
<script language="JavaScript" src="<%=sPath%>Scripts/Libreria.js"></script>
<script language="JavaScript" src="<%=sPath%>Scripts/Gobierno.js"></script>
<script language="JavaScript" src="<%=sPath%>Scripts/Calendario.js"></script>
<script language="JavaScript">
	function edit(pCODE){
	<%//AGREGADO POR VALIDACION ESTATUS
	if(!bSoloLectura) { %>
			document.forma.sCodigo.value = pCODE;
	 		document.forma.sOpcion.value = 'EDIT';
			document.forma.sOpt.value = 1;
       		document.forma.submit();
		<%}%>
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
	    document.forma.sOpt.value = 1;
		document.forma.submit();
	}
	
	function del(pCODE){
	   if(confirm("¿Desea Eliminar el Registro?")){ 
		    document.forma.sCodigo.value = pCODE;
		    document.forma.sOpcion.value = 'DEL';
			document.forma.submit();
	   }
	}
	
	function Borra(){
		if(confirm("¿Desea Eliminar Todo el contenido de este Anexo?")){
			document.forma.sOpcion.value = 'DELALL';
			document.forma.submit();
		}
	}

</script>
</head>

<body topmargin="0" leftmargin="0" onfocus=fReload();>
<table border="0" cellspacing="0" cellpadding="0" width="100%">
<!-- Encabezado -->
<tr>
<td colspan="3"><%@include file="Header.jsp"%></td>
<tr>
<!-- Encabezado -->
<tr>
	<!-- Menu -->
	<td width="135" valign="top"><%@include file="Menu.jsp"%></td>
	<!-- Menu -->
	<td width="2px" valign="top" class="TextoOculto">.</td>
	<!-- Contenido -->
	<td valign="top" width="100%">
<FORM action="pAnexo3IV1.jsp" name="forma" method="post" >
	<input type="hidden" name="sOpcion" value="">
	<input type="hidden" name="sCodigo" value="<%=sCodigo%>">
	<input type="hidden" name="sOpt" value="<%=sOpt%>">  
	<TABLE align=center border=0 cellPadding=0 cellSpacing=0 width="100%">
		<tr>
		<td colspan="3" class="TituloParrafo" width="100%">&nbsp;&nbsp;ANEXO III.4.1 - PLANTILLA DE PERSONAL</td>
		</tr>
		<TR>
		<td width="70%">
		<%//AGREGADO POR VALIDACION ESTATUS
		if(!bSoloLectura) { %>
				Vacío: <input type="radio" name="sEstatus" value="1" <%=sEstatus.equals("1")?" checked":""%>>
				&nbsp;&nbsp;
				En Proceso: <input type="radio" name="sEstatus" value="2" <%=sEstatus.equals("2")?" checked":""%>>
				&nbsp;&nbsp;
				Lleno: <input type="radio" name="sEstatus" value="3" <%=sEstatus.equals("3")?" checked":""%>>
				<%if(iTipoUsuario == oUsuario.GetTipoFuncionario()) { %>
				Autorizado: <input type="radio" name="sEstatus" value="4" <%=sEstatus.equals("4")?" checked":""%>>
				<%}%>
		<%}
		//AGREGADO POR MENSAJES SOLO LECTURA (5)
		if( !sMensageEstatus.equals("") ) {
			out.println("<font class='TituloEstatus'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;" + sMensageEstatus + "</font>" );
		}%>
		</td>			
			<td align=right>
			<%//AGREGADO POR VALIDACION ESTATUS
			if(!bSoloLectura) { %>
			<a onmouseover="this.style.cursor='hand'" style="cursor:normal" onclick="Carga('<%=iIdFuncionario%>','<%=iIdAnexo%>', 'cAnexo3IV1.jsp');"><img alt="Carga Masiva" src="<%=sPath%>Images/Carga.jpg"></a>&nbsp;&nbsp;
				<a onmouseover="this.style.cursor='hand'" style="cursor:normal" onclick="Undo();"><img alt="Deshace ultima Carga" src="<%=sPath%>Images/Undo.jpg"></a>&nbsp;&nbsp;
			<a onmouseover="this.style.cursor='hand'" style="cursor:normal" onclick="Borra('<%=iIdFuncionario%>','<%=iIdAnexo%>');"><img alt="Elimina Anexo" src="<%=sPath%>Images/Eliminar.jpg"></a>&nbsp;&nbsp;
			<a onmouseover="this.style.cursor='hand'" style="cursor:normal" onclick="Adjuntar('<%=iIdFuncionario%>','<%=iIdAnexo%>');"><img alt="Adjuntar Archivos" src="<%=sPath%>Images/Attach.jpg" ></a>&nbsp;&nbsp;
			<%}%>
			<a onmouseover="this.style.cursor='hand'" style="cursor:normal" onclick="imprimirUnidad('<%=iIdFuncionario%>', 'iAnexo3IV1.jsp', 'F');"><img alt="Imprimir Anexo" src="<%=sPath%>Images/Impresora.jpg" ></a>&nbsp;&nbsp;
			<a onmouseover="this.style.cursor='hand'" style="cursor:normal" onclick="ayuda('../Help/aAnexo3IV1.htm');"><img alt="Ayuda" src="<%=sPath%>Images/Ayuda.jpg" ></a></td> 
			<td align=right>
			
	<%//AGREGADO POR VALIDACION ESTATUS
	oAnexo3IV1.GetAll(iIdFuncionario, iItemsPagina, iPagina); 
	long iAllCount = oAnexo3IV1.GetAllCount();
	if(!bSoloLectura) {
		if(sOpcion.equals("SAVE") || sOpcion.equals("NORMAL") || sOpcion.equals("") || (iAllCount == 0 && (!sOpcion.equals("NEW")))) {%>
			<INPUT class="boton" type="button" onclick="news();" name="NEW" value="Nuevo">&nbsp;<%	
		} else {%>	
			<INPUT class="boton" type="button" onclick="cancel();" name="CANCEL" value="Cancelar">&nbsp;
		<%	}%>
			<INPUT <%if(sOpcion.equals("NEWDETALLE")){%>disabled<%}%> class="boton" type="button" onclick="save();" name="SAVE" value="Grabar">&nbsp;
		<%}%>				
			</td>
		</TR><%
		VMatrix vArchivoA;
		AnexoArchivo oArchivoA 	= new AnexoArchivo();
		vArchivoA = oArchivoA.GetAll(iIdAnexo, iIdFuncionario);
		String sSep = "";
		if(vArchivoA.getNumRows()>0){%>
		<TR>
			<td><b>Archivos Adjuntos (Attachment):</b><% 
			for(int i=0;i<vArchivoA.getNumRows();i++){
				String	sAnexoArchivo = (((Vector)vArchivoA.getVMatrixAll().elementAt(0)).elementAt(i)+"").trim();
				String  sRuta 		= (((Vector)vArchivoA.getVMatrixAll().elementAt(3)).elementAt(i)+"").trim();
				String 	sArchivo 	= (((Vector)vArchivoA.getVMatrixAll().elementAt(4)).elementAt(i)+"").trim();
				String	sLink		= (((Vector)vArchivoA.getVMatrixAll().elementAt(5)).elementAt(i)+"").trim() + (((Vector)vArchivoA.getVMatrixAll().elementAt(4)).elementAt(i)+"").trim();
				%><%=sSep%><a target="new" onmouseover="this.style.cursor='hand'" style="cursor:normal" href="<%=sLink%>"><font color="Blue"><%=sArchivo%></font></a><%
				sSep = ", ";
			}
		} else {%>
		<TR>
			<TD>&nbsp;<% 
		}%>
			</td>
			<td colspan="2"><%
		if(null!=oAnexoEstatus.GetObservacion()&&!(oAnexoEstatus.GetObservacion()+"").equals("")){
		%><b>Fecha y Hora de &uacute;ltima actualizaci&oacute;n hecha por la Direcci&oacute;n de Recursos Humanos:</b><%=oAnexoEstatus.GetObservacion()%><%
		}%>
			</td>
		</TR>
		</TABLE>
	<!-- Datos que se agregaran a la tabla  -->
	<TABLE cellPadding="0" cellSpacing="0" width="100%" BORDER="1" BORDERCOLOR="white">
	<!-- Etiqueta donde se aplican los encabezados de las tablas-->
		<TR align="middle">
			<td rowspan="2" class="TituloMenu" colspan="2">&nbsp;</td>
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
		</TR>				 
				<%
		if(!sEstatus.equals("0")){
		if(sOpcion.equals("NEW")){%>
		<TR align="middle">
			<td colspan="2"></td>
			<td><INPUT class="txtBox" name="sNombre" id="sNombre" type="Text" size="20" value="" maxlength="50" onKeyPress="isInValid();" onpaste="validaPasteStr(this);"></td>
      		<td><INPUT class="txtBox" name="sPuesto" id="sPuesto" type="Text" size="20" value="" maxlength="100" onKeyPress="isInValid();" onpaste="validaPasteStr(this);"></td>
			<td><INPUT class="txtBox" name="sCategoria" id="sCategoria" type="Text" size="20" value="" maxlength="50" onKeyPress="isInValid();" onpaste="validaPasteStr(this);"></td>
			<td><INPUT class="txtBox" name="sAdscripcion" id="sAdscripcion" type="Text" size="20" value="" maxlength="50" onKeyPress="isInValid();" onpaste="validaPasteStr(this);"></td>
			<td align="center"><INPUT name="sTipoPlaza" id="sTipoPlaza" type="radio" value="1" checked></td>
			<td align="center"><INPUT name="sTipoPlaza" id="sTipoPlaza" type="radio" value="2"></td>
			<td align="center"><INPUT name="sTipoPlaza" id="sTipoPlaza" type="radio" value="3"></td>
			<td align="center"><INPUT class="txtNumeric" name="sSueldoBase" id="sSueldoBase" type="Text" size="10" value="" maxlength="20" onkeypress="valida(this);" onpaste="return validaPasteNum(this);"></td>
			<td align="center"><INPUT class="txtNumeric" name="sCompensacion" id="sCompensacion" type="Text" size="10" value="" maxlength="20" onkeypress="valida(this);" onpaste="return validaPasteNum(this);"></td>
			<td align="center"><INPUT class="txtNumeric" name="sOtrasPrestaciones" id="sOtrasPrestaciones" type="Text" size="10" value="" maxlength="20" onkeypress="valida(this);" onpaste="return validaPasteNum(this);"></td>
			<td align="center"><INPUT class="txtNumeric" name="sTotal" id="sTotal" type="Text" size="10" value="" maxlength="20" onkeypress="valida(this);" onpaste="return validaPasteNum(this);"></td>
			<td><INPUT class="txtBox" name="sObservaciones" id="sObservaciones" type="Text" size="20" value="" maxlength="255" onKeyPress="isInValid();" onpaste="validaPasteStr(this);"></td>
			<TD>&nbsp;</TD>
		</TR><%
		}
		int intContador = 0;
		String sBackColor = "";

		long iTotalPaginas = ((iAllCount / iItemsPagina) * iItemsPagina) == iAllCount ? (iAllCount / iItemsPagina) : (iAllCount / iItemsPagina) + 1;
		if(iTotalPaginas<iPagina){ iPagina = java.lang.Integer.parseInt(iTotalPaginas+"") ; }
		if(iPagina==0){iPagina=1;}
		TipoNomina oTipoNomina = new TipoNomina();
		for(int i=0;i<oAnexo3IV1.GetAll(iIdFuncionario, iItemsPagina, iPagina);i++){
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
			//Jaime cambios
			if (vTipoNomina.equals("")) vTipoNomina = null;  

			
			String sDescNomina = oTipoNomina.GetPosClave(vTipoNomina)>=0?oTipoNomina.GetDescripcion(oTipoNomina.GetPosClave(vTipoNomina)):"";
			
			
			intContador = intContador + 1;
			if (intContador%2 == 0)	{sBackColor = "#ffffff";}
			else					{sBackColor = "#eeeeee";}
			if(sOpcion.equals("EDIT") && sCodigo.equals(vIdRenglon+"") ){%>
		<TR align="left" bgcolor="<%=sBackColor%>">
			<td colspan="2"></td>
			<td><INPUT class="txtBox" name="sNombre" id="sNombre" type="Text" size="20" value="<%=vNombre%>" maxlength="50" onKeyPress="isInValid();" onpaste="validaPasteStr(this);"></td>
      		<td><INPUT class="txtBox" name="sPuesto" id="sPuesto" type="Text" size="20" value="<%=vPuesto%>" maxlength="100" onKeyPress="isInValid();" onpaste="validaPasteStr(this);"></td>
			<td><INPUT class="txtBox" name="sCategoria" id="sCategoria" type="Text" size="20" value="<%=vCategoria%>" maxlength="50" onKeyPress="isInValid();" onpaste="validaPasteStr(this);"></td>
			<td><INPUT class="txtBox" name="sAdscripcion" id="sAdscripcion" type="Text" size="20" value="<%=vAdscripcion%>" maxlength="50" onKeyPress="isInValid();" onpaste="validaPasteStr(this);"></td>
			<td align="center"><INPUT name="sTipoPlaza" id="sTipoPlaza" type="radio" <%if(vTipoPlaza.equals("1")){%>checked<%}%> value="1"></td>
			<td align="center"><INPUT name="sTipoPlaza" id="sTipoPlaza" type="radio" <%if(vTipoPlaza.equals("2")){%>checked<%}%> value="2"></td>
			<td align="center"><INPUT name="sTipoPlaza" id="sTipoPlaza" type="radio" <%if(vTipoPlaza.equals("3")){%>checked<%}%> value="3"></td>
			<td align="center"><INPUT class="txtNumeric" name="sSueldoBase" id="sSueldoBase" type="Text" size="10" value="<%=vSueldoBase%>" maxlength="20" onkeypress="valida(this);" onpaste="return validaPasteNum(this);"></td>
			<td align="center"><INPUT class="txtNumeric" name="sCompensacion" id="sCompensacion" type="Text" size="10" value="<%=vCompensacion%>" maxlength="20" onkeypress="valida(this);" onpaste="return validaPasteNum(this);"></td>
			<td align="center"><INPUT class="txtNumeric" name="sOtrasPrestaciones" id="sOtrasPrestaciones" type="Text" size="10" value="<%=vOtrasPrestaciones%>" maxlength="20" onkeypress="valida(this);" onpaste="return validaPasteNum(this);"></td>
			<td align="center"><INPUT class="txtNumeric" name="sTotal" id="sTotal" type="Text" size="10" value="<%=vTotal%>" maxlength="20" onkeypress="valida(this);" onpaste="return validaPasteNum(this);"></td>
			<td><INPUT class="txtBox" name="sObservaciones" id="sObservaciones" type="Text" size="20" value="<%=vObservaciones%>" maxlength="255" onKeyPress="isInValid();" onpaste="validaPasteStr(this);"></td>
			<TD>&nbsp;</TD>
		</TR><%
			} else {%>
		<TR align="left" bgcolor="<%=sBackColor%>" onMouseOver = "MouseDentro(this);" onMouseOut  = "MouseFuera(this,'<%=sBackColor%>');">
			<td colspan="2">
			<%//AGREGADO POR VALIDACION ESTATUS
			if(!bSoloLectura  && null == vTipoNomina) { %>	
			<a onmouseover="this.style.cursor='hand'" style="cursor:normal" onclick="del(<%=vIdRenglon%>);"><img src="<%=sPath%>Images/Eliminar.gif" ></a>
			<%}
			String sEditarIni = "", sEditarFin = "";
			char c1 = '"';
			if(null == vTipoNomina) {
				sEditarIni = "<a onmouseover=" + c1 + "this.style.cursor='hand'" + c1 + " style='cursor:normal' onclick=edit(" + vIdRenglon + ");>";
				sEditarFin = "</a>";
			}
			
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
			<td>&nbsp;<%=sEditarIni%><%=vNombre%><%=sEditarFin%></td>
			<td>&nbsp;<%=sEditarIni%><%=vPuesto%><%=sEditarFin%></td>
			<td>&nbsp;<%=sEditarIni%><%=vCategoria%><%=sEditarFin%></td>
			<td>&nbsp;<%=sEditarIni%><%=vAdscripcion%><%=sEditarFin%></td>
			<td align="center">&nbsp;<%=sEditarIni%><%if(vTipoPlaza.equals("1")){%><img src="<%=sPath%>/Images/VinetaGde.gif"><%}%><%=sEditarFin%></td>
			<td align="center">&nbsp;<%=sEditarIni%><%if(vTipoPlaza.equals("2")){%><img src="<%=sPath%>/Images/VinetaGde.gif"><%}%><%=sEditarFin%></td>
			<td align="center">&nbsp;<%=sEditarIni%><%if(vTipoPlaza.equals("3")){%><img src="<%=sPath%>/Images/VinetaGde.gif"><%}%><%=sEditarFin%></td>
			<td align="right">&nbsp;<%=sEditarIni%><%=vSueldoBase%><%=sEditarFin%></td>
			<td align="right">&nbsp;<%=sEditarIni%><%=vCompensacion%><%=sEditarFin%></td>
			<td align="right">&nbsp;<%=sEditarIni%><%=vOtrasPrestaciones%><%=sEditarFin%></td>
			<td align="right">&nbsp;<%=sEditarIni%><%=vTotal%><%=sEditarFin%></td>
			<td>&nbsp;<%=sEditarIni%><%=vObservaciones%><%=sEditarFin%></td>
			<td>&nbsp;<%=sEditarIni%><%=sDescNomina%><%=sEditarFin%></td>
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
			sSep = "<b>Pág: </b>";
			for(int i=1;i<=iTotalPaginas;i++){ 
				if(i!=iPagina){
					%><a onmouseover="this.style.cursor='hand'" onClick='irPag(<%=i%>);'><%=sSep + i%></a><%
				} else out.print(sSep + "<b><font size='2'>" + i + "</font></b>");
				sSep = ", ";
			}%>
			</TD>
		</TR>
	</TABLE><%
		}
	} else {%><!--Hasta aqui paginacion-->
	<TABLE width="100%">
		<TR>
			<td align="center"><H1 style="size=+2"><br>ESTE ANEXO NO APLICA</H1></td>
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
