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
//String	sCodigo = request.getParameter("sCodigo")!= null ? request.getParameter("sCodigo"): "0";

int iIdFuncionario =  java.lang.Integer.parseInt(
		(String)(session.getValue("iIdFuncionario")!= null?session.getValue("iIdFuncionario"):"0") );

int idUsuarioLimitado = request.getParameter("idUsuarioLimitado")!= null ? java.lang.Integer.parseInt((String)request.getParameter("idUsuarioLimitado")): 0;

UsrLimitado		oUsrLimitado	= new UsrLimitado();
UsuarioAnexo	oAnexo			= new UsuarioAnexo();
AnexoEstatus	oAnexoEstatus	= new AnexoEstatus();
//Utilerias	oUtil	 	 = new Utilerias();
String sPath = "../";%>
<html>
<head>
<title>Entrega - Recepción : Asigna Anexos</title>
<link rel="stylesheet" type="text/css" href="<%=sPath%>Styles/Gobierno.css">
<script language="JavaScript" src="<%=sPath%>Scripts/Gobierno.js"></script>
<script language="JavaScript">
	function selUsuario(){
		document.forma.submit();
	}
	function agrega(){
		if(document.forma.selNoAsignados.selectedIndex>=0) {
			var idAnexos = document.forma.selNoAsignados[document.forma.selNoAsignados.selectedIndex].value;
			var dscAnexos = document.forma.selNoAsignados[document.forma.selNoAsignados.selectedIndex].text;
			document.forma.selNoAsignados.options[document.forma.selNoAsignados.selectedIndex] = null;
			var nuevaOption = new Option(dscAnexos, idAnexos, false, true);
			document.forma.selAsignados.options[document.forma.selAsignados.length] = nuevaOption;
		}
	}
	function borra(){
		if(document.forma.selAsignados.selectedIndex>=0) {
			var idAnexos = document.forma.selAsignados[document.forma.selAsignados.selectedIndex].value;
			var dscAnexos = document.forma.selAsignados[document.forma.selAsignados.selectedIndex].text;
			document.forma.selAsignados.options[document.forma.selAsignados.selectedIndex] = null;  
			var nuevaOption = new Option(dscAnexos, idAnexos, false, true);
			document.forma.selNoAsignados.options[document.forma.selNoAsignados.length] = nuevaOption;
		}
	}
	function cargaId(){
		var sIdAsignados = "", sep="";
		for(var i=0;i<document.forma.selAsignados.length;i++){
			sIdAsignados = sIdAsignados + sep + document.forma.selAsignados[i].value;
			sep=", ";
		}
		document.forma.idAsignados.value = sIdAsignados;
	}
	function valid(){
		if (document.forma.idUsuarioLimitado.value=="0"){
			alert("Seleccione un Usuario Lmitado");
			document.forma.idUsuarioLimitado.focus();
			return false;
		}
		return true;
	}
	function save(){
		//if (valid()) {
		//	cargaId();
			document.forma.sOpcion.value = 'SAVE';
			document.forma.submit();
		//}
	}
	function cancel(){
		//document.forma.sCodigo.value = 0;
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
  	<td valign="top">
	<FORM action="pAsignaAnexos.jsp" name="forma" method="post" >
		<input type="hidden" name="sOpcion" value="">
		<TABLE align=center border=0 cellPadding=0 cellSpacing=0 width="100%">
			<TR>
				<TD class="TituloParrafo">&nbsp;&nbsp;Lista de Anexos&nbsp;&nbsp;</TD>
				<TD align=right>
					<INPUT onclick="cancel();" 	name="CANCEL" 	type="button" value="Cancelar" class="boton">&nbsp;
					<INPUT onclick="save();" 	name="SAVE" 	type="button" value="Grabar"  class="boton">&nbsp;
				</TD>
			</TR>
		</TABLE>

		<table>
			<tr>
				<td colspan="2" class="TituloMenu" rowspan="2">Anexos</td>
				<td <%=oUsrLimitado.GetAll(iIdFuncionario)>0?"colspan="+(oUsrLimitado.GetAll(iIdFuncionario)+1):"" %> align="center" class="TituloMenu">Usuario Asignado</td>
			</tr>
			<tr><td class="TituloMenu" align="center"><font style="font-size:8px;">NO ASIGNADO</font></td><%
				for(int i=0;i<oUsrLimitado.GetAll(iIdFuncionario);i++){ 
					%>
				<td class="TituloMenu" align="center"><font style="font-size:8px;"><%=
							oUsrLimitado.GetNombre(i)!=null?oUsrLimitado.GetNombre(i)+" ":""
							%><%=oUsrLimitado.GetApePaterno(i)!=null?oUsrLimitado.GetApePaterno(i)+" ":""
							%><%=oUsrLimitado.GetApeMaterno(i)!=null?oUsrLimitado.GetApeMaterno(i)+" ":""%></font></td><%
				}%>
			</tr><%
				int intContador = 0;
				String sBackColor = "";
				oAnexoEstatus.GetAll(iIdFuncionario);
				for(int i=0;i<oAnexo.GetAll(iIdFuncionario).getNumRows();i++){
					int rowEstatus = oAnexoEstatus.GetPos(iIdFuncionario, oAnexo.GetIdAnexo(i));
					String Estatus = oAnexoEstatus.GetEstatus(rowEstatus);
					if(!Estatus.equals(oAnexoEstatus.GetEstatusNoAplica())) { 
						intContador = intContador + 1;
						if (intContador%2 == 0){	sBackColor = "#ffffff";	}
						else{						sBackColor = "#eeeeee"; }
						%>
			<tr bgcolor="<%=sBackColor%>" onMouseOver = "MouseDentro(this);" onMouseOut  = "MouseFuera(this,'<%=sBackColor%>');">
				<td valign="top">
					<%=oAnexo.GetClave(i).substring(5)%>
				</td>
				<td valign="top">
					<%=oAnexo.GetNombre(i)%>
				</td>
				<td valign="top" align="center">
					<input type="hidden" name="sIdUsuarioAnt<%=oAnexo.GetIdAnexo(i)%>" value="<%=oAnexo.GetIdUsuario(i)>0?oAnexo.GetIdUsuario(i)+"":"null"%>">
					<input type="radio" name="sIdUsuario<%=oAnexo.GetIdAnexo(i)%>" <%=oAnexo.GetIdUsuario(i)>0?"":" checked"%> value="null">
				</td><%
						for(int j=0;j<oUsrLimitado.GetAll(iIdFuncionario);j++){ %>
				<td valign="top" align="center">
					<input type="radio" name="sIdUsuario<%=oAnexo.GetIdAnexo(i)%>" <%=oAnexo.GetIdUsuario(i)==oUsrLimitado.GetIdUsuarioLimitado(j)?" checked":"" %> value="<%=oUsrLimitado.GetIdUsuarioLimitado(j)%>">
				</td><%
						}%>
			</tr><%	}
				}%>
		</table>
	</FORM>
	</td>
  <!-- Contenido -->
  </tr>
</table>
<%//=oAnexo.GetAll(iIdFuncionario).getVMatrixHTML() %>
<%@include file="Footer.jsp"%>
</body>
</html>
