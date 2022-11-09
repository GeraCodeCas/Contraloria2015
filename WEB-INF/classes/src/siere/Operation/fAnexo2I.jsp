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
java.text.DecimalFormat myFormatter = new java.text.DecimalFormat("###,##0.00");
Anexo2I oAnexo2I 	= new Anexo2I();

int iIdAnexo = oAnexo2I.GetIdAnexo();
%>
<%@include file="fAnexoInicia.jsp"%>
<html>
<head>
	<title>Entrega - Recepción : Anexo II.1</title>
<link rel="stylesheet" type="text/css" href="<%=sPath%>Styles/Gobierno.css">
<script language="JavaScript" src="<%=sPath%>Scripts/Libreria.js"></script>
<script language="JavaScript" src="<%=sPath%>Scripts/Gobierno.js"></script>
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
<FORM action="pAnexo2I.jsp" name="forma" method="post" >
	<input type="hidden" name="sOpcion" value="">
	<input type="hidden" name="sCodigo" value="<%=sCodigo%>"> 
	<TABLE align=center border=0 cellPadding=0 cellSpacing=0 width="100%">
		<TR>
			<TD  colspan="3" class="TituloParrafo" width="70%">&nbsp;&nbsp;ANEXO II.1 - PRESUPUESTO GLOBAL DEL EJERCICIO</TD>
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
			<%}%><%
		}
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
				<a onmouseover="this.style.cursor='hand'" style="cursor:normal" onclick="imprimir(<%=iIdFuncionario%>, 'iAnexo2I.jsp');"><img src="<%=sPath%>Images/Impresora.jpg" ></a>&nbsp;&nbsp;
				<a onmouseover="this.style.cursor='hand'" style="cursor:normal" onclick="ayuda('../Help/aAnexo2I.htm');"><img src="<%=sPath%>Images/Ayuda.jpg" ></a></td> 
			<TD align=right><%
		//AGREGADO POR VALIDACION ESTATUS 5
		if(!bSoloLectura) {
			if(sOpcion.equals("SAVE") || sOpcion.equals("NORMAL") || sOpcion.equals("") ) {
			} else {%>	
				<INPUT class="boton" type="button" onclick="cancel();" name="CANCEL" value="Cancelar">&nbsp;<%
			}%>
				<INPUT class="boton" type="button" onclick="save();" name="SAVE" value="Grabar">&nbsp;<%
		}%>
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
	<TABLE cellPadding="0" cellSpacing="0" width="100%" BORDER="1" BORDERCOLOR="white">
		<TR>
			<TD class="TituloMenu" width="400px" align="center">Concepto</TD>
			<TD class="TituloMenu" width="200px" align="center">Importe</TD>
		</TR><%
		String vPresupuestoAprobado = "";
		String vIncrementos		    = "";
		String vReducciones 		= "";
		String vProgramasEspeciales = "";
		String vTotalAprobado 		= "";
		String vTotalEjercido		= "";
		String vTotalPorEjercer 	= "";
		String vObservaciones 		= "";
		if(!sEstatus.equals("0")){
			oAnexo2I.Get(iIdFuncionario);
			vPresupuestoAprobado= oAnexo2I.GetPresupuestoAprobado()!=null?oAnexo2I.GetPresupuestoAprobado():"";
			vIncrementos	    = oAnexo2I.GetIncrementos()!=null?oAnexo2I.GetIncrementos():"";
			vReducciones 		= oAnexo2I.GetReducciones()!=null?oAnexo2I.GetReducciones():"";
			vProgramasEspeciales= oAnexo2I.GetProgramasEspeciales()!=null?oAnexo2I.GetProgramasEspeciales():"";
			vTotalAprobado 		= oAnexo2I.GetTotalAprobado()!=null?oAnexo2I.GetTotalAprobado():"";
			vTotalEjercido		= oAnexo2I.GetTotalEjercido()!=null?oAnexo2I.GetTotalEjercido():"";
			vTotalPorEjercer 	= oAnexo2I.GetTotalPorEjercer()!=null?oAnexo2I.GetTotalPorEjercer():"";
			vObservaciones 		= oAnexo2I.GetObservaciones()!=null?oAnexo2I.GetObservaciones():"";
		}
		boolean bEditAnexo = sOpcion.equals("EDIT") && sCodigo.equals(iIdFuncionario+"");
		char com2 = '"';
		String sEditaAnexo = "<a onmouseover=" + com2 + "this.style.cursor='hand'" + com2 + " style='cursor:normal' onclick='edit(" + iIdFuncionario + ");'>";
		%>
		<TR>
			<TD height="25px" class="SubTituloMenu"><%=sEditaAnexo%>1. Presupuesto Aprobado</a></TD><%
		if(bEditAnexo){%><TD align="right"><INPUT class="txtNumeric" name="sPresupuestoAprobado" id="sPresupuestoAprobado" type="Text" size="20" maxlength="20" value="<%=vPresupuestoAprobado%>" onkeypress="valida(this);" onpaste="return validaPasteNum(this);"></TD><%}
		else{%><TD align="right">&nbsp;<%=sEditaAnexo%><%try{out.println(myFormatter.format(new Double(!vPresupuestoAprobado.equals("")?vPresupuestoAprobado:"0")));}catch(Throwable e){System.out.println("fAnexo2i.vPresupuestoAprobado: " + e + " " + vPresupuestoAprobado); out.println(vPresupuestoAprobado);} %></a>&nbsp;&nbsp;</TD><%}%>
		</TR>
		<TR>
			<TD height="25px" class="SubTituloMenu"><%=sEditaAnexo%>2. Incrementos</a></TD><%
		if(bEditAnexo){%><TD align="right"><INPUT class="txtNumeric" name="sIncrementos" id="sIncrementos" type="Text" size="20" maxlength="20" value="<%=vIncrementos%>" onkeypress="valida(this);" onpaste="return validaPasteNum(this);"></TD><%}
		else{%><TD align="right">&nbsp;<%=sEditaAnexo%><%try{out.println(myFormatter.format(new Double(!vIncrementos.equals("")?vIncrementos:"0")));}catch(Throwable e){System.out.println("fAnexo2i.vIncrementos: " + e + " " + vIncrementos); out.println(vIncrementos);}%></a>&nbsp;&nbsp;</TD><%}%>
		</TR>
		<TR>
			<TD height="25px" class="SubTituloMenu"><%=sEditaAnexo%>3. Reducciones</a></TD><%
		if(bEditAnexo){%><TD align="right"><INPUT class="txtNumeric" name="sReducciones" id="sReducciones" type="Text" size="20" maxlength="20"  value="<%=vReducciones%>" onkeypress="valida(this);" onpaste="return validaPasteNum(this);"></TD><%}
		else{%><TD align="right">&nbsp;<%=sEditaAnexo%><%try{out.println(myFormatter.format(new Double(!vReducciones.equals("")?vReducciones:"0")));}catch(Throwable e){System.out.println("fAnexo2i.vReducciones: " + e + " " + vReducciones); out.println(vReducciones);} %></a>&nbsp;&nbsp;</TD><%}%>
		</TR>
		<TR>
			<TD height="25px" class="SubTituloMenu"><%=sEditaAnexo%>4. Programas Especiales Aprobados</a></TD><%
		if(bEditAnexo){%><TD align="right"><INPUT class="txtNumeric" name="sProgramasEspeciales" id="sProgramasEspeciales" type="Text" size="20" maxlength="20" value="<%=vProgramasEspeciales%>" onkeypress="valida(this);" onpaste="return validaPasteNum(this);"></TD><%}
		else{%><TD align="right">&nbsp;<%=sEditaAnexo%><%try{out.println(myFormatter.format(new Double(!vProgramasEspeciales.equals("")?vProgramasEspeciales:"0")));}catch(Throwable e){System.out.println("fAnexo2i.vProgramasEspeciales: " + e + " " + vProgramasEspeciales); out.println(vProgramasEspeciales);} %></a>&nbsp;&nbsp;</TD><%}%>
		</TR>
		<TR>
			<TD height="25px" class="SubTituloMenu"><%=sEditaAnexo%>5. Total Aprobado</a></TD><%
		if(bEditAnexo){%><TD align="right"><INPUT class="txtNumeric" name="sTotalAprobado" id="sTotalAprobado" type="Text" size="20" maxlength="20" value="<%=vTotalAprobado%>" onkeypress="valida(this);" onpaste="return validaPasteNum(this);"></TD><%}
		else{%><TD align="right">&nbsp;<%=sEditaAnexo%><%try{out.println(myFormatter.format(new Double(!vTotalAprobado.equals("")?vTotalAprobado:"0")));}catch(Throwable e){System.out.println("fAnexo2i.sTotalAprobado: " + e + " " + vTotalAprobado); out.println(vTotalAprobado);} %></a>&nbsp;&nbsp;</TD><%}%>
		</TR>
		<TR>
			<TD height="25px" class="SubTituloMenu"><%=sEditaAnexo%>6. Total Ejercido</a></TD><%
		if(bEditAnexo){%><TD align="right"><INPUT class="txtNumeric" name="sTotalEjercido" id="sTotalEjercido" type="Text" size="20" maxlength="20" value="<%=vTotalEjercido%>" onkeypress="valida(this);" onpaste="return validaPasteNum(this);"></TD><%}
		else{%><TD align="right">&nbsp;<%=sEditaAnexo%><%try{out.println(myFormatter.format(new Double(!vTotalEjercido.equals("")?vTotalEjercido:"0")));}catch(Throwable e){System.out.println("fAnexo2i.vTotalEjercido: " + e + " " + vTotalEjercido); out.println(vTotalEjercido);} %></a>&nbsp;&nbsp;</TD><%}%>
		</TR>
		<TR>
			<TD height="25px" class="SubTituloMenu"><%=sEditaAnexo%>7. Total por Ejercer: Presupuesto Disponible</a></TD><%
		if(bEditAnexo){%><TD align="right"><INPUT class="txtNumeric" name="sTotalPorEjercer" id="sTotalPorEjercer" type="Text" size="20" maxlength="20" value="<%=vTotalPorEjercer%>" onkeypress="valida(this);" onpaste="return validaPasteNum(this);"></TD><%}
		else{%><TD align="right">&nbsp;<%=sEditaAnexo%><%try{out.println(myFormatter.format(new Double(!vTotalPorEjercer.equals("")?vTotalPorEjercer:"0")));}catch(Throwable e){System.out.println("fAnexo2i.vTotalPorEjercer: " + e + " " + vTotalPorEjercer); out.println(vTotalPorEjercer);} %></a>&nbsp;&nbsp;</TD><%}%>
		</TR>
	</TABLE>
	<br><%
