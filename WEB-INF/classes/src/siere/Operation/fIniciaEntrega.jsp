<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<%
com.gob.EntregaEstatus	oEntregaEstatus = new com.gob.EntregaEstatus();
com.gob.AnexoEstatus	oAnexoEstatus 	= new com.gob.AnexoEstatus();

int iIdFuncionario =  java.lang.Integer.parseInt(
		(String)(session.getValue("iIdFuncionario")!= null?session.getValue("iIdFuncionario"):"0") );

String sPath = "../"; %>
<link rel="stylesheet" type="text/css" href="<%=sPath%>Styles/Gobierno.css">
<script language="JavaScript" src="<%=sPath%>Scripts/Libreria.js"></script>
<script language="JavaScript" src="<%=sPath%>Scripts/Gobierno.js"></script>
<script language="JavaScript">
	function inicia(){
		document.forma.sOpcion.value = 'INICIA';
		document.forma.submit();
	}
</script>
	<title>Entrega - Recepción : Inicia Entrega</title>
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
	<td width="135" valign="top"><%@include file="Menu.jsp"%></td>
	<!-- Menu -->
	<!-- Contenido -->
	<td valign="top" align="center" width="80%">
	<FORM action="pIniciaEntrega.jsp" name="forma" method="post">
			<input type="hidden" name="sOpcion" value="">
	<%
	// Validamos primero que todos los anexos esten en No aplica o en Estatus Autorizado
	oAnexoEstatus.GetContador(iIdFuncionario);
	oEntregaEstatus.Get(iIdFuncionario);
	
	int vTotNoAplica	= java.lang.Integer.parseInt(oAnexoEstatus.GetPorcRegistros(0)!=-1?oAnexoEstatus.GetPorcRegistros(0)+"":"0");
	int vTotVacio		= java.lang.Integer.parseInt(oAnexoEstatus.GetPorcRegistros(1)!=-1?oAnexoEstatus.GetPorcRegistros(1)+"":"0");
	int vTotEnProceso	= java.lang.Integer.parseInt(oAnexoEstatus.GetPorcRegistros(2)!=-1?oAnexoEstatus.GetPorcRegistros(2)+"":"0");
	int vTotPorAutorizar= java.lang.Integer.parseInt(oAnexoEstatus.GetPorcRegistros(3)!=-1?oAnexoEstatus.GetPorcRegistros(3)+"":"0");
	int vTotAutorizado	= java.lang.Integer.parseInt(oAnexoEstatus.GetPorcRegistros(4)!=-1?oAnexoEstatus.GetPorcRegistros(4)+"":"0");
	 %><br>
		<table border="0" bordercolor="White">
			<tr>
				<td class="TituloMenu" >Estatus Actual de los Anexos:</td>
				<td align="center" bgcolor="<%=oAnexoEstatus.GetEstatusColor(oAnexoEstatus.GetEstatusNoAplica())%>"><font style="color:'white';">No Aplica</font></td>
				<td align="center" bgcolor="<%=oAnexoEstatus.GetEstatusColor(oAnexoEstatus.GetEstatusVacio())%>"><font style="color:'white';">Vacio</font></td>
				<td align="center" bgcolor="<%=oAnexoEstatus.GetEstatusColor(oAnexoEstatus.GetEstatusEnProceso())%>"><font style="color:'black';">En Proceso</font></td>
				<td align="center" bgcolor="<%=oAnexoEstatus.GetEstatusColor(oAnexoEstatus.GetEstatusPorAutorizar())%>"><font style="color:'white';">Por Autorizar</font></td>
				<td align="center" bgcolor="<%=oAnexoEstatus.GetEstatusColor(oAnexoEstatus.GetEstatusAutorizado())%>"><font style="color:'white';">Autorizado</font></td>
			</tr>
	 		<tr bgcolor="#eeeeee">
				<td valign="middle" align="right"><b>Total:&nbsp;</b></td>
				<td valign="middle" align="center"><b><%=vTotNoAplica%></td>
				<td valign="middle" align="center"><b><%=vTotVacio%></b></td>
				<td valign="middle" align="center"><b><%=vTotEnProceso%></b></td>
				<td valign="middle" align="center"><b><%=vTotPorAutorizar%></b></td>
				<td valign="middle" align="center"><b><%=vTotAutorizado%></b></td>
				<td valign="middle" align="center"></td>
			</tr>
		</table>
		<br>
		<%
		out.println("ESTATUS ACTUAL DE LA ENTREGA: <b>" + 
			oEntregaEstatus.GetEstatusDesc(oEntregaEstatus.GetEstatus()).toUpperCase() + "</b>" );
		
		if( (vTotVacio>0||vTotEnProceso>0||vTotPorAutorizar>0) 
			&& (oEntregaEstatus.GetEstatus().equals( oEntregaEstatus.GetEstatusNoIniciada() ) ||
				oEntregaEstatus.GetEstatus().equals( oEntregaEstatus.GetEstatusRechazadaPorEnlace() ))){
			out.println("<br><br><b>LA ENTREGA NO PUEDE INICIAR POR EXISTIR ANEXOS VACIOS, EN PROCESO O POR AUTORIZAR</b>" );
		} else {
			if( oEntregaEstatus.GetEstatus().equals( oEntregaEstatus.GetEstatusNoIniciada() ) ||
				oEntregaEstatus.GetEstatus().equals( oEntregaEstatus.GetEstatusRechazadaPorEnlace() ) ){%>
			<br><br><br><INPUT onclick="inicia();" 	name="INICIA" 	type="button" value="Inicia Entrega de Anexos" class="boton"><% 

			} else 
				out.println("<br><br><b>LA ENTREGA YA FUE INICIADA O ESTA EN PROCESO</b>" );
		}
%>		
		</form>
	</td>
	<!-- Contenido -->
</tr>
</table>
<%@include file="Footer.jsp"%>
</body>
</html>
