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
String iIdUnidadGobierno = request.getParameter("sUnidadGobierno")!= null ? request.getParameter("sUnidadGobierno"): "0";
AvanceUnidadGobierno oAvanceUnidadGobierno 	= new AvanceUnidadGobierno();
UnidadGobierno oUnidadGobierno = new UnidadGobierno();
String sPath = "../";

%>
<html>
<head>
	<title>Entrega - Recepción : % Avance por Dependencia, Organismo o Tribunal (Impresión)</title>
<script language="JavaScript" src="<%=sPath%>Scripts/Gobierno.js"></script>
<link rel="stylesheet" type="text/css" href="<%=sPath%>Styles/Gobierno.css">
<script language="JavaScript">
function closewin(){
				 window.close();
}
</script>
<SCRIPT LANGUAGE="javascript">
	var da = (document.all) ? 1 : 0;
	var pr = (window.print) ? 1 : 0;
	var mac = (navigator.userAgent.indexOf("Mac") != -1); 

	function Imprimir() {
	  if (pr){
		/* NS4, IE5 */
		window.print();
	  }else if (da && !mac){ 
		/* IE4 (Windows) */
	    window.print();/*vbPrintPage();*/
	  }else /* other browsers */
	    alert("Lo siento, su browser no permite esta accion.");
	}
	</SCRIPT>
</HEAD>
<body topmargin="2" leftmargin="2" onLoad="javascript:Imprimir();">
<table border="0" cellspacing="0" cellpadding="0" width="100%">
<!-- Encabezado -->
<tr>
<td><%@include file="HeaderAvance.jsp"%></td>
<tr>
<!-- Encabezado -->
<tr>
	<!-- Contenido -->
	<td valign="top">
<FORM action="fAvanceUnidadGobierno.jsp" name="forma" method="post" > 
	<input type="hidden" name="sCodigo" value="<%=sCodigo%>"> 
	<br>
	<br>
	<TABLE align=center border=0 cellPadding=0 cellSpacing=0 width="100%">
		<TR>
			<TD  colspan="2" class="TituloParrafo">PORCENTAJE DE AVANCE POR DEPENDENCIA, ORGANISMO PARAESTATAL O TRIBUNAL ADMINISTRATIVO</TD>
		</TR>
		<TR>
		<tr>
			<td colspan="2" height="15" align="right">Fecha: <b><%=(new java.text.SimpleDateFormat("dd/MM/yyyy hh:mm:ss")).format(new java.util.Date())%></b></td>
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
			<td class="TituloMenu" colspan="4">% Avance de Anexos que Aplican</TD>
		</TR>
		<TR>
			
			<td width="30" align="center"><b><font color="#000000">Vacio</font></b></td>
			<td width="40" align="center"><b><font color="#000000">En Proceso</font></b></td>
			<td width="45" align="center"><b><font color="#000000">Por Autorizar</font></b></td>
			<td width="45" align="center"><b><font color="#000000">Autorizado</font></b></td>
		</tr>
		<%		
			int intContador = 0;
			int variable = 0 ;
			String sBackColor = "";
			float acumvPorcVacio = 0;
			float acumvPorcEnProceso = 0;
			float acumvPorcPorAutorizar = 0;
			float acumvPorcAutorizado = 0;
			
			float AnexosVacios = 0;
			float AnexosEnProceso = 0;
			float AnexosPorAutorizar  = 0;
			float AnexosAutorizados = 0;
			
			float TotalAnexos = 0;

			java.text.DecimalFormat myFormatter = new java.text.DecimalFormat("###,##0");
		    variable = oAvanceUnidadGobierno.GetAll(java.lang.Integer.parseInt(iIdUnidadGobierno));
			
			int varNA = variable ;
			int varNAC=0;
			
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
			float vPorcVacio			= java.lang.Integer.parseInt(vEstatus1)!=0?(java.lang.Float.parseFloat(vEstatus1)/CT)*100:0;
			float vPorcEnProceso		= java.lang.Integer.parseInt(vEstatus2)!=0?(java.lang.Float.parseFloat(vEstatus2)/CT)*100:0;
			float vPorcPorAutorizar		= java.lang.Integer.parseInt(vEstatus3)!=0?(java.lang.Float.parseFloat(vEstatus3)/CT)*100:0;
			float vPorcAutorizado		= java.lang.Integer.parseInt(vEstatus4)!=0?(java.lang.Float.parseFloat(vEstatus4)/CT)*100:0;
			
			acumvPorcVacio =  vPorcVacio + acumvPorcVacio;
			acumvPorcEnProceso =  vPorcEnProceso + acumvPorcEnProceso;
			acumvPorcPorAutorizar =  vPorcPorAutorizar + acumvPorcPorAutorizar;
			acumvPorcAutorizado =  vPorcAutorizado + acumvPorcAutorizado;

			AnexosVacios = java.lang.Integer.parseInt(vEstatus1) + AnexosVacios;
			AnexosEnProceso = java.lang.Integer.parseInt(vEstatus2) + AnexosEnProceso;
			AnexosPorAutorizar = java.lang.Integer.parseInt(vEstatus3) + AnexosPorAutorizar;
			AnexosAutorizados = java.lang.Integer.parseInt(vEstatus4) + AnexosAutorizados;
			TotalAnexos = CT + TotalAnexos;
			
			if(vEstatus0.equals("46")){
				varNAC = varNAC+ 1;
			}
			
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
			<TD align="center">&nbsp;<%=myFormatter.format(vPorcVacio)%>%</TD>
			<TD align="center">&nbsp;<%=myFormatter.format(vPorcEnProceso)%>%</TD>
			<TD align="center">&nbsp;<%=myFormatter.format(vPorcPorAutorizar)%>%</TD>
			<TD align="center">&nbsp;<%=myFormatter.format(vPorcAutorizado)%>%</TD>
		</TR>
		<%}
		varNA=varNA-varNAC;
		float TotalAnexosVacios = (AnexosVacios/TotalAnexos)*100;
		float TotalAnexosEnProceso = (AnexosEnProceso/TotalAnexos)*100;
		float TotalAnexosPorAutorizar =(AnexosPorAutorizar/TotalAnexos)*100 ;
		float TotalAnexosAutorizados =(AnexosAutorizados/TotalAnexos)*100;
		
		if(variable == 0 ){%>
		<tr>
			<td colspan="5" align="right"><b>% Total</b></td>
			<TD align="center"><b>&nbsp;0%</b></TD>
			<TD align="center"><b>&nbsp;0%</b></TD>
			<TD align="center"><b>&nbsp;0%</b></TD>
			<TD align="center"><b>&nbsp;0%</b></TD>
		</tr>
		<%}else{%>
		<tr>
			<td colspan="5" align="right"><b>% Total</b></td>
			<TD align="center"><b>&nbsp;<%=myFormatter.format(TotalAnexosVacios)%>%</b></TD>
			<TD align="center"><b>&nbsp;<%=myFormatter.format(TotalAnexosEnProceso)%>%</b></TD>
			<TD align="center"><b>&nbsp;<%=myFormatter.format(TotalAnexosPorAutorizar)%>%</b></TD>
			<TD align="center"><b>&nbsp;<%=myFormatter.format(TotalAnexosAutorizados)%>%</b></TD>
		</tr>
		<%}%>
</TABLE>
</FORM>
</td>	<!-- Contenido -->
</tr>
</table>
</body>
</html>
