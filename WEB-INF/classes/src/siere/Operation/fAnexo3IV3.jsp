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
if ((String)session.getValue("ok")!="Consiss")
			response.sendRedirect("Error.html");

String	sOpcion = request.getParameter("sOpcion")!= null ? request.getParameter("sOpcion"): "";
String	sCodigo = request.getParameter("sCodigo")!= null ? request.getParameter("sCodigo"): "";

Anexo3IV3 oAnexo3IV3 	= new Anexo3IV3();
java.text.DecimalFormat myFormatter = new java.text.DecimalFormat("###,##0.00");
int iIdAnexo = oAnexo3IV3.GetIdAnexo();
%>
<%@include file="fAnexoInicia.jsp"%>
<html>
<head>
	<title>Entrega - Recepción : Anexo III.4.3</title>
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
<FORM action="pAnexo3IV3.jsp" name="forma" method="post" >
	<input type="hidden" name="sOpcion" value="">
	<input type="hidden" name="sCodigo" value="<%=sCodigo%>"> 
	<TABLE align=center border=0 cellPadding=0 cellSpacing=0 width="100%">
		<TR>
			<TD  colspan="3" class="TituloParrafo" width="70%">&nbsp;&nbsp;ANEXO III.4.3 - RELACIÓN DE SUELDOS NO ENTREGADOS</TD>
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
			<a onmouseover="this.style.cursor='hand'" style="cursor:normal" onclick="Adjuntar('<%=iIdFuncionario%>','<%=iIdAnexo%>');"><img src="<%=sPath%>Images/Attach.jpg" ></a>&nbsp;&nbsp;
			<%}%>
			<a onmouseover="this.style.cursor='hand'" style="cursor:normal" onclick="imprimir(<%=iIdFuncionario%>, 'iAnexo3IV3.jsp');"><img src="<%=sPath%>Images/Impresora.jpg" ></a>&nbsp;&nbsp;
			<a onmouseover="this.style.cursor='hand'" style="cursor:normal" onclick="ayuda('../Help/aAnexo3IV3.htm');"><img src="<%=sPath%>Images/Ayuda.jpg" ></a></td> 
			<TD align=right>
	<%//AGREGADO POR VALIDACION ESTATUS
	if(!bSoloLectura) {
	if(sOpcion.equals("SAVE")  || sOpcion.equals("SAVEDETALLE") || sOpcion.equals("NORMAL") || sOpcion.equals("") || (oAnexo3IV3.GetAll(iIdFuncionario) == 0 && (!sOpcion.equals("NEW")))) {%>						    
			<INPUT class="boton" type="button" onclick="news();" name="NEW" value="Nuevo">&nbsp;<%	
	} else {%>	
			<INPUT class="boton" type="button" onclick="cancel();" name="CANCEL" value="Cancelar">&nbsp;<%
	}%>
			<INPUT class="boton" type="button" onclick="save();" name="SAVE" value="Grabar">&nbsp;
	<%}%>			
		</TD>
		</TR>
		<%VMatrix vArchivoA;
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
			<td class="TituloMenu">No. De Empleado</TD>
			<td class="TituloMenu">Nombre</TD>
			<td class="TituloMenu">No. de Cheque</TD>
			<td class="TituloMenu">Importe</TD>
			<td class="TituloMenu">Observaciones</TD>
		</TR>
		<%
		if(!sEstatus.equals("0")){
		if(sOpcion.equals("NEW")){%>
		<TR align="middle">
        	<TD colspan="2"></TD>
			<td>
				<INPUT class="txtBox" name="sNoEmpleado" id="sNoEmpleado" type="Text" size="20" value="" maxlength="20" onKeyPress="isInValid();" onpaste="validaPasteStr(this);"></TD>
			<td>
				<INPUT class="txtBox" name="sNombre" id="sNombre" type="Text" size="20" value="" maxlength="50" onKeyPress="isInValid();" onpaste="validaPasteStr(this);"></TD>
			<td>
				<INPUT class="txtBox" name="sNoCheque" id="sNoCheque" type="Text" size="20" value="" maxlength="50" onKeyPress="isInValid();" onpaste="validaPasteStr(this);"></TD>
			<TD>
				<INPUT class="txtNumeric" name="sImporte" id="sImporte" type="Text" size="20" value="" maxlength="20" onkeypress="valida(this);" onpaste="return validaPasteNum(this);"></TD>
			<TD>
				<INPUT class="txtBox" name="sObservaciones" id="sObservaciones" type="Text" size="30" value="" maxlength="255" onKeyPress="isInValid();" onpaste="validaPasteStr(this);"></TD>
		</TR><%
		}
		int intContador = 0;
		String sBackColor = "";
		oAnexo3IV3.GetAll(iIdFuncionario);
		for(int i=0;i<oAnexo3IV3.GetAll(iIdFuncionario);i++){
		    String vIdRenglon 				= oAnexo3IV3.GetIdRenglon(i)!=-1?oAnexo3IV3.GetIdRenglon(i)+"":"0";
			String vNoEmpleado 				= oAnexo3IV3.GetNoEmpleado(i)!=null?oAnexo3IV3.GetNoEmpleado(i):"";
			String vNombre 					= oAnexo3IV3.GetNombre(i)!=null?oAnexo3IV3.GetNombre(i):"";
			String vNoCheque				= oAnexo3IV3.GetNoCheque(i)!=null?oAnexo3IV3.GetNoCheque(i):"";
			String vImporte			 		= oAnexo3IV3.GetImporte(i)!=null?oAnexo3IV3.GetImporte(i):"";
			String vObservaciones 			= oAnexo3IV3.GetObservaciones(i)!=null?oAnexo3IV3.GetObservaciones(i):"";

			intContador = intContador + 1;
			if (intContador%2 == 0)	{sBackColor = "#ffffff";}
			else					{sBackColor = "#eeeeee";}
			if(sOpcion.equals("EDIT") && sCodigo.equals(vIdRenglon+"") ){%>
		<TR align="left" bgcolor="<%=sBackColor%>">
			<TD colspan="2"></TD>
				<td>
					<INPUT class="txtBox" name="sNoEmpleado" id="sNoEmpleado" type="Text" size="20" value="<%=vNoEmpleado%>"  maxlength="20" onKeyPress="isInValid();" onpaste="validaPasteStr(this);"></TD>
				<td>
					<INPUT class="txtBox" name="sNombre" id="sNombre" type="Text" size="20" value="<%=vNombre%>"  maxlength="50" onKeyPress="isInValid();" onpaste="validaPasteStr(this);"></TD>
				<td>
					<INPUT class="txtBox" name="sNoCheque" id="sNoCheque" type="Text" size="20" value="<%=vNoCheque%>"  maxlength="50" onKeyPress="isInValid();" onpaste="validaPasteStr(this);"></TD>
				<TD>
					<INPUT class="txtNumeric" name="sImporte" id="sImporte" type="Text" size="20" value="<%=vImporte%>" maxlength="20" onkeypress="valida(this);" onpaste="return validaPasteNum(this);"></TD>
				<TD>
					<INPUT class="txtBox" name="sObservaciones" id="sObservaciones" type="Text" size="30"  value="<%=vObservaciones%>" maxlength="255" onKeyPress="isInValid();" onpaste="validaPasteStr(this);"></TD>
		</TR><%
			} else {%>
		<TR align="left" bgcolor="<%=sBackColor%>" 
			onMouseOver = "MouseDentro(this);"
			onMouseOut  = "MouseFuera(this,'<%=sBackColor%>');">
			<TD colspan="2">
			<%//AGREGADO POR VALIDACION ESTATUS
			if(!bSoloLectura) { %>
			<a onmouseover="this.style.cursor='hand'" style="cursor:normal" onclick="del(<%=vIdRenglon%>);"><img src="<%=sPath%>Images/Eliminar.gif" ></a>
			<%}%>
			</TD>
			<TD align="center">&nbsp;<a onmouseover="this.style.cursor='hand'" style="cursor:normal" onclick="edit(<%=vIdRenglon%>);"><%=vNoEmpleado%></a></TD>
			<TD>&nbsp;<a onmouseover="this.style.cursor='hand'" style="cursor:normal" onclick="edit(<%=vIdRenglon%>);"><%=vNombre%></a></TD>
			<TD align="center">&nbsp;<a onmouseover="this.style.cursor='hand'" style="cursor:normal" onclick="edit(<%=vIdRenglon%>);"><%=vNoCheque%></a></TD>
			<TD align="right">&nbsp;<a onmouseover="this.style.cursor='hand'" style="cursor:normal" onclick="edit(<%=vIdRenglon%>);"><%=myFormatter.format(new Double(!vImporte.equals("")?vImporte:"0"))%></a>&nbsp;&nbsp;</TD>
			<TD>&nbsp;<a onmouseover="this.style.cursor='hand'" style="cursor:normal" onclick="edit(<%=vIdRenglon%>);"><%=vObservaciones%></a></TD>
		</TR><%
			}
		}
%>	</TABLE>
<%
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
</td>	<!-- Contenido -->
</tr>
</table>
<%@include file="Footer.jsp"%>
</body>
</html>
