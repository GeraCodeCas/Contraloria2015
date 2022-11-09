<%/*********************************************************************************************************
Elaboro:	Claudia Sandoval
Lugar:		Monterrey, NL
Fecha:		29.Oct.2002
Compañia:	CONSISS*/%>
<%@page import="com.consiss.util.tools.*"%>
<%@page import="com.gob.*"%>
<%@page import="java.util.*" %>
<%

int iIdFuncionario =  java.lang.Integer.parseInt(
			(request.getParameter("iIdFuncionario")!= null?request.getParameter("iIdFuncionario"):"0") );

Anexo3V1	 oAnexo3V1	 	= new Anexo3V1();
Anexo3V2	 oAnexo3V2	 	= new Anexo3V2();
Anexo3V2I	 oAnexo3V2I	 	= new Anexo3V2I();
Anexo3V2II	 oAnexo3V2II	= new Anexo3V2II();
Anexo3V3	 oAnexo3V3	 	= new Anexo3V3();
Anexo3V4	 oAnexo3V4	 	= new Anexo3V4();
Anexo3V5	 oAnexo3V5	 	= new Anexo3V5();
Anexo3V6	 oAnexo3V6	 	= new Anexo3V6();
Anexo3V7	 oAnexo3V7	 	= new Anexo3V7();
String sAnexo = "III.5";
String sPath = "../";
int numpag =0;
int numtot = 0;
int iIdAnexo = 23;
AnexoEstatus	oAnexoEstatus		= new AnexoEstatus();
oAnexoEstatus.Get(iIdFuncionario, iIdAnexo);
String sEstatus = oAnexoEstatus.GetEstatus();
%>
<html>
<head>
	<title>Entrega - Recepción : Anexo III.5 (Impresión)</title>
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
	   print();
	  }else /* other browsers */
	    alert("Lo siento, su browser no permite esta accion.");
	}
	
	function print()
	{
	
	var WebBrowser = '<OBJECT ID="WebBrowser1"  WIDTH=0 HEIGHT=0 CLASSID="CLSID:8856F961-340A-11D0-A96B-00C04FD705A2"></OBJECT>';
	// insert object
	this.document.body.insertAdjacentHTML('afterBegin', WebBrowser); 
	this.focus();
	//if (confirm("Seguro que desea imprimir?"))
	//{
		printVB();
//	}
	WebBrowser1.outerHTML = '';
	//window.location.reload();
}
DelAll = 0;
</script>
<script language="VBScript">
sub printVB()
    const OLECMDID_PRINT = 7
	const OLECMDEXECOPT_DODEFAULT      =  0 
    const OLECMDEXECOPT_PROMPTUSER     =  1 
    const OLECMDEXECOPT_DONTPROMPTUSER =  2 
    const OLECMDEXECOPT_SHOWHELP       =  3  
	on error resume next
	WebBrowser1.ExecWB OLECMDID_PRINT, OLECMDEXECOPT_DONTPROMPTUSER,9,""
end sub
</script>
</HEAD>
<body topmargin="2" leftmargin="2" onLoad="javascript:Imprimir();">
<!-- Encabezado -->
<%@include file="HeaderAnexo.jsp"%>
<!-- Encabezado -->
<br>
<table border="0" cellspacing="0" cellpadding="0" width="100%">
<tr>
	<!-- Contenido -->
	<td valign="top">
	<TABLE cellPadding="0" cellSpacing="0" width="100%" BORDER="1" BORDERCOLOR="white">
	<!-- Etiqueta donde se aplican los encabezados de las tablas-->
	<TR><TD class="TituloParrafoImpr">RESUMEN DE INVENTARIOS</TD></TR>  
	</TABLE>
	<!-- Datos que se agregaran a la tabla  -->
