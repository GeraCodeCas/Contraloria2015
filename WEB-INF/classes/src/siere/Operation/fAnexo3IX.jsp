<%@page import="com.consiss.util.tools.*"%>
<%@page import="com.gob.*"%>
<%@page import="java.util.*" %>
<%
/********************************************************************************************************
'Elaboro:	Jesus Limon
'Lugar:		Monterrey, NL
'Fecha:		6.Dic.2002
'Compañia:	CONSISS
'Ultima Modificacion:
'By:		Sigifredo Vazquez
'
'Distintas opciones:
'
'********************************************************************************************************/
%>
<%
//Valida la permanencia del usuario en session
if ((String)session.getValue("ok")!="Consiss")
			response.sendRedirect("Error.html");

String	sOpcion = request.getParameter("sOpcion")!= null ? request.getParameter("sOpcion"): "";
String	sCodigo = request.getParameter("sCodigo")!= null ? request.getParameter("sCodigo"): "";
int	iPagina = request.getParameter("iPagina")!= null ? java.lang.Integer.parseInt(request.getParameter("iPagina")): 1;
Anexo3IX oAnexo	= new Anexo3IX();
int iIdAnexo = oAnexo.GetIdAnexo();
%>
<%@include file="fAnexoInicia.jsp"%>
<html>
<head>
	<title>Entrega - Recepción : Anexo III.9</title>
	<link rel="stylesheet" type="text/css" href="<%=sPath%>Styles/Gobierno.css">
	<script language="JavaScript" src="<%=sPath%>Scripts/Gobierno.js"></script>
	<script language="JavaScript" src="<%=sPath%>Scripts/Libreria.js"></script>
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
		function news() {
			document.forma.sCodigo.value = 0;
			document.forma.sOpcion.value = 'NEW';
			document.forma.submit();
		}
		function irPag(pPagina){
			document.forma.iPagina.value = pPagina;
			document.forma.sOpcion.value = 'NORMAL';
			document.forma.submit();
		}
		function del(pCODE){
			if(confirm("¿Desea Eliminar el Registro?")){ 
				document.forma.sCodigo.value = pCODE;
				document.forma.sOpcion.value = 'DELETE';
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
<FORM action="pAnexo3IX.jsp" name="forma" method="post" >
	<input type="hidden" name="sOpcion" value="">
	<input type="hidden" name="sCodigo" value="<%=sCodigo%>"> 
	<TABLE align=center border=0 cellPadding=0 cellSpacing=0 width="100%">
		<TR>
			<TD class="TituloParrafo" colspan="3">&nbsp;&nbsp;ANEXO III.9 - RELACIÓN BIENES INMUEBLES&nbsp;&nbsp;</TD>
		</tr>
		<tr>
			<TD width="70%" valign="middle">
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
			<TD align=right>
			<%//AGREGADO POR VALIDACION ESTATUS
			if(!bSoloLectura) { %>
			<a onmouseover="this.style.cursor='hand'" style="cursor:normal" onclick="Carga('<%=iIdFuncionario%>','<%=iIdAnexo%>', 'cAnexo3IX.jsp');"><img alt="Carga Masiva" src="<%=sPath%>Images/Carga.jpg"></a>&nbsp;&nbsp;
			<a onmouseover="this.style.cursor='hand'" style="cursor:normal" onclick="Undo();"><img alt="Deshace ultima Carga" src="<%=sPath%>Images/Undo.jpg"></a>&nbsp;&nbsp;
			<a onmouseover="this.style.cursor='hand'" style="cursor:normal" onclick="Borra('<%=iIdFuncionario%>','<%=iIdAnexo%>');"><img alt="Elimina Anexo" src="<%=sPath%>Images/Eliminar.jpg"></a>&nbsp;&nbsp;
			<a onmouseover="this.style.cursor='hand'" style="cursor:normal" onclick="Adjuntar('<%=iIdFuncionario%>','<%=iIdAnexo%>');"><img src="<%=sPath%>Images/Attach.jpg" ></a>&nbsp;&nbsp;
			<%}%>
			<a onmouseover="this.style.cursor='hand'" style="cursor:normal" onclick="imprimir(<%=iIdFuncionario%>, 'iAnexo3IX.jsp');"><img src="<%=sPath%>Images/Impresora.jpg" ></a>&nbsp;&nbsp;
			<a onmouseover="this.style.cursor='hand'" style="cursor:normal" onclick="ayuda('<%=sPath%>Help/aAnexo3IX.htm');"><img src="<%=sPath%>Images/Ayuda.jpg" ></a></td> 
			<TD align=right>
<%//AGREGADO POR VALIDACION ESTATUS
	oAnexo.GetAll(iIdFuncionario, iItemsPagina, iPagina); 
	long iAllCount = oAnexo.GetAllCount();
	if(!bSoloLectura) {
	if(sOpcion.equals("SAVE") || sOpcion.equals("NORMAL") || sOpcion.equals("") ) {
%>						    
				<INPUT class="boton" type="button" onclick="news();" name="NEW" value="Nuevo">&nbsp;
<%} else {%>	
				<INPUT class="boton" type="button" onclick="cancel();" name="CANCEL" value="Cancelar">&nbsp;
<%}%>	
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
			<TD colspan="3"><b>Archivos Adjuntos (Attachment):</b><% 
			for(int i=0;i<vArchivoA.getNumRows();i++){
				String	sAnexoArchivo = (((Vector)vArchivoA.getVMatrixAll().elementAt(0)).elementAt(i)+"").trim();
				String  sRuta 		= (((Vector)vArchivoA.getVMatrixAll().elementAt(3)).elementAt(i)+"").trim();
				String 	sArchivo 	= (((Vector)vArchivoA.getVMatrixAll().elementAt(4)).elementAt(i)+"").trim();
				String	sLink		= (((Vector)vArchivoA.getVMatrixAll().elementAt(5)).elementAt(i)+"").trim() + (((Vector)vArchivoA.getVMatrixAll().elementAt(4)).elementAt(i)+"").trim();
				%><%=sSep%><a target="new" onmouseover="this.style.cursor='hand'" style="cursor:normal" href="<%=sLink%>"><font color="Blue"><%=sArchivo%></font></a><%
				sSep = ",&nbsp;";
			}%>
			</TD>
		</TR><% 
		}%>
	</TABLE>		
	<!-- Datos que se agregaran a la tabla  -->
	<TABLE cellPadding="0" cellSpacing="0" width="100%" BORDER="1" BORDERCOLOR="white">
	<!-- Etiqueta donde se aplican los encabezados de las tablas-->
		<TR align="middle">
			<td class="TituloMenu" colspan="2">&nbsp;</td>
			<td class="TituloMenu">No. de Exp. Catastral asignado por cada Municipio</TD>
			<td class="TituloMenu">No.Progresivo</TD>
			<td class="TituloMenu">Nombre o Identificación del Bien Inmueble, Ubicación y Superficie</TD>
			<td class="TituloMenu">Destino</TD>
			<td class="TituloMenu">Estado que guarda el Inmueble</TD>
			<td class="TituloMenu">Tipo de Bien Inmueble</TD>
			<td class="TituloMenu">Tipo de Acción Legal</TD>
			<td class="TituloMenu">Observaciones</TD>
		</TR>
<%
if(!sEstatus.equals("0")){
		if(sOpcion.equals("NEW")){
%>
		<TR align="middle">
        	<TD colspan="2"></TD>
	       	<TD>
				<input class="txtBox" name="sNoExpediente" 	id="sNoExpediente" type="Text" size="20" maxlength="50" value="" onKeyPress="isInValid();" onpaste="validaPasteStr(this);"></TD>
			<TD>
				<input class="txtBox" name="sNoProgresivo" id="sNoProgresivo" type="Text" size="20" maxlength="50" value="" onKeyPress="isInValid();" onpaste="validaPasteStr(this);"></TD>
			<TD>
				<input class="txtBox" name="sNombre" id="sNombre" type="Text" size="20" maxlength="100" value="" onKeyPress="isInValid();" onpaste="validaPasteStr(this);"></TD>
			<TD>
				<input class="txtBox" name="sDestino" id="sDestino" type="Text" size="20" maxlength="50" value="" onKeyPress="isInValid();" onpaste="validaPasteStr(this);"></TD>
			<TD><select class="cmbBox" name="sEstadoInmueble">
					<option value="1" >Bueno</option>
					<option value="2" >Malo</option>
					<option value="3" >Regular</option>
				</select>
			</TD>
			<TD><select class="cmbBox" name="sTipoInmueble">
					<option value="1">Dominio Público</option>
					<option value="2">Dominio Privado</option>
					<option value="3">Otros</option>
				</select>
			</TD>
			<TD><select class="cmbBox" name="sTipoAccion">
					<option value="1">Escrituras</option>
					<option value="2">Actas de Donación</option>
					<option value="3">Diligencias</option>
					<option value="4">Otros</option>
				</select>
			</TD>
			<TD>
				<INPUT class="txtBox" name="sObservaciones" id="sObservaciones" type="Text" size="20" maxlength="255" value="" onKeyPress="isInValid();" onpaste="validaPasteStr(this);"></TD>
		</TR>
<%
		}
		int intContador = 0;
		String sBackColor = "";
		
		long iTotalPaginas = ((iAllCount / iItemsPagina) * iItemsPagina) == iAllCount ? (iAllCount / iItemsPagina) : (iAllCount / iItemsPagina) + 1;
		if(iTotalPaginas<iPagina){ iPagina = java.lang.Integer.parseInt(iTotalPaginas+"") ; }
		if(iPagina==0){iPagina=1;}
		
		oAnexo.GetAll(iIdFuncionario, iItemsPagina, iPagina);
		//oAnexo.GetAll(iIdFuncionario);
		for(int i=0;i<oAnexo.GetAll(iIdFuncionario, iItemsPagina, iPagina);i++){
			int 	iIdRenglon			= oAnexo.GetIdRenglon(i)!=-1?			oAnexo.GetIdRenglon(i):0;
			String 	sNoExpediente		= oAnexo.GetNoExpediente(i)!=null?		oAnexo.GetNoExpediente(i)+"":"";
			String 	sNoProgresivo		= oAnexo.GetNoProgresivo(i)!=null?		oAnexo.GetNoProgresivo(i)+"":"";
			String 	sNombre				= oAnexo.GetNombre(i)!=null?			oAnexo.GetNombre(i)+"":"";
			String 	sDestino			= oAnexo.GetDestino(i)!=null?			oAnexo.GetDestino(i)+"":"";
			int 	iEstadoInmueble 	= oAnexo.GetEstadoInmueble(i)!=-1?		oAnexo.GetEstadoInmueble(i):0;
			String  sEstadoInmueble		= oAnexo.GetEstadoInmuebleDescripcion(i);
			//String 	sEstadoInmueble		= oAnexo.GetEstadoInmueble(i)!=null?	oAnexo.GetEstadoInmueble(i)+"":"";
			int 	iTipoInmueble 		= oAnexo.GetTipoInmueble(i)!=-1?		oAnexo.GetTipoInmueble(i):0;
			String  sTipoInmueble		= oAnexo.GetTipoInmuebleDescripcion(i);
			int 	iTipoAccion 		= oAnexo.GetTipoAccion(i)!=-1?			oAnexo.GetTipoAccion(i):0;
			String  sTipoAccion			= oAnexo.GetTipoAccionDescripcion(i);
			String 	sObservacion 		= oAnexo.GetObservacion(i)!=null?		oAnexo.GetObservacion(i):"";
			intContador = intContador + 1;
			if(intContador%2 == 0){
				sBackColor = "#ffffff";
			}else{
				sBackColor = "#eeeeee";
			}
			if(sOpcion.equals("EDIT") && (iIdRenglon == java.lang.Integer.parseInt(sCodigo))){
%>
		<TR align="middle">
        	<TD colspan="2"></TD>
	       	<TD>
				<INPUT class="txtBox" name="sNoExpediente" 	id="sNoExpediente" type="Text" size="20" maxlength="50" value="<%=sNoExpediente%>" onKeyPress="isInValid();" onpaste="validaPasteStr(this);"></TD>
			<TD>
				<INPUT class="txtBox" name="sNoProgresivo" id="sNoProgresivo" type="Text" size="20" maxlength="50" value="<%=sNoProgresivo%>" onKeyPress="isInValid();" onpaste="validaPasteStr(this);"></TD>
			<TD>
				<INPUT class="txtBox" name="sNombre" id="sNombre" type="Text" size="20" maxlength="100" value="<%=sNombre%>" onKeyPress="isInValid();" onpaste="validaPasteStr(this);"></TD>
			<TD>
				<INPUT class="txtBox" name="sDestino" id="sDestino" type="Text" size="20" maxlength="50" value="<%=sDestino%>" onKeyPress="isInValid();" onpaste="validaPasteStr(this);"></TD>
			<TD>
				<select class="cmbBox" name="sEstadoInmueble">
					<option value="1" <%if(iEstadoInmueble == 1){%>selected<%}%>>Bueno</option>
					<option value="2" <%if(iEstadoInmueble == 2){%>selected<%}%>>Malo</option>
					<option value="3" <%if(iEstadoInmueble == 3){%>selected<%}%>>Regular</option>
				</select>
			</TD>
			<TD><select class="cmbBox" name="sTipoInmueble">
					<option value="1" <%if(iTipoInmueble == 1){%>selected<%}%>>Dominio Público</option>
					<option value="2" <%if(iTipoInmueble == 2){%>selected<%}%>>Dominio Privado</option>
					<option value="3" <%if(iTipoInmueble == 3){%>selected<%}%>>Otros</option>
				</select>
			</TD>
			<TD><select class="cmbBox" name="sTipoAccion">
					<option value="1" <%if(iTipoAccion == 1){%>selected<%}%>>Escrituras</option>
					<option value="2" <%if(iTipoAccion == 2){%>selected<%}%>>Actas de Donación</option>
					<option value="3" <%if(iTipoAccion == 3){%>selected<%}%>>Diligencias</option>
					<option value="4" <%if(iTipoAccion == 4){%>selected<%}%>>Otros</option>
				</select>
			</TD>
			<TD>
				<INPUT class="txtBox" name="sObservaciones" id="sObservaciones" type="Text" size="20" maxlength="255" value="<%=sObservacion%>" onKeyPress="isInValid();" onpaste="validaPasteStr(this);"></TD>
		</TR><%
			} else {
%>
		<TR align="left" bgcolor="<%=sBackColor%>" 
			onMouseOver = "MouseDentro(this);"
			onMouseOut  = "MouseFuera(this,'<%=sBackColor%>');">
			<TD colspan="2">
			<%//AGREGADO POR VALIDACION ESTATUS
			if(!bSoloLectura) { %>
			<a onmouseover="this.style.cursor='hand'" style="cursor:normal" onclick="del(<%=iIdRenglon%>);"><img src="<%=sPath%>Images/Eliminar.gif" ></a>
			<%}%>
			</TD>
			<TD>&nbsp;	
				<a onmouseover="this.style.cursor='hand'" style="cursor:normal" onclick="edit(<%=iIdRenglon%>);">
					<%=sNoExpediente%>
				</a>
			</TD>
			<TD>&nbsp;	
				<a onmouseover="this.style.cursor='hand'" style="cursor:normal" onclick="edit(<%=iIdRenglon%>);">
					<%=sNoProgresivo%>
				</a>
			</TD>
			<TD>&nbsp;	
				<a onmouseover="this.style.cursor='hand'" style="cursor:normal" onclick="edit(<%=iIdRenglon%>);">
					<%=sNombre%>
				</a>
			</TD>
			<TD >&nbsp;	
				<a onmouseover="this.style.cursor='hand'" style="cursor:normal" onclick="edit(<%=iIdRenglon%>);">
					<%=sDestino%>
				</a>
			</TD>
			<TD >&nbsp;	
				<a onmouseover="this.style.cursor='hand'" style="cursor:normal" onclick="edit(<%=iIdRenglon%>);">
					<%=sEstadoInmueble%>
				</a>
			</TD>
			<TD >&nbsp;	
				<a onmouseover="this.style.cursor='hand'" style="cursor:normal" onclick="edit(<%=iIdRenglon%>);">
					<%=sTipoInmueble%>
				</a>
			</TD>
			<TD >&nbsp;	
				<a onmouseover="this.style.cursor='hand'" style="cursor:normal" onclick="edit(<%=iIdRenglon%>);">
					<%=sTipoAccion%>
				</a>
			</TD>
			<TD >&nbsp;	
				<a onmouseover="this.style.cursor='hand'" style="cursor:normal" onclick="edit(<%=iIdRenglon%>);">
					<%=sObservacion%>
				</a>
			</TD>
		</TR><%
			}
		}
%>
	</TABLE>
<%
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

} else {
%>
	</TABLE>
	<TABLE width="100%">
		<TR>
			<TD align="center"><H1 style="size=+2"><br>ESTE ANEXO NO APLICA</H1></TD>
		</TR>
	</TABLE>
<%
}
%>	
	<input type="hidden" name="iPagina" value="<%=iPagina%>"> 
</FORM>
</td>
</tr>
</table>
<%@include file="Footer.jsp"%>
</body>
</html>