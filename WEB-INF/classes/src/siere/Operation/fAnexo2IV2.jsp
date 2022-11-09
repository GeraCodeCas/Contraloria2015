<%/*********************************************************************************************************
Elaboro:	Julio Enrique Espinosa Torres
Lugar:		Monterrey, NL
Fecha:		15.Nov.2002
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
Anexo2IV2 oAnexo2IV2 	= new Anexo2IV2();
int iIdAnexo = oAnexo2IV2.GetIdAnexo();
%>
<%@include file="fAnexoInicia.jsp"%>
<html>
<head>
	<title>Entrega - Recepción : Anexo II.4.2</title>
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
		if(opt == 2){
			document.forma.sOpcion.value = 'SAVEDETALLE';
			document.forma.submit();
		}
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
<FORM action="pAnexo2IV2.jsp" name="forma" method="post" >
	<input type="hidden" name="sOpcion" value="">
	<input type="hidden" name="sCodigo" value="<%=sCodigo%>"> 
	<input type="hidden" name="sOpt" value="<%=sOpt%>">  
	<TABLE align=center border=0 cellPadding=0 cellSpacing=0 width="100%">
		<tr>
		<TD colspan="3" class="TituloParrafo" width="100%">&nbsp;&nbsp;ANEXO II.4.2 - RELACIÓN DE CHEQUES EXPEDIDOS SIN ENTREGAR</TD>
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
		<%}//AGREGADO POR MENSAJES SOLO LECTURA (5)
		if( !sMensageEstatus.equals("") ) {
			out.println("<font class='TituloEstatus'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;" + sMensageEstatus + "</font>" );
		}%>
		</TD>			
			<TD align=right>
			<%//AGREGADO POR VALIDACION ESTATUS 4
			if(!bSoloLectura) { %>
			<a onmouseover="this.style.cursor='hand'" style="cursor:normal" onclick="Carga('<%=iIdFuncionario%>','<%=iIdAnexo%>', 'cAnexo2IV2.jsp');"><img alt="Carga Masiva" src="<%=sPath%>Images/Carga.jpg"></a>&nbsp;&nbsp;
				<a onmouseover="this.style.cursor='hand'" style="cursor:normal" onclick="Undo();"><img alt="Deshace ultima Carga" src="<%=sPath%>Images/Undo.jpg"></a>&nbsp;&nbsp;
			<a onmouseover="this.style.cursor='hand'" style="cursor:normal" onclick="Borra('<%=iIdFuncionario%>','<%=iIdAnexo%>');"><img alt="Elimina Anexo" src="<%=sPath%>Images/Eliminar.jpg"></a>&nbsp;&nbsp;
			<a onmouseover="this.style.cursor='hand'" style="cursor:normal" onclick="Adjuntar('<%=iIdFuncionario%>','<%=iIdAnexo%>');"><img src="<%=sPath%>Images/Attach.jpg" ></a>&nbsp;&nbsp;
			<%}%>
			<a onmouseover="this.style.cursor='hand'" style="cursor:normal" onclick="imprimir('<%=iIdFuncionario%>', 'iAnexo2IV2.jsp');"><img src="<%=sPath%>Images/Impresora.jpg" ></a>&nbsp;&nbsp;
			<a onmouseover="this.style.cursor='hand'" style="cursor:normal" onclick="ayuda('../Help/aAnexo2IV2.htm');"><img src="<%=sPath%>Images/Ayuda.jpg" ></a></td> 
			<TD align=right>
			
	<%
	oAnexo2IV2.GetAll(iIdFuncionario, iItemsPagina, iPagina); 
	long iAllCount = oAnexo2IV2.GetAllCount();
	if(!bSoloLectura) {
	if(sOpcion.equals("SAVE")  || sOpcion.equals("SAVEDETALLE") || sOpcion.equals("NORMAL") || sOpcion.equals("")) {%>						    
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
			<td class="TituloMenu">Fecha</TD>
			<td class="TituloMenu">Número de Cuenta</TD>
			<td class="TituloMenu">Banco</TD>
			<td class="TituloMenu">Beneficiario</TD>
			<td class="TituloMenu">Número de Cheque</TD>
			<td class="TituloMenu">Importe</TD>
		</TR>
		<%
		if(!sEstatus.equals("0")){
		if(sOpcion.equals("NEW")){%>
		<TR align="middle">
        	<TD colspan="2"></TD>
			<TD>
				<INPUT class="txtBox" name="sFecha" id="sFecha" type="Text" size="9"  maxlength="10" value="" readonly>&nbsp;<img src="<%=sPath%>Images/Fecha.gif" align="top" border=0 onclick="fPopCalendar(sFecha,sFecha)"></TD>
			<TD>
				<INPUT class="txtBox" name="sNoCuenta" id="sNoCuenta" type="Text" size="30" value="" maxlength="50" onKeyPress="isInValid();" onpaste="validaPasteStr(this);"></TD>
			<TD>
				<INPUT class="txtBox" name="sBanco" id="sBanco" type="Text" size="30" value="" maxlength="100" onKeyPress="isInValid();" onpaste="validaPasteStr(this);"></TD>
			<TD>
				<INPUT class="txtBox" name="sBeneficiario" id="sBeneficiario" type="Text" size="30" value="" maxlength="50" onKeyPress="isInValid();" onpaste="validaPasteStr(this);"></TD>
			<TD>
				<INPUT class="txtBox" name="sNoCheque" id="sNoCheque" type="Text" size="30" value="" maxlength="50" onKeyPress="isInValid();" onpaste="validaPasteStr(this);"></TD>
			<TD>
				<INPUT class="txtNumeric" name="sImporte" id="sImporte" type="Text" size="10" value="" maxlength="20" onkeypress="valida(this);" onpaste="return validaPasteNum(this);"></TD>
		</TR><%
		}
		int intContador = 0;
		String sBackColor = "";
		
		long iTotalPaginas = ((iAllCount / iItemsPagina) * iItemsPagina) == iAllCount ? (iAllCount / iItemsPagina) : (iAllCount / iItemsPagina) + 1;
		if(iTotalPaginas<iPagina){ iPagina = java.lang.Integer.parseInt(iTotalPaginas+"") ; }
		if(iPagina==0){iPagina=1;}
		for(int i=0;i<oAnexo2IV2.GetAll(iIdFuncionario, iItemsPagina, iPagina);i++){
			String vIdRenglon 						= oAnexo2IV2.GetIdRenglon(i)!=-1?oAnexo2IV2.GetIdRenglon(i)+"":"0";
			String vFecha 							  = oAnexo2IV2.GetFecha(i)!=null?oAnexo2IV2.GetFecha(i):"";
			String vNoCuenta		  = oAnexo2IV2.GetNoCuenta(i)!=null?oAnexo2IV2.GetNoCuenta(i):"";
			String vBanco 				      = oAnexo2IV2.GetBanco(i)!=null?oAnexo2IV2.GetBanco(i):"";
			String vBeneficiario 					= oAnexo2IV2.GetBeneficiario(i)!=null?oAnexo2IV2.GetBeneficiario(i):"";
			String vNoCheque 					= oAnexo2IV2.GetNoCheque(i)!=null?oAnexo2IV2.GetNoCheque(i):"";
			String vImporte		            = oAnexo2IV2.GetImporte(i)!=null?oAnexo2IV2.GetImporte(i):"";

			intContador = intContador + 1;
			if (intContador%2 == 0)	{sBackColor = "#ffffff";}
			else					{sBackColor = "#eeeeee";}
			if(sOpcion.equals("EDIT") && sCodigo.equals(vIdRenglon+"") ){%>
		<TR align="left" bgcolor="<%=sBackColor%>">
			<TD colspan="2"></TD>
			<TD>
				<INPUT class="txtBox" name="sFecha" id="sFecha" type="Text" size="9" maxlength="10"  value="<%=vFecha%>" readonly>&nbsp;<img src="<%=sPath%>Images/Fecha.gif" align="top" border=0 onclick="fPopCalendar(sFecha,sFecha)"></TD>
			<TD>
				<INPUT class="txtBox" name="sNoCuenta" id="sNoCuenta" type="Text" size="30" maxlength="50" value="<%=vNoCuenta%>" onKeyPress="isInValid();" onpaste="validaPasteStr(this);"></TD>
			<TD>
				<INPUT class="txtBox" name="sBanco" id="sBanco" type="Text" size="30" maxlength="100" value="<%=vBanco%>" onKeyPress="isInValid();" onpaste="validaPasteStr(this);"></TD>
			<TD>
				<INPUT class="txtBox" name="sBeneficiario" id="sBeneficiario" type="Text" size="30" maxlength="50" value="<%=vBeneficiario%>" onKeyPress="isInValid();" onpaste="validaPasteStr(this);"></TD>
			<TD>
				<INPUT class="txtBox" name="sNoCheque" id="sNoCheque" type="Text" size="30" maxlength="50" value="<%=vNoCheque%>" onKeyPress="isInValid();" onpaste="validaPasteStr(this);"></TD>
			<TD>
				<INPUT class="txtNumeric" name="sImporte" id="sImporte" type="Text" size="10" maxlength="20" value="<%=vImporte%>" onkeypress="valida(this);" onpaste="return validaPasteNum(this);"></TD>
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
			<TD>&nbsp;<a onmouseover="this.style.cursor='hand'" style="cursor:normal" onclick="edit(<%=vIdRenglon%>);"><%=vFecha%></a></TD>
			<TD align="left">&nbsp;<a onmouseover="this.style.cursor='hand'" style="cursor:normal" onclick="edit(<%=vIdRenglon%>);"><%=vNoCuenta%></a>&nbsp;&nbsp;</TD>
			<TD align="left">&nbsp;<a onmouseover="this.style.cursor='hand'" style="cursor:normal" onclick="edit(<%=vIdRenglon%>);"><%=vBanco%></a>&nbsp;&nbsp;</TD>
			<TD align="left">&nbsp;<a onmouseover="this.style.cursor='hand'" style="cursor:normal" onclick="edit(<%=vIdRenglon%>);"><%=vBeneficiario%></a>&nbsp;&nbsp;</TD>
			<TD align="left">&nbsp;<a onmouseover="this.style.cursor='hand'" style="cursor:normal" onclick="edit(<%=vIdRenglon%>);"><%=vNoCheque%></a>&nbsp;&nbsp;</TD>
			<TD align="right">&nbsp;<a onmouseover="this.style.cursor='hand'" style="cursor:normal" onclick="edit(<%=vIdRenglon%>);"><%=myFormatter.format(new Double(!vImporte.equals("")?vImporte:"0"))%></a>&nbsp;&nbsp;</TD>
		</TR><%
			}
		}%>
</TABLE>
<br>
<br>
<TABLE cellPadding="0" cellSpacing="0" width="300" BORDER="1" BORDERCOLOR="WHITE" align="left">
	<!-- Etiqueta donde se aplican los encabezados de las tablas-->
	<TR align="middle">
		<td class="TituloMenu"><a onmouseover="this.style.cursor='hand'" style="cursor:normal" onclick="editDetalle(<%=iIdFuncionario%>);">Los Cheques de la presente relación son todos los que obran en poder de esta Unidad Administrativa al</a></TD>
	</TR>
		<%if(sOpcion.equals("NEW") && ( oAnexoEstatus.GetObservacion() == null ||  oAnexoEstatus.GetObservacion() == "")){%>
	<TR align="middle">
       	<TD align="center">
			<INPUT class="txtBox" name="sChequesObran" id="sChequesObran" type="Text" size="40" value="" maxlength="100" onKeyPress="isInValid();" onpaste="validaPasteStr(this);"></TD>
<%
		}%>	
<%		
			oAnexoEstatus.Get(iIdFuncionario, iIdAnexo);
			String vChequesObran 		= oAnexoEstatus.GetObservacion()!=null?oAnexoEstatus.GetObservacion():"";
			sBackColor = "#ffffff";
		if(sOpcion.equals("EDITDETALLE")){%>
		<TR align="left" bgcolor="<%=sBackColor%>">
			<TD align="center">
				<INPUT class="txtBox" name="sChequesObran" id="sChequesObran" type="Text" size="40" maxlength="100" value="<%=vChequesObran%>" onKeyPress="isInValid();" onpaste="validaPasteStr(this);"></TD>
		</TR><%
			} else {%>
		<TR align="left" bgcolor="<%=sBackColor%>">
			<TD align="center">&nbsp;<a onmouseover="this.style.cursor='hand'" style="cursor:normal" onclick="editDetalle(<%=iIdFuncionario%>);"><INPUT readonly style="BORDER:0;background-color: transparent;CURSOR:HAND;text-align:center" class="txtBox" name="sChequesObran" id="sChequesObran" type="Text" size="40" value="<%=vChequesObran%>"></a></TD>
		</tr>
	</table></TD>
	</TR><%}%>
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