<%if(!sEstatus.equals("0")){
	oAnexo3V1.GetResumen(iIdFuncionario);
	int iEscritorios	 = oAnexo3V1.GetResumen("1");
	int iSilleria		 = oAnexo3V1.GetResumen("2");
	int iArchiveros		 = oAnexo3V1.GetResumen("3");
	int iMaquinas		 = oAnexo3V1.GetResumen("4");
	int iFotocopiadoras	 = oAnexo3V1.GetResumen("5");
	int iFax			 = oAnexo3V1.GetResumen("6");
	int iOtros1			 = oAnexo3V1.GetResumen("7");
	
	oAnexo3V2.GetResumen(iIdFuncionario);
	int iMinicomputadoras	= oAnexo3V2.GetResumen("1");
	int iMicrocomputadoras	= oAnexo3V2.GetResumen("2");
	int iImpresoras			= oAnexo3V2.GetResumen("3");
	int iOtros2				= oAnexo3V2.GetResumen("4");
	
	int iSistemas			=	oAnexo3V2I.GetResumen(iIdFuncionario); 
	int iProgramas			=	oAnexo3V2II.GetResumen(iIdFuncionario); 
	
	oAnexo3V3.GetResumen(iIdFuncionario);
	int iMonitores		= oAnexo3V3.GetResumen("1");
	int iVideocaseteras	= oAnexo3V3.GetResumen("2");
	int iCamaras		= oAnexo3V3.GetResumen("3");
	int iProyectores	= oAnexo3V3.GetResumen("4");
	
	oAnexo3V4.GetResumen(iIdFuncionario);
	int iPickUp		= oAnexo3V4.GetResumen("1");
	int i5Pasajeros	= oAnexo3V4.GetResumen("2");
	int iAutobuses	= oAnexo3V4.GetResumen("3");
	int iAviones	= oAnexo3V4.GetResumen("4");
	int iPatrullas	= oAnexo3V4.GetResumen("5");
	int iAmbulancias= oAnexo3V4.GetResumen("6");
	int iCamiones	= oAnexo3V4.GetResumen("7");
	int iOtros3		= oAnexo3V4.GetResumen("8"); 
	
	int iArmamento	=	oAnexo3V5.GetResumen(iIdFuncionario); 
		
	oAnexo3V6.GetResumen(iIdFuncionario);
	int iCuadros		= oAnexo3V6.GetResumen("1");
	int iMurales		= oAnexo3V6.GetResumen("2");
	int iEsculturas		= oAnexo3V6.GetResumen("3");
	int iOtros4			= oAnexo3V6.GetResumen("4");
	
	oAnexo3V7.GetResumen(iIdFuncionario);
	int iLibros			= oAnexo3V7.GetResumen("1");
	int iPublicaciones	= oAnexo3V7.GetResumen("2");
	int iMaterial		= oAnexo3V7.GetResumen("3");
	int iOtros5			= oAnexo3V7.GetResumen("4");
	%>
	<TABLE cellPadding="0" cellSpacing="0" width="900" BORDER="1" bordercolor="Black">
	<!-- Etiqueta donde se aplican los encabezados de las tablas-->
		<TR align="middle">
			<td align="center"><b>Concepto</b></TD>
			<td align="center"><b>Total</b></TD>
			<td align="center"><b>Cantidades</b></TD>
			<td align="center"><b>Cantidades</b></TD>
			<td align="center"><b>Cantidades</b></TD>
			<td align="center"><b>Cantidades</b></TD>
		</TR>
		<TR align="middle">
			<td rowspan="2"><b>Mobiliario y Equipo de Oficina</b></TD>
			<td align="center" rowspan="2" valign="middle" class="ContenidoImpr"><%=
				iEscritorios+iSilleria+iArchiveros+iMaquinas+iFotocopiadoras+iFax+iOtros1 %></TD>
			<td align="center" valign="top"><b>escritorios</b><br><%=iEscritorios%></TD>
			<td align="center" valign="top"><b>sillería</b><br><%=iSilleria%></TD>
			<td align="center" valign="top"><b>archiveros</b><br><%=iArchiveros%></TD>
			<td align="center" rowspan="2" valign="middle"><b>otros</b><br><%=iOtros1%></TD>
		</TR>
		<TR align="middle">
			<td align="center" valign="top"><b>máquinas escribir</b><br><%=iMaquinas%></TD>
			<td align="center" valign="top"><b>fotocopiadoras</b><br><%=iFotocopiadoras%></TD>
			<td align="center" valign="top"><b>fax</b><br><%=iFax%></TD>
		</TR>
		<TR align="middle">
			<td><b>Equipo de Computo</b></TD>
			<td align="center"><%=
				iMinicomputadoras+iMicrocomputadoras+iImpresoras+iOtros2 %></TD>
			<td align="center" valign="top"><b>minicomputadoras</b><br><%=iMinicomputadoras%></TD>
			<td align="center" valign="top"><b>microcomputadoras</b><br><%=iMicrocomputadoras%></TD>
			<td align="center" valign="top"><b>impresoras</b><br><%=iImpresoras%></TD>
			<td align="center" valign="top"><b>otros</b><br><%=iOtros2%></TD>
		</TR>
		<TR align="middle">
			<td><b>Sistemas Desarrollados Internamente</b></TD>
			<td align="center"><%=iSistemas %></TD>
			<td align="center" valign="top" colspan="4"><br>&nbsp;</TD>
		</TR>
		<TR align="middle">
			<td><b>Programas Tipo Paquete</b></TD>
			<td align="center"><%=iProgramas%></TD>
			<td align="center" valign="top" colspan="4"><br>&nbsp;</TD>
		</TR>
		<TR align="middle">
			<td><b>Equipo de Video</b></TD>
			<td align="center" class="ContenidoImpr"><%=
				iMonitores+iVideocaseteras+iCamaras+iProyectores%></TD>
			<td align="center" valign="top"><b>monitores</b><br><%=iMonitores%></TD>
			<td align="center" valign="top"><b>videocaseteras</b><br><%=iVideocaseteras%></TD>
			<td align="center" valign="top"><b>cámaras</b><br><%=iCamaras%></TD>
			<td align="center" valign="top"><b>proyectores</b><br><%=iProyectores%></TD>
		</TR>
		<TR align="middle">
			<td rowspan="2"><b>Equipo de Transporte y Maquinaria</b></TD>
			<td align="center" rowspan="2"><%=
			iPickUp + i5Pasajeros + iAutobuses + iAviones + iPatrullas + iAmbulancias + iCamiones + iOtros3 %></TD>
			<td align="center" valign="top"><b>pick up</b><br><%=iPickUp%></TD>
			<td align="center" valign="top"><b>5 pasajeros</b><br><%=i5Pasajeros%></TD>
			<td align="center" valign="top"><b>autobuses</b><br><%=iAutobuses%></TD>
			<td align="center" valign="top"><b>aviones</b><br><%=iAviones%></TD>
		</TR>
		<TR align="middle">
			<td align="center" valign="top"><b>patrullas</b><br><%=iPatrullas%></TD>
			<td align="center" valign="top"><b>ambulancias</b><br><%=iAmbulancias%></TD>
			<td align="center" valign="top"><b>camiones 10 ton</b><br><%=iCamiones%></TD>
			<td align="center" valign="top"><b>otros</b><br><%=iOtros3%></TD>
		</TR>
		<TR align="middle">
			<td><b>Armamento</b></TD>
			<td align="center"><%=iArmamento%></TD>
			<td align="center" valign="top" colspan="4"><br>&nbsp;</TD>
		</TR>
		<TR align="middle">
			<td><b>Obras de Arte y Decoración</b></TD>
			<td align="center"><%=iCuadros + iMurales + iEsculturas + iOtros4 %></TD>
			<td align="center" valign="top"><b>cuadros</b><br><%=iCuadros %></TD>
			<td align="center" valign="top"><b>murales</b><br><%=iMurales %></TD>
			<td align="center" valign="top"><b>esculturas</b><br><%=iEsculturas %></TD>
			<td align="center" valign="top"><b>otros</b><br><%=iOtros4 %></TD>
		</TR>
		<TR align="middle">
			<td><b>Libros, Publicaciones y Material Bibliográfico e Informativo</b></TD>
			<td align="center"><%=iLibros + iPublicaciones + iMaterial + iOtros5 %></TD>
			<td align="center" valign="top"><b>libros</b><br><%=iLibros%></TD>
			<td align="center" valign="top"><b>publicaciones</b><br><%=iPublicaciones%></TD>
			<td align="center" valign="top"><b>material bibliográfico e informativo</b><br><%=iMaterial%></TD>
			<td align="center" valign="top"><b>otros</b><br><%=iOtros5 %></TD>
		</TR>
	</TABLE>
</td>
	<!-- Contenido -->
</tr>
</table>
<%@include file="FooterAnexo.jsp"%>
</body>
</html>
<%
} else {
%>
</table>
	<TABLE width="100%">
		<TR>
			<TD align="center"><H1 style="size=+2"><br>ESTE ANEXO NO APLICA</H1></TD>
		</TR>
	</TABLE>
</td>
</tr>
</table>
<br>
<%@include file="FooterAnexo.jsp"%>
</body>
</html>
<%}%>

