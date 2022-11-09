<%@page import="com.consiss.util.tools.*"%>
<%@page import="com.gob.*"%>
<%@page import="java.util.*" %>
<%
/********************************************************************************************************
'Elaboro:	Jesus Limon
'Lugar:		Monterrey, NL
'Fecha:		22.Nov.2002
'Compañia:	CONSISS
'Ultima Modificacion:
'By:		Jesus Limon
'
'Distintas opciones:
'********************************************************************************************************/
%>
<%
//Valida la permanencia del usuario en session
if ((String)session.getValue("ok")!="Consiss") response.sendRedirect("Error.html");

String	sOpcion = request.getParameter("sOpcion")!= null ? request.getParameter("sOpcion"): "";
String	sCodigo = request.getParameter("sCodigo")!= null ? request.getParameter("sCodigo"): "";

Anexo3XV oAnexo	= new Anexo3XV();
int	iPagina = request.getParameter("iPagina")!= null ? java.lang.Integer.parseInt(request.getParameter("iPagina")): 1;
int iIdAnexo = oAnexo.GetIdAnexo();
%>
<%@include file="fAnexoInicia.jsp"%>
<html>
<head>
	<title>Entrega - Recepción : Anexo III.15</title>
<link rel="stylesheet" type="text/css" href="<%=sPath%>Styles/Gobierno.css">
<script language="JavaScript" src="<%=sPath%>Scripts/Gobierno.js"></script>
<script language="JavaScript" src="<%=sPath%>Scripts/Libreria.js"></script>
<script language="JavaScript">
	function edit(pCODE){
	<%//AGREGADO POR VALIDACION ESTATUS 1
	if(!bSoloLectura) { %>
		document.forma.sCodigo.value = pCODE;
		document.forma.sOpcion.value = 'EDIT';
		document.forma.submit();
	<%} %>
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
<FORM action="pAnexo3XV.jsp" name="forma" method="post" >
	<input type="hidden" name="sOpcion" value="">
	<input type="hidden" name="sCodigo" value="<%=sCodigo%>"> 
	<TABLE align=center border=0 cellPadding=0 cellSpacing=0 width="100%">
		<tr>
			<td class="TituloParrafo" colspan="3">&nbsp;&nbsp;ANEXO III.15 - RELACIÓN DE ARCHIVO VIGENTE&nbsp;&nbsp;</td>
		</tr>
		<tr>
			<TD width="70%" valign="middle">
				<%//AGREGADO POR VALIDACION ESTATUS 2
				if( !bSoloLectura ){// STATUS DE ANEXO %> 
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
			<%//AGREGADO POR VALIDACION ESTATUS 4
			if( !bSoloLectura ){%>
				<a onmouseover="this.style.cursor='hand'" style="cursor:normal" onclick="Carga('<%=iIdFuncionario%>','<%=iIdAnexo%>', 'cAnexo3XV.jsp');"><img alt="Carga Masiva" src="<%=sPath%>Images/Carga.jpg"></a>&nbsp;&nbsp;
			<a onmouseover="this.style.cursor='hand'" style="cursor:normal" onclick="Undo();"><img alt="Deshace ultima Carga" src="<%=sPath%>Images/Undo.jpg"></a>&nbsp;&nbsp;
				<a onmouseover="this.style.cursor='hand'" style="cursor:normal" onclick="Borra('<%=iIdFuncionario%>','<%=iIdAnexo%>');"><img alt="Elimina Anexo" src="<%=sPath%>Images/Eliminar.jpg"></a>&nbsp;&nbsp;
				<a onmouseover="this.style.cursor='hand'" style="cursor:normal" onclick="Adjuntar('<%=iIdFuncionario%>', '<%=iIdAnexo%>');"><img src="<%=sPath%>Images/Attach.jpg" ></a>&nbsp;&nbsp;
			<%}%>
				<a onmouseover="this.style.cursor='hand'" style="cursor:normal" onclick="imprimir('<%=iIdFuncionario%>', 'iAnexo3XV.jsp');"><img src="<%=sPath%>Images/Impresora.jpg" ></a>&nbsp;&nbsp;
				<a onmouseover="this.style.cursor='hand'" style="cursor:normal" onclick="ayuda('<%=sPath%>Help/aAnexo3XV.htm');"><img src="<%=sPath%>Images/Ayuda.jpg" ></a></td> 
			<TD align=right>
<%
//AGREGADO POR VALIDACION ESTATUS 5
oAnexo.GetAll(iIdFuncionario, iItemsPagina, iPagina); 
long iAllCount = oAnexo.GetAllCount();
if( !bSoloLectura ){
	if(sOpcion.equals("SAVE") || sOpcion.equals("NORMAL") || sOpcion.equals("") ) {%>						    
				<INPUT class="boton" type="button" onclick="news();" name="NEW" value="Nuevo">&nbsp;<%	
	} else {%>	
				<INPUT class="boton" type="button" onclick="cancel();" name="CANCEL" value="Cancelar">&nbsp;<%
	}%>
				<INPUT class="boton" type="button" onclick="save();" name="SAVE" value="Grabar">&nbsp;<%
}%>
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
		<TR align="middle">
			<td class="TituloMenu" colspan="2">&nbsp;</td>
			<td class="TituloMenu">Identificaci&oacute;n Del Archivo</TD>
			<td class="TituloMenu">Expediente</TD>
			<td class="TituloMenu">Periodo Comprendido</TD>
			<td class="TituloMenu">Ubicaci&oacute;n</TD>
			<td class="TituloMenu">Documentos o Planos</TD>
		</TR>
<%
if(!sEstatus.equals("0")){
		if(sOpcion.equals("NEW")){%>
		<TR align="middle">
        	<TD colspan="2"></TD>
	       	<TD>
				<INPUT class="txtBox" name="sIdentificacion" id="sIdentificacion" type="Text" size="20" maxlength="50" value="" onKeyPress="isInValid();" onpaste="validaPasteStr(this);"></TD>
			<TD>
				<INPUT class="txtBox" name="sExpediente" id="sExpediente" type="Text" size="20" maxlength="255" value="" onKeyPress="isInValid();" onpaste="validaPasteStr(this);"></TD>
			<TD>
				<INPUT class="txtBox" name="sPeriodo" id="sPeriodo" type="Text" size="20" maxlength="50" value="" onKeyPress="isInValid();" onpaste="validaPasteStr(this);"></TD>
			<TD>
				<INPUT class="txtBox" name="sUbicacion" id="sUbicacion" type="Text" size="20" maxlength="50" value=""  onKeyPress="isInValid();" onpaste="validaPasteStr(this);"></TD>
			<TD>
				<INPUT class="txtBox" name="sDocumento" id="sDocumento" type="Text" size="20" maxlength="50" value="" onKeyPress="isInValid();" onpaste="validaPasteStr(this);"></TD>
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
			String 	sIdentificacion		= oAnexo.GetIdentificacion(i)!=null?	oAnexo.GetIdentificacion(i)+"":"";
			String 	sExpediente 		= oAnexo.GetExpediente(i)!=null?		oAnexo.GetExpediente(i):"";
			String 	sPeriodo 			= oAnexo.GetPeriodo(i)!=null?			oAnexo.GetPeriodo(i):"";
			String 	sUbicacion 			= oAnexo.GetUbicacion(i)!=null?			oAnexo.GetUbicacion(i):"";
			String 	sDocumento 			= oAnexo.GetDocumento(i)!=null?	oAnexo.GetDocumento(i):"";
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
				<INPUT class="txtBox" name="sIdentificacion" id="sIdentificacion" type="Text" size="20" maxlength="50" value="<%=sIdentificacion%>" onKeyPress="isInValid();" onpaste="validaPasteStr(this);"></TD>
			<TD>
				<INPUT class="txtBox" name="sExpediente" id="sExpediente" type="Text" size="20" maxlength="255" value="<%=sExpediente%>" onKeyPress="isInValid();" onpaste="validaPasteStr(this);"></TD>
			<TD>
				<INPUT class="txtBox" name="sPeriodo" id="sPeriodo" type="Text" size="20" maxlength="50" value="<%=sPeriodo%>" onKeyPress="isInValid();" onpaste="validaPasteStr(this);"></TD>
			<TD>
				<INPUT class="txtBox" name="sUbicacion" id="sUbicacion" type="Text" size="20" maxlength="50" value="<%=sUbicacion%>" onKeyPress="isInValid();" onpaste="validaPasteStr(this);"></TD>
			<TD>
				<INPUT class="txtBox" name="sDocumento" id="sDocumento" type="Text" size="20" maxlength="50" value="<%=sDocumento%>" onKeyPress="isInValid();" onpaste="validaPasteStr(this);"></TD>
		</TR>
<%
			} else {%>
		<TR align="left" bgcolor="<%=sBackColor%>" 
			onMouseOver = "MouseDentro(this);"
			onMouseOut  = "MouseFuera(this,'<%=sBackColor%>');">
			<TD colspan="2">
			<%//AGREGADO POR VALIDACION ESTATUS 6
			if( !bSoloLectura ) { %>
			<a onmouseover="this.style.cursor='hand'" style="cursor:normal" onclick="del(<%=iIdRenglon%>);"><img src="<%=sPath%>Images/Eliminar.gif" ></a>
			<%}%>
			</TD>
			<TD>&nbsp;	
				<a onmouseover="this.style.cursor='hand'" style="cursor:normal" onclick="edit(<%=iIdRenglon%>);">
					<%=sIdentificacion%>
				</a>
			</TD>
			<TD>&nbsp;	
				<a onmouseover="this.style.cursor='hand'" style="cursor:normal" onclick="edit(<%=iIdRenglon%>);">
					<%=sExpediente%>
				</a>
			</TD>
			<TD>&nbsp;	
				<a onmouseover="this.style.cursor='hand'" style="cursor:normal" onclick="edit(<%=iIdRenglon%>);">
					<%=sPeriodo%>
				</a>
			</TD>
			<TD >&nbsp;	
				<a onmouseover="this.style.cursor='hand'" style="cursor:normal" onclick="edit(<%=iIdRenglon%>);">
					<%=sUbicacion%>
				</a>
			</TD>
			<TD >&nbsp;	
				<a onmouseover="this.style.cursor='hand'" style="cursor:normal" onclick="edit(<%=iIdRenglon%>);">
					<%=sDocumento%>
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
