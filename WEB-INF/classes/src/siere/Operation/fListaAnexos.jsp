<%/*********************************************************************************************************
Elaboro:	Claudia V. Sandoval Pardo
Lugar:		Monterrey, NL
Fecha:		01.Nov.2002
Compañia:	CONSISS*/%>
<%@page import="com.consiss.util.tools.*"%>
<%@page import="com.consiss.util.*"%>
<%@page import="com.gob.*"%>
<%@page import="java.util.*" %>
<%
//Valida la permanencia del usuario en session
if ((String)session.getValue("ok")!="Consiss")
			response.sendRedirect("Error.html");
			
String	sOpcion = request.getParameter("sOpcion")!= null ? request.getParameter("sOpcion"): "";

int iIdFuncionario =  java.lang.Integer.parseInt(
		(String)(session.getValue("iIdFuncionario")!= null?session.getValue("iIdFuncionario"):"0") );
//int iIdFuncionario =  1;

AnexoEstatus	oAnexoEstatus	= new AnexoEstatus();
Anexo			oAnexo			= new Anexo();
Usuario			oUsuario		= new Usuario();
Utilerias		oUtil			= new Utilerias();
String sPath = "../";

oAnexoEstatus.GetContador(iIdFuncionario);
//String vTotNoAplica			= oAnexoEstatus.GetPorcRegistros(0)!=-1?oAnexoEstatus.GetPorcRegistros(0)+"":"0";
String vTotVacio			= oAnexoEstatus.GetPorcRegistros(1)!=-1?oAnexoEstatus.GetPorcRegistros(1)+"":"0";
String vTotEnProceso		= oAnexoEstatus.GetPorcRegistros(2)!=-1?oAnexoEstatus.GetPorcRegistros(2)+"":"0";
String vTotPorAutorizar		= oAnexoEstatus.GetPorcRegistros(3)!=-1?oAnexoEstatus.GetPorcRegistros(3)+"":"0";
String vTotAutorizado		= oAnexoEstatus.GetPorcRegistros(4)!=-1?oAnexoEstatus.GetPorcRegistros(4)+"":"0";
 
int CT = java.lang.Integer.parseInt(vTotVacio) + java.lang.Integer.parseInt(vTotEnProceso) + java.lang.Integer.parseInt(vTotPorAutorizar) + java.lang.Integer.parseInt(vTotAutorizado);
java.text.DecimalFormat myFormatter = new java.text.DecimalFormat("###,##0");

//float vPorcNoAplica		= java.lang.Integer.parseInt(vTotNoAplica)!=0?(java.lang.Float.parseFloat(vTotNoAplica)/CT)*100:0;
float vPorcVacio			= java.lang.Integer.parseInt(vTotVacio)!=0?(java.lang.Float.parseFloat(vTotVacio)/CT)*100:0;
float vPorcEnProceso		= java.lang.Integer.parseInt(vTotEnProceso)!=0?(java.lang.Float.parseFloat(vTotEnProceso)/CT)*100:0;
float vPorcPorAutorizar	= java.lang.Integer.parseInt(vTotPorAutorizar)!=0?(java.lang.Float.parseFloat(vTotPorAutorizar)/CT)*100:0;
float vPorcAutorizado		= java.lang.Integer.parseInt(vTotAutorizado)!=0?(java.lang.Float.parseFloat(vTotAutorizado)/CT)*100:0;

