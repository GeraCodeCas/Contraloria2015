<%/*********************************************************************************************************
Elaboro:	Claudia V. Sandoval Pardo
Lugar:		Monterrey, NL
Fecha:		28.Oct.2002
Compañia:	CONSISS*/%>
<%@page import="com.consiss.util.tools.*"%>
<%@page import="com.gob.*"%>
<%@page import="java.util.*" %>
<%
//Valida la permanencia del usuario en session
if ((String)session.getValue("ok")!="ConsissRH")	response.sendRedirect("../Operation/Error.html");
			
String	sOpcion = request.getParameter("sOpcion")!= null ? request.getParameter("sOpcion"): "";
String	sCodigo = request.getParameter("sCodigo")!= null ? request.getParameter("sCodigo"): "0";
int 	iIdUnidadGobierno = java.lang.Integer.parseInt(request.getParameter("iIdUnidadGobierno")!= null ? request.getParameter("iIdUnidadGobierno"): "-1");
String	sMensage = request.getParameter("sMensage")!= null ? request.getParameter("sMensage"): "";

String	sNombre = request.getParameter("sNombre")!= null ? request.getParameter("sNombre"): "0";
String	sTipoUnidad = request.getParameter("sTipoUnidad")!= null ? request.getParameter("sTipoUnidad"): "";

UnidadAdministrativa oUnidadAdministrativa 	= new UnidadAdministrativa();
UnidadGobierno 		 oUnidadGobierno 		= new UnidadGobierno();
Municipio 		 	 oMunicipio		 		= new Municipio();

String sPath = "../";%>
<html>
<head>
	<title>Entrega - Recepción : Unidades Administrativas</title>
<link rel="stylesheet" type="text/css" href="../Styles/Gobierno.css">
<script language="JavaScript" src="<%=sPath%>Scripts/Gobierno.js"></script>
<script language="JavaScript">
	function selecciona(){
		document.forma.submit();
	}
	function imprimir(){
		var ancho = 600;
		var alto = 500;
		var x = (screen.width - ancho) / 2;
		var y = (screen.height - alto)- 150 / 2;		
		var strUrl = "iUnidadAdministrativaRH.jsp?iIdUnidadGobierno=<%=iIdUnidadGobierno%>&Tipo=1";
		window.open(strUrl, "Imprimir", "width=" + ancho + ",height=" + alto + ",top=" + y + ",left=" + x + ",toolbar=0,location=0,directories=0,status=0,menubar=0,scrollbars=1,resizable=0");
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
	<FORM action="pUnidadAdministrativaRH.jsp" name="forma" method="post" >
		<input type="hidden" name="sOpcion" value="">
		<input type="hidden" name="sCodigo" value="<%=sCodigo%>"> 
		<TABLE align=center border=0 cellPadding=0 cellSpacing=0 width="100%">
			<TR>
				<TD>
				<TABLE border=0 cellPadding=0 cellSpacing=0>
					<TR>
						<TD class="TituloParrafo" colspan="2">&nbsp;&nbsp;Unidades Administrativas&nbsp;&nbsp;</TD>
					</tr>
					<tr>
						<td class="TituloMenu"><b>Dependencia:</b></td>
						<td>
							<select class="cmbBox" name="iIdUnidadGobierno" onchange="selecciona();">
									<option value="-1"> [ SELECCIONE ] </option>
									<option <%=iIdUnidadGobierno==0?"selected":""%> value="0"> [ TODAS ] </option><%
							for(int j=0;j<oUnidadGobierno.GetAll('1').getNumRows();j++){
								int oIdUnidadGobierno	= oUnidadGobierno.GetIdUnidadGobierno(j);
								String oNombre 			= oUnidadGobierno.GetNombre(j);		%>
									<option <%=iIdUnidadGobierno==oIdUnidadGobierno?"selected":""%> value="<%=oIdUnidadGobierno%>"><%=oNombre%></option><%
							}%>
							</select>
						</td>
					</TR>
				</TABLE>
				</TD>
				<TD><a onmouseover="this.style.cursor='hand'" style="cursor:normal" onclick="imprimir();"><img alt="Imprimir" src="<%=sPath%>Images/Impresora.jpg"></a>
				</TD>
			</TR>
		</TABLE>
		<table><tr><td></td></tr></table>
		<!-- Datos que se agregaran a la tabla  -->
		<TABLE cellPadding="0" cellSpacing="0" width="100%" BORDER="1" BORDERCOLOR="white">
		<!-- Etiqueta donde se aplican los encabezados de las tablas-->
			<TR align="middle">
				<TD class="TituloMenu">ID</TD>
				<TD class="TituloMenu">Dependencia</TD>
				<TD class="TituloMenu">Unidad Administrativa</TD>
				<TD class="TituloMenu">Dirección</TD>
				<TD class="TituloMenu">Municipio</TD>
				<TD class="TituloMenu">Clave</TD>
			</TR><%
			oUnidadGobierno.GetAll();
			oMunicipio.GetAll();
			int intContador = 0;
			String sBackColor = "";
			for(int i=0;i<oUnidadAdministrativa.GetAll(iIdUnidadGobierno, '1');i++){
				int vIdUnidadAdministrativa = oUnidadAdministrativa.GetIdUnidadAdministrativa(i);
				int vIdUnidadGobierno 		= oUnidadAdministrativa.GetIdUnidadGobierno(i);
				String vNombre 				= oUnidadAdministrativa.GetNombre(i)!=null?oUnidadAdministrativa.GetNombre(i):"";
				String vDireccion 			= oUnidadAdministrativa.GetDireccion(i);
				int vIdMunicipio 			= oUnidadAdministrativa.GetIdMunicipio(i);
				String vClave				= oUnidadAdministrativa.GetClave(i);
				intContador = intContador + 1;
				if (intContador%2 == 0){
					sBackColor = "#ffffff";
				}else{
					sBackColor = "#eeeeee";
			 	}%>
			<TR align="center" bgcolor="<%=sBackColor%>" onMouseOver = "MouseDentro(this);this.style.cursor='hand';"
			onMouseOut  = "MouseFuera(this,'<%=sBackColor%>');" style="cursor:normal" >
				<TD><%=vIdUnidadAdministrativa%></TD>
				<TD><%=oUnidadGobierno.GetPos(vIdUnidadGobierno)>=0?oUnidadGobierno.GetNombre(oUnidadGobierno.GetPos(vIdUnidadGobierno)):""%></TD>				
				<TD><%=vNombre%></TD>
				<TD><%=vDireccion%></TD>
				<TD><%=oMunicipio.GetPos(vIdMunicipio)>=0?oMunicipio.GetNombre(oMunicipio.GetPos(vIdMunicipio)):""%></TD>
				<TD><%=!vClave.equals("null")?vClave:""%></TD>
			</TR><%
			}%>
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
