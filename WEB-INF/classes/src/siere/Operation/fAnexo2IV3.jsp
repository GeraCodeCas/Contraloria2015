<%/*********************************************************************************************************
Elaboro:	Julio Enrique Espinosa Torres
Lugar:		Monterrey, NL
Fecha:		18.Nov.2002
Compañia:	CONSISS
Modificación : 12.May.2003
Realizó : Enrique Martínez*/
%>
<%@page import="com.consiss.util.tools.*"%>
<%@page import="com.gob.*"%>
<%@page import="java.util.*" %>
<%
//Valida la permanencia del usuario en session
if ((String)session.getValue("ok")!="Consiss")	response.sendRedirect("Error.html");

String	sOpcion = request.getParameter("sOpcion")!= null ? request.getParameter("sOpcion"): "";
String	sCodigo = request.getParameter("sCodigo")!= null ? request.getParameter("sCodigo"): "";

int	iPagina = request.getParameter("iPagina")!= null ? java.lang.Integer.parseInt(request.getParameter("iPagina")): 1;

String	sOpt = request.getParameter("sOpt")!= null ? request.getParameter("sOpt"): "0";
Anexo2IV3 oAnexo2IV3 	= new Anexo2IV3();
DetalleAnexo2IV3 oDetalleAnexo2IV3 	= new DetalleAnexo2IV3();
java.text.DecimalFormat myFormatter = new java.text.DecimalFormat("###,##0.00");
int iIdAnexo = oAnexo2IV3.GetIdAnexo();
%>
<%@include file="fAnexoInicia.jsp"%>
<html>
<head>
	<title>Entrega - Recepción : Anexo II.4.3</title>
