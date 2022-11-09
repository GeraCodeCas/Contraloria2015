<%/*********************************************************************************************************
Elaboro:	Julio Enrique Espinosa Torres
Lugar:		Monterrey, NL
Fecha:		12.Nov.2002
Compañia:	CONSISS*/%>
<%@page import="com.consiss.util.tools.*"%>
<%@page import="com.gob.*"%>
<%@page import="java.util.*" %>
<%
//Valida la permanencia del usuario en session
if ((String)session.getValue("ok")!="Consiss") response.sendRedirect("Error.html");

String	sOpcion = request.getParameter("sOpcion")!= null ? request.getParameter("sOpcion"): "";
String	sCodigo = request.getParameter("sCodigo")!= null ? request.getParameter("sCodigo"): "";

java.text.DecimalFormat myFormatter = new java.text.DecimalFormat("###,##0.00");

int	iPagina = request.getParameter("iPagina")!= null ? java.lang.Integer.parseInt(request.getParameter("iPagina")): 1;

Anexo2VI oAnexo2VI 	= new Anexo2VI();

int iIdAnexo = oAnexo2VI.GetIdAnexo();
%>
<%@include file="fAnexoInicia.jsp"%>
<html>
<head>
	<title>Entrega - Recepción : Anexo II.6</title>
<link rel="stylesheet" type="text/css" href="<%=sPath%>Styles/Gobierno.css">
<script language="JavaScript" src="<%=sPath%>Scripts/Libreria.js"></script>
<script language="JavaScript" src="<%=sPath%>Scripts/Gobierno.js"></script>
<script language="JavaScript" src="<%=sPath%>Scripts/Calendario.js"></script>

