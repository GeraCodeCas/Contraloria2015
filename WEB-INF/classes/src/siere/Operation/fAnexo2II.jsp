<%/*********************************************************************************************************
Elaboro:	Julio Enrique Espinosa Torres
Lugar:		Monterrey, NL
Fecha:		06.Nov.2002
Compañia:	CONSISS*/%>
<%@page import="com.consiss.util.tools.*"%>
<%@page import="com.gob.*"%>
<%@page import="java.util.*" %>
<%
//Valida la permanencia del usuario en session
if ((String)session.getValue("ok")!="Consiss") response.sendRedirect("Error.html");

String	sOpcion = request.getParameter("sOpcion")!= null ? request.getParameter("sOpcion"): "";
String	sCodigo = request.getParameter("sCodigo")!= null ? request.getParameter("sCodigo"): "";

String	sOpt = request.getParameter("sOpt")!= null ? request.getParameter("sOpt"): "0";
java.text.DecimalFormat myFormatter = new java.text.DecimalFormat("###,##0.00");
Anexo2II oAnexo2II 	= new Anexo2II();
DetalleAnexo2II oDetalleAnexo2II 	= new DetalleAnexo2II();
int iIdAnexo = oAnexo2II.GetIdAnexo();
%>
<%@include file="fAnexoInicia.jsp"%>
<html>
<head>
	<title>Entrega - Recepción : Anexo II.2</title>