if(!sEstatus.equals("0")){ %>
	<TABLE align="center" cellPadding="0" cellSpacing="0" BORDER="1" BORDERCOLOR="black" width="100%">
		<TR>
			<TD class="TituloMenu" align="center"><a onmouseover="this.style.cursor='hand'" style="cursor:normal" onclick="edit(<%=iIdFuncionario%>);">Observaciones</a></TD>
		</TR><%
		if(sOpcion.equals("NEW")){%>
		<TR>
			<TD><textarea class="txtBox" name="sObservaciones" id="sObservaciones" rows="8" cols="130" onKeyPress="isInValid();" onpaste="validaPasteStr(this);"></textarea></TD>
		</TR><%
		}
		if(sOpcion.equals("EDIT") && sCodigo.equals(iIdFuncionario+"") ){%>
		<TR>
			<TD><textarea class="txtBox" name="sObservaciones" id="sObservaciones" rows="8" cols="130" onKeyPress="isInValid();" onpaste="validaPasteStr(this);"><%=vObservaciones%></textarea></TD>
		</TR><%
		} 
		if(!sOpcion.equals("NEW") && !sOpcion.equals("EDIT")){%>
		<TR>
  			<TD>&nbsp;<a onmouseover="this.style.cursor='hand'" style="cursor:normal" onclick="edit(<%=iIdFuncionario%>);"><textarea class="txtBox" name="sObservaciones" id="sObservaciones" style="border: 0; background-color: transparent; transparent;overflow-y:hidden; width:'100%'; height='100%'"><%=vObservaciones%></textarea></a></TD>
		</TR><%
		}%>
	</TABLE>
	<br>
	<TABLE border=0 cellPadding=0 cellSpacing=0 width="100%">
		<TR>
		   <TD class="SubTituloMenu">ADJUNTAR PRESUPUESTOS AUTORIZADOS</TD>
		</TR>
	</TABLE><%
} else {%>
	<TABLE width="100%">
		<TR>
			<TD align="center"><H1 style="size=+2"><br>ESTE ANEXO NO APLICA</H1></TD>
		</TR>
	</TABLE><%
}%>	
</FORM>
</td>	<!-- Contenido -->
</tr>
</table>
<%@include file="Footer.jsp"%>
</body>
</html>
