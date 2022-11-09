<%/*********************************************************************************************************
Elaboro:	Claudia Sandoval
Lugar:		Monterrey, NL
Fecha:		29.Oct.2002
Compañia:	CONSISS*/%>
<%@page import="com.consiss.util.tools.*"%>
<%@page import="com.gob.*"%>
<%@page import="java.util.*" %><%
//Valida la permanencia del usuario en session
if ((String)session.getValue("ok")!="Consiss")		response.sendRedirect("Error.html");
			
String	sOpcion = request.getParameter("sOpcion")!= null ? request.getParameter("sOpcion"): "";
String	sCodigo = request.getParameter("sCodigo")!= null ? request.getParameter("sCodigo"): "";
int	iPagina = request.getParameter("iPagina")!= null ? java.lang.Integer.parseInt(request.getParameter("iPagina")): 1;

Anexo3IV5 oAnexo3IV5 	= new Anexo3IV5();
int iIdAnexo = oAnexo3IV5.GetIdAnexo();
%>
<%@include file="fAnexoInicia.jsp"%>
<html>
<head>
	<title>Entrega - Recepción : Anexo III.4.5</title>
<link rel="stylesheet" type="text/css" href="<%=sPath%>Styles/Gobierno.css">
<script language="JavaScript" src="<%=sPath%>Scripts/Libreria.js"></script>
<script language="JavaScript" src="<%=sPath%>Scripts/Gobierno.js"></script>
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
<FORM action="pAnexo3IV5.jsp" name="forma" method="post" >
	<input type="hidden" name="sOpcion" value="">
	<input type="hidden" name="sCodigo" value="<%=sCodigo%>">
	<TABLE align=center border=0 cellPadding=0 cellSpacing=0 width="100%">
		<TR>
			<TD colspan="3" class="TituloParrafo" width="100%">&nbsp;&nbsp;ANEXO III.4.5 - RELACIÓN DE EXPEDIENTES DE PERSONAL</TD>
		</TR>
		
		<TR>
<!-- Modificaciones por Validaciones de Estatus y Asignacion de Usuarios -->
<!-- Inicio -->
			<TD width="70%" valign="middle">
			<%//AGREGADO POR VALIDACION ESTATUS
			if(!bSoloLectura) { %>
			<%=oAnexoEstatus.GetEstatusDesc(oAnexoEstatus.GetEstatusVacio())%>: <input type="radio" name="sEstatus" value="<%=oAnexoEstatus.GetEstatusVacio()%>" <%=sEstatus.equals(oAnexoEstatus.GetEstatusVacio())?" checked":""%>>
			&nbsp;&nbsp;
			<%=oAnexoEstatus.GetEstatusDesc(oAnexoEstatus.GetEstatusEnProceso())%>: <input type="radio" name="sEstatus" value="<%=oAnexoEstatus.GetEstatusEnProceso()%>" <%=sEstatus.equals(oAnexoEstatus.GetEstatusEnProceso())?" checked":""%>>
			&nbsp;&nbsp;
			Lleno: <input type="radio" name="sEstatus" value="<%=oAnexoEstatus.GetEstatusPorAutorizar()%>" <%=sEstatus.equals(oAnexoEstatus.GetEstatusPorAutorizar())?" checked":""%>>
			<%if(iTipoUsuario == oUsuario.GetTipoFuncionario()) { %>
				Autorizado: <input type="radio" name="sEstatus" value="4" <%=sEstatus.equals("4")?" checked":""%>>
			<%}%>
			<%}	
		//AGREGADO POR MENSAJES SOLO LECTURA (5)
		if( !sMensageEstatus.equals("") ) {
			out.println("<font class='TituloEstatus'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;" + sMensageEstatus + "</font>" );
		}
			%>
			</TD>
			<TD align=right><%//AGREGADO POR VALIDACION ESTATUS
			if(!bSoloLectura) { 
			%><a onmouseover="this.style.cursor='hand'" style="cursor:normal" onclick="Carga('<%=iIdFuncionario%>','<%=iIdAnexo%>', 'cAnexo3IV5.jsp');"><img src="<%=sPath%>Images/Carga.jpg" ></a>&nbsp;&nbsp;
			<a onmouseover="this.style.cursor='hand'" style="cursor:normal" onclick="Undo();"><img alt="Deshace ultima Carga" src="<%=sPath%>Images/Undo.jpg"></a>&nbsp;&nbsp;
			 <a onmouseover="this.style.cursor='hand'" style="cursor:normal" onclick="Borra('<%=iIdFuncionario%>','<%=iIdAnexo%>');"><img alt="Elimina Anexo" src="<%=sPath%>Images/Eliminar.jpg"></a>&nbsp;&nbsp;
			 <a onmouseover="this.style.cursor='hand'" style="cursor:normal" onclick="Adjuntar('<%=iIdFuncionario%>','<%=iIdAnexo%>');"><img src="<%=sPath%>Images/Attach.jpg" ></a>&nbsp;&nbsp;
			 <%	}%>			
			 <a onmouseover="this.style.cursor='hand'" style="cursor:normal" onclick="imprimirUnidad('<%=iIdFuncionario%>', 'iAnexo3IV5.jsp', 'F');"><img src="<%=sPath%>Images/Impresora.jpg" ></a>&nbsp;&nbsp;
			<a onmouseover="this.style.cursor='hand'" style="cursor:normal" onclick="ayuda('../Help/aAnexo3IV5.htm');"><img src="<%=sPath%>Images/Ayuda.jpg" ></a>
			</td> 
			<TD align=right>
			<%//AGREGADO POR VALIDACION ESTATUS
			if(!bSoloLectura) {
			if(sOpcion.equals("SAVE")  || sOpcion.equals("NORMAL") || sOpcion.equals("") ) {%>
				<INPUT class="boton" type="button" onclick="news();"	name="NEW"		value="Nuevo">&nbsp;<%
			} else {%>
				<INPUT class="boton" type="button" onclick="cancel();"	name="CANCEL"	value="Cancelar">&nbsp;<%
			}%>
				<INPUT class="boton" type="button" onclick="save();"	name="SAVE"		value="Grabar">&nbsp;<%
			}%>
			</TD>
		</TR>
		<%
	VMatrix vArchivoA;
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
	</TABLE>
