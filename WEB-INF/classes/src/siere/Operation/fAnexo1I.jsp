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
if ((String)session.getValue("ok")!="Consiss") response.sendRedirect("Error.html");

String	sOpcion = request.getParameter("sOpcion")!= null ? request.getParameter("sOpcion"): "";
String	sCodigo = request.getParameter("sCodigo")!= null ? request.getParameter("sCodigo"): "";
String	sOpt = request.getParameter("sOpt")!= null ? request.getParameter("sOpt"): "0";

Anexo1I oAnexo1I 	= new Anexo1I();
DetalleAnexo1I oDetalleAnexo1I 	= new DetalleAnexo1I();
int iIdAnexo = oAnexo1I.GetIdAnexo();
%>
<%@include file="fAnexoInicia.jsp"%>
<html>
<head>
	<title>Entrega - Recepción : Anexo I.1</title>
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
		document.forma.sOpt.value = 1;
		document.forma.submit();
	<%} %>
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
		if (opt == 1 || opt == 0){
			document.forma.sOpcion.value = 'SAVE';
		}
		if (opt == 2){
			document.forma.sOpcion.value = 'SAVEDETALLE';
		}
		// alert(document.forma.sOpt.value);
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
<FORM action="pAnexo1I.jsp" name="forma" method="post" >
	<input type="hidden" name="sOpcion" value="">
	<input type="hidden" name="sCodigo" value="<%=sCodigo%>">
	<input type="hidden" name="sOpt" value="<%=sOpt%>">  
<TABLE align=center border=0 cellPadding=0 cellSpacing=0 width="100%">
	<tr>
		<TD colspan="3" class="TituloParrafo" width="100%">&nbsp;&nbsp;ANEXO I.1 - DOCUMENTOS DE CREACIÓN, INTEGRACIÓN DEL ORGANO DE GOBIERNO Y ACTAS DE SESIONES</TD>
	</tr>
	<TR>
		<TD width="70%"><%
		//AGREGADO POR VALIDACION ESTATUS 2
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
		<TD align=right>
		<%//AGREGADO POR VALIDACION ESTATUS 4
		if( !bSoloLectura ){%>
			<a onmouseover="this.style.cursor='hand'" style="cursor:normal" onclick="Adjuntar('<%=iIdFuncionario%>','<%=iIdAnexo%>');"><img src="<%=sPath%>Images/Attach.jpg" ></a>&nbsp;&nbsp;<%
		}%>
			<a onmouseover="this.style.cursor='hand'" style="cursor:normal" onclick="imprimir('<%=iIdFuncionario%>', 'iAnexo1I.jsp');"><img src="<%=sPath%>Images/Impresora.jpg" ></a>&nbsp;&nbsp;
			<a onmouseover="this.style.cursor='hand'" style="cursor:normal" onclick="ayuda('../Help/aAnexo1I.htm');"><img src="<%=sPath%>Images/Ayuda.jpg" ></a>
		</TD>
		<TD align=right><%
		//AGREGADO POR VALIDACION ESTATUS 5
		if( !bSoloLectura ){
			if(sOpcion.equals("SAVE") || sOpcion.equals("NORMAL") || sOpcion.equals("") ) {%>						    
			<INPUT class="boton" type="button" onclick="news();" name="NEW" value="Nuevo">&nbsp;<%	
			} else {%>	
			<INPUT class="boton" type="button" onclick="cancel();" name="CANCEL" value="Cancelar">&nbsp;<%
			}%>
			<INPUT class="boton" type="button" onclick="save('<%=sOpt%>');" name="SAVE" value="Grabar">&nbsp;<%
		}%>
		</TD>
	</TR>
		<%@include file="fAnexoAttachment.jsp"%>