<link rel="stylesheet" type="text/css" href="<%=sPath%>Styles/Gobierno.css">
<script language="JavaScript" src="<%=sPath%>Scripts/Libreria.js"></script>
<script language="JavaScript" src="<%=sPath%>Scripts/Calendario.js"></script>
<script language="JavaScript" src="<%=sPath%>Scripts/Gobierno.js"></script>
<script language="JavaScript">
	
	function edit(pCODE){
	<%//AGREGADO POR VALIDACION ESTATUS 1
	if(!bSoloLectura) { %>
		document.forma.sCodigo.value = pCODE;
		document.forma.sOpcion.value = 'EDIT';
		document.forma.sOpt.value = 1;
		document.forma.submit();
		<%}%>
	}
	
	function editDetalle(pCODE){
	<%//AGREGADO POR VALIDACION ESTATUS 1
	if(!bSoloLectura) { %>
		document.forma.sCodigo.value = pCODE;
		document.forma.sOpcion.value = 'EDITDETALLE';
		document.forma.sOpt.value = 2;
		document.forma.submit();
	<%}%>
	}
	
	function save(opt){
		if (opt == 0){	
			document.forma.sOpcion.value = 'STATUS';
		  	document.forma.submit();
		}
		if (opt == 1){	
			document.forma.sOpcion.value = 'SAVE';
		  	document.forma.submit();
		}
		if (opt == 2){
			document.forma.sOpcion.value = 'SAVEDETALLE';
		  	document.forma.submit();
		}
	}
	
	function cancel(){
		document.forma.sCodigo.value = 0;
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
<FORM action="pAnexo2II.jsp" name="forma" method="post" >
	<input type="hidden" name="sOpcion" value="">
	<input type="hidden" name="sCodigo" value="<%=sCodigo%>"> 
	<input type="hidden" name="sOpt" value="<%=sOpt%>">  
	<TABLE align=center border=0 cellPadding=0 cellSpacing=0 width="100%">
		<tr>
		<TD colspan="3" class="TituloParrafo" width="100%">&nbsp;&nbsp;ANEXO II.2 - SITUACIÓN DE FONDOS REVOLVENTES</TD>
		</tr>
		<TR>
		<TD width="70%">
		<%//AGREGADO POR VALIDACION ESTATUS 2
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
			<%//AGREGADO POR VALIDACION ESTATUS 4
			if(!bSoloLectura) { %>
			<a onmouseover="this.style.cursor='hand'" style="cursor:normal" onclick="Adjuntar('<%=iIdFuncionario%>','<%=iIdAnexo%>');"><img src="<%=sPath%>Images/Attach.jpg" ></a>&nbsp;&nbsp;
			<%}%>
			<a onmouseover="this.style.cursor='hand'" style="cursor:normal" onclick="imprimir('<%=iIdFuncionario%>', 'iAnexo2II.jsp');"><img src="<%=sPath%>Images/Impresora.jpg" ></a>&nbsp;&nbsp;
			<a onmouseover="this.style.cursor='hand'" style="cursor:normal" onclick="ayuda('../Help/aAnexo2II.htm');"><img src="<%=sPath%>Images/Ayuda.jpg" ></a></td> 
			<TD align=right>
			
	<%//AGREGADO POR VALIDACION ESTATUS 5
	if(!bSoloLectura) {
	if(sOpcion.equals("SAVE") || sOpcion.equals("NORMAL") || sOpcion.equals("") ) {
	%>						    
				<INPUT class="boton" type="button" onclick="news();" name="NEW" value="Nuevo">&nbsp;
	<%} else {%>	
				<INPUT class="boton" type="button" onclick="cancel();" name="CANCEL" value="Cancelar">&nbsp;
	<%}%>
				<INPUT class="boton" type="button" onclick="save('<%=sOpt%>');" name="SAVE" value="Grabar">&nbsp;
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
				sSep = ", ";
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
			<td class="TituloMenu">Departamento</TD>
			<td class="TituloMenu">Monto Total Fondo</TD>
			<td class="TituloMenu">Efectivo</TD>
			<td class="TituloMenu">Comprobantes</TD>
			<td class="TituloMenu">Vales Provisionales</TD>
			<td class="TituloMenu">Otros</TD>
			<td class="TituloMenu">Responsable del Fondo</TD>
		</TR>
		<%
		if(!sEstatus.equals("0")){
		if(sOpcion.equals("NEW")){%>
		<TR align="middle">
        	<TD colspan="2"></TD>
				<TD>
					<INPUT class="txtBox" name="sDepartamento" id="sDepartamento" type="Text" size="40" value="" maxlength="255" onKeyPress="isInValid();" onpaste="validaPasteStr(this);"></TD>
				<TD>
					<INPUT class="txtNumeric" name="sMontoTotal" id="sMontoTotal" type="Text" size="10" value="" maxlength="20" onkeypress="valida(this);" onpaste="return validaPasteNum(this);"></TD>
				<TD>
					<INPUT class="txtNumeric" name="sEfectivo" id="sEfectivo" type="Text" size="10" value="" maxlength="20" onkeypress="valida(this);" onpaste="return validaPasteNum(this);"></TD>
				<TD>
					<INPUT class="txtNumeric" name="sComprobantes" id="sComprobantes" type="Text" size="10" value="" maxlength="20" onkeypress="valida(this);" onpaste="return validaPasteNum(this);"></TD>
				<TD>
					<INPUT class="txtNumeric" name="sValesProvisionales" id="sValesProvisionales" type="Text" size="10" maxlength="20" value="" onkeypress="valida(this);" onpaste="return validaPasteNum(this);"></TD>
				<TD>
					<INPUT class="txtNumeric" name="sOtros" id="sOtros" type="Text" size="10" value="" maxlength="20" onkeypress="valida(this);" onpaste="return validaPasteNum(this);"></TD>
				<TD>
					<INPUT class="txtBox" name="sResponsableFondo" id="sResponsableFondo" type="Text" size="30" value="" maxlength="255" onKeyPress="isInValid();" onpaste="validaPasteStr(this);"></TD>
		</TR><%
		}%>	
<%		
			int intContador = 0;
			String sBackColor = "";
			oAnexo2II.GetAll(iIdFuncionario);
		for(int i=0;i<oAnexo2II.GetAll(iIdFuncionario);i++){
		  String vIdRenglon 				= oAnexo2II.GetIdRenglon(i)!=-1?oAnexo2II.GetIdRenglon(i)+"":"0";
			String vDepartamento 			= oAnexo2II.GetDepartamento(i)!=null?oAnexo2II.GetDepartamento(i):"";
			String vMontoTotal		  		= oAnexo2II.GetMontoTotal(i)!=null?oAnexo2II.GetMontoTotal(i):"";
			String vEfectivo 				= oAnexo2II.GetEfectivo(i)!=null?oAnexo2II.GetEfectivo(i):"";
			String vComprobantes 			= oAnexo2II.GetComprobantes(i)!=null?oAnexo2II.GetComprobantes(i):"";
			String vValesProvisionales 		= oAnexo2II.GetValesProvisionales(i)!=null?oAnexo2II.GetValesProvisionales(i):"";
			String vOtros		            = oAnexo2II.GetOtros(i)!=null?oAnexo2II.GetOtros(i):"";
			String vResponsableFondo 		= oAnexo2II.GetResponsableFondo(i)!=null?oAnexo2II.GetResponsableFondo(i):"";

			intContador = intContador + 1;
		 if (intContador%2 == 0){
					sBackColor = "#ffffff";
				}else{
					sBackColor = "#eeeeee";
			  }
			if(sOpcion.equals("EDIT") && sCodigo.equals(vIdRenglon+"") ){%>
		<TR align="left" bgcolor="<%=sBackColor%>">
			<TD colspan="2"></TD>
			<TD>
				<INPUT class="txtBox" name="sDepartamento" id="sDepartamento" type="Text" size="40" value="<%=vDepartamento%>" maxlength="255" onKeyPress="isInValid();" onpaste="validaPasteStr(this);"></TD>
			<TD>
				<INPUT class="txtNumeric" name="sMontoTotal" id="sMontoTotal" type="Text" size="10" value="<%=vMontoTotal%>" maxlength="20" onkeypress="valida(this);" onpaste="return validaPasteNum(this);"></TD>
			<TD>
				<INPUT class="txtNumeric" name="sEfectivo" id="sEfectivo" type="Text" size="10"  value="<%=vEfectivo%>" maxlength="20" onkeypress="valida(this);" onpaste="return validaPasteNum(this);"></TD>
			<TD>
				<INPUT class="txtNumeric" name="sComprobantes" id="sComprobantes" type="Text" size="10" value="<%=vComprobantes%>" maxlength="20" onkeypress="valida(this);" onpaste="return validaPasteNum(this);"></TD>
			<TD>
				<INPUT class="txtNumeric" name="sValesProvisionales" id="sValesProvisionales" type="Text" size="10" maxlength="20" value="<%=vValesProvisionales%>" onkeypress="valida(this);" onpaste="return validaPasteNum(this);"></TD>
			<TD>
				<INPUT class="txtNumeric" name="sOtros" id="sOtros" type="Text" size="10" value="<%=vOtros%>" maxlength="20" onkeypress="valida(this);" onpaste="return validaPasteNum(this);"></TD>
			<TD>
				<INPUT class="txtBox" name="sResponsableFondo" id="sResponsableFondo" type="Text" size="30" maxlength="255" value="<%=vResponsableFondo%>" onKeyPress="isInValid();" onpaste="validaPasteStr(this);"></TD>
		</TR><%
			} else {%>
		<TR align="left" bgcolor="<%=sBackColor%>" 
			onMouseOver = "MouseDentro(this);"
			onMouseOut  = "MouseFuera(this,'<%=sBackColor%>');">
			<TD colspan="2">
			<%//AGREGADO POR VALIDACION ESTATUS 6
			if(!bSoloLectura) { %>
				<a onmouseover="this.style.cursor='hand'" style="cursor:normal" onclick="del(<%=vIdRenglon%>);"><img src="<%=sPath%>Images/Eliminar.gif" ></a>
			<%}%>	
			</TD>
			<TD>&nbsp;<a onmouseover="this.style.cursor='hand'" style="cursor:normal" onclick="edit(<%=vIdRenglon%>);"><%=vDepartamento%></a></TD>
			<TD align="right">&nbsp;<a onmouseover="this.style.cursor='hand'" style="cursor:normal" onclick="edit(<%=vIdRenglon%>);"><%=myFormatter.format(new Double(!vMontoTotal.equals("")?vMontoTotal:"0"))%></a>&nbsp;&nbsp;</TD>
			<TD align="right">&nbsp;<a onmouseover="this.style.cursor='hand'" style="cursor:normal" onclick="edit(<%=vIdRenglon%>);"><%=myFormatter.format(new Double(!vEfectivo.equals("")?vEfectivo:"0"))%></a>&nbsp;&nbsp;</TD>
			<TD align="right">&nbsp;<a onmouseover="this.style.cursor='hand'" style="cursor:normal" onclick="edit(<%=vIdRenglon%>);"><%=myFormatter.format(new Double(!vComprobantes.equals("")?vComprobantes:"0"))%></a>&nbsp;&nbsp;</TD>
			<TD align="right">&nbsp;<a onmouseover="this.style.cursor='hand'" style="cursor:normal" onclick="edit(<%=vIdRenglon%>);"><%=myFormatter.format(new Double(!vValesProvisionales.equals("")?vValesProvisionales:"0"))%></a>&nbsp;&nbsp;</TD>
			<TD align="right">&nbsp;<a onmouseover="this.style.cursor='hand'" style="cursor:normal" onclick="edit(<%=vIdRenglon%>);"><%=myFormatter.format(new Double(!vOtros.equals("")?vOtros:"0"))%></a>&nbsp;&nbsp;</TD>
			<TD>&nbsp;<a onmouseover="this.style.cursor='hand'" style="cursor:normal" onclick="edit(<%=vIdRenglon%>);"><%=vResponsableFondo%></a></TD>
		</TR><%
			}
		}%>
</TABLE>
<br>
<br>
<TABLE cellPadding="0" cellSpacing="0" width="150" BORDER="1" BORDERCOLOR="white" align="left">
	<!-- Etiqueta donde se aplican los encabezados de las tablas-->
	<TR align="middle">
		<td class="TituloMenu"><a onmouseover="this.style.cursor='hand'" style="cursor:normal" onclick="editDetalle(<%=iIdFuncionario%>);">Fecha Corte</a></TD>
	</TR>
	<%if(sOpcion.equals("NEW")  && (oAnexoEstatus.GetObservacion() == null  ||  oAnexoEstatus.GetObservacion().trim().equals(""))){%>
	<TR align="middle">
       	<TD align="center">
			<INPUT readonly class="txtBox" name="sFechaCorte" id="sFechaCorte" type="Text" size="10" value="">&nbsp;<img src="<%=sPath%>Images/Fecha.gif" border=0 onclick="fPopCalendar(sFechaCorte,sFechaCorte)"></TD>
	</tr>	
</TABLE></TD>
</TR><%
	} else {
		//oAnexoEstatus.Get(iIdFuncionario, iIdAnexo);
		String vFechaCorte 		= oAnexoEstatus.GetObservacion()!=null?oAnexoEstatus.GetObservacion():"";
		sBackColor = "#ffffff";
		if(sOpcion.equals("EDITDETALLE")){%>
	<TR align="left" bgcolor="<%=sBackColor%>">
		<TD align="center">
			<INPUT readonly class="txtBox" name="sFechaCorte" id="sFechaCorte" type="Text" size="10" value="<%=vFechaCorte%>">&nbsp;<img src="<%=sPath%>Images/Fecha.gif" border=0 onclick="fPopCalendar(sFechaCorte,sFechaCorte)"></TD>
	</TR>
</table></TD>
</TR><%
		} else {%>
	<TR align="left" bgcolor="<%=sBackColor%>">
		<TD align="center">&nbsp;<a onmouseover="this.style.cursor='hand'" style="cursor:normal" onclick="editDetalle(<%=iIdFuncionario%>);"><INPUT readonly style="BORDER:0;background-color:transparent;CURSOR:HAND;text-align:center" type="text" name="sFechaCorte" id="sFechaCorte" value="<%=vFechaCorte%>"></a></TD>
	</tr>
</table></TD>
</TR><%
		}
	}
%><%
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
</FORM>
</td>
	<!-- Contenido -->
</tr>
</table>
<%@include file="Footer.jsp"%>
<!--ESTA ES LA ACTUALIZACION DEL 26-03-2003-->
</body>
</html>
