<%/*********************************************************************************************************
Elaboro:	Claudia V. Sandoval Pardo
Lugar:		Monterrey, NL
Fecha:		29.May.2003
Compañia:	CONSISS*/%><%
response.setHeader("Cache-Control","no-cache");
response.setHeader("Pragma","no-cache");
response.setDateHeader ("Expires", -1);
%><%@page import="com.consiss.util.tools.*"
%><%@page import="com.consiss.util.*"
%><%@page import="com.gob.*"
%><%@page import="java.util.*"%><%
if ((String)session.getValue("ok")!="ConsissRH")	response.sendRedirect("../Operation/Error.html");

String	sOpcion = request.getParameter("sOpcion")!= null ? request.getParameter("sOpcion"): "";
String	sCodigo = request.getParameter("sCodigo")!= null ? request.getParameter("sCodigo"): "0";
String	sMensaje = request.getParameter("sMensaje")!= null ? request.getParameter("sMensaje"): "";

TipoNomina	oTipoNomina	= new TipoNomina();
String sPath = "../";
%>
<html>
<head>
	<title>Entrega - Recepción : Tipo de Nómina</title>
<link rel="stylesheet" type="text/css" href="../Styles/Gobierno.css">
<script language='JavaScript' src="<%=sPath%>Scripts/Calendario.js"></script>
<script language="JavaScript" src="<%=sPath%>Scripts/Gobierno.js"></script>
<script language="JavaScript">
	function valid(){
		if (document.forma.sClave.value==""){
			alert("No se puede, capture por favor la Clave");
			document.forma.sClave.setFocus();
			return false;
		}
		return true;
	}
	function edit(pCODE){
		document.forma.sCodigo.value = pCODE;
		document.forma.sOpcion.value = 'EDIT';
		document.forma.submit();
	}
	function save(){
		if (valid()) {
			document.forma.sOpcion.value = 'SAVE';
			document.forma.submit();
		}
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
		if(confirm("¿Desea Eliminar el Tipo de Nómina?")){ 
			document.forma.sCodigo.value = pCODE;
			document.forma.sOpcion.value = 'DEL';
			document.forma.submit();
		}
	}
</script>
</head>
<body topmargin="0" leftmargin="0">
<!-- Encabezado -->
<%@include file="Header.jsp"%>
<!-- Encabezado -->
<table border="0" cellspacing="0" cellpadding="0" width="100%">
<tr>
	<!-- Menu -->
	<td width="135" valign="top"><%@include file="MenuRH.jsp"%></td>
	<!-- Menu -->
	<!-- Contenido -->
	<td valign="top">
	
	<FORM action="pTipoNomina.jsp" name="forma" method="post">
		<input type="hidden" name="sOpcion" value="">
		<input type="hidden" name="sCodigo" value="<%=sCodigo%>"> 
		<TABLE align=center border=0 cellPadding=0 cellSpacing=0 width="100%">
			<TR>
				<TD class="TituloParrafo">&nbsp;&nbsp;Claves de Nómina&nbsp;&nbsp;</TD>
				<TD align=right>
		<%if(sOpcion.equals("SAVE") || sOpcion.equals("NORMAL") || sOpcion.equals("")) {%>						    
					<INPUT onclick="news();" 	name="NEW" 		type="button" value="Nuevo"  class="boton">&nbsp;
		<%} else {%>	
					<INPUT onclick="cancel();" 	name="CANCEL" 	type="button" value="Cancelar" class="boton">&nbsp;
					<INPUT onclick="save();" 	name="SAVE" 	type="button" value="Grabar"  class="boton">&nbsp;
		<%}%>	
				</TD>
			</TR>
		</TABLE>		
		<!-- Datos que se agregaran a la tabla  -->
		<TABLE cellPadding="0" cellSpacing="0" width="100%" BORDER="1" BORDERCOLOR="white">
		<!-- Etiqueta donde se aplican los encabezados de las tablas-->
			<TR align="middle">
				<TD class="TituloMenu">&nbsp;</TD>
				<TD class="TituloMenu">ID</TD>
				<TD class="TituloMenu">Clave</TD>
				<TD class="TituloMenu">Descripción</TD>
			</TR>
			<%if(sOpcion.equals("NEW")){%>
			<TR align="middle">
				<TD>&nbsp;</TD>
	        	<TD>Automático</TD>
	        	<TD align="left">
					<INPUT name="sClave" id="sClave" type="Text" size="2" maxlength="2" value="">
				</TD>
	        	<TD align="left">
					<INPUT name="sDescripcion" id="sDescripcion" type="Text" size="50" maxlength="50" value="">
				</TD>
			</TR><%
			}
			int intContador = 0;
			String sBackColor = "";
			for(int i=0;i<oTipoNomina.GetAll().getNumRows();i++){
				int iIdTipoNomina = oTipoNomina.GetIdTipoNomina(i);
				intContador = intContador + 1;
				if (intContador%2 == 0){	sBackColor = "#ffffff";	}
				else{						sBackColor = "#eeeeee"; }
				if(sOpcion.equals("EDIT") && sCodigo.equals(iIdTipoNomina+"") ){%>
			<TR valign="top" align="left" bgcolor="<%=sBackColor%>">
				<TD>&nbsp;</TD>
				<TD align="center" valign="middle"><%=iIdTipoNomina%></TD>
				<TD align="left">
					<INPUT name="sClave" id="sClave" type="Text" size="2" maxlength="2" value="<%=oTipoNomina.GetClave(i)%>">
				</TD>
				<TD align="left">
					<INPUT name="sDescripcion" id="sDescripcion" type="Text" size="50" maxlength="50" value="<%=oTipoNomina.GetDescripcion(i)%>">
				</TD>
			</TR><%
				} else {%>
			<TR align="left" bgcolor="<%=sBackColor%>" 
				onMouseOver = "MouseDentro(this);"
				onMouseOut  = "MouseFuera(this,'<%=sBackColor%>');">
				<TD width="10px"><a onmouseover="this.style.cursor='hand'" style="cursor:normal" onclick="del(<%=iIdTipoNomina%>);"><img src="<%=sPath%>Images/Eliminar.gif" ></a></TD>
				<TD align="center">	
					<a onmouseover="this.style.cursor='hand'" style="cursor:normal" onclick="edit(<%=iIdTipoNomina%>);">
						<b><%=iIdTipoNomina%></b>
					</a>
				</TD>
				<TD>	
					<a onmouseover="this.style.cursor='hand'" style="cursor:normal" onclick="edit(<%=iIdTipoNomina%>);">
						<%=oTipoNomina.GetClave(i)%>
					</a>
				</TD>
				<TD>	
					<a onmouseover="this.style.cursor='hand'" style="cursor:normal" onclick="edit(<%=iIdTipoNomina%>);">
						<%=oTipoNomina.GetDescripcion(i)%>
					</a>
				</TD>
			</TR><%
				}
			}%>
		</TABLE>
	</FORM>
	</td>
	<!-- Contenido -->
</tr>
</table>
<%if(!sMensaje.trim().equals("")){%>
<script language="JavaScript">alert("<%=sMensaje%>");</script>
<%}%>
<%@include file="Footer.jsp"%>
</body>
</html>