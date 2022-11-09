<%/*********************************************************************************************************
Elaboro:	Julio Enrique Espinosa Torres
Lugar:		Monterrey, NL
Fecha:		12.Nov.2002
Compañia:	CONSISS*/%>
<%@page import="com.consiss.util.tools.*"%>
<%@page import="com.gob.*"%>
<%@page import="java.util.*" %>
<%
//Valida la permanencia del usuario en session
if ((String)session.getValue("ok")!="Consiss")
			response.sendRedirect("Error.html");

String	sCodigo = request.getParameter("sCodigo")!= null ? request.getParameter("sCodigo"): "";
int iIdFuncionario =  java.lang.Integer.parseInt(
		(String)(session.getValue("iIdFuncionario")!= null?session.getValue("iIdFuncionario"):"0") );
int tempIdUnidadGobierno =  java.lang.Integer.parseInt(
		(String)(session.getValue("iIdUnidadGobierno")!= null?session.getValue("iIdUnidadGobierno"):"0") );
String iIdUnidadGobierno = request.getParameter("sUnidadGobierno")!= null ? request.getParameter("sUnidadGobierno"): "-1";
AvanceUnidadGobierno oAvanceUnidadGobierno 	= new AvanceUnidadGobierno();
UnidadGobierno oUnidadGobierno = new UnidadGobierno();
String sPath = "../";

%>
<html>
<head>
	<title>Entrega - Recepción : Avance por Dependencia, Organismo o Tribunal</title>
<link rel="stylesheet" type="text/css" href="<%=sPath%>Styles/Gobierno.css">
<script language="JavaScript" src="<%=sPath%>Scripts/Libreria.js"></script>
<script language="JavaScript" src="<%=sPath%>Scripts/Gobierno.js"></script>
<script language="JavaScript" src="<%=sPath%>Scripts/Calendario.js"></script>

<script language="JavaScript">
	function imprimir(){
	var ancho = 600;
	var alto = 500;
	var x = (screen.width - ancho) / 2;
	var y = (screen.height - alto)- 150 / 2;		
		var strUrl  = "iAvanceUnidadGobierno2.jsp?sUnidadGobierno=" + document.forma.sUnidadGobierno.value;
	window.open(strUrl, "Imprimir", "width=" + ancho + ",height=" + alto + ",top=" + y + ",left=" + x + ",toolbar=0,location=0,directories=0,status=0,menubar=0,scrollbars=1,resizable=0");
	}
</script>
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
	<td valign="top">
