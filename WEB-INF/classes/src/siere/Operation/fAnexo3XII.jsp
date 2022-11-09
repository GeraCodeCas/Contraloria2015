<%@page import="com.consiss.util.tools.*"%>
<%@page import="com.gob.*"%>
<%@page import="java.util.*" %>
<%
/********************************************************************************************************
'Elaboro:	Jesus Limon
'Lugar:		Monterrey, NL
'Fecha:		19.Nov.2002
'Compañia:	CONSISS
'Ultima Modificacion:30.Abr.2003
'By:	Enrique Martinez
'********************************************************************************************************/
%>
<%
//Valida la permanencia del usuario en session
if ((String)session.getValue("ok")!="Consiss")
			response.sendRedirect("Error.html");

String	sOpcion = request.getParameter("sOpcion")!= null ? request.getParameter("sOpcion"): "";
String	sCodigo = request.getParameter("sCodigo")!= null ? request.getParameter("sCodigo"): "";
String	vsIdTipoOrigen = request.getParameter("sIdTipoOrigen")!= null ? request.getParameter("sIdTipoOrigen"): "0";
int sIdTipoOrigen = java.lang.Integer.parseInt(vsIdTipoOrigen);
int	iPagina = request.getParameter("iPagina")!= null ? java.lang.Integer.parseInt(request.getParameter("iPagina")): 1;
java.text.DecimalFormat myFormatter = new java.text.DecimalFormat("###,##0.00");

