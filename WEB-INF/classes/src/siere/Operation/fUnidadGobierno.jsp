<%/*********************************************************************************************************
Elaboro:	Claudia V. Sandoval Pardo
Lugar:		Monterrey, NL
Fecha:		28.Oct.2002
Compañia:	CONSISS*/%>
<%@page import="com.consiss.util.tools.*"%>
<%@page import="com.gob.*"%>
<%@page import="java.util.*" %>
<%
String	sOpcion = request.getParameter("sOpcion")!= null ? request.getParameter("sOpcion"): "";
String	sCodigo = request.getParameter("sCodigo")!= null ? request.getParameter("sCodigo"): "0";
String	sMensage = request.getParameter("sMensage")!= null ? request.getParameter("sMensage"): "";

String	sNombre = request.getParameter("sNombre")!= null ? request.getParameter("sNombre"): "0";
String	sTipoUnidad = request.getParameter("sTipoUnidad")!= null ? request.getParameter("sTipoUnidad"): "";

UnidadGobierno oUnidadGobierno = new UnidadGobierno();

String sPath = "../";
%>
<html>
<head>
	<title>Entrega - Recepción : Dependencias, Organismos o Tribunales</title>
<link rel="stylesheet" type="text/css" href="<%=sPath%>Styles/Gobierno.css">
<script language="JavaScript" src="<%=sPath%>Scripts/Gobierno.js"></script>
<script language="JavaScript" src="<%=sPath%>Scripts/Libreria.js"></script>
<script language="JavaScript">
	function valid(){
		if (document.forma.sNombre.value==""){
			alert("No se puede, capture por favor del Nombre");
			document.forma.sNombre.setFocus();
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
		if(confirm("¿Desea Eliminar la Dependencia, Organismo o Tribunal Administrativo?")){ 
			document.forma.sCodigo.value = pCODE;
			document.forma.sOpcion.value = 'DEL';
			document.forma.submit();
		}
	}
	function editImagen(pIdUnidadGobierno, pImagen, pNombre, pTipo){
		popBox("Imagen", 550, 280, "pUpImagen.jsp?sIdUnidadGobierno=" + pIdUnidadGobierno + "&sImagen=" + pImagen + "&sNombre=" + pNombre + "&sTipo=" + pTipo );
		//popBox("Imagen", 550, 280, "pUpImagen.jsp?sIdUnidadGobierno=" + pIdUnidadGobierno + "&sImagen=" + pImagen );
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
	<td width="135" valign="top"><%@include file="Menu.jsp"%></td>
	<!-- Menu -->
	<!-- Contenido -->
	<td valign="top">
	<FORM action="pUnidadGobierno.jsp" name="forma" method="post" >
		<input type="hidden" name="sOpcion" value="">
		<input type="hidden" name="sCodigo" value="<%=sCodigo%>"> 
		<TABLE align=center border=0 cellPadding=0 cellSpacing=0 width="100%">
			<TR>
				<TD class="TituloParrafo">&nbsp;&nbsp;Dependencias, Organismos o Tribunales Administrativos&nbsp;&nbsp;</TD>
				<TD align=right>
		<%if(sOpcion.equals("SAVE") || sOpcion.equals("NORMAL") || sOpcion.equals("DEL") || sOpcion.equals("") ) {%>						    
					<INPUT onclick="news();" 	name="NEW" 		type="button" value="Nuevo" class="boton">&nbsp;
		<%} else {%>	
					<INPUT onclick="cancel();" 	name="CANCEL" 	type="button" value="Cancelar" class="boton">&nbsp;
					<INPUT onclick="save();" 	name="SAVE" 	type="button" value="Grabar"   class="boton">&nbsp;
		<%}%>	
				</TD>
			</TR>
		</TABLE>		
		<!-- Datos que se agregaran a la tabla  -->
		<TABLE cellPadding="0" cellSpacing="0" width="100%" BORDER="1" BORDERCOLOR="white">
		<!-- Etiqueta donde se aplican los encabezados de las tablas-->
			<TR align="middle">
				<td class="TituloMenu">&nbsp;</td>
				<TD class="TituloMenu">ID</TD>
				<TD class="TituloMenu">Nombre</TD>
				<TD class="TituloMenu" align="center">Tipo de Unidad</TD>
				<TD class="TituloMenu">Imagen</TD>
			</TR>
	<%if(sOpcion.equals("NEW")){%>
			<TR align="middle">
	        	<TD colspan="2">Automático</TD>
	        	<TD align="center">
					<INPUT name="sNombre" id="sNombre" type="Text" size="50" maxlength="120" value="">
				</TD>
	        	<TD align="center">
					<select name="sTipoUnidad">
						<option value="1">Dependencia</option>
						<option value="2">Organismo Parestatal</option>
						<option value="3">Tribunal Administrativo</option>
					</select>
				</TD>
			</TR><%
	}
	int intContador = 0;
	String sBackColor = "";
	for(int i=0;i<oUnidadGobierno.GetAll();i++){
		int vIdUnidadGobierno	= oUnidadGobierno.GetIdUnidadGobierno(i);
		String vNombre 			= oUnidadGobierno.GetNombre(i);
		String vTipoUnidad		= oUnidadGobierno.GetTipoUnidad(i);
		intContador = intContador + 1;
		if (intContador%2 == 0){
			sBackColor = "#ffffff";
		} else {
			sBackColor = "#eeeeee";
		}
		 
		if(sOpcion.equals("EDIT") && sCodigo.equals(vIdUnidadGobierno+"") ){%>
			<TR align="left" bgcolor="<%=sBackColor%>">
				<TD></TD>
				<TD align="center"><b><%=vIdUnidadGobierno%></b></TD>
				<TD>&nbsp;
					<INPUT class="txtBox" name="sNombre" id="sNombre" type="Text" size="50" maxlength="120" style="HEIGHT: 19px;" value="<%=vNombre%>">
				</TD>
				<TD align="center">
					<select class="cmbBox" name="sTipoUnidad">
						<option value="1" <%=vTipoUnidad.equals("1")?" selected":""%>>Dependencia</option>
						<option value="2" <%=vTipoUnidad.equals("2")?" selected":""%>>Organismo Parestatal</option>
						<option value="3" <%=vTipoUnidad.equals("3")?" selected":""%>>Tribunal Administrativo</option>
					</select>
				</TD>
				<td>
					<a onmouseover="this.style.cursor='hand'" onclick="editImagen(<%=vIdUnidadGobierno%>, '<%=oUnidadGobierno.GetImagen(i)!=null?oUnidadGobierno.GetImagen(i):""%>', '<%=vNombre %>', '<%=vTipoUnidad%>');">
						<%//=oUnidadGobierno.GetImagen(i)!=null?"<img src='../Images/"+oUnidadGobierno.GetImagen(i)+"' width='10px' height='10px'>":"sin imagen"%>
						<%=oUnidadGobierno.GetImagen(i)!=null?"Ver Imagen":"Sin Imagen"%></td>
					</a>
				</TD>
			</TR><%
		} else {%>
			<TR align="left" bgcolor="<%=sBackColor%>" 	onMouseOver = "MouseDentro(this);" onMouseOut  = "MouseFuera(this,'<%=sBackColor%>');">
				<TD><a onmouseover="this.style.cursor='hand'" style="cursor:normal" onclick="del(<%=vIdUnidadGobierno%>);"><img src="<%=sPath%>Images/Eliminar.gif" ></a></TD>
				<TD align="center">	
					<a onmouseover="this.style.cursor='hand'" style="cursor:normal" onclick="edit(<%=vIdUnidadGobierno%>);">
						<b><%=vIdUnidadGobierno%></b>
					</a>
				</TD>
				<TD>&nbsp;	
					<a onmouseover="this.style.cursor='hand'" style="cursor:normal" onclick="edit(<%=vIdUnidadGobierno%>);">
						<%=vNombre%>
					</a>
				</TD>
				<TD align="center">	
					<a onmouseover="this.style.cursor='hand'" style="cursor:normal" onclick="edit(<%=vIdUnidadGobierno%>);">
						<%=vTipoUnidad.equals("1")?"Dependencia":(vTipoUnidad.equals("2")?"Organismo Parestatal":"Tribunal Administrativo")%>
					</a>
				</TD>
				<td>
					<a onmouseover="this.style.cursor='hand'"  onclick="editImagen(<%=vIdUnidadGobierno%>, '<%=oUnidadGobierno.GetImagen(i)!=null?oUnidadGobierno.GetImagen(i):""%>', '<%=vNombre %>', '<%=vTipoUnidad%>');">
						<%//=oUnidadGobierno.GetImagen(i)!=null?"<img src='../Images/"+oUnidadGobierno.GetImagen(i)+"' width='10px' height='10px'>":"sin imagen"%>
						<%=oUnidadGobierno.GetImagen(i)!=null?"Ver Imagen":"Sin Imagen"%></td>
					</a>
				</td>
			</TR><%
		}
	}	%>
		</TABLE>
	</FORM>
	</td>
	<!-- Contenido -->
</tr>
</table>
<%=!sMensage.equals("")?"<script language='JavaScript'>alert('"+sMensage+"');</script>":"" %>
<%@include file="Footer.jsp"%>
</body>
</html>