</TABLE>
	
	<!-- Datos que se agregaran a la tabla  -->
	<TABLE cellPadding="0" cellSpacing="0" width="100%" BORDER="1" BORDERCOLOR="white">
	<!-- Etiqueta donde se aplican los encabezados de las tablas-->
		<TR align="center" valign="middle">
			<td class="TituloMenu" rowspan="2" colspan="2">&nbsp;</td>
			<td class="TituloMenu" rowspan="2" >Ley, Decreto, Acuerdo, Contrato de Fideicomiso, Acta Constitutiva</TD>
			<td class="TituloMenu" rowspan="2" >Nombre</TD>
			<td class="TituloMenu" rowspan="2" >Objetivo General</TD>
			<td class="TituloMenu" rowspan="2" >Fideicomitente</TD>
			<td class="TituloMenu" rowspan="2" >Fiduciario</TD>
			<td class="TituloMenu" rowspan="2" >Fideicomisario</TD>
			<td class="TituloMenu" rowspan="2" >Fecha de Creación</TD>
			<td class="TituloMenu" colspan="2">Publicación</td>
		</tr>
		<TR align="center" valign="middle">
			<td class="TituloMenu">Fecha</td>
			<td class="TituloMenu">Periodico Oficial No.</td>
		</TR>
		<%
		if(!sEstatus.equals("0")){
		if(sOpcion.equals("NEW")){%>
		<TR align="middle">
        	<TD colspan="2"></TD>
			<TD><INPUT class="txtBox" name="sLey" id="sLey" type="Text" size="20" value="" maxlength="255" onKeyPress="isInValid();" onpaste="validaPasteStr(this);"></TD>
        	<TD><INPUT class="txtBox" name="sNombre" id="sNombre" type="Text" size="20" value="" maxlength="255" onKeyPress="isInValid();" onpaste="validaPasteStr(this);"></TD>
			<TD><INPUT class="txtBox" name="sObjetivoGeneral" id="sObjetivoGeneral" type="Text" size="20" value="" maxlength="255" onKeyPress="isInValid();" onpaste="validaPasteStr(this);"></TD>
			<TD><INPUT class="txtBox" name="sFideicomitente" id="sFideicomitente" type="Text" size="20" value="" maxlength="255" onKeyPress="isInValid();" onpaste="validaPasteStr(this);"></TD>
			<TD><INPUT class="txtBox" name="sFiduciario" id="sFiduciario" type="Text" size="20" value="" maxlength="255" onKeyPress="isInValid();" onpaste="validaPasteStr(this);"></TD>
			<TD><INPUT class="txtBox" name="sFideicomisario" id="sFideicomisario" type="Text" size="20" value="" maxlength="255" onKeyPress="isInValid();" onpaste="validaPasteStr(this);"></TD>
			<TD><INPUT class="txtBox" name="sFechaCreacion" id="sFechaCreacion" type="Text" size="9" maxlength="10" value="" readonly>&nbsp;<img src="<%=sPath%>Images/Fecha.gif" align="top" border=0 onclick="fPopCalendar(sFechaCreacion,sFechaCreacion)"></TD>
			<TD><INPUT class="txtBox" name="sFechaPublicacion" id="sFechaPublicacion" type="Text" size="9" maxlength="10"  value="" readonly>&nbsp;<img src="<%=sPath%>Images/Fecha.gif" align="top" border=0 onclick="fPopCalendar(sFechaPublicacion,sFechaPublicacion)"></td>
			<TD><INPUT class="txtBox" name="sPeriodicoOficial" id="sPeriodicoOficial" type="Text" size="20"  value=""  maxlength="255" onKeyPress="isInValid();" onpaste="validaPasteStr(this);"></td>
		</TR><%
		}%>	
<%		
			
			int intContador = 0;
			String sBackColor = "";
			oAnexo1I.GetAll(iIdFuncionario);
		for(int i=0;i<oAnexo1I.GetAll(iIdFuncionario);i++){
			String vIdRenglon 						= oAnexo1I.GetIdRenglon(i)!=-1?oAnexo1I.GetIdRenglon(i)+"":"0";
			String vLey 							= oAnexo1I.GetLey(i)!=null?oAnexo1I.GetLey(i):"";
			String vNombre 							= oAnexo1I.GetNombre(i)!=null?oAnexo1I.GetNombre(i):"";
			String vObjetivoGeneral					= oAnexo1I.GetObjetivoGeneral(i)!=null?oAnexo1I.GetObjetivoGeneral(i):"";
			String vFideicomitente 				    = oAnexo1I.GetFideicomitente(i)!=null?oAnexo1I.GetFideicomitente(i):"";
			String vFiduciario 						= oAnexo1I.GetFiduciario(i)!=null?oAnexo1I.GetFiduciario(i):"";
			String vFideicomisario 					= oAnexo1I.GetFideicomisario(i)!=null?oAnexo1I.GetFideicomisario(i):"";
			String vFechaCreacion		            = oAnexo1I.GetFechaCreacion(i)!=null?oAnexo1I.GetFechaCreacion(i):"";
			String vFechaPublicacion 				= oAnexo1I.GetFechaPublicacion(i)!=null?oAnexo1I.GetFechaPublicacion(i):"";
			String vPeriodicoOficial 				= oAnexo1I.GetPeriodicoOficial(i)!=null?oAnexo1I.GetPeriodicoOficial(i):"";

			intContador = intContador + 1;
		 if (intContador%2 == 0){
					sBackColor = "#ffffff";
				}else{
					sBackColor = "#eeeeee";
			  }
			if(sOpcion.equals("EDIT") && sCodigo.equals(vIdRenglon+"") ){%>
		<TR align="left" bgcolor="<%=sBackColor%>">
			<TD colspan="2"></TD>
			<TD><INPUT class="txtBox" name="sLey" id="sLey" type="Text" size="20" value="<%=vLey%>"  maxlength="255" onKeyPress="isInValid();" onpaste="validaPasteStr(this);"></TD>
			<TD><INPUT class="txtBox" name="sNombre" id="sNombre" type="Text" size="20" value="<%=vNombre%>"  maxlength="255" onKeyPress="isInValid();" onpaste="validaPasteStr(this);"></TD>
			<TD><INPUT class="txtBox" name="sObjetivoGeneral" id="sObjetivoGeneral" type="Text" size="20" value="<%=vObjetivoGeneral%>"  maxlength="255" onKeyPress="isInValid();" onpaste="validaPasteStr(this);"></TD>
			<TD><INPUT class="txtBox" name="sFideicomitente" id="sFideicomitente" type="Text" size="20"  value="<%=vFideicomitente%>"  maxlength="255" onKeyPress="isInValid();" onpaste="validaPasteStr(this);"></TD>
			<TD><INPUT class="txtBox" name="sFiduciario" id="sFiduciario" type="Text" size="20" value="<%=vFiduciario%>"  maxlength="255" onKeyPress="isInValid();" onpaste="validaPasteStr(this);"></TD>
			<TD><INPUT class="txtBox" name="sFideicomisario" id="sFideicomisario" type="Text" size="20" value="<%=vFideicomisario%>"  maxlength="255" onKeyPress="isInValid();" onpaste="validaPasteStr(this);"></TD>
			<TD><INPUT class="txtBox" name="sFechaCreacion" id="sFechaCreacion" type="Text" size="9" maxlength="10" value="<%=vFechaCreacion%>" readonly>&nbsp;<img src="<%=sPath%>Images/Fecha.gif" align="top" border=0 onclick="fPopCalendar(sFechaCreacion,sFechaCreacion)"></TD>
			<TD><INPUT class="txtBox" name="sFechaPublicacion" id="sFechaPublicacion" type="Text" size="9" maxlength="10" value="<%=vFechaPublicacion%>" readonly>&nbsp;<img src="<%=sPath%>Images/Fecha.gif" align="top" border=0 onclick="fPopCalendar(sFechaPublicacion,sFechaPublicacion)"></td>
			<td><INPUT class="txtBox" name="sPeriodicoOficial" id="sPeriodicoOficial" type="Text" size="20" value="<%=vPeriodicoOficial%>"  maxlength="255" onKeyPress="isInValid();" onpaste="validaPasteStr(this);"></td>
		</TR><%
			} else {%>
		<TR valign="top" align="left" bgcolor="<%=sBackColor%>" 
			onMouseOver = "MouseDentro(this);"
			onMouseOut  = "MouseFuera(this,'<%=sBackColor%>');">
			<TD colspan="2">
			<%//AGREGADO POR VALIDACION ESTATUS 6
			if( !bSoloLectura ) { %>
			<a onmouseover="this.style.cursor='hand'" style="cursor:normal" onclick="del(<%=vIdRenglon%>);"><img src="<%=sPath%>Images/Eliminar.gif" ></a>
			<%}%>
			</TD>
			<TD>&nbsp;<a onmouseover="this.style.cursor='hand'" style="cursor:normal" onclick="edit(<%=vIdRenglon%>);"><%=vLey%></a></TD>
			<TD>&nbsp;<a onmouseover="this.style.cursor='hand'" style="cursor:normal" onclick="edit(<%=vIdRenglon%>);"><%=vNombre%></a></TD>
			<TD>&nbsp;<a onmouseover="this.style.cursor='hand'" style="cursor:normal" onclick="edit(<%=vIdRenglon%>);"><%=vObjetivoGeneral%></a></TD>
			<TD>&nbsp;<a onmouseover="this.style.cursor='hand'" style="cursor:normal" onclick="edit(<%=vIdRenglon%>);"><%=vFideicomitente%></a></TD>
			<TD>&nbsp;<a onmouseover="this.style.cursor='hand'" style="cursor:normal" onclick="edit(<%=vIdRenglon%>);"><%=vFiduciario%></a></TD>
			<TD>&nbsp;<a onmouseover="this.style.cursor='hand'" style="cursor:normal" onclick="edit(<%=vIdRenglon%>);"><%=vFideicomisario%></a></TD>
			<TD>&nbsp;<a onmouseover="this.style.cursor='hand'" style="cursor:normal" onclick="edit(<%=vIdRenglon%>);"><%=vFechaCreacion%></a></TD>
			<TD>&nbsp;<a onmouseover="this.style.cursor='hand'" style="cursor:normal" onclick="edit(<%=vIdRenglon%>);"><%=vFechaPublicacion%></a></td>
			<td>&nbsp;<a onmouseover="this.style.cursor='hand'" style="cursor:normal" onclick="edit(<%=vIdRenglon%>);"><%=vPeriodicoOficial%></a></td>
		</TR><%
			}
		}
%>
	</TABLE>
<br>
<br>
<TABLE border="0" cellPadding="0" cellSpacing="0" width="80%" BORDER="1" BORDERCOLOR="white" align="center">
	<!-- Etiqueta donde se aplican los encabezados de las tablas-->
		<TR align="middle">
			<td class="TituloMenu"><a onmouseover="this.style.cursor='hand'" style="cursor:normal" onclick="editDetalle(<%=iIdFuncionario%>);">Integración del Organo de Gobierno</a></TD>
			<td class="TituloMenu"><a onmouseover="this.style.cursor='hand'" style="cursor:normal" onclick="editDetalle(<%=iIdFuncionario%>);">Actas de Sesión: Octubre 1997</a></TD>
		</TR>
				<%if(sOpcion.equals("NEW") && oDetalleAnexo1I.Get(iIdFuncionario)== false ){%>
	<TR align="middle">
        	<TD width="50%" align="center">
					<textarea class="txtBox" name="sIntegracion" id="sIntegracion" rows="8" cols="50" onKeyPress="isInValid();" onpaste="validaPasteStr(this);"></textarea></TD>
        	<TD width="50%" align="center">
					<textarea class="txtBox" name="sActasSesion" id="sActasSesion" rows="8" cols="50" onKeyPress="isInValid();" onpaste="validaPasteStr(this);"></textarea></TD>
<%
		}%>	
<%		
			oDetalleAnexo1I.Get(iIdFuncionario);
			String vIntegracion 		= oDetalleAnexo1I.GetIntegracion()!=null?oDetalleAnexo1I.GetIntegracion():"";
			String vActasSesion 		= oDetalleAnexo1I.GetActasSesion()!=null?oDetalleAnexo1I.GetActasSesion():"";
					sBackColor = "#ffffff";
		if(sOpcion.equals("EDITDETALLE")){%>
		<TR align="left" bgcolor="<%=sBackColor%>">
			<TD width="50%" align="center">
				<textarea class="txtBox" name="sIntegracion" id="sIntegracion" rows="8" cols="50" onKeyPress="isInValid();" onpaste="validaPasteStr(this);"><%=vIntegracion%></textarea></TD>
			<TD width="50%" align="center">
				<textarea class="txtBox" name="sActasSesion" id="sActasSesion" rows="8" cols="50" onKeyPress="isInValid();" onpaste="validaPasteStr(this);"><%=vActasSesion%></textarea></TD>
		</TR><%
			} else {%>
		<TR align="left" bgcolor="<%=sBackColor%>">
			<TD width="50%" align="center">&nbsp;<a onmouseover="this.style.cursor='hand'" style="cursor:normal" onclick="editDetalle(<%=iIdFuncionario%>);"><textarea readonly class="txtBox" style="border: 0; background-color: transparent; transparent;overflow-y:hidden; width:'100%'; height='100%';cursor:hand" name="sIntegracion" id="sIntegracion" rows="10" cols="40"><%=vIntegracion%></textarea></a></TD>
			<TD width="50%" align="center">&nbsp;<a onmouseover="this.style.cursor='hand'" style="cursor:normal" onclick="editDetalle(<%=iIdFuncionario%>);"><textarea readonly class="txtBox" style="border: 0; background-color: transparent; transparent;overflow-y:hidden; width:'100%'; height='100%';cursor:hand" name="sActasSesion" id="sActasSesion" rows="10" cols="40"><%=vActasSesion%></textarea></a></TD>
		</TR><%
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
	</TABLE><%
}
%>	
</FORM>
</td>	<!-- Contenido -->
</tr>
</table>
<%@include file="Footer.jsp"%>
</body>
</html>