<script language="JavaScript">
	
	function edit(pCODE){
	<%//AGREGADO POR VALIDACION ESTATUS 1
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
<FORM action="pAnexo2VI.jsp" name="forma" method="post" >
	<input type="hidden" name="sOpcion" value="">
	<input type="hidden" name="sCodigo" value="<%=sCodigo%>"> 
	<TABLE align=center border=0 cellPadding=0 cellSpacing=0 width="100%">
		<TR>
			<TD  colspan="3" class="TituloParrafo" width="70%">&nbsp;&nbsp;ANEXO II.6 - RELACIÓN DE DOCUMENTOS Y CUENTAS POR PAGAR</TD>
		</TR>
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
			<a onmouseover="this.style.cursor='hand'" style="cursor:normal" onclick="Carga('<%=iIdFuncionario%>','<%=iIdAnexo%>', 'cAnexo2VI.jsp');"><img alt="Carga Masiva" src="<%=sPath%>Images/Carga.jpg"></a>&nbsp;&nbsp;
				<a onmouseover="this.style.cursor='hand'" style="cursor:normal" onclick="Undo();"><img alt="Deshace ultima Carga" src="<%=sPath%>Images/Undo.jpg"></a>&nbsp;&nbsp;
			<a onmouseover="this.style.cursor='hand'" style="cursor:normal" onclick="Borra('<%=iIdFuncionario%>','<%=iIdAnexo%>');"><img alt="Elimina Anexo" src="<%=sPath%>Images/Eliminar.jpg"></a>&nbsp;&nbsp;
			<a onmouseover="this.style.cursor='hand'" style="cursor:normal" onclick="Adjuntar('<%=iIdFuncionario%>','<%=iIdAnexo%>');"><img src="<%=sPath%>Images/Attach.jpg" ></a>&nbsp;&nbsp;
			<%}%>
			<a onmouseover="this.style.cursor='hand'" style="cursor:normal" onclick="imprimir(<%=iIdFuncionario%>, 'iAnexo2VI.jsp');"><img src="<%=sPath%>Images/Impresora.jpg" ></a>&nbsp;&nbsp;
			<a onmouseover="this.style.cursor='hand'" style="cursor:normal" onclick="ayuda('../Help/aAnexo2VI.htm');"><img src="<%=sPath%>Images/Ayuda.jpg" ></a></td> 		
			<TD align=right>
		<%//AGREGADO POR VALIDACION ESTATUS 5
		oAnexo2VI.GetAll(iIdFuncionario, iItemsPagina, iPagina); 
		long iAllCount = oAnexo2VI.GetAllCount();
		if(!bSoloLectura) {
			if(sOpcion.equals("SAVE") || sOpcion.equals("NORMAL") || sOpcion.equals("") ) {%>						    
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
			<td class="TituloMenu">Número de Documento</TD>
			<td class="TituloMenu">Nombre del Acreedor</TD>
			<td class="TituloMenu">Concepto</TD>
			<td class="TituloMenu">Vencimiento</TD>
			<td class="TituloMenu">Importe</TD>
			<td class="TituloMenu">Saldo</TD>
		</TR>
		<%
		if(!sEstatus.equals("0")){
		if(sOpcion.equals("NEW")){%>
		<TR align="middle">
        	<TD colspan="2"></TD>
        	<TD>
				<INPUT class="txtBox" name="sNumeroDocumento" id="sNumeroDocumento" type="Text" size="20" maxlength="50" value="" onKeyPress="isInValid();" onpaste="validaPasteStr(this);"></TD>
			<TD>
				<INPUT class="txtBox" name="sNombreAcreedor" id="sNombreAcreedor" maxlength="100" type="Text" size="30" value="" onKeyPress="isInValid();" onpaste="validaPasteStr(this);"></TD>
			<TD>
				<INPUT class="txtBox" name="sConcepto" id="sConcepto" type="Text" size="30" maxlength="255"  value="" onKeyPress="isInValid();" onpaste="validaPasteStr(this);"></TD>
			<TD>
				<INPUT class="txtBox" name="sFechaVencimiento" id="sFechaVencimiento" type="Text" size="9" maxlength="10" value="" readonly>&nbsp;<img src="<%=sPath%>Images/Fecha.gif" align="top" border=0 onclick="fPopCalendar(sFechaVencimiento,sFechaVencimiento)"></TD>		
			<TD>
				<INPUT class="txtNumeric" name="sImporte" id="sImporte" type="Text" size="20" value="" maxlength="20" onkeypress="valida(this);" onpaste="return validaPasteNum(this);"></TD>
			<TD>
				<INPUT class="txtNumeric" name="sSaldo" id="sSaldo" type="Text" size="20" value="" maxlength="20" onkeypress="valida(this);" onpaste="return validaPasteNum(this);"></TD>
		</TR><%
		}
		int intContador = 0;
		String sBackColor = "";
		long iTotalPaginas = ((iAllCount / iItemsPagina) * iItemsPagina) == iAllCount ? (iAllCount / iItemsPagina) : (iAllCount / iItemsPagina) + 1;
		if(iTotalPaginas<iPagina){ iPagina = java.lang.Integer.parseInt(iTotalPaginas+"") ; }
		if(iPagina==0){iPagina=1;}
		
		oAnexo2VI.GetAll(iIdFuncionario, iItemsPagina, iPagina);
		
		//oAnexo2VI.GetAll(iIdFuncionario);
		for(int i=0;i<oAnexo2VI.GetAll(iIdFuncionario, iItemsPagina, iPagina);i++){
		    String vIdRenglon 				= oAnexo2VI.GetIdRenglon(i)!=-1?oAnexo2VI.GetIdRenglon(i)+"":"0";
			String vNumeroDocumento 			= oAnexo2VI.GetNumeroDocumento(i)!=null?oAnexo2VI.GetNumeroDocumento(i):"";
			String vNombreAcreedor 					= oAnexo2VI.GetNombreAcreedor(i)!=null?oAnexo2VI.GetNombreAcreedor(i):"";
			String vConcepto 		= oAnexo2VI.GetConcepto(i)!=null?oAnexo2VI.GetConcepto(i):"";
			String vFechaVencimiento		  				= oAnexo2VI.GetFechaVencimiento(i)!=null?oAnexo2VI.GetFechaVencimiento(i):"";
			String vImporte 					= oAnexo2VI.GetImporte(i)!=null?oAnexo2VI.GetImporte(i):"";
			String vSaldo 					= oAnexo2VI.GetSaldo(i)!=null?oAnexo2VI.GetSaldo(i):"";
			
			intContador = intContador + 1;
			if (intContador%2 == 0)	{sBackColor = "#ffffff";}
			else					{sBackColor = "#eeeeee";}
			if(sOpcion.equals("EDIT") && sCodigo.equals(vIdRenglon+"") ){%>
		<TR align="left" bgcolor="<%=sBackColor%>">
			<TD colspan="2"></TD>
            <TD>
				<INPUT class="txtBox" name="sNumeroDocumento" id="sNumeroDocumento" type="Text" size="10" maxlength="50" value="<%=vNumeroDocumento%>" onKeyPress="isInValid();" onpaste="validaPasteStr(this);"></TD>
			<TD>
				<INPUT class="txtBox" name="sNombreAcreedor" id="sNombreAcreedor" type="Text" size="30" maxlength="100" value="<%=vNombreAcreedor%>" onKeyPress="isInValid();" onpaste="validaPasteStr(this);"></TD>
			<TD>
				<INPUT class="txtBox" name="sConcepto" id="sConcepto" type="Text" size="30" maxlength="255" value="<%=vConcepto%>" onKeyPress="isInValid();" onpaste="validaPasteStr(this);"></TD>
			<TD>
				<INPUT class="txtBox" name="sFechaVencimiento" id="sFechaVencimiento" type="Text" size="9" maxlength="10" value="<%=vFechaVencimiento%>" readonly>&nbsp;<img src="<%=sPath%>Images/Fecha.gif" align="top" border=0 onclick="fPopCalendar(sFechaVencimiento,sFechaVencimiento)"></TD>
			<TD>
				<INPUT class="txtNumeric" name="sImporte" id="sImporte" type="Text" size="10" maxlength="20" value="<%=vImporte%>" onkeypress="valida(this);" onpaste="return validaPasteNum(this);"></TD>
			<TD>
				<INPUT class="txtNumeric" name="sSaldo" id="sSaldo" type="Text" size="10" maxlength="20" value="<%=vSaldo%>" onkeypress="valida(this);" onpaste="return validaPasteNum(this);"></TD>
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
			<TD>&nbsp;<a onmouseover="this.style.cursor='hand'" style="cursor:normal" onclick="edit(<%=vIdRenglon%>);"><%=vNumeroDocumento%></a></TD>
			<TD >&nbsp;<a onmouseover="this.style.cursor='hand'" style="cursor:normal" onclick="edit(<%=vIdRenglon%>);"><%=vNombreAcreedor%></a></TD>
			<TD >&nbsp;<a onmouseover="this.style.cursor='hand'" style="cursor:normal" onclick="edit(<%=vIdRenglon%>);"><%=vConcepto%></a></TD>
			<TD align="center">&nbsp;<a onmouseover="this.style.cursor='hand'" style="cursor:normal" onclick="edit(<%=vIdRenglon%>);"><%=vFechaVencimiento%></a></TD>
			<TD align="right">&nbsp;<a onmouseover="this.style.cursor='hand'" style="cursor:normal" onclick="edit(<%=vIdRenglon%>);"><%=myFormatter.format(new Double(!vImporte.equals("")?vImporte:"0"))%></a>&nbsp;&nbsp;</TD>
			<TD align="right">&nbsp;<a onmouseover="this.style.cursor='hand'" style="cursor:normal" onclick="edit(<%=vIdRenglon%>);"><%=myFormatter.format(new Double(!vSaldo.equals("")?vSaldo:"0"))%></a>&nbsp;&nbsp;</TD>
			
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
</td>	<!-- Contenido -->
</tr>
</table>
<%@include file="Footer.jsp"%>
</body>
</html>
