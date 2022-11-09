<%
/*********************************************************************************************************
Elaboro:	Julio Enrique Espinosa Torres
Lugar:		Monterrey, NL
Fecha:		25.Oct.2002
Compañia:	CONSISS*/%>
<%@page import="com.consiss.util.tools.*"%>
<%@page import="com.gob.*"%>
<%@page import="java.util.*" %>
<%String sPath ="../";
//Valida la permanencia del usuario en session
if ((String)session.getValue("ok")!="Consiss")
			response.sendRedirect("Error.html");
Funcionario oFuncionario = new Funcionario();
Cargo oCargo = new Cargo();
UnidadAdministrativa oUnidadAdministrativa = new UnidadAdministrativa();
UnidadGobierno oUnidadGobierno = new UnidadGobierno();
int iIdUnidadAdministrativa = java.lang.Integer.parseInt( request.getParameter("iIdUnidadAdministrativa")!= null ? (String)request.getParameter("iIdUnidadAdministrativa"): "0" );
int iIdUnidadGobierno = java.lang.Integer.parseInt( request.getParameter("iIdUnidadGobierno")!= null ? (String)request.getParameter("iIdUnidadGobierno"): "0" );
int tempIdUnidadGobierno =  java.lang.Integer.parseInt(
		(String)(session.getValue("iIdUnidadGobierno")!= null?session.getValue("iIdUnidadGobierno"):"0") );
//out.println("iUA:" +  request.getParameter("iIdUnidadAdministrativa") + "<br>" );
//out.println("iUG:" +  request.getParameter("iIdUnidadGobierno") );
%>
<html>
<head>
	<title>Entrega - Recepción : Selecciona Funcionario</title>
	<link rel="stylesheet" type="text/css" href="<%=sPath%>Styles/Gobierno.css">