<FORM action="fAvanceUnidadGobierno2.jsp" name="forma" method="post" >
	<input type="hidden" name="sCodigo" value="<%=sCodigo%>"> 
	<TABLE align=center border=0 cellPadding=0 cellSpacing=0 width="100%">
		<TR>
			<TD  colspan="2" class="TituloParrafo">CONSULTAS - AVANCE POR DEPENDENCIA, ORGANISMO PARAESTATAL O TRIBUNAL ADMINISTRATIVO</TD>
		</TR>
		<TR>
		<TD></TD>		
			<TD align=right>&nbsp;&nbsp;<a onmouseover="this.style.cursor='hand'" style="cursor:normal" onclick="imprimir();"><img src="<%=sPath%>Images/Impresora.jpg" ></a></td> 
			<TD align=right></TD>
		</TR>
		<%if(tempIdUnidadGobierno == 0){%>		
		<tr>
		<td width="25%"><b>Dependencia, Organismo o Tribunal</b></td>
		<td>
		<select class="cmbBox" name="sUnidadGobierno" onchange="javascript:document.forma.submit();">
			<option value="-1"> [ SELECCIONE ] </option>
			<option value="0" <%=iIdUnidadGobierno.equals("0")?"selected":""%> > [ TODAS ] </option><%
				for(int i=0;i<oUnidadGobierno.GetAll();i++){
						int oIdUnidadGobierno	= oUnidadGobierno.GetIdUnidadGobierno(i);
						String oNombre 			= oUnidadGobierno.GetNombre(i); %>
					<option value="<%=oIdUnidadGobierno%>" <%=java.lang.Integer.parseInt(iIdUnidadGobierno)==oIdUnidadGobierno?" selected":""%>><%=oNombre%></option><%
				}%></td>
		</tr>
		<%} else {%>
			<input type="hidden" name="sUnidadGobierno" id="sUnidadGobierno" value="<%=tempIdUnidadGobierno%>">
		<%} %>
		<tr>
		<td colspan="2" height="15"></td>
		</tr>
		</TABLE>	
	<!-- Datos que se agregaran a la tabla  -->
	<TABLE cellPadding="0" cellSpacing="0" width="100%" BORDER="1" BORDERCOLOR="white">
	<!-- Etiqueta donde se aplican los encabezados de las tablas-->
		<TR align="middle">
			<td class="TituloMenu" rowspan="2">Funcionario</TD>
			<td class="TituloMenu" rowspan="2">Cargo</TD>
			<td class="TituloMenu" rowspan="2">Unidad Administrativa</TD>
			<td class="TituloMenu" rowspan="2">Dependencia, Organismo o Tribunal</TD>
			<td class="TituloMenu" width="40"  rowspan="2" align="center">No aplica</td>
			<td class="TituloMenu" colspan="4">Avance de Anexos que Aplican</TD>
		</TR>
		<TR>
			
			<td width="30" align="center"><b><font color="#FF0000">Vacio</font></b></td>
			<td width="40" align="center"><b><font color="#FFCC18">En Proceso</font></b></td>
			<td width="45" align="center"><b><font color="#008000">Por Autorizar</font></b></td>
			<td width="45" align="center"><b><font color="#000000">Autorizado</font></b></td>
		</tr>
		<%		
			int intContador = 0;
			int variable = 0 ;
			String sBackColor = "";
			
			float AnexosVacios = 0;
			float AnexosEnProceso = 0;
			float AnexosPorAutorizar  = 0;
			float AnexosAutorizados = 0;
			float AnexosNoAplican=0;
			
			float TotalAnexos = 0;
			
			java.text.DecimalFormat myFormatter = new java.text.DecimalFormat("###,##0");
			
			if (tempIdUnidadGobierno != 0){
			variable = oAvanceUnidadGobierno.GetAll(tempIdUnidadGobierno);
			}else{ 
		    variable = oAvanceUnidadGobierno.GetAll(java.lang.Integer.parseInt(iIdUnidadGobierno));
			}
		for(int i=0;i<variable;i++){
		    String vIdUnidadGobierno 				= oAvanceUnidadGobierno.GetIdUnidadGobierno(i)!=-1?oAvanceUnidadGobierno.GetIdUnidadGobierno(i)+"":"0";
			String vNombreUnidadGobierno 			= oAvanceUnidadGobierno.GetNombreUnidadGobierno(i)!=null?oAvanceUnidadGobierno.GetNombreUnidadGobierno(i):"";
			String vIdUnidadAdministrativa 			= oAvanceUnidadGobierno.GetIdUnidadAdministrativa(i)!=null?oAvanceUnidadGobierno.GetIdUnidadAdministrativa(i):"";
			String vNombreUnidadAdministrativa 		= oAvanceUnidadGobierno.GetNombreUnidadAdministrativa(i)!=null?oAvanceUnidadGobierno.GetNombreUnidadAdministrativa(i):"";
			String vIdCargo		  					= oAvanceUnidadGobierno.GetIdCargo(i)!=null?oAvanceUnidadGobierno.GetIdCargo(i):"";
			String vNombreCargo 					= oAvanceUnidadGobierno.GetNombreCargo(i)!=null?oAvanceUnidadGobierno.GetNombreCargo(i):"";
			String vIdFuncionario 					= oAvanceUnidadGobierno.GetIdFuncionario(i)!=null?oAvanceUnidadGobierno.GetIdFuncionario(i):"";
			String vNombreFuncionario 				= oAvanceUnidadGobierno.GetNombreFuncionario(i)!=null?oAvanceUnidadGobierno.GetNombreFuncionario(i):"";
			String vEstatus0 						= oAvanceUnidadGobierno.GetEstatus0(i)!=null?oAvanceUnidadGobierno.GetEstatus0(i):"";
			String vEstatus1 						= oAvanceUnidadGobierno.GetEstatus1(i)!=null?oAvanceUnidadGobierno.GetEstatus1(i):"";
			String vEstatus2 						= oAvanceUnidadGobierno.GetEstatus2(i)!=null?oAvanceUnidadGobierno.GetEstatus2(i):"";
			String vEstatus3 						= oAvanceUnidadGobierno.GetEstatus3(i)!=null?oAvanceUnidadGobierno.GetEstatus3(i):"";
			String vEstatus4 						= oAvanceUnidadGobierno.GetEstatus4(i)!=null?oAvanceUnidadGobierno.GetEstatus4(i):"";
			int CT = java.lang.Integer.parseInt(vEstatus1) + java.lang.Integer.parseInt(vEstatus2) + java.lang.Integer.parseInt(vEstatus3) + java.lang.Integer.parseInt(vEstatus4);
			
			AnexosVacios = java.lang.Integer.parseInt(vEstatus1) + AnexosVacios;
			AnexosEnProceso = java.lang.Integer.parseInt(vEstatus2) + AnexosEnProceso;
			AnexosPorAutorizar = java.lang.Integer.parseInt(vEstatus3) + AnexosPorAutorizar;
			AnexosAutorizados = java.lang.Integer.parseInt(vEstatus4) + AnexosAutorizados;
			AnexosNoAplican = java.lang.Integer.parseInt(vEstatus0) + AnexosNoAplican;
			TotalAnexos = CT + TotalAnexos;
			
			intContador = intContador + 1;
		 	if (intContador%2 == 0){
					sBackColor = "#ffffff";
				}else{
					sBackColor = "#eeeeee";
			  }
			%>
			
		<TR align="left" bgcolor="<%=sBackColor%>">
			<TD>&nbsp;<%=vNombreFuncionario%></TD>
			<TD>&nbsp;<%=vNombreCargo%></TD>
			<TD>&nbsp;<%=vNombreUnidadAdministrativa%></TD>
			<TD>&nbsp;<%=vNombreUnidadGobierno%></TD>
			<TD align="center">&nbsp;<%=vEstatus0%></TD>
			<TD align="center">&nbsp;<%=vEstatus1%></TD>
			<TD align="center">&nbsp;<%=vEstatus2%></TD>
			<TD align="center">&nbsp;<%=vEstatus3%></TD>
			<TD align="center">&nbsp;<%=vEstatus4%></TD>
		</TR>
		<%}%>
		<%if(variable == 0 ){%>
		<tr>
			<td></td>
			<td></td>
			<td></td>
			<td colspan="5" align="right"><b>Total Anexos</b></td>
			<TD align="center"><b>&nbsp;0</b></TD>
			<TD align="center"><b>&nbsp;0</b></TD>
			<TD align="center"><b>&nbsp;0</b></TD>
			<TD align="center"><b>&nbsp;0</b></TD>
			<TD align="center"><b>&nbsp;0</b></TD>
		</tr>
		<%}else{%>
		<tr>
			<TD></TD>
			<TD></TD>
			<TD></TD>
			<td align="right"><b>Total de Anexos que sí Aplican&nbsp;<%=myFormatter.format(TotalAnexos)%></b></td>
			<TD align="center"><b>&nbsp;<%=myFormatter.format(AnexosNoAplican)%></b></TD>
			<TD align="center"><b>&nbsp;<%=myFormatter.format(AnexosVacios)%></b></TD>
			<TD align="center"><b>&nbsp;<%=myFormatter.format(AnexosEnProceso)%></b></TD>
			<TD align="center"><b>&nbsp;<%=myFormatter.format(AnexosPorAutorizar)%></b></TD>
			<TD align="center"><b>&nbsp;<%=myFormatter.format(AnexosAutorizados)%></b></TD>
		</tr>
		<%}	
		%>

</TABLE>
</FORM>
</td><!-- Contenido -->
</tr>
</table>
<%@include file="Footer.jsp"%>
</body>
</html>