<%/*********************************************************************************************************
Elaboro:	Julio Enrique Espinosa Torres
Lugar:		Monterrey, NL
TotalPersonas:		8.Nov.2002
Compañia:	CONSISS*/%>
<%@page import="com.consiss.util.tools.*"%>
<%@page import="com.gob.*"%>
<%@page import="java.util.*" %>
<%
//Valida la permanencia del usuario en session
if ((String)session.getValue("ok")!="Consiss")	response.sendRedirect("Error.html");

String	sOpcion = request.getParameter("sOpcion")!= null ? request.getParameter("sOpcion"): "";
String	sCodigo = request.getParameter("sCodigo")!= null ? request.getParameter("sCodigo"): "";

Anexo3IV oAnexo3IV 	= new Anexo3IV();
java.text.DecimalFormat myFormatter = new java.text.DecimalFormat("###,##0.00");
int iIdAnexo = oAnexo3IV.GetIdAnexo();
%>
<%@include file="fAnexoInicia.jsp"%>
<html>
<head>
	<title>Entrega - Recepción : Anexo III.4</title>
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
<FORM action="pAnexo3IV.jsp" name="forma" method="post" >
	<input type="hidden" name="sOpcion" value="">
	<input type="hidden" name="sCodigo" value="<%=sCodigo%>"> 
	<TABLE align=center border=0 cellPadding=0 cellSpacing=0 width="100%">
		<TR>
			<TD  colspan="3" class="TituloParrafo" width="70%">&nbsp;&nbsp;ANEXO III.4 - RESUMEN DE PLAZAS AUTORIZADAS</TD>
		</TR>
		<TR>
		<TD width="70%">
		<%// STATUS DE ANEXO
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
			<a onmouseover="this.style.cursor='hand'" style="cursor:normal" onclick="imprimir(<%=iIdFuncionario%>, 'iAnexo3IV.jsp');"><img src="<%=sPath%>Images/Impresora.jpg" ></a>&nbsp;&nbsp;
			<a onmouseover="this.style.cursor='hand'" style="cursor:normal" onclick="ayuda('../Help/aAnexo3IV.htm');"><img src="<%=sPath%>Images/Ayuda.jpg" ></a></td> 
			<TD align=right>
	<%//AGREGADO POR VALIDACION ESTATUS
		if(!bSoloLectura) {
	if(sOpcion.equals("SAVE")  || sOpcion.equals("SAVEDETALLE") || sOpcion.equals("NORMAL") || sOpcion.equals("") || (oAnexo3IV.GetAll(iIdFuncionario)== 0 && (!sOpcion.equals("NEW")))) {%>						    
				<INPUT class="boton" type="button" onclick="news();" name="NEW" value="Nuevo">&nbsp;
	<%	} else {%>	
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
		<TR align="center" valign="middle">
			<td class="TituloMenu" rowspan="2" colspan="2">&nbsp;</td>
			<td class="TituloMenu" rowspan="2">Categoría</TD>
			<td class="TituloMenu" rowspan="2">Total de Personas</TD>
			<td class="TituloMenu" rowspan="2">Total de Sueldos</TD>
		    <td class="TituloMenu" colspan="3">Clasificación de Personal</td>
		</TR>
		<TR align="center" valign="middle">
		     <td class="TituloMenu">Confianza</td>
			 <td class="TituloMenu">Base</td>
			 <td class="TituloMenu">Otros</td></tr>
		</TR>		 
		<%
		if(!sEstatus.equals("0")){
		if(sOpcion.equals("NEW")){%>
		<TR align="middle">
        	<TD colspan="2"></TD>
        	<TD><INPUT class="txtBox" name="sCategoria" id="sCategoria" type="Text" size="40" maxlength="50" value="" onKeyPress="isInValid();" onpaste="validaPasteStr(this);"></TD>
			<TD align="center"><INPUT class="txtNumeric" name="sTotalPersonas" id="sTotalPersonas" type="Text" size="10" value="" maxlength="5" onkeypress="valida(this);" onpaste="return validaPasteNum(this);"></TD>
			<TD align="center"><INPUT class="txtNumeric" name="sTotalSueldos" id="sTotalSueldos" type="Text" size="15" value="" maxlength="20" onkeypress="valida(this);" onpaste="return validaPasteNum(this);"></TD>
		    <td align="center"><INPUT class="txtNumeric" name="sConfianza" id="sConfianza" type="Text" size="10" maxlength="5" value="" onkeypress="valida(this);" onpaste="return validaPasteNum(this);"></td>
			<td align="center"><INPUT class="txtNumeric" name="sBase" id="sBase" type="Text" size="10" value="" maxlength="5" onkeypress="valida(this);" onpaste="return validaPasteNum(this);"></td>
			<td align="center"><INPUT class="txtNumeric" name="sOtros" id="sOtros" type="Text" size="10" value="" maxlength="5" onkeypress="valida(this);" onpaste="return validaPasteNum(this);"></td>
		</TR><%
		}
		int intContador = 0;
		String sBackColor = "";
		oAnexo3IV.GetAll(iIdFuncionario);
		for(int i=0;i<oAnexo3IV.GetAll(iIdFuncionario);i++){
		  String vIdRenglon 				= oAnexo3IV.GetIdRenglon(i)!=-1?oAnexo3IV.GetIdRenglon(i)+"":"0";
			String vCategoria 			= oAnexo3IV.GetCategoria(i)!=null?oAnexo3IV.GetCategoria(i):"";
			String vTotalPersonas		  				= oAnexo3IV.GetTotalPersonas(i)!=null?oAnexo3IV.GetTotalPersonas(i):"";
			String vTotalSueldos 					= oAnexo3IV.GetTotalSueldos(i)!=null?oAnexo3IV.GetTotalSueldos(i):"";
			String vConfianza 					= oAnexo3IV.GetConfianza(i)!=null?oAnexo3IV.GetConfianza(i):"";
			String vBase 		= oAnexo3IV.GetBase(i)!=null?oAnexo3IV.GetBase(i):"";
			String vOtros 		= oAnexo3IV.GetOtros(i)!=null?oAnexo3IV.GetOtros(i):"";

			intContador = intContador + 1;
			if (intContador%2 == 0)	{sBackColor = "#ffffff";}
			else					{sBackColor = "#eeeeee";}
			if(sOpcion.equals("EDIT") && sCodigo.equals(vIdRenglon+"") ){%>
		<TR align="left" bgcolor="<%=sBackColor%>">
			<TD colspan="2"></TD>
			<TD><INPUT class="txtBox" name="sCategoria" id="sCategoria" type="Text" size="40" maxlength="50" value="<%=vCategoria%>" onKeyPress="isInValid();" onpaste="validaPasteStr(this);"></TD>
			<TD align="center"><INPUT class="txtNumeric" name="sTotalPersonas" id="sTotalPersonas" type="Text" maxlength="5" size="10" value="<%=vTotalPersonas%>" onkeypress="valida(this);" onpaste="return validaPasteNum(this);"></TD>
			<TD align="center"><INPUT class="txtNumeric" name="sTotalSueldos" id="sTotalSueldos" type="Text" size="15" maxlength="20" value="<%=vTotalSueldos%>" onkeypress="valida(this);" onpaste="return validaPasteNum(this);"></TD>
		    <td align="center"><INPUT class="txtNumeric" maxlength="5" name="sConfianza" id="sConfianza" type="Text" size="10" value="<%=vConfianza%>" onkeypress="valida(this);" onpaste="return validaPasteNum(this);"></td>
			<td align="center"><INPUT class="txtNumeric" maxlength="5" name="sBase" id="sBase" type="Text" size="10" value="<%=vBase%>" onkeypress="valida(this);" onpaste="return validaPasteNum(this);"></td>
			<td align="center"><INPUT class="txtNumeric" maxlength="5" name="sOtros" id="sOtros" type="Text" size="10" value="<%=vOtros%>" onkeypress="valida(this);" onpaste="return validaPasteNum(this);"></td>
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
			<TD>&nbsp;<a onmouseover="this.style.cursor='hand'" style="cursor:normal" onclick="edit(<%=vIdRenglon%>);"><%=vCategoria%></a></TD>
			<TD align="center">&nbsp;<a onmouseover="this.style.cursor='hand'" style="cursor:normal" onclick="edit(<%=vIdRenglon%>);"><%=vTotalPersonas%></a></TD>
			
			<!-- <TD align="right">&nbsp;<a onmouseover="this.style.cursor='hand'" style="cursor:normal" onclick="edit(< %= //vIdRenglon%>);">< %=//myFormatter.format(new Double(!vTotalSueldos.equals("")?vTotalSueldos:"0"))%></a></TD>   -->
			
			<TD align="right">&nbsp;<a onmouseover="this.style.cursor='hand'" style="cursor:normal" onclick="edit(<%=vIdRenglon%>);"><%try{out.println(myFormatter.format(new Double(oAnexo3IV.GetTotalSueldos(i)!=null && !(oAnexo3IV.GetTotalSueldos(i)+"").trim().equals("")?oAnexo3IV.GetTotalSueldos(i):"0")));}catch(Throwable e){System.out.println("fAnexo3v1.GetTotalSueldos: " + e + " " + oAnexo3IV.GetTotalSueldos(i)); out.println(oAnexo3IV.GetTotalSueldos(i));} %></a></TD>
					
			<td align="center">&nbsp;<a onmouseover="this.style.cursor='hand'" style="cursor:normal" onclick="edit(<%=vIdRenglon%>);"><%=vConfianza%></a>&nbsp;&nbsp;</td>
			<td align="center">&nbsp;<a onmouseover="this.style.cursor='hand'" style="cursor:normal" onclick="edit(<%=vIdRenglon%>);"><%=vBase%></a>&nbsp;&nbsp;</td>
			<td align="center">&nbsp;<a onmouseover="this.style.cursor='hand'" style="cursor:normal" onclick="edit(<%=vIdRenglon%>);"><%=vOtros%></a>&nbsp;&nbsp;</td>
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