<script language="JavaScript" src="<%=sPath%>Scripts/Gobierno.js"></script>
<script language="JavaScript">
	
	function chgCombo(comboPadre, comboHijo, idSel){
		if(idSel<0) return;
		limpiaCombo(comboHijo);
		var sOpciones = comboPadre.options[idSel].title;
		while ( sOpciones.length > 0) {
			x1 = sOpciones.substr(0, sOpciones.indexOf(":"));
			x2 = sOpciones.substr(sOpciones.indexOf(":")+1, sOpciones.indexOf(";") - (sOpciones.indexOf(":")+1) );
			sOpciones = sOpciones.substr(sOpciones.indexOf(";")+1 );
			
			var nuevaOption = new Option(x2, x1, false, true);
			comboHijo.options[comboHijo.length] = nuevaOption;
		}
		if(comboHijo.length > 0 ) { comboHijo.options[0].selected = true; }
	}
	
	function limpiaCombo(combo){
		while (combo.length > 0 ) {	combo.options[combo.length-1] = null;  	}
	}
	
	function sele(pCodigo) {
		document.forma.sIdFuncionario.value = pCodigo;
		document.forma.sOpcion.value = 'SELE';
		document.forma.submit();
	}
	
	function seleAdministrativa(){
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
  	<td valign="top"><br>
<form name="forma" method="post" action="pSeleFuncionario.jsp">
	<input type="hidden" name="sOpcion">
	<input type="hidden" name="sIdFuncionario">
	<div align="center">
	<table cellPadding="1" cellSpacing="1">
		<tr>
			<td align="center" colspan="2" class="TituloParrafo">&nbsp;&nbsp;SELECCIONE EL FUNCIONARIO&nbsp;&nbsp;<br>&nbsp;</td>
		</tr>
		<tr>
			<td class="	TituloMenu" width="220px">Dependencia, Organismo Paraestatal o Tribunal Administrativo: </td>
			<td width="240px">
			<%if(tempIdUnidadGobierno ==0){%>
				<select class="cmbBox" name="iIdUnidadGobierno" onchange="chgCombo(this, iIdUnidadAdministrativa, this.selectedIndex);">
					<option title="0:[ SELECCIONE ];" value="0"> [ SELECCIONE ] </option><%
				String sPaso = "";
				int oIdUnidadGobiernoIni = 0;
				for(int j=0;j<oUnidadGobierno.GetAll();j++){
					oIdUnidadGobiernoIni	= oUnidadGobierno.GetIdUnidadGobierno(0);
					int oIdUnidadGobierno	= oUnidadGobierno.GetIdUnidadGobierno(j);
					String oNombre 			= oUnidadGobierno.GetNombre(j);
					sPaso			= "0:[ SELECCIONE ];";
					for(int k=0;k<oUnidadAdministrativa.GetAll();k++){
						if(oUnidadAdministrativa.GetIdUnidadGobierno(k)==oIdUnidadGobierno){
							int oIdUnidadAdministrativa	= oUnidadAdministrativa.GetIdUnidadAdministrativa(k);
							sPaso						= sPaso + oIdUnidadAdministrativa + ":" + oUnidadAdministrativa.GetNombre(k) + ";";
						}
					}%>
					<option title="<%=sPaso%>" value="<%=oIdUnidadGobierno%>"<%=iIdUnidadGobierno==oIdUnidadGobierno?" selected":""%>><%=oNombre%></option><%
				}%>
				</select><%
			} else {
				iIdUnidadGobierno = tempIdUnidadGobierno;
				%><font class="cmbBox">&nbsp;<%=oUnidadGobierno.GetPos(iIdUnidadGobierno)>=0?oUnidadGobierno.GetNombre(oUnidadGobierno.GetPos(iIdUnidadGobierno)):""%></font>
			<%}%>
			</td>
		</tr>
		<tr><td>&nbsp;</td></tr>
		<tr>
			<td class="TituloMenu">Unidad Administrativa: </td>
			<td>
				<select class="cmbBox" name="iIdUnidadAdministrativa" onchange="seleAdministrativa();">
					<option value="0">[ SELECCIONE ]</option><%
					if(iIdUnidadGobierno>0){
						for(int k=0;k<oUnidadAdministrativa.GetAll();k++){
							if(oUnidadAdministrativa.GetIdUnidadGobierno(k)==iIdUnidadGobierno){
								int oIdUnidadAdministrativa = oUnidadAdministrativa.GetIdUnidadAdministrativa(k);
								String oNombre 				= oUnidadAdministrativa.GetNombre(k);%>
					<option value="<%=oIdUnidadAdministrativa%>"<%=oIdUnidadAdministrativa==iIdUnidadAdministrativa?" selected":""%>><%=oNombre%></option><%
							}
						}
					}%>
				</select>
			</td>
		</tr>
	</table>
	<br>
	<%if(iIdUnidadGobierno>0){ %>
	<table>
		<tr>
			<td class="TituloMenu">Cargo</td>
			<td class="TituloMenu">Funcionario</td>
			<td class="TituloMenu">&nbsp;</td>
		</tr><%
		for(int m=0;m<oFuncionario.GetUnidadesAll();m++){
			if(oFuncionario.GetIdUnidadAdministrativa(m)==iIdUnidadAdministrativa){ 
				String oNombre 		= oFuncionario.GetNombre(m);
				String oApePaterno 	= oFuncionario.GetApePaterno(m);
				String oApeMaterno 	= oFuncionario.GetApeMaterno(m);
				String oEstatus 	= oFuncionario.GetEstatus(m);%>
		<%if(!oEstatus.equals("0")){%>
		<tr><td><%=oFuncionario.GetCargo(m)%></td>
			<td><%=oNombre + " " + oApePaterno + " " + oApeMaterno%></td>
			<td align="right">
				<input class="boton" onclick="sele(<%=oFuncionario.GetIdFuncionario(m)%>);" 	name="SELE" 	type="button" value=" Selecciona "  >&nbsp;
			</td>
		</tr><%}
			}
		}%>
	</table><%
	}%>
	</div>
	<br>	

</form></td>
  <!-- Contenido -->
  </tr>
</table>
<%@include file="Footer.jsp"%>
</body>
</html>
