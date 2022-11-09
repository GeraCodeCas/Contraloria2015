<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<%@page import="com.gob.EntregaEstatus.*"%>
<%
//Valida la permanencia del usuario en session
if ((String)session.getValue("ok")!="Consiss")
			response.sendRedirect("Error.html");
int iIdUnidadGobierno = java.lang.Integer.parseInt(request.getParameter("iIdUnidadGobierno")!= null ? request.getParameter("iIdUnidadGobierno"): "-1");

String sIdFuncionario			= (String)(request.getParameter("sIdFuncionario")!= null?		  request.getParameter("sIdFuncionario"):"0") ;
String sIdCargo  				= (String)(request.getParameter("sIdCargo")!= null?				  request.getParameter("sIdCargo"):"0") ;
String sIdUnidadAdministrativa  = (String)(request.getParameter("sIdUnidadAdministrativa")!= null?request.getParameter("sIdUnidadAdministrativa"):"0");
String sIdUnidadGobierno 		= (String)(request.getParameter("sIdUnidadGobierno")!= null?	  request.getParameter("sIdUnidadGobierno"):"0") ;

int iIdFuncionarioAnt = java.lang.Integer.parseInt(sIdFuncionario);

com.gob.EntregaEstatus	oEntregaEstatus = new com.gob.EntregaEstatus();
com.gob.Funcionario		oFuncionario	= new com.gob.Funcionario();

String sPath = "../"; 

com.gob.UnidadGobierno		oUnidadGobierno = new com.gob.UnidadGobierno();
com.consiss.util.Utilerias	oUtil		 	= new com.consiss.util.Utilerias();
%>
<link rel="stylesheet" type="text/css" href="<%=sPath%>Styles/Gobierno.css">
<script language="JavaScript" src="<%=sPath%>Scripts/Libreria.js"></script>
<script language="JavaScript" src="<%=sPath%>Scripts/Gobierno.js"></script>
<script language="JavaScript">
	function selecionaNuevoFuncionario(pIdFuncionario){
		document.forma.iIdFuncionario.value = pIdFuncionario;
		document.forma.sOpcion.value = "SELECCIONA";
		document.forma.submit();
	}
	function cancel(){
		document.forma.iIdFuncionario.value = 0;
		document.forma.sOpcion.value = 'NORMAL';
		document.forma.submit();
	}		
</script>
	<title>Entrega - Recepción : Asigna Nuevo Funcionario</title>
</head>

<body topmargin="0" leftmargin="0">
<table border="0" cellspacing="0" cellpadding="0" width="100%">
<!-- Encabezado -->
<tr>
<td colspan="2"><%@include file="Header.jsp"%></td>
<tr>
<!-- Encabezado -->
<tr>
	<!-- Menu -->
	<td width="135px" valign="top"><%@include file="Menu.jsp"%></td>
	<!-- Menu -->
	<!-- Contenido -->
	<td valign="top" align="left">
	<FORM action="pAsignaNuevoFuncionario.jsp" name="forma" method="post" >
		<input type="hidden" name="sOpcion" id="sOpcion">
		<input type="hidden" name="iIdFuncionario" id="iIdFuncionario">
		<input type="hidden" name="iIdFuncionarioAnt" id="iIdFuncionarioAnt" value="<%=iIdFuncionarioAnt%>">
		<input type="hidden" name="iIdUnidadGobierno" id="iIdUnidadGobierno" value="<%=iIdUnidadGobierno%>"><%
	oFuncionario.Get(iIdFuncionarioAnt);
	 %>
	<TABLE align=center border=0 cellPadding=0 cellSpacing=0 width="100%">
		<TR>
			<TD class="TituloParrafo">ASIGNA NUEVO FUNCIONARIO</TD>
			<TD><INPUT class="boton" type="button" onclick="cancel();" name="CANCEL" value="Cancelar"></TD>
		</TR>
	</TABLE>
	
	<TABLE border=0 cellPadding=2 cellSpacing=2>
		<TR>
			<TD>&nbsp;</TD>
		</TR>
		<TR>
			<TD class="TituloMenu" width="50%">Dependencia, Organismo o Tribunal:</TD>
			<TD  width="50%"><b><%=oFuncionario.GetUnidadGobierno()%></b></TD>
		</TR>
		<TR>
			<TD></TD>
		</TR>
		<TR>
			<TD class="TituloMenu">Unidad Administrativa:</TD>
			<TD><b><%=oFuncionario.GetUnidadAdministrativa()%></b></TD>
		</TR>
		<TR>
			<TD></TD>
		</TR>
		<TR>
			<TD class="TituloMenu">Cargo:</TD>
			<TD><b><%=oFuncionario.GetCargo()%></b></TD>
		</TR>
	</TABLE>
	<br>
		<table>
			<tr>
				
				<td class="TituloMenu">Funcionario</TD>
				<td class="TituloMenu">Estatus</TD>
				<td class="TituloMenu">Fecha Ultima Actualizaci&oacute;n</TD>
				<td class="TituloMenu">&nbsp;</TD>
			</tr><%
			
			int IdUnidadGobierno = java.lang.Integer.parseInt(sIdUnidadGobierno);
			int IdUnidadAdministrativa = java.lang.Integer.parseInt(sIdUnidadAdministrativa); 
			int IdCargo = java.lang.Integer.parseInt(sIdCargo); 
			
			for(int j=0;j<oEntregaEstatus.GetNuevoFuncionario(IdUnidadGobierno, IdUnidadAdministrativa, IdCargo);j++){%>
			<tr>
				<TD><%=oEntregaEstatus.GetNombre(j) + " " + 
						oEntregaEstatus.GetApePaterno(j) + " " + oEntregaEstatus.GetApeMaterno(j)%></TD>
				<TD><%=oEntregaEstatus.GetEstatusDesc(oEntregaEstatus.GetEstatus(j))%></TD>
				<TD align="center""><%=!oEntregaEstatus.GetFecha(j).equals("")?
								oUtil.sGetNumToDate(oEntregaEstatus.GetFecha(j),"dd") + "." +
								oUtil.GetMesCorto(java.lang.Integer.parseInt(oUtil.sGetNumToDate(oEntregaEstatus.GetFecha(j),"MM"))) + "." +
								oUtil.sGetNumToDate(oEntregaEstatus.GetFecha(j),"yyyy")
								:""%></TD>
				<TD>
					<INPUT class="boton" type="button"style="width:'160px';" onclick="selecionaNuevoFuncionario(<%=oEntregaEstatus.GetIdFuncionario(j)%>);" name="Selecciona" value="Selecciona">
				</TD>
			</tr><%
			} %>
		</table>
	</form>

	</td>
	<!-- Contenido -->
</tr>
</table>
<%@include file="Footer.jsp"%>
</body>
</html>
