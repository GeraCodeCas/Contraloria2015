<%@page import="com.consiss.util.tools.*"%>
<%@page import="com.gob.*"%>
<%@page import="java.util.*" %>
<%

/********************************************************************************************************
'Elaboro:	Jesus Limon
'Lugar:		Monterrey, NL
'Fecha:		9.Nov.2002
'Compañia:	CONSISS
'Ultima Modificacion: 09.Dic.2002
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
String	vsIdTipoOrigen = request.getParameter("sIdTipoOrigen")!= null ? request.getParameter("sIdTipoOrigen"): "0";
int sIdTipoOrigen = java.lang.Integer.parseInt(vsIdTipoOrigen);
String	sCodigo = request.getParameter("sCodigo")!= null ? request.getParameter("sCodigo"): "";
java.text.DecimalFormat myFormatter = new java.text.DecimalFormat("###,##0.00");
int	iPagina = request.getParameter("iPagina")!= null ? java.lang.Integer.parseInt(request.getParameter("iPagina")): 1;

Anexo3X oAnexo	= new Anexo3X();
int iIdAnexo = oAnexo.GetIdAnexo();
%>
<%@include file="fAnexoInicia.jsp"%>
<html>
<head>
	<title>Entrega - Recepción : Anexo III.10</title>
	<link rel="stylesheet" type="text/css" href="<%=sPath%>Styles/Gobierno.css">
	<script language="JavaScript" src="<%=sPath%>Scripts/Gobierno.js"></script>
	<script language="JavaScript" src="<%=sPath%>Scripts/Libreria.js"></script>
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
			document.forma.sCodigo.value = "0";
			document.forma.sOpcion.value = 'NORMAL';
			document.forma.submit();
		}
		function news() {
			document.forma.sCodigo.value = "0";
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
		function CambioTipoOrigen(){
			document.forma.sCodigo.value = "0";
			document.forma.sOpcion.value = 'NORMAL';
			document.forma.action='fAnexo3X.jsp'
			document.forma.submit();
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
<FORM action="pAnexo3X.jsp" name="forma" method="post" >
	<input type="hidden" name="sOpcion" value="">
	<input type="hidden" name="sCodigo" value="<%=sCodigo%>"> 
	<TABLE align=center border=0 cellPadding=0 cellSpacing=0 width="100%">
		<TR>
			<TD class="TituloParrafo" colspan="3">&nbsp;&nbsp;ANEXO III.10 - RELACIÓN DE OBRAS EN PROCESO&nbsp;&nbsp;</TD>
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
				<br>ORIGEN DE LOS RECURSOS 
				<!-- < input class="txtBox" name="sOrigen" id="sOrigen" type="Text" size="20" maxlength="20" value="<%//=sOrigen%>"> -->
				
			<select class="cmbBox" name="sIdTipoOrigen" onchange="CambioTipoOrigen();">
				<option value="0" <%if(sIdTipoOrigen == 0){%>selected<%}%>>   TODOS    </option>
				<option value="1" <%if(sIdTipoOrigen == 1){%>selected<%}%>>RECURSOS PROPIOS</option>
				<option value="2" <%if(sIdTipoOrigen == 2){%>selected<%}%>>PROGRAMA ESTATAL DE INVERSIONES</option>
				<option value="3" <%if(sIdTipoOrigen == 3){%>selected<%}%>>RAMO 23</option>
				<option value="4" <%if(sIdTipoOrigen == 4){%>selected<%}%>>RAMO 33</option>
				<option value="5" <%if(sIdTipoOrigen == 5){%>selected<%}%>>FEDERALIZADOS</option>
			</select>
			<%}	
		//AGREGADO POR MENSAJES SOLO LECTURA (5)
		if( !sMensageEstatus.equals("") ) {
			out.println("<font class='TituloEstatus'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;" + sMensageEstatus + "</font>" );
		}%>
			</TD>
			<TD align=right>
			<%//AGREGADO POR VALIDACION ESTATUS
			if(!bSoloLectura) { %>
			<a onmouseover="this.style.cursor='hand'" style="cursor:normal" onclick="Carga('<%=iIdFuncionario%>','<%=iIdAnexo%>', 'cAnexo3X.jsp');"><img alt="Carga Masiva" src="<%=sPath%>Images/Carga.jpg"></a>&nbsp;&nbsp;
			<a onmouseover="this.style.cursor='hand'" style="cursor:normal" onclick="Undo();"><img alt="Deshace ultima Carga" src="<%=sPath%>Images/Undo.jpg"></a>&nbsp;&nbsp;
			<a onmouseover="this.style.cursor='hand'" style="cursor:normal" onclick="Borra('<%=iIdFuncionario%>','<%=iIdAnexo%>');"><img alt="Elimina Anexo" src="<%=sPath%>Images/Eliminar.jpg"></a>&nbsp;&nbsp;
			<a onmouseover="this.style.cursor='hand'" style="cursor:normal" onclick="Adjuntar('<%=iIdFuncionario%>', '<%=iIdAnexo%>');"><img src="<%=sPath%>Images/Attach.jpg" ></a>&nbsp;&nbsp;
			<%}%>
			<a onmouseover="this.style.cursor='hand'" style="cursor:normal" onclick="imprimirTipo(<%=iIdFuncionario%>, '<%=sIdTipoOrigen%>', 'iAnexo3X.jsp');"><img src="<%=sPath%>Images/Impresora.jpg" ></a>&nbsp;&nbsp;
			<a onmouseover="this.style.cursor='hand'" style="cursor:normal" onclick="ayuda('<%=sPath%>Help/aAnexo3X.htm');"><img src="<%=sPath%>Images/Ayuda.jpg" ></a></td> 
			<TD align=right>
<%//AGREGADO POR VALIDACION ESTATUS
oAnexo.GetAll(iIdFuncionario,sIdTipoOrigen, iItemsPagina, iPagina); 
	long iAllCount = oAnexo.GetAllCount();
	if(!bSoloLectura) {
	if(sOpcion.equals("SAVE") || sOpcion.equals("NORMAL") || sOpcion.equals("") ) {
			if (sIdTipoOrigen!=0){
%>						    
				<INPUT class="boton" type="button" onclick="news();" name="NEW" value="Nuevo">&nbsp;
<%}
	} else {%>
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
			<TD><b>Archivos Adjuntos (Attachment):</b><% 
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
		<TR valign="middle" align="center">
			<td class="TituloMenu" rowspan="2" colspan="2">&nbsp;</td>
			<td class="TituloMenu" rowspan="2">Clave</TD>
			<td class="TituloMenu" rowspan="2">Programa<br>Subprograma<br>Obra Localización</TD>
			<td class="TituloMenu" rowspan="2">Contrato ó Admon.</TD>
			<td class="TituloMenu" rowspan="2">Monto Total Aprobado</TD>
			<td class="TituloMenu" rowspan="2">Monto Total Ejercido</TD>
			<td class="TituloMenu" rowspan="2">Diferencia</TD>
			<td class="TituloMenu" colspan="2">Fecha</td>
			<td class="TituloMenu" colspan="2">% Avance</td>
			<td class="TituloMenu" rowspan="2">Observaciones</TD>
		</TR>
		<TR valign="middle" align="center">
			<td class="TituloMenu">Inicio</td>
			<td class="TituloMenu">Termino</td>
			<td class="TituloMenu">Físico</td>
			<td class="TituloMenu">Financ.</td>
		</tr>
<%

if(!sEstatus.equals("0")){
		if(sOpcion.equals("NEW")){
%>
		<TR align="middle">
        	<TD colspan="2"></TD>
	       	<TD>
				<input class="txtBox" name="sClave"	id="sClave" type="Text" size="10" maxlength="20" value="" onKeyPress="isInValid();" onpaste="validaPasteStr(this);"></TD>
			<TD>
				<input class="txtBox" name="sPrograma" id="sPrograma" type="Text" size="20" maxlength="100" value="" onKeyPress="isInValid();" onpaste="validaPasteStr(this);"></TD>
			<TD><select class="cmbBox" name="sTipo">
					<option value="0">   --------   </option>
					<option value="1">Contrato</option>
					<option value="2">Administración</option>
				</select></TD>
			<TD>
				<input class="txtNumeric" name="sMontoAprobado" id="sMontoAprobado" type="Text" size="9" maxlength="20" value="" onkeypress="valida(this);" onpaste="return validaPasteNum(this);"></TD>
			<TD>
				<input class="txtNumeric" name="sMontoEjercido" id="sMontoEjercido" type="Text" size="9" maxlength="20" value="" onkeypress="valida(this);" onpaste="return validaPasteNum(this);"></TD>
			<td>&nbsp;</td>
			<TD>
				<input class="txtBox" name="sFechaInicial" id="sFechaInicial" type="Text" size="9" maxlength="9" readonly value="">&nbsp;<img src="<%=sPath%>Images/Fecha.gif" align="top" border=0 onclick="fPopCalendar(sFechaInicial, sFechaInicial)"></TD>
			<TD>
				<input class="txtBox" name="sFechaFinal" id="sFechaFinal" type="Text" size="9" maxlength="9" readonly value="">&nbsp;<img src="<%=sPath%>Images/Fecha.gif" align="top" border=0 onclick="fPopCalendar(sFechaFinal, sFechaFinal)"></TD>
			<TD>
				<input class="txtNumeric" name="sAvanceFisico" id="sAvanceFisico" type="Text" size="5" maxlength="5" value="" onkeypress="valida(this);" onpaste="return validaPasteNum(this);"></TD>
			<TD>
				<input class="txtNumeric" name="sAvanceFinanciado" id="sAvanceFinanciado" type="Text" size="5" maxlength="5" value="" onkeypress="valida(this);" onpaste="return validaPasteNum(this);"></TD>
			<TD>
				<INPUT class="txtBox" name="sObservaciones" id="sObservaciones" type="Text" size="20" maxlength="255" value="" onKeyPress="isInValid();" onpaste="validaPasteStr(this);"></TD>
		</TR>
<%
		}
		int vAntTipoOrigen=0;
		int intContador = 0;
		String sBackColor = "";
		
		long iTotalPaginas = ((iAllCount / iItemsPagina) * iItemsPagina) == iAllCount ? (iAllCount / iItemsPagina) : (iAllCount / iItemsPagina) + 1;
		if(iTotalPaginas<iPagina){ iPagina = java.lang.Integer.parseInt(iTotalPaginas+"") ; }
		if(iPagina==0){iPagina=1;}
		
		oAnexo.GetAll(iIdFuncionario,sIdTipoOrigen, iItemsPagina, iPagina);
		
		//oAnexo.GetAll(iIdFuncionario,sIdTipoOrigen);
		for(int i=0;i<oAnexo.GetAll(iIdFuncionario,sIdTipoOrigen, iItemsPagina, iPagina);i++){
			int 	iIdRenglon			= oAnexo.GetIdRenglon(i)!=-1?			oAnexo.GetIdRenglon(i):0;
			String 	sClave				= oAnexo.GetClave(i)!=null?				oAnexo.GetClave(i)+"":"";
			String 	sPrograma			= oAnexo.GetPrograma(i)!=null?			oAnexo.GetPrograma(i)+"":"";
			int 	iTipo		 		= oAnexo.GetTipo(i)!=-1?				oAnexo.GetTipo(i):0;
			String 	sTipo		 		= oAnexo.GetTipoDescripcion(i);
			String 	iFechaInicial 		= oAnexo.GetFechaInicial(i)!=null?		oAnexo.GetFechaInicial(i):"";
			String 	iFechaFinal 		= oAnexo.GetFechaFinal(i)!=null?		oAnexo.GetFechaFinal(i):"";
			String	fMontoAprobado		= oAnexo.GetMontoAprobado(i)!=null?		oAnexo.GetMontoAprobado(i):"0";
			String	fMontoEjercido		= oAnexo.GetMontoEjercido(i)!=null?		oAnexo.GetMontoEjercido(i):"0";
			String 	sAvanceFisico		= oAnexo.GetAvanceFisico(i)!=null?		oAnexo.GetAvanceFisico(i)+"":"";
			String 	sAvanceFinanciado	= oAnexo.GetAvanceFinanciado(i)!=null?	oAnexo.GetAvanceFinanciado(i)+"":"";
			String 	sObservaciones 		= oAnexo.GetObservacion(i)!=null?		oAnexo.GetObservacion(i):"";
			int 	iTipoOrigen		 		= oAnexo.GetTipoOrigen(i)!=-1?				oAnexo.GetTipoOrigen(i):0;
			String 	sTipoOrigen		 		= oAnexo.GetTipoOrigenDescripcion(i);
			intContador = intContador + 1;
			if(intContador%2 == 0){
				sBackColor = "#ffffff";
			}else{
				sBackColor = "#eeeeee";
			}
			
			if (sIdTipoOrigen==0){
				if(vAntTipoOrigen!=iTipoOrigen ){%>
					<TR bgcolor="#A9A374" align="middle">
        			<TD colspan="2"></TD>
					<TD colspan="11">
						<%=sTipoOrigen%>
					<TD>
					</tr>
					
			<%
				}
				vAntTipoOrigen=iTipoOrigen;
			}
			if(sOpcion.equals("EDIT") && (iIdRenglon == java.lang.Integer.parseInt(sCodigo))){
%>


		<TR align="middle">
        	<TD colspan="2"></TD>
	       	<TD >
				<input class="txtBox" name="sClave"	id="sClave" type="Text" size="10" maxlength="20" value="<%=sClave%>" onKeyPress="isInValid();" onpaste="validaPasteStr(this);"></TD>
			<TD>
				<input class="txtBox" name="sPrograma" id="sPrograma" type="Text" size="20" maxlength="100" value="<%=sPrograma%>" onKeyPress="isInValid();" onpaste="validaPasteStr(this);"></TD>
			<TD><select class="cmbBox" name="sTipo">
					<option value="0" <%if(iTipo == 0){%>selected<%}%>>   -------    </option>
					<option value="1" <%if(iTipo == 1){%>selected<%}%>>Contrato</option>
					<option value="2" <%if(iTipo == 2){%>selected<%}%>>Administración</option>
				</select></TD>
			<TD>
				<input class="txtNumeric" name="sMontoAprobado" id="sMontoAprobado" type="Text" size="9" maxlength="20" value="<%=fMontoAprobado%>" onkeypress="valida(this);" onpaste="return validaPasteNum(this);"></TD>
			<TD>
				<input class="txtNumeric" name="sMontoEjercido" id="sMontoEjercido" type="Text" size="9" maxlength="20" value="<%=fMontoEjercido%>" onkeypress="valida(this);" onpaste="return validaPasteNum(this);"></TD>
			<td>&nbsp;</td>
			<TD>
				<input class="txtBox" name="sFechaInicial" id="sFechaInicial" type="Text" size="9" maxlength="9" readonly value="<%=iFechaInicial%>">&nbsp;<img src="<%=sPath%>Images/Fecha.gif" align="top" border=0 onclick="fPopCalendar(sFechaInicial, sFechaInicial)"></TD>
			<TD>
				<input class="txtBox" name="sFechaFinal" id="sFechaFinal" type="Text" size="9" maxlength="9" readonly value="<%=iFechaFinal%>">&nbsp;<img src="<%=sPath%>Images/Fecha.gif" align="top" border=0 onclick="fPopCalendar(sFechaFinal, sFechaFinal)"></TD>
			<TD>
				<input class="txtNumeric" name="sAvanceFisico" id="sAvanceFisico" type="Text" size="5" maxlength="5" value="<%=sAvanceFisico%>" onkeypress="valida(this);" onpaste="return validaPasteNum(this);"></TD>
			<TD>
				<input class="txtNumeric" name="sAvanceFinanciado" id="sAvanceFinanciado" type="Text" size="5" maxlength="5" value="<%=sAvanceFinanciado%>" onkeypress="valida(this);" onpaste="return validaPasteNum(this);"></TD>
			<TD>
				<INPUT class="txtBox" name="sObservaciones" id="sObservaciones" type="Text" size="20" maxlength="255" value="<%=sObservaciones%>" onKeyPress="isInValid();" onpaste="validaPasteStr(this);"></TD>
		</TR>
<%
			} else {
%>
		<TR align="left" valign="top" bgcolor="<%=sBackColor%>" 
			onMouseOver = "MouseDentro(this);"
			onMouseOut  = "MouseFuera(this,'<%=sBackColor%>');">
			<TD colspan="2">
			<%//AGREGADO POR VALIDACION ESTATUS
			if(!bSoloLectura) { %>
			<a onmouseover="this.style.cursor='hand'" style="cursor:normal" onclick="del(<%=iIdRenglon%>);"><img src="<%=sPath%>Images/Eliminar.gif" ></a>
			<%}%>
			</TD>
			<TD><a onmouseover="this.style.cursor='hand'" style="cursor:normal" onclick="edit(<%=iIdRenglon%>);">
					<%=sClave%>
				</a>
			</TD>
			<TD><a onmouseover="this.style.cursor='hand'" style="cursor:normal" onclick="edit(<%=iIdRenglon%>);">
					<%=sPrograma%>
				</a>
			</TD>
			<TD><a onmouseover="this.style.cursor='hand'" style="cursor:normal" onclick="edit(<%=iIdRenglon%>);">
					<%=sTipo%>
				</a>
			</TD>
			<TD align="right">
				<a onmouseover="this.style.cursor='hand'" style="cursor:normal" onclick="edit(<%=iIdRenglon%>);">
					<%=myFormatter.format(java.lang.Double.parseDouble(fMontoAprobado))%>&nbsp;
				</a>
			</TD>
			<TD align="right">
				<a onmouseover="this.style.cursor='hand'" style="cursor:normal" onclick="edit(<%=iIdRenglon%>);">
					<%=myFormatter.format(java.lang.Double.parseDouble(fMontoEjercido))%>&nbsp;
				</a>
			</TD>
			<TD align="right">
				<a onmouseover="this.style.cursor='hand'" style="cursor:normal" onclick="edit(<%=iIdRenglon%>);">
					<%=myFormatter.format(java.lang.Double.parseDouble(fMontoAprobado) - java.lang.Double.parseDouble(fMontoEjercido))%>&nbsp;
				</a>
			</TD>
			<TD><a onmouseover="this.style.cursor='hand'" style="cursor:normal" onclick="edit(<%=iIdRenglon%>);">
					<%=iFechaInicial%>
				</a>
			</TD>
			<TD><a onmouseover="this.style.cursor='hand'" style="cursor:normal" onclick="edit(<%=iIdRenglon%>);">
					<%=iFechaFinal%>
				</a>
			</TD>
			<TD><a onmouseover="this.style.cursor='hand'" style="cursor:normal" onclick="edit(<%=iIdRenglon%>);">
					<%=sAvanceFisico%>
				</a>
			</TD>
			<TD><a onmouseover="this.style.cursor='hand'" style="cursor:normal" onclick="edit(<%=iIdRenglon%>);">
					<%=sAvanceFinanciado%>
				</a>
			</TD>
			<TD><a onmouseover="this.style.cursor='hand'" style="cursor:normal" onclick="edit(<%=iIdRenglon%>);">
					<%=sObservaciones%>
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
