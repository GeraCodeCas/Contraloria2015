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
if ((String)session.getValue("ok")!="Consiss")		response.sendRedirect("Error.html");

String	sOpcion = request.getParameter("sOpcion")!= null ? request.getParameter("sOpcion"): "";
String	sCodigo = request.getParameter("sCodigo")!= null ? request.getParameter("sCodigo"): "";

int	iPagina = request.getParameter("iPagina")!= null ? java.lang.Integer.parseInt(request.getParameter("iPagina")): 1;

Anexo3IV2 oAnexo3IV2 	= new Anexo3IV2();
int iIdAnexo = oAnexo3IV2.GetIdAnexo();
%>
<%@include file="fAnexoInicia.jsp"%>
<html>
<head>
	<title>Entrega - Recepción : Anexo III.4.2</title>
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
<FORM action="pAnexo3IV2.jsp" name="forma" method="post" >
	<input type="hidden" name="sOpcion" value="">
	<input type="hidden" name="sCodigo" value="<%=sCodigo%>"> 
	<TABLE align=center border=0 cellPadding=0 cellSpacing=0 width="100%">
		<TR>
			<TD  colspan="3" class="TituloParrafo" width="70%">&nbsp;&nbsp;ANEXO III.4.2 - PERSONAL CON LICENCIA, PERMISO O COMISIÓN</TD>
		</TR>
		<TR>
		<TD width="70%">
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
			</TD>		
			<TD align=right>
			<%//AGREGADO POR VALIDACION ESTATUS
			if(!bSoloLectura) { %>
			<a onmouseover="this.style.cursor='hand'" style="cursor:normal" onclick="Carga('<%=iIdFuncionario%>','<%=iIdAnexo%>', 'cAnexo3IV2.jsp');"><img src="<%=sPath%>Images/Carga.jpg" ></a>&nbsp;&nbsp;
			<a onmouseover="this.style.cursor='hand'" style="cursor:normal" onclick="Undo();"><img alt="Deshace ultima Carga" src="<%=sPath%>Images/Undo.jpg"></a>&nbsp;&nbsp;
			<a onmouseover="this.style.cursor='hand'" style="cursor:normal" onclick="Borra('<%=iIdFuncionario%>','<%=iIdAnexo%>');"><img alt="Elimina Anexo" src="<%=sPath%>Images/Eliminar.jpg"></a>&nbsp;&nbsp;
			<a onmouseover="this.style.cursor='hand'" style="cursor:normal" onclick="Adjuntar('<%=iIdFuncionario%>','<%=iIdAnexo%>');"><img src="<%=sPath%>Images/Attach.jpg" ></a>&nbsp;&nbsp;
			<%}%>
			<a onmouseover="this.style.cursor='hand'" style="cursor:normal" onclick="imprimirUnidad(<%=iIdFuncionario%>, 'iAnexo3IV2.jsp', 'F');"><img src="<%=sPath%>Images/Impresora.jpg" ></a>&nbsp;&nbsp;
			<a onmouseover="this.style.cursor='hand'" style="cursor:normal" onclick="ayuda('../Help/aAnexo3IV2.htm');"><img src="<%=sPath%>Images/Ayuda.jpg" ></a></td> 
			<TD align=right><%
	oAnexo3IV2.GetAll(iIdFuncionario, iItemsPagina, iPagina); 
	long iAllCount = oAnexo3IV2.GetAllCount();			
	//AGREGADO POR VALIDACION ESTATUS
	if(!bSoloLectura) {
		if(sOpcion.equals("SAVE")  || sOpcion.equals("SAVEDETALLE") || sOpcion.equals("NORMAL") || sOpcion.equals("") || (iAllCount == 0 && (!sOpcion.equals("NEW")))) {%>						    
				<INPUT class="boton" type="button" onclick="news();" name="NEW" value="Nuevo">&nbsp;<%	
	} else {%>	
				<INPUT class="boton" type="button" onclick="cancel();" name="CANCEL" value="Cancelar">&nbsp;<%
	}%>
				<INPUT class="boton" type="button" onclick="save();" name="SAVE" value="Grabar">&nbsp;
	<%}%>
			</TD>
		</TR>
		<%		VMatrix vArchivoA;
		AnexoArchivo oArchivoA 	= new AnexoArchivo();
		vArchivoA = oArchivoA.GetAll(iIdAnexo, iIdFuncionario);
		String sSep = "";
		if(vArchivoA.getNumRows()>0){%>
		<TR>
			<TD><b>Archivos Adjuntos (Attachment):</b><% 
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
		<TR align="center" valign="middle">
			<td class="TituloMenu" rowspan="2" colspan="2">&nbsp;</td>
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
		</tr>
		<%
		if(!sEstatus.equals("0")){
		if(sOpcion.equals("NEW")){%>
		<TR align="middle">
        	<TD colspan="2"></TD>
			<td><INPUT class="txtBox" name="sNomina" id="sNomina" type="Text" size="20" value=""  maxlength="20" onKeyPress="isInValid();" onpaste="validaPasteStr(this);"></TD>
			<td><INPUT class="txtBox" name="sNombre" id="sNombre" type="Text" size="20" value=""  maxlength="50" onKeyPress="isInValid();" onpaste="validaPasteStr(this);"></TD>
			<TD><select class="cmbBox" name="sSituacion">
					<option value="L" selected>LICENCIA</option>
					<option value="P">PERMISO</option>
					<option value="C">COMISIÓN</option>
				</select></TD>
			<TD><INPUT class="txtBox" name="sDeComisionado" id="sDeComisionado" type="Text" size="30" maxlength="50" value="" onKeyPress="isInValid();" onpaste="validaPasteStr(this);"></td>
			<td><INPUT class="txtBox" name="sAComisionado" id="sAComisionado" type="Text" size="30" maxlength="50" value="" onKeyPress="isInValid();" onpaste="validaPasteStr(this);"></td>
			<TD><INPUT class="txtBox" name="sFechaDePeriodo" id="sFechaDePeriodo" type="Text" size="9" maxlength="10" value="" readonly>&nbsp;<img src="<%=sPath%>Images/Fecha.gif" align="top" border=0 onclick="fPopCalendar(sFechaDePeriodo,sFechaDePeriodo)"></td>
			<td><INPUT class="txtBox" name="sFechaAPeriodo" id="sFechaAPeriodo" type="Text" size="9" maxlength="10" value="" readonly>&nbsp;<img src="<%=sPath%>Images/Fecha.gif" align="top" border=0 onclick="fPopCalendar(sFechaAPeriodo,sFechaAPeriodo)"></td>
			<TD><INPUT class="txtBox" name="sObservaciones" id="sObservaciones" type="Text" size="30"  value="" maxlength="255" onKeyPress="isInValid();" onpaste="validaPasteStr(this);"></TD>
			<TD>&nbsp;</TD>
		</TR><%
		}
		int intContador = 0;
		String sBackColor = "";

		long iTotalPaginas = ((iAllCount / iItemsPagina) * iItemsPagina) == iAllCount ? (iAllCount / iItemsPagina) : (iAllCount / iItemsPagina) + 1;
		if(iTotalPaginas<iPagina){ iPagina = java.lang.Integer.parseInt(iTotalPaginas+"") ; }
		if(iPagina==0){iPagina=1;}
		TipoNomina oTipoNomina = new TipoNomina();
		for(int i=0;i<oAnexo3IV2.GetAll(iIdFuncionario, iItemsPagina, iPagina);i++){
		    String vIdRenglon 		= oAnexo3IV2.GetIdRenglon(i)!=-1?oAnexo3IV2.GetIdRenglon(i)+"":"0";
			String vNomina 			= oAnexo3IV2.GetNomina(i)!=null?oAnexo3IV2.GetNomina(i):"";
			String vNombre 			= oAnexo3IV2.GetNombre(i)!=null?oAnexo3IV2.GetNombre(i):"";
			String vSituacion		= oAnexo3IV2.GetSituacion(i)!=null?oAnexo3IV2.GetSituacion(i):"";
			String vDeComisionado 	= oAnexo3IV2.GetDeComisionado(i)!=null?oAnexo3IV2.GetDeComisionado(i):"";
			String vAComisionado 	= oAnexo3IV2.GetAComisionado(i)!=null?oAnexo3IV2.GetAComisionado(i):"";
			String vFechaDePeriodo 	= oAnexo3IV2.GetFechaDePeriodo(i)!=null?oAnexo3IV2.GetFechaDePeriodo(i):"";
			String vFechaAPeriodo 	= oAnexo3IV2.GetFechaAPeriodo(i)!=null?oAnexo3IV2.GetFechaAPeriodo(i):"";
			String vObservaciones 	= oAnexo3IV2.GetObservaciones(i)!=null?oAnexo3IV2.GetObservaciones(i):"";
			String vTipoNomina		= oAnexo3IV2.GetClaveTipoNomina(i);
			//Jaime cambios
			if (vTipoNomina.equals("")) vTipoNomina = null;  

			
			String sDescNomina = oTipoNomina.GetPosClave(vTipoNomina)>=0?oTipoNomina.GetDescripcion(oTipoNomina.GetPosClave(vTipoNomina)):"";
			
			intContador = intContador + 1;
			if (intContador%2 == 0)	{sBackColor = "#ffffff";}
			else					{sBackColor = "#eeeeee";}
			if(sOpcion.equals("EDIT") && sCodigo.equals(vIdRenglon+"") ){%>
		<TR align="left" bgcolor="<%=sBackColor%>">
			<TD colspan="2"></TD>
			<td><INPUT class="txtBox" name="sNomina" id="sNomina" type="Text" size="20" value="<%=vNomina%>" maxlength="20" onKeyPress="isInValid();" onpaste="validaPasteStr(this);"></TD>
			<td><INPUT class="txtBox" name="sNombre" id="sNombre" type="Text" size="20" value="<%=vNombre%>" maxlength="50" onKeyPress="isInValid();" onpaste="validaPasteStr(this);"></TD>
			<TD><select class="cmbBox" name="sSituacion">
					<option value="L" <%if(vSituacion.equals("L")){%>selected<%}%>>LICENCIA</option>
					<option value="P" <%if(vSituacion.equals("P")){%>selected<%}%>>PERMISO</option>
					<option value="C" <%if(vSituacion.equals("C")){%>selected<%}%>>COMISIÓN</option>
				</select></TD>
			<TD><INPUT class="txtBox" name="sDeComisionado" id="sDeComisionado" type="Text" size="30" maxlength="50" value="<%=vDeComisionado%>" onKeyPress="isInValid();" onpaste="validaPasteStr(this);"></td>
			<td><INPUT class="txtBox" name="sAComisionado" id="sAComisionado" type="Text" size="30" maxlength="50" value="<%=vAComisionado%>" onKeyPress="isInValid();" onpaste="validaPasteStr(this);"></td>
			<TD><INPUT class="txtBox" name="sFechaDePeriodo" id="sFechaDePeriodo" type="Text" size="9" maxlength="10" value="<%=vFechaDePeriodo%>" readonly>&nbsp;<img src="<%=sPath%>Images/Fecha.gif" align="top" border=0 onclick="fPopCalendar(sFechaDePeriodo,sFechaDePeriodo)"></td>
			<td><INPUT class="txtBox" name="sFechaAPeriodo" id="sFechaAPeriodo" type="Text" size="9" maxlength="10" value="<%=vFechaAPeriodo%>" readonly>&nbsp;<img src="<%=sPath%>Images/Fecha.gif" align="top" border=0 onclick="fPopCalendar(sFechaAPeriodo,sFechaAPeriodo)"></td>
			<TD><INPUT class="txtBox" name="sObservaciones" id="sObservaciones" type="Text" size="30"  value="<%=vObservaciones%>" maxlength="255" onKeyPress="isInValid();" onpaste="validaPasteStr(this);"></TD>
			<TD>&nbsp;</TD>
		</TR><%
			} else {%>
		<TR align="left" bgcolor="<%=sBackColor%>" 
			onMouseOver = "MouseDentro(this);"
			onMouseOut  = "MouseFuera(this,'<%=sBackColor%>');">
			<TD colspan="2">
			<%//AGREGADO POR VALIDACION ESTATUS
			if(!bSoloLectura && null == vTipoNomina) { %>
			<a onmouseover="this.style.cursor='hand'" style="cursor:normal" onclick="del(<%=vIdRenglon%>);"><img src="<%=sPath%>Images/Eliminar.gif" ></a><%
			}
			String sEditarIni = "", sEditarFin = "";
			char c1 = '"';
			if(null == vTipoNomina) {
				sEditarIni = "<a onmouseover=" + c1 + "this.style.cursor='hand'" + c1 + " style='cursor:normal' onclick=edit(" + vIdRenglon + ");>";
				sEditarFin = "</a>";
			}%>
			</TD>
			<TD align="center">&nbsp;<%=sEditarIni%><%=vNomina%><%=sEditarFin%></TD>
			<TD>&nbsp;<%=sEditarIni%><%=vNombre%><%=sEditarFin%></TD>
			<TD align="center">&nbsp;<%=sEditarIni%><%=vSituacion%><%=sEditarFin%></TD>
			<TD>&nbsp;<%=sEditarIni%><%=vDeComisionado%><%=sEditarFin%></TD>
			<TD>&nbsp;<%=sEditarIni%><%=vAComisionado%><%=sEditarFin%></TD>
			<TD>&nbsp;<%=sEditarIni%><%=vFechaDePeriodo%><%=sEditarFin%></TD>
			<TD>&nbsp;<%=sEditarIni%><%=vFechaAPeriodo%><%=sEditarFin%></TD>
			<TD>&nbsp;<%=sEditarIni%><%=vObservaciones%><%=sEditarFin%></TD>
			<TD>&nbsp;<%=sEditarIni%><%=sDescNomina%><%=sEditarFin%></TD>
		</TR><%
			}
		}
if(!sOpcion.equals("EDIT") && !sOpcion.equals("NEW")){%>
	<TR><td colspan="4" ></td><TD colspan="2" class="ContenidoParrafo">SITUACIÓN:</TD><td colspan="4"></td></TR>
	<TR><td colspan="4" ></td><TD colspan="2" class="ContenidoParrafo">L = LICENCIA</TD><td colspan="4" ></td></TR>
	<TR><td colspan="4" ></td><TD colspan="2" class="ContenidoParrafo">P = PERMISO</TD><td colspan="4" ></td></TR>
	<TR><td colspan="4" ></td><TD colspan="2" class="ContenidoParrafo">C = COMISION</TD><td colspan="4" ></td></TR>
<%}%>
	</TABLE><%
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
	} else {%>
	</TABLE>
	<TABLE width="100%">
		<TR>
			<TD align="center"><H1 style="size=+2"><br>ESTE ANEXO NO APLICA</H1></TD>
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