<link rel="stylesheet" type="text/css" href="<%=sPath%>Styles/Gobierno.css">
<script language="JavaScript" src="<%=sPath%>Scripts/Libreria.js"></script>
<script language="JavaScript" src="<%=sPath%>Scripts/Gobierno.js"></script>
<script language="JavaScript" src="<%=sPath%>Scripts/Calendario.js"></script>
<script language="JavaScript">
	function edit(pCODE, Opt){
	<%//AGREGADO POR VALIDACION ESTATUS 1
	if(!bSoloLectura) { %>
		document.forma.sCodigo.value = pCODE;
		if (Opt == 1){
			document.forma.sOpcion.value = 'EDIT';
			document.forma.sOpt.value = 1;
		}
	
		if (Opt == 2){
			document.forma.sOpcion.value = 'EDITDETALLE';
			document.forma.sOpt.value = 2;
		}
		
		if (Opt == 3){
			document.forma.sOpcion.value = 'EDITOBSERVACIONES';
			document.forma.sOpt.value = 3;
		}
		document.forma.submit();
	<%}%>
	}
			
	function save(Opt){
		if (Opt == 1){
			document.forma.sOpcion.value = 'SAVE';
			document.forma.submit();
		}
		
		if (Opt == 2){
			document.forma.sOpcion.value = 'SAVEDETALLE';
			document.forma.submit();
		}
		
		if (Opt == 3){
			document.forma.sOpcion.value = 'SAVEOBSERVACIONES';
			document.forma.submit();
		}
	}
	
	function cancel(Opt){
		if (Opt == 1){
			document.forma.sCodigo.value = 0;
			document.forma.sOpcion.value = 'NORMAL';
		}
		if (Opt == 2){
			document.forma.sCodigo.value = 0;
			document.forma.sOpcion.value = 'NORMALDETALLE';
		}
		if (Opt == 3){
			document.forma.sCodigo.value = 0;
			document.forma.sOpcion.value = 'NORMALOBSERVACIONES';
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
	
	function irPag(pPagina){
		document.forma.iPagina.value = pPagina;
		document.forma.sOpcion.value = 'NORMAL';
		document.forma.submit();
	}
	
	function Borra(){
		if(confirm("¿Desea Eliminar Todo el contenido de este Anexo?")){
			document.forma.sOpcion.value = 'DELALL';
			document.forma.submit();
		}
	}
	
	function del(pCODE, Opt){
		if (Opt == 1){
			if(confirm("¿Desea Eliminar el Registro?")){ 
				document.forma.sCodigo.value = pCODE;
				document.forma.sOpcion.value = 'DEL';
				document.forma.submit();
			}
		}
		if (Opt == 2){
			if(confirm("¿Desea Eliminar la Firma Registrada?")){ 
				document.forma.sCodigo.value = pCODE;
				document.forma.sOpcion.value = 'DELDETALLE';
				document.forma.submit();
			}
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
<FORM action="pAnexo2IV3.jsp" name="forma" method="post" >
	<input type="hidden" name="sOpcion" value="">
	<input type="hidden" name="sCodigo" value="<%=sCodigo%>">
	<input type="hidden" name="sOpt" value="<%=sOpt%>">  
	<TABLE align=center border=0 cellPadding=0 cellSpacing=0 width="100%">
		<tr>
		<TD colspan="3" class="TituloParrafo" width="100%">&nbsp;&nbsp;ANEXO II.4.3 - DETALLE DE CUENTAS DE INVERSIONES</TD>
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
			<a onmouseover="this.style.cursor='hand'" style="cursor:normal" onclick="Carga('<%=iIdFuncionario%>','<%=iIdAnexo%>', 'cAnexo2IV3.jsp');"><img alt="Carga Masiva" src="<%=sPath%>Images/Carga.jpg"></a>&nbsp;&nbsp;
				<a onmouseover="this.style.cursor='hand'" style="cursor:normal" onclick="Undo();"><img alt="Deshace ultima Carga" src="<%=sPath%>Images/Undo.jpg"></a>&nbsp;&nbsp;
			<a onmouseover="this.style.cursor='hand'" style="cursor:normal" onclick="Borra('<%=iIdFuncionario%>','<%=iIdAnexo%>');"><img alt="Elimina Anexo" src="<%=sPath%>Images/Eliminar.jpg"></a>&nbsp;&nbsp;
			<a onmouseover="this.style.cursor='hand'" style="cursor:normal" onclick="Adjuntar('<%=iIdFuncionario%>','<%=iIdAnexo%>');"><img src="<%=sPath%>Images/Attach.jpg" ></a>&nbsp;&nbsp;
			<%}%>
			<a onmouseover="this.style.cursor='hand'" style="cursor:normal" onclick="imprimir('<%=iIdFuncionario%>', 'iAnexo2IV3.jsp');"><img src="<%=sPath%>Images/Impresora.jpg" ></a>&nbsp;&nbsp;
			<a onmouseover="this.style.cursor='hand'" style="cursor:normal" onclick="ayuda('../Help/aAnexo2IV3.htm');"><img src="<%=sPath%>Images/Ayuda.jpg" ></a></td> 
			<TD align=right>
			
	<%
	oAnexo2IV3.GetAll(iIdFuncionario, iItemsPagina, iPagina); 
	long iAllCount = oAnexo2IV3.GetAllCount();
	if(!bSoloLectura) {
	if(sOpcion.equals("DELDETALLE") || sOpcion.equals("NORMALDETALLE") || sOpcion.equals("EDITDETALLE") || sOpcion.equals("SAVEDETALLE") || sOpcion.equals("NEWDETALLE") || sOpcion.equals("SAVE") || sOpcion.equals("NORMAL") || sOpcion.equals("") || (oAnexo2IV3.GetAll(iIdFuncionario) == 0 && (!sOpcion.equals("NEW")))) {%>						    
				<INPUT class="boton" type="button" onclick="news(1);" name="NEW" value="Nuevo">&nbsp;
	<%} else {%>	
				<INPUT class="boton" type="button" onclick="cancel(1);" name="CANCEL" value="Cancelar">&nbsp;
	<%}%>
				<INPUT <%if(sOpcion.equals("NEWDETALLE")){%>disabled<%}%> class="boton" type="button" onclick="save(1);" name="SAVE" value="Grabar">&nbsp;
	<%}%>			
			</TD>
		</TR><%
		VMatrix vArchivoA;
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
			<td class="TituloMenu">Nombre de la Institución</TD>
			<td class="TituloMenu">Tipo de Inversión</TD>
			<td class="TituloMenu">Vencimiento</TD>
			<td class="TituloMenu">Saldo en Libros</TD>
		</TR><%
	if(!sEstatus.equals("0")){
		oAnexo2IV3.GetObservaciones(iIdFuncionario);
		String vObservaciones = oAnexo2IV3.GetObservaciones();
		if(sOpcion.equals("NEW")){%>
		<TR align="middle">
			<TD colspan="2"></TD>
			<TD>
				<INPUT class="txtBox" name="sFecha" id="sFecha" type="Text" size="9"  maxlength="10" value="" readonly>&nbsp;<img src="<%=sPath%>Images/Fecha.gif" width="19" height="18" align="top" border=0 onclick="fPopCalendar(sFecha,sFecha)"></TD>
	        <TD>
				<INPUT class="txtBox" name="sNoCuenta" id="sNoCuenta" type="Text" size="20" value="" maxlength="50" onKeyPress="isInValid();" onpaste="validaPasteStr(this);"></TD>
			<TD>
			    <INPUT class="txtBox" name="sNombreInstitucion" id="sNombreInstitucion" type="Text" size="15" value="" maxlength="100" onKeyPress="isInValid();" onpaste="validaPasteStr(this);"></TD>
			<TD>
			    <INPUT class="txtBox" name="sTipoInversion" id="sTipoInversion" type="Text" size="15" value="" maxlength="50" onKeyPress="isInValid();" onpaste="validaPasteStr(this);"></TD>
			<TD>
			    <INPUT class="txtBox" name="sVencimiento" id="sVencimiento" type="Text" size="9" maxlength="10" value="" readonly>&nbsp;<img src="<%=sPath%>Images/Fecha.gif" width="19" height="18" align="top" border=0 onclick="fPopCalendar(sVencimiento,sVencimiento)"></TD>
			<TD>
				<INPUT class="txtNumeric" name="sSaldo" id="sSaldo" type="Text" size="15" value="" maxlength="20" onkeypress="valida(this);" onpaste="return validaPasteNum(this);"></TD>
		</TR><%
		}
		
		int intContador = 0;
		String sBackColor = "";
		
		long iTotalPaginas = ((iAllCount / iItemsPagina) * iItemsPagina) == iAllCount ? (iAllCount / iItemsPagina) : (iAllCount / iItemsPagina) + 1;
		if(iTotalPaginas<iPagina){ iPagina = java.lang.Integer.parseInt(iTotalPaginas+"") ; }
		if(iPagina==0){iPagina=1;}
		
		//oAnexo2IV3.GetAll(iIdFuncionario);
		for(int i=0;i<oAnexo2IV3.GetAll(iIdFuncionario, iItemsPagina, iPagina);i++){
			String vIdRenglon 						= oAnexo2IV3.GetIdRenglon(i)!=-1?oAnexo2IV3.GetIdRenglon(i)+"":"0";
			String vFecha 							= oAnexo2IV3.GetFecha(i)!=null?oAnexo2IV3.GetFecha(i):"";
			String vNoCuenta 							= oAnexo2IV3.GetNoCuenta(i)!=null?oAnexo2IV3.GetNoCuenta(i):"";
			String vNombreInstitucion					= oAnexo2IV3.GetNombreInstitucion(i)!=null?oAnexo2IV3.GetNombreInstitucion(i):"";
			String vTipoInversion 				    = oAnexo2IV3.GetTipoInversion(i)!=null?oAnexo2IV3.GetTipoInversion(i):"";
			String vVencimiento 						= oAnexo2IV3.GetVencimiento(i)!=null?oAnexo2IV3.GetVencimiento(i):"";
			String vSaldo 					= oAnexo2IV3.GetSaldo(i)!=null?oAnexo2IV3.GetSaldo(i):"";

			intContador = intContador + 1;
			if (intContador%2 == 0)	{sBackColor = "#ffffff";}
			else					{sBackColor = "#eeeeee";}
			if(sOpcion.equals("EDIT") && sCodigo.equals(vIdRenglon+"") ){%>
		<TR align="left" bgcolor="<%=sBackColor%>">
			<TD colspan="2"></TD>
			<TD>
				<INPUT class="txtBox" name="sFecha" id="sFecha" type="Text" size="9"  maxlength="10" value="<%=vFecha%>" readonly>&nbsp;<img src="<%=sPath%>Images/Fecha.gif" align="top" border=0 onclick="fPopCalendar(sFecha,sFecha)"></TD>
	        <TD>
				<INPUT class="txtBox" name="sNoCuenta" id="sNoCuenta" type="Text" size="20" maxlength="50" value="<%=vNoCuenta%>" onKeyPress="isInValid();" onpaste="validaPasteStr(this);"></TD>
			<TD>
			    <INPUT class="txtBox" name="sNombreInstitucion" id="sNombreInstitucion" type="Text" size="15" maxlength="100" value="<%=vNombreInstitucion%>" onKeyPress="isInValid();" onpaste="validaPasteStr(this);"></TD>
			<TD>
			    <INPUT class="txtBox" name="sTipoInversion" id="sTipoInversion" type="Text" size="15" maxlength="50" value="<%=vTipoInversion%>" onKeyPress="isInValid();" onpaste="validaPasteStr(this);"></TD>
			<TD>
			    <INPUT class="txtBox" name="sVencimiento" id="sVencimiento" type="Text" size="9" maxlength="10" value="<%=vVencimiento%>" readonly>&nbsp;<img src="<%=sPath%>Images/Fecha.gif" align="top" border=0 onclick="fPopCalendar(sVencimiento,sVencimiento)"></TD>
			<TD>
				<INPUT class="txtNumeric" name="sSaldo" id="sSaldo" type="Text" size="15" maxlength="20" value="<%=vSaldo%>" onkeypress="valida(this);" onpaste="return validaPasteNum(this);"></TD>
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
			<TD>&nbsp;<a onmouseover="this.style.cursor='hand'" style="cursor:normal" onclick="edit(<%=vIdRenglon%>,1);"><%=vFecha%></a></TD>
			<TD>&nbsp;<a onmouseover="this.style.cursor='hand'" style="cursor:normal" onclick="edit(<%=vIdRenglon%>,1);"><%=vNoCuenta%></a></TD>
			<TD>&nbsp;<a onmouseover="this.style.cursor='hand'" style="cursor:normal" onclick="edit(<%=vIdRenglon%>,1);"><%=vNombreInstitucion%></a></td>					
			<td>&nbsp;<a onmouseover="this.style.cursor='hand'" style="cursor:normal" onclick="edit(<%=vIdRenglon%>,1);"><%=vTipoInversion%></a></td>
			<td>&nbsp;<a onmouseover="this.style.cursor='hand'" style="cursor:normal" onclick="edit(<%=vIdRenglon%>,1);"><%=vVencimiento%></a></td>					
			<td align="right">&nbsp;<a onmouseover="this.style.cursor='hand'" style="cursor:normal" onclick="edit(<%=vIdRenglon%>,1);"><%=myFormatter.format(new Double(!vSaldo.equals("")?vSaldo:"0"))%></a>&nbsp;&nbsp;</td>
		</TR><%
			}
		}
%>
	</TABLE>
<br>
<TABLE width="450px">
	<TR>
		<td class="TituloMenu"><a onmouseover="this.style.cursor='hand'" style="cursor:normal" onclick="edit(1, 3);">Observaciones:</a></TD>
	</TR><%
	if(sOpcion.equals("EDITOBSERVACIONES")){%>
	<TR>
		<td><textarea class="txtBox" name="sObservaciones" id="sObservaciones" rows="8" cols="70" onKeyPress="isInValid();" onpaste="validaPasteStr(this);"><%=vObservaciones%></textarea></TD>
		<td valign="top"><INPUT class="boton" type="button" onclick="cancel(3);" name="NORMALOBSERVACIONES" value="Cancelar">&nbsp;
			<INPUT class="boton" type="button" onclick="save(3);" name="SAVEOBSERVACIONES" value="Grabar">&nbsp;</td>
	</TR><%
	} else {%>
	<TR>
		<td><a onmouseover="this.style.cursor='hand'" onclick="edit(1, 3);"><textarea class="txtBox" name="sObservaciones" id="sObservaciones" onmouseover="this.style.cursor='hand'" style="border: 0; background-color: transparent; transparent;overflow-y:hidden; width:'100%'; height='100%'"><%=vObservaciones%></textarea></a></TD>
	</TR><%
	}%>
</TABLE>
<br>
<TABLE cellPadding="0" cellSpacing="0" width="450px" BORDER="1" BORDERCOLOR="white">
	<!-- Etiqueta donde se aplican los encabezados de las tablas-->
	<tr><td colspan="4" align="right">
	<%
	//AGREGADO POR VALIDACION ESTATUS 6
	if(!bSoloLectura) {
	    if(sOpcion.equals("DEL") || sOpcion.equals("NEW") ||  sOpcion.equals("EDIT") || sOpcion.equals("SAVE") || sOpcion.equals("NORMAL") || sOpcion.equals("SAVEDETALLE") || sOpcion.equals("NORMALDETALLE") || sOpcion.equals("")|| (oDetalleAnexo2IV3.GetAll(iIdFuncionario) == 0 && (!sOpcion.equals("NEWDETALLE")))) {%>						    
			<INPUT class="boton" type="button" onclick="news(2);" name="NEWDETALLE" value="Nuevo">&nbsp;
	<% } else {%>	
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
				<INPUT class="txtBox" name="sNombreFirma" id="sNombreFirma" type="Text" size="40" value="" maxlength="50" onKeyPress="isInValid();" onpaste="validaPasteStr(this);"></TD>
        	<TD>
				<INPUT class="txtBox" name="sCargo" id="sCargo" type="Text" size="50" value="" maxlength="100" onKeyPress="isInValid();" onpaste="validaPasteStr(this);"></TD>
	</TR><%
		}%>	
<%		
		intContador = 0;
		sBackColor = "";	
		oDetalleAnexo2IV3.GetAll(iIdFuncionario);
		for(int i=0;i<oDetalleAnexo2IV3.GetAll(iIdFuncionario);i++){
			String vIdRenglonDetalle			= oDetalleAnexo2IV3.GetIdRenglon(i)!=-1?oDetalleAnexo2IV3.GetIdRenglon(i)+"":"0";
			String vNombreFirma 				= oDetalleAnexo2IV3.GetNombreFirma(i)!=null?oDetalleAnexo2IV3.GetNombreFirma(i):"";
			String vCargo						= oDetalleAnexo2IV3.GetCargo(i)!=null?oDetalleAnexo2IV3.GetCargo(i):"";
			intContador = intContador + 1;
		  if (intContador%2 == 0){
					sBackColor = "#ffffff";
				}else{
					sBackColor = "#eeeeee";
			}
		  if(sOpcion.equals("EDITDETALLE") && sCodigo.equals(vIdRenglonDetalle+"") ){%>
		<TR align="left" bgcolor="<%=sBackColor%>">
			<TD colspan="2"></TD>
			<TD>
				<INPUT class="txtBox" name="sNombreFirma" id="sNombreFirma" type="Text" size="40" maxlength="50" value="<%=vNombreFirma%>" onKeyPress="isInValid();" onpaste="validaPasteStr(this);"></TD>
			<TD>
			    <INPUT class="txtBox" name="sCargo" id="sCargo" type="Text" size="50" maxlength="100" value="<%=vCargo%>" onKeyPress="isInValid();" onpaste="validaPasteStr(this);"></TD>
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
	</TABLE>
<!-- Hasta Aqui-->	
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