EntregaEstatus oEntregaEstatus = new EntregaEstatus();
int iEstatusEntrega = java.lang.Integer.parseInt((String)(session.getValue("sEstatusEntrega")!= null?session.getValue("sEstatusEntrega"):"0") );
if(iEstatusEntrega==0){
	oEntregaEstatus.Get(iIdFuncionario);
	iEstatusEntrega = java.lang.Integer.parseInt(oEntregaEstatus.GetEstatus());
}
%>
<html>
<head>
<title>Entrega - Recepción : Lista de Anexos</title>
<link rel="stylesheet" type="text/css" href="<%=sPath%>Styles/Gobierno.css">
<script language="JavaScript" src="<%=sPath%>Scripts/Gobierno.js"></script>
<script language="JavaScript">
	function save(){
		document.forma.sOpcion.value = 'SAVE';
		document.forma.submit();
	}
	function cancel(){
		document.forma.sOpcion.value = 'NORMAL';
		document.forma.submit();
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
  	<td valign="top" align="center">
	<FORM action="pListaAnexos.jsp" name="forma" method="post" >
		<input type="hidden" name="sOpcion" value="">
		<table border="0" bordercolor="White">
		   <tr>
				<td colspan="2">
					<table border="0" width="100%">
						<tr>	
							<td width="50%" class="TituloParrafo" align="left">&nbsp;&nbsp;Lista de Anexos&nbsp;&nbsp;</td>
							<td width="50%" align="right"><b>% Avance</b></td>
						</tr>
					</table>
				</td>
				<td align="center" colspan="5">
					<table border="0" width="100%">
						<tr>	 
							<td width="40" align="center"><b><font style="font-size:9px;color:'<%=oAnexoEstatus.GetEstatusColor(oAnexoEstatus.GetEstatusNoAplica())%>';"></font></b></td>
							<td width="30" align="center"><b><font style="font-size:9px;color:'<%=oAnexoEstatus.GetEstatusColor(oAnexoEstatus.GetEstatusVacio())%>';"><%=myFormatter.format(vPorcVacio)%>%</font></b></td>
							<td width="40" align="center"><b><font style="font-size:9px;color:'<%=oAnexoEstatus.GetEstatusColor(oAnexoEstatus.GetEstatusEnProceso())%>';"><%=myFormatter.format(vPorcEnProceso)%>%</font></b></td>
							<td width="45" align="center"><b><font style="font-size:9px;color:'<%=oAnexoEstatus.GetEstatusColor(oAnexoEstatus.GetEstatusPorAutorizar())%>';"><%=myFormatter.format(vPorcPorAutorizar)%>%</font></b></td>
							<td width="45" align="center"><b><font style="font-size:9px;color:'<%=oAnexoEstatus.GetEstatusColor(oAnexoEstatus.GetEstatusAutorizado())%>';"><%=myFormatter.format(vPorcAutorizado)%>%</font></b></td>
						</tr>
					</table>
				</td>
				<%
				int		iTipoUsuario		= session.getValue("iTipoUsuario")!=null?java.lang.Integer.parseInt((String)session.getValue("iTipoUsuario")):0;
				if(iTipoUsuario != oUsuario.GetTipoRepresentante() && iTipoUsuario != oUsuario.GetTipoEnlace() ) { 
					if(oEntregaEstatus.GetEstatusSinInformacion().equals(iEstatusEntrega+"") || oEntregaEstatus.GetEstatusNoIniciada().equals(iEstatusEntrega+"") || oEntregaEstatus.GetEstatusRechazadaPorEnlace().equals(iEstatusEntrega+"")){%>
				<td align=right colspan="2">
				    <INPUT onclick="cancel();" 	name="CANCEL" 	type="button" value="Cancelar" class="boton">&nbsp;
					<INPUT onclick="save();" 	name="SAVE" 	type="button" value="Grabar"  class="boton">&nbsp;
				</td><%
					} else {%>
			</tr>
			<tr>
				<td colspan="8">
					<font class='TituloEstatus'>La Entrega-Recepción se encuentra en proceso, su estado actual es <%=oEntregaEstatus.GetEstatusDesc(iEstatusEntrega+"") %></font>
				</td><%
					}
				} %>
			</tr>
			<tr>
				<td colspan="2" class="TituloMenu" rowspan="2" width="200">Anexos</td>
				<td colspan="5" align="center" class="TituloMenu" width="188">Estatus</td>
				<td align="center" class="TituloMenu" width="152" rowspan="2">Usuario Ult. Modificaci&oacute;n</td>
				<td width="60" align="center" class="TituloMenu" rowspan="2">Fecha Ult. Mod.</td>
			</tr>
			<tr>	
				<td width="35" align="center" bgcolor="<%=oAnexoEstatus.GetEstatusColor(oAnexoEstatus.GetEstatusNoAplica())%>"><font style="font-size:8px;color:'white';">No Aplica</font></td>
				<td width="36" align="center" bgcolor="<%=oAnexoEstatus.GetEstatusColor(oAnexoEstatus.GetEstatusVacio())%>"><font style="font-size:8px;color:'white';">Vacio</font></td>
				<td width="37" align="center" bgcolor="<%=oAnexoEstatus.GetEstatusColor(oAnexoEstatus.GetEstatusEnProceso())%>"><font style="font-size:8px;color:'black';">En Proceso</font></td>
				<td width="40" align="center" bgcolor="<%=oAnexoEstatus.GetEstatusColor(oAnexoEstatus.GetEstatusPorAutorizar())%>"><font style="font-size:8px;color:'white';">Por Autorizar</font></td>
				<td width="40" align="center" bgcolor="<%=oAnexoEstatus.GetEstatusColor(oAnexoEstatus.GetEstatusAutorizado())%>"><font style="font-size:8px;color:'white';">Autorizado</font></td>
			</tr><%
			int intContador = 0;
			String sBackColor = "";
			int iNumRows = oAnexoEstatus.GetAll(iIdFuncionario);
			for(int i=0;i<iNumRows;i++){
				intContador = intContador + 1;
				if (intContador%2 == 0){	sBackColor = "#ffffff";	}
				else{						sBackColor = "#eeeeee"; }%>
			<tr bgcolor="<%=sBackColor%>"  onMouseOver = "MouseDentro(this);" onMouseOut  = "MouseFuera(this,'<%=sBackColor%>');">
				<td valign="middle"  bgcolor="<%=oAnexoEstatus.GetEstatusColor(oAnexoEstatus.GetEstatus(i))%>">
					<font style="color:'<%=oAnexoEstatus.GetEstatus(i).equals(oAnexoEstatus.GetEstatusEnProceso())?"black":"white"%>';"><%=oAnexo.GetPos(oAnexoEstatus.GetIdAnexo(i))>=0?
						oAnexo.GetClave(oAnexo.GetPos(oAnexoEstatus.GetIdAnexo(i))).substring(5):oAnexoEstatus.GetIdAnexo(i)+"" %></font>
				</td>
				<td valign="middle"><a href="f<%=oAnexo.GetNombreCorto(i)%>.jsp"><font style="color:'<%=oAnexoEstatus.GetEstatus(i).equals(oAnexoEstatus.GetEstatusEnProceso())?"black":oAnexoEstatus.GetEstatusColor(oAnexoEstatus.GetEstatus(i))%>';">
					<%=oAnexo.GetPos(oAnexoEstatus.GetIdAnexo(i))>=0?
						oAnexo.GetNombre(oAnexo.GetPos(oAnexoEstatus.GetIdAnexo(i))):oAnexoEstatus.GetIdAnexo(i)+"" %></font>
						</a>
				</td>
				<td valign="middle" align="center">
					<input type="hidden" name="sEstatusAnt<%=oAnexoEstatus.GetIdAnexo(i)%>" value="<%=oAnexoEstatus.GetEstatus(i)%>">
					<input type="radio" name="sEstatus<%=oAnexoEstatus.GetIdAnexo(i)%>" <%=oAnexoEstatus.GetEstatusNoAplica().equals(oAnexoEstatus.GetEstatus(i))?" checked":""    %> value="<%=oAnexoEstatus.GetEstatusNoAplica()%>">
				</td>
				<td valign="middle" align="center">
					<input type="radio" name="sEstatus<%=oAnexoEstatus.GetIdAnexo(i)%>" <%=oAnexoEstatus.GetEstatusVacio().equals(oAnexoEstatus.GetEstatus(i))?" checked":""       %> value="<%=oAnexoEstatus.GetEstatusVacio()%>">
				</td>
				<td valign="middle" align="center">
					<input type="radio" name="sEstatus<%=oAnexoEstatus.GetIdAnexo(i)%>" <%=oAnexoEstatus.GetEstatusEnProceso().equals(oAnexoEstatus.GetEstatus(i))?" checked":""   %> value="<%=oAnexoEstatus.GetEstatusEnProceso()%>">
				</td>
				<td valign="middle" align="center">
					<input type="radio" name="sEstatus<%=oAnexoEstatus.GetIdAnexo(i)%>" <%=oAnexoEstatus.GetEstatusPorAutorizar().equals(oAnexoEstatus.GetEstatus(i))?" checked":""%> value="<%=oAnexoEstatus.GetEstatusPorAutorizar()%>">
				</td>
				<td valign="middle" align="center">
					<input type="radio" name="sEstatus<%=oAnexoEstatus.GetIdAnexo(i)%>" <%=oAnexoEstatus.GetEstatusAutorizado().equals(oAnexoEstatus.GetEstatus(i))?" checked":""  %> value="<%=oAnexoEstatus.GetEstatusAutorizado()%>">
				</td>
				<td valign="middle" align="center">
					<%=oAnexoEstatus.GetIdUsuario(i)>0&&oUsuario.GetPos(oAnexoEstatus.GetIdUsuario(i))>=0?oUsuario.GetNombre(oUsuario.GetPos(oAnexoEstatus.GetIdUsuario(i)) ):(oAnexoEstatus.GetIdUsuario(i)>0?oAnexoEstatus.GetIdUsuario(i)+"":"")%>
				</td>
				<td valign="middle" align="center">
					<%=!oAnexoEstatus.GetFechaActualizacion(i).equals("")?
								oUtil.sGetNumToDate(oAnexoEstatus.GetFechaActualizacion(i),"dd") + "." +
								oUtil.GetMesCorto(java.lang.Integer.parseInt(oUtil.sGetNumToDate(oAnexoEstatus.GetFechaActualizacion(i),"MM"))) + "." +
								oUtil.sGetNumToDate(oAnexoEstatus.GetFechaActualizacion(i),"yyyy")
								:""%>
				</td>
			</tr><%
			}%>
			<tr>
				<td valign="middle" align="center"></td>
				<td valign="middle"></td>
				<td valign="middle" align="center"></td>
				<td valign="middle" align="center"><b><%=vTotVacio%></b></td>
				<td valign="middle" align="center"><b><%=vTotEnProceso%></b></td>
				<td valign="middle" align="center"><b><%=vTotPorAutorizar%></b></td>
				<td valign="middle" align="center"><b><%=vTotAutorizado%></b></td>
				<td valign="middle" align="center"><b>Total:&nbsp;<%=CT%></b></td>
				<td valign="middle" align="center"></td>
			</tr>
		</table>
	</FORM>
<%//=oUsuario.GetAll().getVMatrixHTML() %>
	</td>
  <!-- Contenido -->
  </tr>
</table>
<%@include file="Footer.jsp"%>
</body>
</html>
