<%/*********************************************************************************************************
Elaboro:	Claudia Sandoval
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

Anexo3IV6 		oAnexo3IV6		= new Anexo3IV6();
int iIdAnexo = oAnexo3IV6.GetIdAnexo();
%>
<%@include file="fAnexoInicia.jsp"%>
<html>
<head>
	<title>Entrega - Recepción : Anexo III.4.6</title>
<link rel="stylesheet" type="text/css" href="<%=sPath%>Styles/Gobierno.css">
<script language="JavaScript" src="<%=sPath%>Scripts/Libreria.js"></script>
<script language="JavaScript" src="<%=sPath%>Scripts/Gobierno.js"></script>
<script language="JavaScript">
	function news() {
		document.forma.sCodigo.value = 0;
		document.forma.sOpcion.value = 'NEW';
		document.forma.submit();
	}
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
	function del(pCODE){
		if(confirm("¿Desea Eliminar el Registro?")){ 
			document.forma.sCodigo.value = pCODE;
			document.forma.sOpcion.value = 'DEL';
			document.forma.submit();
		}
	}
	function cancel(){
		document.forma.sCodigo.value = 0;
		document.forma.sOpcion.value = 'NORMAL';
		document.forma.submit();
	}
	function newsDetail() {
		document.forma.sCodigo.value = 0;
		document.forma.sOpcion.value = 'NEWDETAIL';
		document.forma.submit();
	}
	function editDetail(pCODE){
	<%//AGREGADO POR VALIDACION ESTATUS
	if(!bSoloLectura) { %>
		document.forma.sCodigo.value = pCODE;
		document.forma.sOpcion.value = 'EDITDETAIL';
		document.forma.submit();
	<%}%>
	}
	function saveDetail(){
		document.forma.sOpcion.value = 'SAVEDETAIL';
		document.forma.submit();
	}

	function delDetail(pCODE){
		if(confirm("¿Desea Eliminar el Registro?")){ 
			document.forma.sCodigo.value = pCODE;
			document.forma.sOpcion.value = 'DELDETAIL';
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
<FORM action="pAnexo3IV6.jsp" name="forma" method="post" >
	<input type="hidden" name="sOpcion" value="">
	<input type="hidden" name="sCodigo" value="<%=sCodigo%>"> 
	<TABLE align=center border=0 cellPadding=0 cellSpacing=0 width="100%">
		<TR>
			<TD colspan="3" class="TituloParrafo" width="100%">&nbsp;&nbsp;ANEXO III.4.6 - PROGRAMA DE AVANCE Y CAPACITACION DE PERSONAL</TD>
		</TR>
		<TR>
			<TD width="70%" valign="middle">
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
				<%	}%>			
				<a onmouseover="this.style.cursor='hand'" style="cursor:normal" onclick="imprimir('<%=iIdFuncionario%>', 'iAnexo3IV6.jsp');"><img src="<%=sPath%>Images/Impresora.jpg" ></a>&nbsp;&nbsp;
				<a onmouseover="this.style.cursor='hand'" style="cursor:normal" onclick="ayuda('../Help/aAnexo3IV6.htm');"><img src="<%=sPath%>Images/Ayuda.jpg" ></a>
			 </td> 
			<TD align=right>
			<%//AGREGADO POR VALIDACION ESTATUS
			if(!bSoloLectura) {
			if(sOpcion.equals("SAVE")  || sOpcion.equals("NORMAL") || sOpcion.equals("") ) {%>
				<INPUT class="boton" type="button" onclick="news();"	name="NEW"		value="Nuevo">&nbsp;<%
			} else {%>
				<INPUT class="boton" type="button" onclick="cancel();"	name="CANCEL"	value="Cancelar">&nbsp;<%
			}%>
				<INPUT class="boton" type="button" onclick="save();"	name="SAVE"		value="Grabar">&nbsp;<%
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
			<td class="TituloMenu" rowspan="2">&nbsp;</td><%//}%>
			<td class="TituloMenu" rowspan="2">Nombre del Empleado</TD>
			<td class="TituloMenu" <%=oAnexo3IV6.GetCursoAll(iIdFuncionario)>0?
									("colspan="+oAnexo3IV6.GetCursoAll(iIdFuncionario)):""%>>Horas Invertidas en cada Curso</TD>
			<td class="TituloMenu" rowspan="2">Horas Totales Capacitación</TD>
		</TR>
		<TR align="top"><%
	if(oAnexo3IV6.GetCursoAll(iIdFuncionario)>0){
		for(int i=0;i<oAnexo3IV6.GetCursoAll(iIdFuncionario);i++){%>
			<td class="TituloMenu" align="center"><%=oAnexo3IV6.GetNombreCurso(i)%></TD><%
		}
	} else {%>
			<td class="TituloMenu" align="center">Curso</TD><%
	}%>
		</TR>
<%
oAnexo3IV6.GetAll(iIdFuncionario);
if(!sEstatus.equals("0") ){ 
	if(sOpcion.equals("NEW")){%>
		<TR align="center">
        	<TD>&nbsp;</TD><%
		if(oAnexo3IV6.GetCursoAll(iIdFuncionario)>0){%>
			<TD align="left"><INPUT class="txtBox" name="sNombreEmpleado" id="sNombreEmpleado" type="Text" size="40" maxlength="50" value="" onKeyPress="isInValid();" onpaste="validaPasteStr(this);"></TD><%
			for(int i=0;i<oAnexo3IV6.GetCursoAll(iIdFuncionario);i++){%>
			<TD><INPUT class="txtBox" name="sHoras<%=oAnexo3IV6.GetIdCurso(i)%>" id="sHoras<%=oAnexo3IV6.GetIdCurso(i)%>" type="Text" size="3" maxlength="5" onkeypress="isInt();" onpaste="validaPasteInt(this);" value=""></TD><%
			}
		} else {%>
			<TD>Capture primero cursos</TD><%
		}%>
		</TR><%
	}
	int intContador = 0;
	String sBackColor = "";
	int [] iHorasCursos = new int[oAnexo3IV6.GetCursoAll(iIdFuncionario)];
	for(int i=0;i<oAnexo3IV6.GetEmpleadoAll(iIdFuncionario);i++){
		String vIdEmpleado 			= oAnexo3IV6.GetIdEmpleado(i)!=-1?oAnexo3IV6.GetIdEmpleado(i)+"":"0";
		String vNombreEmpleado		= oAnexo3IV6.GetNombreEmpleado(i)!=null?oAnexo3IV6.GetNombreEmpleado(i):"";
		intContador = intContador + 1;
		if (intContador%2 == 0){	sBackColor = "#ffffff";	}
		else{						sBackColor = "#eeeeee"; }
		if(sOpcion.equals("EDIT") && sCodigo.equals(vIdEmpleado+"") ){%>
		<TR align="center" bgcolor="<%=sBackColor%>">
        	<TD>&nbsp;</TD><%
			if(oAnexo3IV6.GetCursoAll(iIdFuncionario)>0){ 
				int horas = 0;%>
			<TD align="left"><INPUT class="txtBox" name="sNombreEmpleado" id="sNombreEmpleado" type="Text" size="40" maxlength="50" value="<%=vNombreEmpleado%>" onKeyPress="isInValid();" onpaste="validaPasteStr(this);"></TD><%
				for(int j=0;j<oAnexo3IV6.GetCursoAll(iIdFuncionario);j++){
					int iPos = oAnexo3IV6.GetPos(iIdFuncionario, oAnexo3IV6.GetIdCurso(j), oAnexo3IV6.GetIdEmpleado(i));
					horas = horas + (iPos>=0?java.lang.Integer.parseInt(oAnexo3IV6.GetHoras(iPos)):0);
					iHorasCursos[j] = iHorasCursos[j] + (iPos>=0?java.lang.Integer.parseInt(oAnexo3IV6.GetHoras(iPos)):0);%>
			<TD><INPUT class="txtBox" name="sHoras<%=oAnexo3IV6.GetIdCurso(j)%>" id="sHoras<%=oAnexo3IV6.GetIdCurso(j)%>" type="Text" size="3" maxlength="5" onkeypress="isInt();" onpaste="validaPasteInt(this);" value="<%=
					iPos>=0?oAnexo3IV6.GetHoras(iPos):""%>">
				<INPUT type="hidden" name="sIns<%=oAnexo3IV6.GetIdCurso(j)%>" id="sIns<%=oAnexo3IV6.GetIdCurso(j)%>" value="<%=oAnexo3IV6.GetIns(j)%>"></TD><%
				}%>
				
			<TD align="center"><%=horas%></TD><%
			}%>
		</TR><%
		} else {
			int horas = 0;%>
		<TR align="left" bgcolor="<%=sBackColor%>" onMouseOver = "MouseDentro(this);" onMouseOut  = "MouseFuera(this,'<%=sBackColor%>');">
			<TD>
			<%//AGREGADO POR VALIDACION ESTATUS
			if(!bSoloLectura) { %>
			<a onmouseover="this.style.cursor='hand'" style="cursor:normal" onclick="del(<%=vIdEmpleado%>);"><img src="<%=sPath%>Images/Eliminar.gif" ></a>
			<%}%>
			</TD>
			<TD>&nbsp;<a onmouseover="this.style.cursor='hand'" style="cursor:normal" onclick="edit(<%=vIdEmpleado%>);"><%=vNombreEmpleado%></a></TD><%
				if(oAnexo3IV6.GetCursoAll(iIdFuncionario)>0){
			 		for(int j=0;j<oAnexo3IV6.GetCursoAll(iIdFuncionario);j++){
						int iPos = oAnexo3IV6.GetPos(iIdFuncionario, oAnexo3IV6.GetIdCurso(j), oAnexo3IV6.GetIdEmpleado(i));
						horas = horas + (iPos>=0?java.lang.Integer.parseInt(oAnexo3IV6.GetHoras(iPos)):0);
						iHorasCursos[j] = iHorasCursos[j] + (iPos>=0?java.lang.Integer.parseInt(oAnexo3IV6.GetHoras(iPos)):0);%>
			<TD align="center">&nbsp;<a onmouseover="this.style.cursor='hand'" style="cursor:normal" onclick="edit(<%=vIdEmpleado%>);"><%=iPos>=0?oAnexo3IV6.GetHoras(iPos):""%></a></TD><%
					}
				}
			%>
			<TD align="center"><%=horas%></TD>
		</TR><%
		}
	}%>
		<TR>
			<TD colspan="2" class="TituloMenu">Total Horas Capacitación</TD><%
			if(oAnexo3IV6.GetCursoAll(iIdFuncionario)>0){
			 	int horas = 0;
				for(int j=0;j<oAnexo3IV6.GetCursoAll(iIdFuncionario);j++){
					horas = horas + iHorasCursos[j];%>
			<TD align="center">&nbsp;<%=iHorasCursos[j]%></TD><%
				}%>
			<TD align="center"><%=horas%></TD><%
			}%>
		</TR>
	</TABLE><%
} else {%>
	</TABLE>
	<TABLE width="100%">
		<TR>
			<TD align="center"><H1 style="size=+2"><br>ESTE ANEXO NO APLICA</H1></TD>
		</TR>
	</TABLE><%
}%>
	<BR><BR><BR>
	<TABLE cellPadding="0" cellSpacing="0" width="50%" BORDER="1" BORDERCOLOR="white">
	<!-- Etiqueta donde se aplican los encabezados de las tablas-->
		<TR align="middle">
			<td class="TituloMenu">&nbsp;</td>
			<td class="TituloMenu">Nombre del Curso</TD>
			<TD align=right>
			<%//AGREGADO POR VALIDACION ESTATUS
			if(!bSoloLectura) {
			if(sOpcion.equals("NEW") || sOpcion.equals("EDIT") || sOpcion.equals("SAVE") || sOpcion.equals("SAVEDETAIL")  || sOpcion.equals("NORMAL") || sOpcion.equals("") ) {%>
				<INPUT class="boton" type="button" onclick="newsDetail();"	name="NEWDETAIL"	value="Nuevo">&nbsp;<%
	} else {%>
				<INPUT class="boton" type="button" onclick="cancel();"		name="CANCEL"		value="Cancelar">&nbsp;
				<INPUT class="boton" type="button" onclick="saveDetail();"	name="SAVEDETAIL"	value="Grabar">&nbsp;
				<%	}
}%>
			</TD>
		</TR>
<%if(sOpcion.equals("NEWDETAIL")){%>
		<TR align="middle">
        	<TD>&nbsp;</TD>
			<TD><INPUT class="txtBox" name="sNombreCurso" id="sNombreCurso" type="Text" size="50" maxlength="60" value="" onKeyPress="isInValid();" onpaste="validaPasteStr(this);"></TD>
		</TR><%
}
if(!sEstatus.equals("0")){ 
	int intContador = 0;
	String sBackColor = "";
	for(int i=0;i<oAnexo3IV6.GetCursoAll(iIdFuncionario);i++){
		String vIdCurso 			= oAnexo3IV6.GetIdCurso(i)!=-1?oAnexo3IV6.GetIdCurso(i)+"":"0";
		String vNombreCurso			= oAnexo3IV6.GetNombreCurso(i)!=null?oAnexo3IV6.GetNombreCurso(i):"";
		intContador = intContador + 1;
		if (intContador%2 == 0){	sBackColor = "#ffffff";	}
		else{						sBackColor = "#eeeeee"; }
		if(sOpcion.equals("EDITDETAIL") && sCodigo.equals(vIdCurso+"") ){%>
		<TR align="left" bgcolor="<%=sBackColor%>">
        	<TD>&nbsp;</TD>
			<TD><INPUT class="txtBox" name="sNombreCurso" id="sNombreCurso" type="Text" size="50" maxlength="60" value="<%=vNombreCurso%>" onKeyPress="isInValid();" onpaste="validaPasteStr(this);"></TD>
		</TR><%
		} else {%>
		<TR align="left" bgcolor="<%=sBackColor%>" onMouseOver = "MouseDentro(this);" onMouseOut  = "MouseFuera(this,'<%=sBackColor%>');">
			<TD>
			<%//AGREGADO POR VALIDACION ESTATUS
			if(!bSoloLectura) { %>
			<a onmouseover="this.style.cursor='hand'" style="cursor:normal" onclick="delDetail(<%=vIdCurso%>);"><img src="<%=sPath%>Images/Eliminar.gif" ></a>
			<%}%>
			</TD>
			<TD>&nbsp;<a onmouseover="this.style.cursor='hand'" style="cursor:normal" onclick="editDetail(<%=vIdCurso%>);"><%=vNombreCurso%></a></TD>
		</TR><%
		}
	}%>
	</TABLE><%
}	

oAnexo3IV6.Close();%>
</FORM>
</td>
	<!-- Contenido -->
</tr>
</table>
<%@include file="Footer.jsp"%>
</body>
</html>
