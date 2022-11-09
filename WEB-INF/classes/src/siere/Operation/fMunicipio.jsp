<%/*********************************************************************************************************
Elaboro:	Claudia V. Sandoval Pardo
Lugar:		Monterrey, NL
Fecha:		25.Oct.2002
Compañia:	CONSISS*/%>
<%@page import="com.consiss.util.tools.*"%>
<%@page import="com.gob.*"%>
<%@page import="java.util.*" %>
<%
String	sOpcion = request.getParameter("sOpcion")!= null ? request.getParameter("sOpcion"): "";
String	sCodigo = request.getParameter("sCodigo")!= null ? request.getParameter("sCodigo"): "0";
String	sMensage = request.getParameter("sMensage")!= null ? request.getParameter("sMensage"): "";

String	sNombre = request.getParameter("sNombre")!= null ? request.getParameter("sNombre"): "0";

Municipio oMunicipio = new Municipio();

String sPath = "../";
%>
<html>
<head>
	<title>Entrega - Recepción : Municipio</title>
<link rel="stylesheet" type="text/css" href="../Styles/Gobierno.css">
<script language="JavaScript" src="<%=sPath%>Scripts/Gobierno.js"></script>
<script language="JavaScript">
	function valid(){
		if (document.forma.sNombre.value==""){
			alert("No se puede, capture por favor del Nombre");
			document.forma.sNombre.focus();
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
		if(confirm("¿Desea Eliminar el Municipio?")){ 
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
	<td width="135" valign="top"><%@include file="Menu.jsp"%></td>
	<!-- Menu -->
	<!-- Contenido -->
	<td valign="top">
	<FORM action="pMunicipio.jsp" name="forma" method="post" >
		<input type="hidden" name="sOpcion" value="">
		<input type="hidden" name="sCodigo" value="<%=sCodigo%>"> 
		<TABLE align=center border=0 cellPadding=0 cellSpacing=0 width="100%">
			<TR>
				<TD class=TituloParrafo>&nbsp;&nbsp;Municipios&nbsp;&nbsp;</TD>
				<TD align=right>
		<%if(sOpcion.equals("SAVE") || sOpcion.equals("NORMAL") || sOpcion.equals("") ) {%>						    
					<INPUT onclick="news();" 	name="NEW" 		type="button" value="Nuevo" class="boton">&nbsp;
		<%} else {%>	
					<INPUT onclick="cancel();" 	name="CANCEL" 	type="button" value="Cancelar" class="boton">&nbsp;
					<INPUT onclick="save();" 	name="SAVE" 	type="button" value="Grabar"   class="boton">&nbsp;
		<%}%>	
				</TD>
			</TR>
		</TABLE>		
		<!-- Datos que se agregaran a la tabla  -->
		<TABLE cellPadding="2" cellSpacing="2" width="100%" BORDERCOLOR="white">
		<!-- Etiqueta donde se aplican los encabezados de las tablas-->
			<TR align="middle">
				<td class="TituloMenu" width="10px">&nbsp;</td>
				<TD class="TituloMenu">ID</TD>
				<TD class="TituloMenu">Nombre</TD>
			</TR>
			<%if(sOpcion.equals("NEW")){%>
			<TR align="middle">
	        	<TD colspan="2">Automático</TD>
	        	<TD align="center">
					<INPUT name="sNombre" id="sNombre" type="Text" size="20" maxlength="20" value="">
				</TD>
			</TR><%
			}%>	
	<%		VMatrix vmMunicipio;
			vmMunicipio = oMunicipio.GetAll();
			int intContador = 0;
			String sBackColor = "";
			for(int i=0;i<vmMunicipio.getNumRows();i++){
				String sIdMunicipioV = (((Vector)vmMunicipio.getVMatrixAll().elementAt(0)).elementAt(i)+"").trim();
				String sNombreV = (((Vector)vmMunicipio.getVMatrixAll().elementAt(1)).elementAt(i)+"").trim();
				intContador = intContador + 1;
				if (intContador%2 == 0){
					sBackColor = "#ffffff";
				}else{
					sBackColor = "#eeeeee";
				}
				if(sOpcion.equals("EDIT") && sCodigo.equals(sIdMunicipioV)){%>
			<TR align="left" bgcolor="<%=sBackColor%>">
				<TD align="center"><SPAN><%=sIdMunicipioV%></SPAN></TD>
				<TD align="center">
					<INPUT name="sNombre" id="sNombre" type="Text" size="30" maxlength="30" style="HEIGHT: 19px;" value="<%=sNombreV%>">
				</TD>
			</TR><%
				} else {%>
			<TR align="left" bgcolor="<%=sBackColor%>" 
			onMouseOver = "MouseDentro(this);"
			onMouseOut  = "MouseFuera(this,'<%=sBackColor%>');">
				<TD width="10px"><a onmouseover="this.style.cursor='hand'" style="cursor:normal" onclick="del(<%=sIdMunicipioV%>);"><img src="<%=sPath%>Images/Eliminar.gif" ></a></TD>
				<TD align="center">	
					<a onmouseover="this.style.cursor='hand'" style="cursor:normal" onclick="edit(<%=sIdMunicipioV%>);">
						<%=sIdMunicipioV%>
					</a>
				</TD>
				<TD align="center">	
					<a onmouseover="this.style.cursor='hand'" style="cursor:normal" onclick="edit(<%=sIdMunicipioV%>);">
						<%=sNombreV%>
					</a>
				</TD>
			</TR><%
				}
			}
	%>
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
