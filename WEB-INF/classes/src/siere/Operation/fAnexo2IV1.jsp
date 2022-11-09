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
if ((String)session.getValue("ok")!="Consiss") 	response.sendRedirect("Error.html");

String	sOpcion = request.getParameter("sOpcion")!= null ? request.getParameter("sOpcion"): "";
String	sCodigo = request.getParameter("sCodigo")!= null ? request.getParameter("sCodigo"): "";

String	sOpt = request.getParameter("sOpt")!= null ? request.getParameter("sOpt"): "0";
java.text.DecimalFormat myFormatter = new java.text.DecimalFormat("###,##0.00");
int	iPagina = request.getParameter("iPagina")!= null ? java.lang.Integer.parseInt(request.getParameter("iPagina")): 1;
Anexo2IV1 oAnexo2IV1 	= new Anexo2IV1();
DetalleAnexo2IV1 oDetalleAnexo2IV1 	= new DetalleAnexo2IV1();

int iIdAnexo = oAnexo2IV1.GetIdAnexo();
%>
<%@include file="fAnexoInicia.jsp"%>
<html>
<head>
	<title>Entrega - Recepción : Anexo II.4.1</title>
<link rel="stylesheet" type="text/css" href="<%=sPath%>Styles/Gobierno.css">
<script language="JavaScript" src="<%=sPath%>Scripts/Libreria.js"></script>
<script language="JavaScript" src="<%=sPath%>Scripts/Gobierno.js"></script>
<script language="JavaScript" src="<%=sPath%>Scripts/Calendario.js"></script>
<script language="JavaScript">
	
	function edit(pCODE, Opt){
	<%//AGREGADO POR VALIDACION ESTATUS 1
	if(!bSoloLectura) { %>
		document.forma.sCodigo.value = pCODE;
		if(Opt == 1){
			document.forma.sOpcion.value = 'EDIT';
			document.forma.sOpt.value = 1;
		}
		
		if(Opt == 2){
			document.forma.sOpcion.value = 'EDITDETALLE';
			document.forma.sOpt.value = 2;
		}
		
		if(Opt == 3){
			document.forma.sOpcion.value = 'EDITDETALLE3';
			document.forma.sOpt.value = 3;
		}
		document.forma.submit();
	<%}%>
	}
	
	function save(Opt){
		if(Opt == 1){
			document.forma.sOpcion.value = 'SAVE';
			document.forma.submit();
		}
		if (Opt == 2){
			document.forma.sOpcion.value = 'SAVEDETALLE';
			document.forma.submit();
		}
	}
	
	function irPag(pPagina){
		document.forma.iPagina.value = pPagina;
		document.forma.sOpcion.value = 'NORMAL';
		document.forma.submit();
	}
	
	function cancel(Opt){
		if(Opt == 1){
			document.forma.sCodigo.value = 0;
			document.forma.sOpcion.value = 'NORMAL';
		}
		if(Opt == 2){
			document.forma.sCodigo.value = 0;
			document.forma.sOpcion.value = 'NORMALDETALLE';
		}
		document.forma.submit();
	}
	
	function news(Opt) {
		document.forma.sCodigo.value = 0;
		
		if (Opt == 1){ 
			document.forma.sOpcion.value = 'NEW';
			document.forma.sOpt.value = 1;
		}
		if (Opt == 2){
			document.forma.sOpcion.value = 'NEWDETALLE';
			document.forma.sOpt.value = 2;
		}
		document.forma.submit();
	}
	
	function del(pCODE, Opt){
		if(Opt == 1){
			if(confirm("¿Desea Eliminar el Registro?")){ 
				document.forma.sCodigo.value = pCODE;
				document.forma.sOpcion.value = 'DEL';
				document.forma.submit();
			}
		}
		if(Opt == 2){
			if(confirm("¿Desea Eliminar la Firma Registrada?")){ 
				document.forma.sCodigo.value = pCODE;
				document.forma.sOpcion.value = 'DELDETALLE';
				document.forma.submit();
			}
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
<FORM action="pAnexo2IV1.jsp" name="forma" method="post" >
	<input type="hidden" name="sOpcion" value="">
	<input type="hidden" name="sCodigo" value="<%=sCodigo%>">
	<input type="hidden" name="sOpt" value="<%=sOpt%>">  
	<TABLE align=center border=0 cellPadding=0 cellSpacing=0 width="100%">
		<tr>
		<TD colspan="3" class="TituloParrafo" width="100%">&nbsp;&nbsp;ANEXO II.4.1 - DETALLE DE LA SITUACIÓN DE BANCOS</TD>
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
			<a onmouseover="this.style.cursor='hand'" style="cursor:normal" onclick="Carga('<%=iIdFuncionario%>','<%=iIdAnexo%>', 'cAnexo2IV1.jsp');"><img alt="Carga Masiva" src="<%=sPath%>Images/Carga.jpg"></a>&nbsp;&nbsp;
				<a onmouseover="this.style.cursor='hand'" style="cursor:normal" onclick="Undo();"><img alt="Deshace ultima Carga" src="<%=sPath%>Images/Undo.jpg"></a>&nbsp;&nbsp;
			<a onmouseover="this.style.cursor='hand'" style="cursor:normal" onclick="Borra('<%=iIdFuncionario%>','<%=iIdAnexo%>');"><img alt="Elimina Anexo" src="<%=sPath%>Images/Eliminar.jpg"></a>&nbsp;&nbsp;
			<a onmouseover="this.style.cursor='hand'" style="cursor:normal" onclick="Adjuntar('<%=iIdFuncionario%>','<%=iIdAnexo%>');"><img src="<%=sPath%>Images/Attach.jpg" ></a>&nbsp;&nbsp;
			<%}%>
			<a onmouseover="this.style.cursor='hand'" style="cursor:normal" onclick="imprimir('<%=iIdFuncionario%>', 'iAnexo2IV1.jsp');"><img src="<%=sPath%>Images/Impresora.jpg" ></a>&nbsp;&nbsp;
			<a onmouseover="this.style.cursor='hand'" style="cursor:normal" onclick="ayuda('../Help/aAnexo2IV1.htm');"><img src="<%=sPath%>Images/Ayuda.jpg" ></a></td> 
			<TD align=right>
			
		<%//AGREGADO POR VALIDACION ESTATUS 5
		oAnexo2IV1.GetAll(iIdFuncionario, iItemsPagina, iPagina); 
		long iAllCount = oAnexo2IV1.GetAllCount();
		if(!bSoloLectura) {
		if(sOpcion.equals("SAVE") || sOpcion.equals("NORMAL") || sOpcion.equals("") ) {
		%>						    
				<INPUT class="boton" type="button" onclick="news(1);" name="NEW" value="Nuevo">&nbsp;
		<%} else {%>	
				<INPUT class="boton" type="button" onclick="cancel(1);" name="CANCEL" value="Cancelar">&nbsp;
		<%}%>
				<INPUT class="boton" type="button" onclick="save(1);" name="SAVE" value="Grabar">&nbsp;
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
		<TR align="center" valign="middle">
			<td class="TituloMenu" rowspan="2" colspan="2">&nbsp;</td>
			<td class="TituloMenu" rowspan="2">No. Cuenta</TD>
			<td class="TituloMenu" rowspan="2">Nombre de la Institución</TD>
			<td class="TituloMenu" colspan="2">Saldo Según</td>
			<td class="TituloMenu" colspan="2">Relación de Talonarios/Póliza</td>
			<td class="TituloMenu" colspan="3">Último Cheque Expedido por cada Chequera</td>
		</TR>
		<TR align="center" valign="middle">
			<td class="TituloMenu">Chequera</td>
			<td class="TituloMenu">Banco</td>
			<td class="TituloMenu">Inicial</td>
			<td class="TituloMenu">Final</td>
			<td class="TituloMenu">Número</td>
			<td class="TituloMenu">Fecha</td>
			<td class="TituloMenu">Importe</td>
		</TR><%
		if(!sEstatus.equals("0")){
		if(sOpcion.equals("NEW")){%>
		<TR align="middle">
			<TD colspan="2"></TD>
			<TD><INPUT class="txtBox" name="sNoCuenta" id="sNoCuenta" type="Text" size="20" value="" maxlength="50" onKeyPress="isInValid();" onpaste="validaPasteStr(this);"></TD>
			<TD><INPUT class="txtBox" name="sNombre" id="sNombre" type="Text" size="20" value="" maxlength="100" onKeyPress="isInValid();" onpaste="validaPasteStr(this);"></TD>
			<TD><INPUT class="txtNumeric" name="sChequera" id="sChequera" type="Text" size="15" value="" maxlength="20" onkeypress="validaNeg(this);" onpaste="return validaPasteNumNeg(this);"></td>
			<TD><INPUT class="txtNumeric" name="sBanco" id="sBanco" type="Text" size="15" value="" maxlength="20" onkeypress="validaNeg(this);" onpaste="return validaPasteNumNeg(this);"></td>
			<TD><INPUT class="txtBox" name="sInicial" id="sInicial" type="Text" size="15" value="" maxlength="50" onKeyPress="isInValid();" onpaste="validaPasteStr(this);"></td>
			<TD><INPUT class="txtBox" name="sFinal" id="sFinal" type="Text" size="15" value="" maxlength="50" onKeyPress="isInValid();" onpaste="validaPasteStr(this);"></td>
			<TD><INPUT class="txtBox" name="sNumero" id="sNumero" type="Text" size="12" value="" maxlength="50" onKeyPress="isInValid();" onpaste="validaPasteStr(this);"></td>
			<TD><INPUT class="txtBox" name="sFecha" id="sFecha" type="Text" size="9" maxlenght="10" value="" readonly>&nbsp;<img src="<%=sPath%>Images/Fecha.gif" align="top" border=0 onclick="fPopCalendar(sFecha,sFecha)"></td>
			<TD><INPUT class="txtNumeric" name="sImporte" id="sImporte" type="Text" size="12" value="" maxlength="20" onkeypress="valida(this);" onpaste="return validaPasteNum(this);"></td>
		</TR><%
		}
		int intContador = 0;
		String sBackColor = "";
		
		long iTotalPaginas = ((iAllCount / iItemsPagina) * iItemsPagina) == iAllCount ? (iAllCount / iItemsPagina) : (iAllCount / iItemsPagina) + 1;
		if(iTotalPaginas<iPagina){ iPagina = java.lang.Integer.parseInt(iTotalPaginas+"") ; }
		if(iPagina==0){iPagina=1;}
		for(int i=0;i<oAnexo2IV1.GetAll(iIdFuncionario, iItemsPagina, iPagina);i++){
			String vIdRenglon 						= oAnexo2IV1.GetIdRenglon(i)!=-1?oAnexo2IV1.GetIdRenglon(i)+"":"0";
			String vNoCuenta 							= oAnexo2IV1.GetNoCuenta(i)!=null?oAnexo2IV1.GetNoCuenta(i):"";
			String vNombre 							= oAnexo2IV1.GetNombre(i)!=null?oAnexo2IV1.GetNombre(i):"";
			String vChequera					= oAnexo2IV1.GetChequera(i)!=null?oAnexo2IV1.GetChequera(i):"";
			String vBanco 				    = oAnexo2IV1.GetBanco(i)!=null?oAnexo2IV1.GetBanco(i):"";
			String vInicial 						= oAnexo2IV1.GetInicial(i)!=null?oAnexo2IV1.GetInicial(i):"";
			String vFinal 					= oAnexo2IV1.GetFinal(i)!=null?oAnexo2IV1.GetFinal(i):"";
			String vNumero		            = oAnexo2IV1.GetNumero(i)!=null?oAnexo2IV1.GetNumero(i):"";
			String vFecha 				= oAnexo2IV1.GetFecha(i)!=null?oAnexo2IV1.GetFecha(i):"";
			String vImporte 				= oAnexo2IV1.GetImporte(i)!=null?oAnexo2IV1.GetImporte(i):"";

			intContador = intContador + 1;
			if (intContador%2 == 0)	{sBackColor = "#ffffff";}
			else					{sBackColor = "#eeeeee";}
			if(sOpcion.equals("EDIT") && sCodigo.equals(vIdRenglon+"") ){%>
		<TR align="left" bgcolor="<%=sBackColor%>">
			<TD colspan="2"></TD>
			<TD><INPUT class="txtBox" name="sNoCuenta" id="sNoCuenta" type="Text" size="20" maxlength="50" value="<%=vNoCuenta%>" onKeyPress="isInValid();" onpaste="validaPasteStr(this);"></TD>
			<TD><INPUT class="txtBox" name="sNombre" id="sNombre" type="Text" size="20" maxlength="100" value="<%=vNombre%>" onKeyPress="isInValid();" onpaste="validaPasteStr(this);"></TD>
			<TD><INPUT class="txtNumeric" name="sChequera" id="sChequera" type="Text" size="15" value="<%=vChequera%>" maxlength="20" onkeypress="validaNeg(this);" onpaste="return validaPasteNumNeg(this);"></td>
			<TD><INPUT class="txtNumeric" name="sBanco" id="sBanco" type="Text" size="15" value="<%=vBanco%>" maxlength="20" onkeypress="validaNeg(this);" onpaste="return validaPasteNumNeg(this);"></td>
			<TD><INPUT class="txtBox" name="sInicial" id="sInicial" type="Text" size="15" maxlength="50" value="<%=vInicial%>" onKeyPress="isInValid();" onpaste="validaPasteStr(this);"></td>
			<TD><INPUT class="txtBox" name="sFinal" id="sFinal" type="Text" size="15" maxlength="50" value="<%=vFinal%>" onKeyPress="isInValid();" onpaste="validaPasteStr(this);"></td>
			<TD><INPUT class="txtBox" name="sNumero" id="sNumero" type="Text" size="12" maxlength="50" value="<%=vNumero%>" onKeyPress="isInValid();" onpaste="validaPasteStr(this);"></td>
			<TD><INPUT class="txtBox" name="sFecha" id="sFecha" type="Text" size="9" maxlenght="10" value="<%=vFecha%>" readonly>&nbsp;<img src="<%=sPath%>Images/Fecha.gif" align="top" border=0 onclick="fPopCalendar(sFecha,sFecha)"></td>
			<TD><INPUT class="txtNumeric" name="sImporte" id="sImporte" type="Text" size="12" value="<%=vImporte%>" maxlength="20" onkeypress="valida(this);" onpaste="return validaPasteNum(this);"></td>
		</TR><%
			} else {%>
		<TR align="left" bgcolor="<%=sBackColor%>" 
			onMouseOver = "MouseDentro(this);"
			onMouseOut  = "MouseFuera(this,'<%=sBackColor%>');">
			<TD colspan="2">
		<%//AGREGADO POR VALIDACION ESTATUS 6
		if(!bSoloLectura) { %>
				<a onmouseover="this.style.cursor='hand'" style="cursor:normal" onclick="del(<%=vIdRenglon%>,1);"><img src="<%=sPath%>Images/Eliminar.gif" ></a>
		<%}%>	
			</TD>
			<TD>&nbsp;<a onmouseover="this.style.cursor='hand'" style="cursor:normal" onclick="edit(<%=vIdRenglon%>,1);"><%=vNoCuenta%></a></TD>
			<TD>&nbsp;<a onmouseover="this.style.cursor='hand'" style="cursor:normal" onclick="edit(<%=vIdRenglon%>,1);"><%=vNombre%></a></TD>
			<%if (vChequera.indexOf("-")==0){%>
				<TD align="right">&nbsp;<a onmouseover="this.style.cursor='hand'" style="cursor:normal" onclick="edit(<%=vIdRenglon%>,1);"><font color="Red">(<%=myFormatter.format(new Double(!vChequera.substring(1, vChequera.length()).equals("")?vChequera.substring(1, vChequera.length()):"0"))%>)</font></a></td>
			<%}else{%>
				<TD align="right">&nbsp;<a onmouseover="this.style.cursor='hand'" style="cursor:normal" onclick="edit(<%=vIdRenglon%>,1);"><%=myFormatter.format(new Double(!vChequera.equals("")?vChequera:"0"))%></a></td>
			<%}%>
			<%if (vBanco.indexOf("-")==0){%>
				<TD align="right">&nbsp;<a onmouseover="this.style.cursor='hand'" style="cursor:normal" onclick="edit(<%=vIdRenglon%>,1);"><font color="Red">(<%=myFormatter.format(new Double(!vBanco.substring(1, vBanco.length()).equals("")?vBanco.substring(1, vBanco.length()):"0"))%>)</font></a></td>
			<%}else{%>
				<TD align="right">&nbsp;<a onmouseover="this.style.cursor='hand'" style="cursor:normal" onclick="edit(<%=vIdRenglon%>,1);"><%=myFormatter.format(new Double(!vBanco.equals("")?vBanco:"0"))%></a></td>
			<%}%>
			<TD>&nbsp;<a onmouseover="this.style.cursor='hand'" style="cursor:normal" onclick="edit(<%=vIdRenglon%>,1);"><%=vInicial%></a></td>
			<TD>&nbsp;<a onmouseover="this.style.cursor='hand'" style="cursor:normal" onclick="edit(<%=vIdRenglon%>,1);"><%=vFinal%></a></td>
			<TD>&nbsp;<a onmouseover="this.style.cursor='hand'" style="cursor:normal" onclick="edit(<%=vIdRenglon%>,1);"><%=vNumero%></a></td>
			<TD>&nbsp;<a onmouseover="this.style.cursor='hand'" style="cursor:normal" onclick="edit(<%=vIdRenglon%>,1);"><%=vFecha%></a></td>
			<TD align="right">&nbsp;<a onmouseover="this.style.cursor='hand'" style="cursor:normal" onclick="edit(<%=vIdRenglon%>,1);"><%=myFormatter.format(new Double(!vImporte.equals("")?vImporte:"0"))%></a></td>
		</TR><%
			}
		}
%>
	</TABLE>
<br>

<TABLE cellPadding="0" cellSpacing="0" width="80%" BORDER="0" align="center">
<tr>
<td width="50%" valign="top" align="center">
<TABLE cellPadding="0" cellSpacing="0" width="90%" BORDER="1" BORDERCOLOR="white">
	<!-- Etiqueta donde se aplican los encabezados de las tablas-->
	<tr><td colspan="4" align="right">
	<%
	if(!bSoloLectura) {
		if(sOpcion.equals("DEL") || sOpcion.equals("NEW") ||  sOpcion.equals("EDIT") || sOpcion.equals("SAVE") || sOpcion.equals("NORMAL") || sOpcion.equals("SAVEDETALLE") || sOpcion.equals("NORMALDETALLE") || sOpcion.equals("")|| (oDetalleAnexo2IV1.GetAll(iIdFuncionario) == 0 && (!sOpcion.equals("NEWDETALLE")))) {%>
			<INPUT class="boton" type="button" onclick="news(2);" name="NEWDETALLE" value="Nuevo">&nbsp;
		<%} else {%>	
			<INPUT class="boton" type="button" onclick="cancel(2);" name="CANCELDETALLE" value="Cancelar">&nbsp;
		<%}%>
			<INPUT <%if(sOpcion.equals("NEW")){%>disabled<%}%> class="boton" type="button" onclick="save(2);" name="SAVEDETALLE" value="Grabar">&nbsp;
		<%}%>
		</td></tr>		
		<TR align="middle">
			<td class="TituloMenu" colspan="4">Firmas Registradas</TD>
		</TR>
		<TR align="middle">
		  <td class="TituloMenu" colspan="2">&nbsp;</td>
			<td class="TituloMenu">Nombre</TD>
			<td class="TituloMenu">Cargo</TD>
		</TR>
				<%if(sOpcion.equals("NEWDETALLE")){%>
		<TR align="middle">
	        <TD colspan="2"></TD>
        	<TD>
				<INPUT class="txtBox" name="sNombreFirma" id="sNombreFirma" type="Text" size="30" value="" maxlength="50" onKeyPress="isInValid();" onpaste="validaPasteStr(this);"></TD>
        	<TD>
				<INPUT class="txtBox" name="sCargo" id="sCargo" type="Text" size="20" value="" maxlength="100" onKeyPress="isInValid();" onpaste="validaPasteStr(this);"></TD>
		</TR><%
		}
		intContador = 0;
		sBackColor = "";	
		oDetalleAnexo2IV1.GetAll(iIdFuncionario);
		for(int i=0;i<oDetalleAnexo2IV1.GetAll(iIdFuncionario);i++){
			String vIdRenglonDetalle		= oDetalleAnexo2IV1.GetIdRenglon(i)!=-1?oDetalleAnexo2IV1.GetIdRenglon(i)+"":"0";
			String vNombreFirma 				= oDetalleAnexo2IV1.GetNombreFirma(i)!=null?oDetalleAnexo2IV1.GetNombreFirma(i):"";
			String vCargo						    = oDetalleAnexo2IV1.GetCargo(i)!=null?oDetalleAnexo2IV1.GetCargo(i):"";
			intContador = intContador + 1;
			if (intContador%2 == 0)	{sBackColor = "#ffffff";}
			else					{sBackColor = "#eeeeee";}
			if(sOpcion.equals("EDITDETALLE") && sCodigo.equals(vIdRenglonDetalle+"") ){%>
		<TR align="left" bgcolor="<%=sBackColor%>">
			<TD colspan="2"></TD>
			<TD>
				<INPUT class="txtBox" name="sNombreFirma" id="sNombreFirma" type="Text" size="30" maxlength="50" value="<%=vNombreFirma%>" onKeyPress="isInValid();" onpaste="validaPasteStr(this);"></TD>
			<TD>
			    <INPUT class="txtBox" name="sCargo" id="sCargo" type="Text" size="20" maxlength="100" value="<%=vCargo%>" onKeyPress="isInValid();" onpaste="validaPasteStr(this);"></TD>
			</TR><%
			} else {%>
		<TR align="left" bgcolor="<%=sBackColor%>" 
			onMouseOver = "MouseDentro(this);"
			onMouseOut  = "MouseFuera(this,'<%=sBackColor%>');">
			<TD colspan="2">
			<%//AGREGADO POR VALIDACION ESTATUS 6
			if(!bSoloLectura) { %>
			<a onmouseover="this.style.cursor='hand'" style="cursor:normal" onclick="del(<%=vIdRenglonDetalle%>,2);"><img src="<%=sPath%>Images/Eliminar.gif" ></a>
			<%}%>
			</TD>
			<TD width="50%" align="center">&nbsp;<a onmouseover="this.style.cursor='hand'" style="cursor:normal" onclick="edit('<%=vIdRenglonDetalle%>','2');"><%=vNombreFirma%></a></TD>
			<TD width="50%" align="center">&nbsp;<a onmouseover="this.style.cursor='hand'" style="cursor:normal" onclick="edit('<%=vIdRenglonDetalle%>','2');"><%=vCargo%></a></TD>
		</TR><%
			}
		}
%>
	</TABLE></td>
	<td align="center" width="50%" valign="top">
	<%	oAnexoEstatus.Get(iIdFuncionario, iIdAnexo);
			String vChequesSinEntregar 		= oAnexoEstatus.GetObservacion()!=null?oAnexoEstatus.GetObservacion():"";%>
	<TABLE cellPadding="0" cellSpacing="0" width="50%" BORDER="1" BORDERCOLOR="white">
	    <!-- Etiqueta donde se aplican los encabezados de las tablas-->
		<TR align="middle">
			<td class="TituloMenu" colspan="2"><a onmouseover="this.style.cursor='hand'" style="cursor:normal" onclick="edit(<%=iIdFuncionario%>,3);">Cantidad de Cheques sin Entregar</a></TD>
		</TR>
		<%if(sOpcion.equals("NEW") && (vChequesSinEntregar == ""  || vChequesSinEntregar == null )){%>
		<TR align="middle">
        	<TD align="center">
				<INPUT class="txtNumeric" name="sChequesSinEntregar" id="sChequesSinEntregar" type="Text" size="10" value="" onKeyPress="isInValid();" onpaste="validaPasteStr(this);"></TD>
		
		</TR><%
		}
    	sBackColor = "#ffffff";
		if(sOpcion.equals("EDITDETALLE3")){%>
		<TR align="left" bgcolor="<%=sBackColor%>">
			<TD align="center">
				<INPUT class="txtNumeric" name="sChequesSinEntregar" id="sChequesSinEntregar" type="Text" size="10" value="<%=vChequesSinEntregar%>" onKeyPress="isInValid();" onpaste="validaPasteStr(this);"></TD>
		</TR><%
			} else {%>
		<TR align="left" bgcolor="<%=sBackColor%>">
			<TD align="center">&nbsp;<a onmouseover="this.style.cursor='hand'" style="cursor:normal" onclick="edit(<%=iIdFuncionario%>,3);"
				><INPUT readonly style="BORDER:0;background-color: transparent;CURSOR:HAND;text-align:center" class="txtNumeric" name="sChequesSinEntregar" id="sChequesSinEntregar" type="Text" size="10" value="<%=vChequesSinEntregar%>"></a></TD>
		</TR>
	</TABLE></td>
	</tr><%	}%>
	</table><%
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
