<%/*********************************************************************************************************
Elaboro:	Julio Enrique Espinosa Torres
Lugar:		Monterrey, NL
Fecha:		12.Nov.2002
Compa?ia:	CONSISS*/%>
<%@page import="com.consiss.util.tools.*"%>
<%@page import="com.gob.*"%>
<%@page import="java.util.*" %>
<%
//Valida la permanencia del usuario en session
if ((String)session.getValue("ok")!="Consiss")
			response.sendRedirect("Error.html");

String	sOpcion = request.getParameter("sOpcion")!= null ? request.getParameter("sOpcion"): "";
String	sCodigo = request.getParameter("sCodigo")!= null ? request.getParameter("sCodigo"): "";

Anexo3III oAnexo3III 	= new Anexo3III();

int iIdAnexo = oAnexo3III.GetIdAnexo();
%>
<%@include file="fAnexoInicia.jsp"%>
<html>
<head>
	<title>Entrega - Recepci?n : Anexo III.3</title>
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
	
	function del(pCODE){
		if(confirm("?Desea Eliminar el Registro?")){ 
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
<FORM action="pAnexo3III.jsp" name="forma" method="post" >
	<input type="hidden" name="sOpcion" value="">
	<input type="hidden" name="sCodigo" value="<%=sCodigo%>"> 
	<TABLE align=center border=0 cellPadding=0 cellSpacing=0 width="100%">
		<TR>
			<TD  colspan="3" class="TituloParrafo" width="70%">&nbsp;&nbsp;ANEXO III.3 - RELACI?N DE MANUALES DE ORGANIZACI?N, POL?TICAS Y NORMAS DE ADMINISTRACI?N INTERNA</TD>
		</TR>
		<TR>
		<TD width="70%">
		<%//AGREGADO POR VALIDACION ESTATUS 2
			if(!bSoloLectura) { %>
				Vac?o: <input type="radio" name="sEstatus" value="1" <%=sEstatus.equals("1")?" checked":""%>>
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
			<a onmouseover="this.style.cursor='hand'" style="cursor:normal" onclick="imprimir(<%=iIdFuncionario%>, 'iAnexo3III.jsp');"><img src="<%=sPath%>Images/Impresora.jpg" ></a>&nbsp;&nbsp;
			<a onmouseover="this.style.cursor='hand'" style="cursor:normal" onclick="ayuda('../Help/aAnexo3III.htm');"><img src="<%=sPath%>Images/Ayuda.jpg" ></a></td> 
			<TD align=right>
	<%//AGREGADO POR VALIDACION ESTATUS 5
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
			<td class="TituloMenu">T?tulo</TD>
			<td class="TituloMenu">?rea de Aplicaci?n</TD>
		</TR>
		<%
		if(!sEstatus.equals("0")){
		if(sOpcion.equals("NEW")){%>
		<TR align="middle">
        	<TD colspan="2"></TD>
        	<TD>
				<INPUT class="txtBox" name="sTitulo" id="sTitulo" type="Text" size="50" value="" maxlength="100" onKeyPress="isInValid();" onpaste="validaPasteStr(this);"></TD>
			<TD>
				<INPUT class="txtBox" name="sAreaAplicacion" id="sAreaAplicacion" type="Text" size="70" value="" maxlength="100" onKeyPress="isInValid();" onpaste="validaPasteStr(this);"></TD>
		</TR><%
		}
		int intContador = 0;
		String sBackColor = "";
		oAnexo3III.GetAll(iIdFuncionario);
		for(int i=0;i<oAnexo3III.GetAll(iIdFuncionario);i++){
		    String vIdRenglon 				= oAnexo3III.GetIdRenglon(i)!=-1?oAnexo3III.GetIdRenglon(i)+"":"0";
			String vTitulo 			= oAnexo3III.GetTitulo(i)!=null?oAnexo3III.GetTitulo(i):"";
			String vAreaAplicacion 					= oAnexo3III.GetAreaAplicacion(i)!=null?oAnexo3III.GetAreaAplicacion(i):"";
					
			intContador = intContador + 1;
			if (intContador%2 == 0)	{sBackColor = "#ffffff";}
			else					{sBackColor = "#eeeeee";}
			if(sOpcion.equals("EDIT") && sCodigo.equals(vIdRenglon+"") ){%>
		<TR align="left" bgcolor="<%=sBackColor%>">
			<TD colspan="2"></TD>
            <TD>
				<INPUT maxlength="100" class="txtBox" name="sTitulo" id="sTitulo" type="Text" size="50"  value="<%=vTitulo%>" onKeyPress="isInValid();" onpaste="validaPasteStr(this);"></TD>
			<TD>
				<INPUT maxlength="100" class="txtBox" name="sAreaAplicacion" id="sAreaAplicacion" type="Text" size="70" value="<%=vAreaAplicacion%>" onKeyPress="isInValid();" onpaste="validaPasteStr(this);"></TD>
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
			<TD>&nbsp;<a onmouseover="this.style.cursor='hand'" style="cursor:normal" onclick="edit(<%=vIdRenglon%>);"><%=vTitulo%></a></TD>
			<TD >&nbsp;<a onmouseover="this.style.cursor='hand'" style="cursor:normal" onclick="edit(<%=vIdRenglon%>);"><%=vAreaAplicacion%></a></TD>
		</TR><%
			}
		}
%>
</TABLE>
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