<!-- Modificaciones por Validaciones de Estatus y Asignacion de Usuarios -->
<!-- Final -->

	<!-- Datos que se agregaran a la tabla  -->
	<TABLE cellPadding="0" cellSpacing="0" width="100%" BORDER="1" BORDERCOLOR="white">
		<TR align="middle">
			<td class="TituloMenu">&nbsp;</td>
			<td class="TituloMenu">Número de<BR>Empleado</TD>
			<td class="TituloMenu">Nombre</TD>
			<td class="TituloMenu">Puesto</TD>
			<td class="TituloMenu">Unidad Administrativa</TD>
			<td class="TituloMenu">Tipo de Nómina</td>
		</TR><%
	if(sOpcion.equals("NEW")){%>
		<TR align="middle">
        	<TD>&nbsp;</TD>
        	<TD><INPUT class="txtBox" name="sNumero" id="sNumero" type="Text" size="10" maxlength="10" value="" onKeyPress="isInValid();" onpaste="validaPasteStr(this);"></TD>
			<TD><INPUT class="txtBox" name="sNombre" id="sNombre" type="Text" size="35" maxlength="50" value="" onKeyPress="isInValid();" onpaste="validaPasteStr(this);"></TD>
			<TD><INPUT class="txtBox" name="sPuesto" id="sPuesto" type="Text" size="35" maxlength="100" value="" onKeyPress="isInValid();" onpaste="validaPasteStr(this);"></TD>
			<TD><INPUT class="txtBox" name="sUnidadAdministrativa" id="sUnidadAdministrativa" type="Text" size="35" maxlength="50" value="" onKeyPress="isInValid();" onpaste="validaPasteStr(this);"></TD>
			<TD>&nbsp;</TD>
		</TR><%
	}
	TipoNomina oTipoNomina = new TipoNomina();
	if( !sEstatus.equals(oAnexoEstatus.GetEstatusNoAplica()) ){ // DETALLE DE ANEXO
		int intContador = 0;
		String sBackColor = "";
		oAnexo3IV5.GetAll(iIdFuncionario, iItemsPagina, iPagina); 
		long iAllCount = oAnexo3IV5.GetAllCount();
		long iTotalPaginas = ((iAllCount / iItemsPagina) * iItemsPagina) == iAllCount ? (iAllCount / iItemsPagina) : (iAllCount / iItemsPagina) + 1;
		if(iTotalPaginas<iPagina){ iPagina = java.lang.Integer.parseInt(iTotalPaginas+"") ; }
		if(iPagina==0){iPagina=1;}
		for(int i=0;i<oAnexo3IV5.GetAll(iIdFuncionario, iItemsPagina, iPagina);i++){
			String vIdRenglon 			= oAnexo3IV5.GetIdRenglon(i)!=-1?oAnexo3IV5.GetIdRenglon(i)+"":"0";
			String vNumero 				= oAnexo3IV5.GetNumero(i)!=null?oAnexo3IV5.GetNumero(i):"";
			String vNombre 				= oAnexo3IV5.GetNombre(i)!=null?oAnexo3IV5.GetNombre(i):"";
			String vPuesto				= oAnexo3IV5.GetPuesto(i)!=null?oAnexo3IV5.GetPuesto(i):"";
			String vUnidadAdministrativa= oAnexo3IV5.GetUnidadAdministrativa(i)!=null?oAnexo3IV5.GetUnidadAdministrativa(i):"";
			String vTipoNomina		= oAnexo3IV5.GetClaveTipoNomina(i)  ;
			//Jaime cambios
			if (vTipoNomina.equals("")) vTipoNomina = null;  
			
			String sDescNomina = oTipoNomina.GetPosClave(vTipoNomina)>=0?oTipoNomina.GetDescripcion(oTipoNomina.GetPosClave(vTipoNomina)):"";
			
			intContador = intContador + 1;
			if (intContador%2 == 0){	sBackColor = "#ffffff";	}
			else{						sBackColor = "#eeeeee"; }
			if(sOpcion.equals("EDIT") && sCodigo.equals(vIdRenglon+"") ){%>
		<TR align="left" bgcolor="<%=sBackColor%>">
        	<TD>&nbsp;</TD>
        	<TD><INPUT class="txtBox" name="sNumero" id="sNumero" type="Text" size="10" maxlength="10" value="<%=vNumero%>" onKeyPress="isInValid();" onpaste="validaPasteStr(this);"></TD>
			<TD><INPUT class="txtBox" name="sNombre" id="sNombre" type="Text" size="35" maxlength="50" value="<%=vNombre%>" onKeyPress="isInValid();" onpaste="validaPasteStr(this);"></TD>
			<TD><INPUT class="txtBox" name="sPuesto" id="sPuesto" type="Text" size="35" maxlength="100" value="<%=vPuesto%>" onKeyPress="isInValid();" onpaste="validaPasteStr(this);"></TD>
			<TD><INPUT class="txtBox" name="sUnidadAdministrativa" id="sUnidadAdministrativa" type="Text" size="35" maxlength="50" value="<%=vUnidadAdministrativa%>" onKeyPress="isInValid();" onpaste="validaPasteStr(this);"></TD>
			<TD>&nbsp;</TD>
		</TR><%
			} else {%>
		<TR align="left" bgcolor="<%=sBackColor%>" onMouseOver = "MouseDentro(this);" onMouseOut  = "MouseFuera(this,'<%=sBackColor%>');">
			<TD><%//AGREGADO POR VALIDACION ESTATUS
			if(!bSoloLectura && null == vTipoNomina) { %>
			<a onmouseover="this.style.cursor='hand'" style="cursor:normal" onclick="del(<%=vIdRenglon%>);"><img src="<%=sPath%>Images/Eliminar.gif"></a><%
			}
			String sEditarIni = "", sEditarFin = "";
			char c1 = '"';
			if(null == vTipoNomina) {
				sEditarIni = "<a onmouseover=" + c1 + "this.style.cursor='hand'" + c1 + " style='cursor:normal' onclick=edit(" + vIdRenglon + ");>";
				sEditarFin = "</a>";
			}%>
			</TD>
			<TD>&nbsp;<%=sEditarIni%><%=vNumero%><%=sEditarFin%></TD>
			<TD>&nbsp;<%=sEditarIni%><%=vNombre%><%=sEditarFin%></TD>
			<TD>&nbsp;<%=sEditarIni%><%=vPuesto%><%=sEditarFin%></TD>
			<TD>&nbsp;<%=sEditarIni%><%=vUnidadAdministrativa%><%=sEditarFin%></TD>
			<TD>&nbsp;<%=sEditarIni%><%=sDescNomina%><%=sEditarFin%></TD>
		</TR><%
			}
		}%>
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
</td>
	<!-- Contenido -->
</tr>
</table>
<%@include file="Footer.jsp"%>
</body>
</html>