Anexo3XII oAnexo	= new Anexo3XII();
int iIdAnexo = oAnexo.GetIdAnexo();
%>
<%@include file="fAnexoInicia.jsp"%>
<html>
<head>
	<title>Entrega - Recepción : Anexo III.12</title>
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
			document.forma.sCodigo.value = "0";
			document.forma.sOpcion.value = 'NORMAL';
			document.forma.submit();
		}
		function news() {
			document.forma.sCodigo.value = "0";
			document.forma.sOpcion.value = 'NEW';
			document.forma.submit();
		}
		function del(pCODE){
			if(confirm("¿Desea Eliminar el Registro?")){ 
				document.forma.sCodigo.value = pCODE;
				document.forma.sOpcion.value = 'DELETE';
				document.forma.submit();
			}
		}
		function irPag(pPagina){
			document.forma.iPagina.value = pPagina;
			document.forma.sOpcion.value = 'NORMAL';
			document.forma.submit();
		}
		function CambioTipoOrigen(){
			document.forma.sCodigo.value = "0";
			document.forma.sOpcion.value = 'NORMAL';
			document.forma.action='fAnexo3XII.jsp'
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
<FORM action="pAnexo3XII.jsp" name="forma" method="post" >
	<input type="hidden" name="sOpcion" value="">
	<input type="hidden" name="sCodigo" value="<%=sCodigo%>"> 
	<TABLE align=center border=0 cellPadding=0 cellSpacing=0 width="100%">
		<TR>
			<TD class="TituloParrafo" colspan="3">&nbsp;&nbsp;ANEXO III.12 - RELACIÓN DE ANTICIPOS DE OBRAS POR AMORTIZAR&nbsp;&nbsp;</TD>
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
				<br>ORIGEN DE LOS RECURSOS <!--< input class="txtBox" name="sOrigen" id="sOrigen" type="Text" size="20" maxlength="20" value="<%//=sOrigen%>">-->
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
			</td>
			<TD align=right><%//AGREGADO POR VALIDACION ESTATUS
				if(!bSoloLectura) { %>
			<a onmouseover="this.style.cursor='hand'" style="cursor:normal" onclick="Carga('<%=iIdFuncionario%>','<%=iIdAnexo%>', 'cAnexo3XII.jsp');"><img alt="Carga Masiva" src="<%=sPath%>Images/Carga.jpg"></a>&nbsp;&nbsp;
			<a onmouseover="this.style.cursor='hand'" style="cursor:normal" onclick="Undo();"><img alt="Deshace ultima Carga" src="<%=sPath%>Images/Undo.jpg"></a>&nbsp;&nbsp;
			<a onmouseover="this.style.cursor='hand'" style="cursor:normal" onclick="Borra('<%=iIdFuncionario%>','<%=iIdAnexo%>');"><img alt="Elimina Anexo" src="<%=sPath%>Images/Eliminar.jpg"></a>&nbsp;&nbsp;
			<a onmouseover="this.style.cursor='hand'" style="cursor:normal" onclick="Adjuntar('<%=iIdFuncionario%>', '<%=iIdAnexo%>');"><img src="<%=sPath%>Images/Attach.jpg" ></a>&nbsp;&nbsp;
			<%}%>
			<a onmouseover="this.style.cursor='hand'" style="cursor:normal" onclick="imprimirTipo(<%=iIdFuncionario%>, '<%=sIdTipoOrigen%>', 'iAnexo3XII.jsp');"><img src="<%=sPath%>Images/Impresora.jpg" ></a>&nbsp;&nbsp;
			<a onmouseover="this.style.cursor='hand'" style="cursor:normal" onclick="ayuda('<%=sPath%>Help/aAnexo3XII.htm');"><img src="<%=sPath%>Images/Ayuda.jpg" ></a></td> 
			<TD align=right>
<%//AGREGADO POR VALIDACION ESTATUS
	oAnexo.GetAll(iIdFuncionario,sIdTipoOrigen, iItemsPagina, iPagina); 
	long iAllCount = oAnexo.GetAllCount();
	if(!bSoloLectura) {
	if(sOpcion.equals("SAVE") || sOpcion.equals("NORMAL") || sOpcion.equals("") ) {
				if (sIdTipoOrigen!=0){
%>						    
				<INPUT class="boton" type="button" onclick="news();" name="NEW" value="Nuevo">&nbsp;
<%	
				}
	} else {
%>	
				<INPUT class="boton" type="button" onclick="cancel();" name="CANCEL" value="Cancelar">&nbsp;
<%
	}
%>
				<INPUT class="boton" type="button" onclick="save();" name="SAVE" value="Grabar">&nbsp;
<%
}
%>
			</TD>
		</TR>
<%		VMatrix vArchivoA;
		AnexoArchivo oArchivoA 	= new AnexoArchivo();
		vArchivoA = oArchivoA.GetAll(iIdAnexo, iIdFuncionario);
		String sSep = "";
		if(vArchivoA.getNumRows()>0){%>
		<TR>
			<TD><b>Archivos Adjuntos (Attachment): &nbsp;&nbsp;</b><% 
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
		<TR align="center" valign="middle">
			<td class="TituloMenu" rowspan="2" colspan="2">&nbsp;</td>
			<td class="TituloMenu" rowspan="2">Clave</TD>
			<td class="TituloMenu" rowspan="2">Obra</TD>
			<td class="TituloMenu" rowspan="2">No. Contrato</TD>
			<td class="TituloMenu" rowspan="2">Nombre del Contratista</TD>
			<td class="TituloMenu" rowspan="2">Costo Total</TD>
			<td class="TituloMenu" colspan="2">Importe</td>
			<td class="TituloMenu" rowspan="2">Saldo Anticipo por Amortizar</TD>
			<td class="TituloMenu" rowspan="2">Observaciones</TD>
		</TR>
		<TR align="center" valign="middle">
			<td class="TituloMenu">Anticipos Otorgados</td>
			<td class="TituloMenu">Anticipos Amortizados</td>
		</TR>
<%
if(!sEstatus.equals("0")){
		if(sOpcion.equals("NEW")){
%>
		<TR align="middle">
        	<TD colspan="2"></TD>
	       	<TD>
				<input class="txtBox" name="sClave"	id="sClave" type="Text" size="20" maxlength="20" value="" onKeyPress="isInValid();" onpaste="validaPasteStr(this);"></TD>
			<TD>
				<input class="txtBox" name="sObra" id="sObra" type="Text" size="20" maxlength="50" value="" onKeyPress="isInValid();" onpaste="validaPasteStr(this);"></TD>
			<TD>
				<input class="txtBox" name="sNoContrato" id="sNoContrato" type="Text" size="20" maxlength="50" value="" onKeyPress="isInValid();" onpaste="validaPasteStr(this);"></TD>
			<TD>
				<input class="txtBox" name="sNombreContratista" id="sNombreContratista" type="Text" size="20" maxlength="50" value="" onKeyPress="isInValid();" onpaste="validaPasteStr(this);"></TD>
			<TD>
				<input class="txtNumeric" name="sCostoTotal" id="sCostoTotal" type="Text" size="8" maxlength="20" value="" onkeypress="valida(this);" onpaste="return validaPasteNum(this);"></TD>
			<TD>
				<input class="txtNumeric" name="sAnticipoOtorgado" id="sAnticipoOtorgado" type="Text" size="8" maxlength="20" value="" onkeypress="valida(this);" onpaste="return validaPasteNum(this);"></TD>
			<TD>
				<input class="txtNumeric" name="sAnticipoAmortizado" id="sAnticipoAmortizado" type="Text" size="8" maxlength="20" value="" onkeypress="valida(this);" onpaste="return validaPasteNum(this);"></TD>
			<TD>
				<input class="txtNumeric" name="sSaldoAnticipoAmortizar" id="sSaldoAnticipoAmortizar" type="Text" size="8" maxlength="20" value="" onkeypress="valida(this);" onpaste="return validaPasteNum(this);"></TD>
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
			int 	iIdRenglon				= oAnexo.GetIdRenglon(i)!=-1?				oAnexo.GetIdRenglon(i):0;
			String 	sClave					= oAnexo.GetClave(i)!=null?					oAnexo.GetClave(i)+"":"";
			String 	sNombreContratista		= oAnexo.GetNombreContratista(i)!=null?		oAnexo.GetNombreContratista(i)+"":"";
			String 	sObra					= oAnexo.GetObra(i)!=null?					oAnexo.GetObra(i)+"":"";
			String 	iNoContrato				= oAnexo.GetNoContrato(i)!=null?			oAnexo.GetNoContrato(i):"";
			String	fCostoTotal				= oAnexo.GetCostoTotal(i)!=null?			oAnexo.GetCostoTotal(i):"0";
			String	fAnticipoOtorgado		= oAnexo.GetAnticipoOtorgado(i)!=null?		oAnexo.GetAnticipoOtorgado(i):"0";
			String 	fAnticipoAmortizado 	= oAnexo.GetAnticipoAmortizado(i)!=null?	oAnexo.GetAnticipoAmortizado(i):"0";
			String 	fSaldoAnticipoAmortizar = oAnexo.GetSaldoAnticipoAmortizar(i)!=null?oAnexo.GetSaldoAnticipoAmortizar(i):"0";
			String 	sObservaciones 			= oAnexo.GetObservacion(i)!=null?			oAnexo.GetObservacion(i):"";
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
	       	<TD>
				<input class="txtBox" name="sClave"	id="sClave" type="Text" size="20" maxlength="20" value="<%=sClave%>" onKeyPress="isInValid();" onpaste="validaPasteStr(this);"></TD>
			<TD>
				<input class="txtBox" name="sObra" id="sObra" type="Text" size="20" maxlength="50" value="<%=sObra%>" onKeyPress="isInValid();" onpaste="validaPasteStr(this);"></TD>
			<TD>
				<input class="txtBox" name="sNoContrato" id="sNoContrato" type="Text" size="20" maxlength="50" value="<%=iNoContrato%>" onKeyPress="isInValid();" onpaste="validaPasteStr(this);"></TD>
			<TD>
				<input class="txtBox" name="sNombreContratista" id="sNombreContratista" type="Text" size="50" maxlength="50" value="<%=sNombreContratista%>" onKeyPress="isInValid();" onpaste="validaPasteStr(this);"></TD>
			<TD>
				<input class="txtNumeric" name="sCostoTotal" id="sCostoTotal" type="Text" size="8" maxlength="20" value="<%=fCostoTotal%>" onkeypress="valida(this);" onpaste="return validaPasteNum(this);"></TD>
			<TD>
				<input class="txtNumeric" name="sAnticipoOtorgado" id="sAnticipoOtorgado" style="text-align:right;" type="Text" size="8" maxlength="20" value="<%=fAnticipoOtorgado%>" onkeypress="valida(this);" onpaste="return validaPasteNum(this);"></TD>
			<TD>
				<input class="txtNumeric" name="sAnticipoAmortizado" id="sAnticipoAmortizado" style="text-align:right;" type="Text" size="8" maxlength="20" value="<%=fAnticipoAmortizado%>" onkeypress="valida(this);" onpaste="return validaPasteNum(this);"></TD>
			<td>
				<input class="txtNumeric" name="sSaldoAnticipoAmortizar" id="sSaldoAnticipoAmortizar" style="text-align:right;" type="Text" size="8" maxlength="20" value="<%=fSaldoAnticipoAmortizar%>" onkeypress="valida(this);" onpaste="return validaPasteNum(this);"></td>
			<TD>
				<INPUT class="txtBox" name="sObservaciones" id="sObservaciones" type="Text" size="20" maxlength="255" value="<%=sObservaciones%>" onKeyPress="isInValid();" onpaste="validaPasteStr(this);"></TD>
		</TR>

<%
			} else {
%>
		<TR align="left" bgcolor="<%=sBackColor%>" 
			onMouseOver = "MouseDentro(this);"
			onMouseOut  = "MouseFuera(this,'<%=sBackColor%>');">
			<TD colspan="2"><%//AGREGADO POR VALIDACION ESTATUS
				if(!bSoloLectura) { %>
			<a onmouseover="this.style.cursor='hand'" style="cursor:normal" onclick="del(<%=iIdRenglon%>);"><img src="<%=sPath%>Images/Eliminar.gif" ></a>
			<%}%>
			</TD>
			<TD>&nbsp;	
				<a onmouseover="this.style.cursor='hand'" style="cursor:normal" onclick="edit(<%=iIdRenglon%>);">
					<%=sClave%>
				</a>
			</TD>
			<TD>&nbsp;	
				<a onmouseover="this.style.cursor='hand'" style="cursor:normal" onclick="edit(<%=iIdRenglon%>);">
					<%=sObra%>
				</a>
			</TD>
			<TD align="right">
				<a onmouseover="this.style.cursor='hand'" style="cursor:normal" onclick="edit(<%=iIdRenglon%>);">
					<%=iNoContrato%>&nbsp;
				</a>
			</TD>
			<TD >&nbsp;	
				<a onmouseover="this.style.cursor='hand'" style="cursor:normal" onclick="edit(<%=iIdRenglon%>);">
					<%=sNombreContratista%>
				</a>
			</TD>
			<TD align="right">
				<a onmouseover="this.style.cursor='hand'" style="cursor:normal" onclick="edit(<%=iIdRenglon%>);">
					<%=myFormatter.format(java.lang.Double.parseDouble(fCostoTotal))%>&nbsp;
				</a>
			</TD>
			<TD align="right">
				<a onmouseover="this.style.cursor='hand'" style="cursor:normal" onclick="edit(<%=iIdRenglon%>);">
					<%=myFormatter.format(java.lang.Double.parseDouble(fAnticipoOtorgado))%>&nbsp;
				</a>
			</TD>
			<TD align="right">
				<a onmouseover="this.style.cursor='hand'" style="cursor:normal" onclick="edit(<%=iIdRenglon%>);">
					<%=myFormatter.format(java.lang.Double.parseDouble(fAnticipoAmortizado))%>&nbsp;
				</a>
			</TD>
			<TD align="right">
				<a onmouseover="this.style.cursor='hand'" style="cursor:normal" onclick="edit(<%=iIdRenglon%>);">
					<%=myFormatter.format(java.lang.Double.parseDouble(fSaldoAnticipoAmortizar))%>&nbsp;
				</a>
			</TD>
			<TD >&nbsp;	
				<a onmouseover="this.style.cursor='hand'" style="cursor:normal" onclick="edit(<%=iIdRenglon%>);">
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