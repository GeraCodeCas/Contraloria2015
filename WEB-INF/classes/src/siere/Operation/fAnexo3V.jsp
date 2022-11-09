<%/*********************************************************************************************************
Elaboro:	Claudia Sandoval
Lugar:		Monterrey, NL
Fecha:		07.Nov.2002
Compañia:	CONSISS*/%>
<%@page import="com.consiss.util.tools.*"%>
<%@page import="com.gob.*"%>
<%@page import="java.util.*" %>
<%
//Valida la permanencia del usuario en session
if ((String)session.getValue("ok")!="Consiss")	response.sendRedirect("Error.html");
			
String	sOpcion = request.getParameter("sOpcion")!= null ? request.getParameter("sOpcion"): "";
String	sCodigo = request.getParameter("sCodigo")!= null ? request.getParameter("sCodigo"): "";

Anexo3V1	 oAnexo3V1	 	= new Anexo3V1();
Anexo3V2	 oAnexo3V2	 	= new Anexo3V2();
Anexo3V2I	 oAnexo3V2I	 	= new Anexo3V2I();
Anexo3V2II	 oAnexo3V2II	= new Anexo3V2II();
Anexo3V3	 oAnexo3V3	 	= new Anexo3V3();
Anexo3V4	 oAnexo3V4	 	= new Anexo3V4();
Anexo3V5	 oAnexo3V5	 	= new Anexo3V5();
Anexo3V6	 oAnexo3V6	 	= new Anexo3V6();
Anexo3V7	 oAnexo3V7	 	= new Anexo3V7();
int iIdAnexo = 23;
%>
<%@include file="fAnexoInicia.jsp"%>
<html>
<head>
	<title>Entrega - Recepción : Anexo III.5</title>
<link rel="stylesheet" type="text/css" href="<%=sPath%>Styles/Gobierno.css">
<script language="JavaScript" src="<%=sPath%>Scripts/Libreria.js"></script>
<script language="JavaScript" src="<%=sPath%>Scripts/Gobierno.js"></script>
<script language="JavaScript">
	function save(){
			document.forma.sOpcion.value = 'SAVE';
			document.forma.submit();
	}
</script>
</head>

<body topmargin="0" leftmargin="0" onfocus=fReload();>
<table border="0" cellspacing="0" cellpadding="0" width="100%">
<!-- Encabezado -->
<tr>
<td colspan="3"><%@include file="Header.jsp"%></td>
<tr>
<!-- Encabezado -->
<tr>
	<!-- Menu -->
	<td width="135" valign="top"><%@include file="Menu.jsp"%></td>
	<!-- Menu -->
	<td width="2px" valign="top" class="TextoOculto">.</td>
	<!-- Contenido -->
	<td valign="top" width="100%">
<FORM action="pAnexo3V.jsp" name="forma" method="post" >
	<input type="hidden" name="sOpcion" value="">
	<input type="hidden" name="sCodigo" value="<%=sCodigo%>"> 
	<TABLE align=center border=0 cellPadding=0 cellSpacing=0 width="100%">
		<TR>
			<TD colspan="3" class="TituloParrafo" width="100%">&nbsp;&nbsp;ANEXO III.5 - RESUMEN DE INVENTARIOS</TD>
		</TR>
		<TR>
			<TD width="70%" valign="middle">
			<%//AGREGADO POR VALIDACION ESTATUS
			if(!bSoloLectura) { %>
				Vacío: <input type="radio" name="sEstatus" value="1" <%=sEstatus.equals("1")?" checked":""%>>
				&nbsp;&nbsp;
				En Proceso: <input type="radio" name="sEstatus" value="2" <%=sEstatus.equals("2")?" checked":""%>>
				&nbsp;&nbsp;
				Lleno: <input type="radio" name="sEstatus" value="3" <%=sEstatus.equals("3")?" checked":""%>>
				<%if(iTipoUsuario == oUsuario.GetTipoFuncionario()) { %>
				Autorizado: <input type="radio" name="sEstatus" value="4" <%=sEstatus.equals("4")?" checked":""%>>
				<%}%>
			<%}	
		//AGREGADO POR MENSAJES SOLO LECTURA (5)
		if( !sMensageEstatus.equals("") ) {
			out.println("<font class='TituloEstatus'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;" + sMensageEstatus + "</font>" );
		}%>
			</TD>
			<TD align=right>
			<%//AGREGADO POR VALIDACION ESTATUS
			if(!bSoloLectura) { %>
			<a onmouseover="this.style.cursor='hand'" style="cursor:normal" onclick="Adjuntar('<%=iIdFuncionario%>','<%=iIdAnexo%>');"><img src="<%=sPath%>Images/Attach.jpg" ></a>&nbsp;&nbsp;
			<%}%>
			<a onmouseover="this.style.cursor='hand'" style="cursor:normal" onclick="imprimir('<%=iIdFuncionario%>', 'iAnexo3V.jsp');"><img src="<%=sPath%>Images/Impresora.jpg" ></a>&nbsp;&nbsp;
			<a onmouseover="this.style.cursor='hand'" style="cursor:normal" onclick="ayuda('../Help/aAnexo3V.htm');"><img src="<%=sPath%>Images/Ayuda.jpg" ></a>
			</td> 
			<TD align=right>
			<%//AGREGADO POR VALIDACION ESTATUS
			if(!bSoloLectura) {
				if(sOpcion.equals("SAVE")  || sOpcion.equals("NORMAL") || sOpcion.equals("") ) {%>
				<%
				} else {%>
				<INPUT class="boton" type="button" onclick="cancel();"	name="CANCEL"	value="Cancelar">&nbsp;
				<%}%>
				<INPUT class="boton" type="button" onclick="save();"	name="SAVE"		value="Grabar">&nbsp;
				<%}%>
			</TD>
		</TR>
<%		VMatrix vArchivoA;
		AnexoArchivo oArchivoA 	= new AnexoArchivo();
		vArchivoA = oArchivoA.GetAll(iIdAnexo, iIdFuncionario);
		String sSep = "";
		if(vArchivoA.getNumRows()>0){%>
		<TR>
			<TD><b>Archivos Adjuntos (Attachment):</b><% 
			for(int i=0;i<vArchivoA.getNumRows();i++){
				String	sAnexoArchivo = (((Vector)vArchivoA.getVMatrixAll().elementAt(0)).elementAt(i)+"").trim();
				String  sRuta 		= (((Vector)vArchivoA.getVMatrixAll().elementAt(3)).elementAt(i)+"").trim();
				String 	sArchivo 	= (((Vector)vArchivoA.getVMatrixAll().elementAt(4)).elementAt(i)+"").trim();
				String	sLink		= (((Vector)vArchivoA.getVMatrixAll().elementAt(5)).elementAt(i)+"").trim() + (((Vector)vArchivoA.getVMatrixAll().elementAt(4)).elementAt(i)+"").trim();
				%><%=sSep%><a target="new" onmouseover="this.style.cursor='hand'" style="cursor:normal" href="<%=sLink%>"><font color="Blue"><%=sArchivo%></font></a><%
				sSep = ", ";
			}%>
			</TD>
		</TR><% 
		}%>		
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
	<TABLE cellPadding="0" cellSpacing="0" width="100%" BORDER="1" BORDERCOLOR="white">
	<!-- Etiqueta donde se aplican los encabezados de las tablas-->
		<TR align="middle">
			<td class="TituloMenu" align="center">Concepto</TD>
			<td class="TituloMenu" align="center">Total</TD>
			<td class="TituloMenu" align="center">Cantidades</TD>
			<td class="TituloMenu" align="center">Cantidades</TD>
			<td class="TituloMenu" align="center">Cantidades</TD>
			<td class="TituloMenu" align="center">Cantidades</TD>
		</TR>
		<TR align="middle">
			<td class="TituloMenu" rowspan="2">Mobiliario y Equipo de Oficina</TD>
			<td align="center" rowspan="2" bgcolor="#eeeeee" valign="middle"><%=
				iEscritorios+iSilleria+iArchiveros+iMaquinas+iFotocopiadoras+iFax+iOtros1 %></TD>
			<td align="center" valign="top"><b>escritorios</b><br><%=iEscritorios%></TD>
			<td align="center" valign="top"><b>sillería</b><br><%=iSilleria%></TD>
			<td align="center" valign="top"><b>archiveros</b><br><%=iArchiveros%></TD>
			<td align="center" rowspan="2" valign="middle"><b>otros</b><br><%=iOtros1%></TD>
		</TR>
		<TR align="middle" bgcolor="#eeeeee">
			<td align="center" valign="top"><b>máquinas escribir</b><br><%=iMaquinas%></TD>
			<td align="center" valign="top"><b>fotocopiadoras</b><br><%=iFotocopiadoras%></TD>
			<td align="center" valign="top"><b>fax</b><br><%=iFax%></TD>
		</TR>
		<TR align="middle">
			<td class="TituloMenu">Equipo de Computo</TD>
			<td align="center"><%=
				iMinicomputadoras+iMicrocomputadoras+iImpresoras+iOtros2 %></TD>
			<td align="center" valign="top"><b>minicomputadoras</b><br><%=iMinicomputadoras%></TD>
			<td align="center" valign="top"><b>microcomputadoras</b><br><%=iMicrocomputadoras%></TD>
			<td align="center" valign="top"><b>impresoras</b><br><%=iImpresoras%></TD>
			<td align="center" valign="top"><b>otros</b><br><%=iOtros2%></TD>
		</TR>
		<TR align="middle">
			<td class="TituloMenu">Sistemas Desarrollados Internamente</TD>
			<td align="center" bgcolor="#eeeeee"><%=iSistemas %></TD>
			<td align="center" valign="top"><br>&nbsp;</TD>
			<td align="center" valign="top"><br>&nbsp;</TD>
			<td align="center" valign="top"><br>&nbsp;</TD>
			<td align="center" valign="top"><br>&nbsp;</TD>
		</TR>
		<TR align="middle">
			<td class="TituloMenu">Programas Tipo Paquete</TD>
			<td align="center"><%=iProgramas%></TD>
			<td align="center" valign="top"><br>&nbsp;</TD>
			<td align="center" valign="top"><br>&nbsp;</TD>
			<td align="center" valign="top"><br>&nbsp;</TD>
			<td align="center" valign="top"><br>&nbsp;</TD>
		</TR>
		<TR align="middle" bgcolor="#eeeeee">
			<td class="TituloMenu">Equipo de Video</TD>
			<td align="center"><%=
				iMonitores+iVideocaseteras+iCamaras+iProyectores%></TD>
			<td align="center" valign="top"><b>monitores</b><br><%=iMonitores%></TD>
			<td align="center" valign="top"><b>videocaseteras</b><br><%=iVideocaseteras%></TD>
			<td align="center" valign="top"><b>cámaras</b><br><%=iCamaras%></TD>
			<td align="center" valign="top"><b>proyectores</b><br><%=iProyectores%></TD>
		</TR>
		<TR align="middle">
			<td class="TituloMenu" rowspan="2">Equipo de Transporte y Maquinaria</TD>
			<td align="center" rowspan="2" bgcolor="#eeeeee"><%=
			iPickUp + i5Pasajeros + iAutobuses + iAviones + iPatrullas + iAmbulancias + iCamiones + iOtros3 %></TD>
			<td align="center" valign="top"><b>pick up</b><br><%=iPickUp%></TD>
			<td align="center" valign="top"><b>5 pasajeros</b><br><%=i5Pasajeros%></TD>
			<td align="center" valign="top"><b>autobuses</b><br><%=iAutobuses%></TD>
			<td align="center" valign="top"><b>aviones</b><br><%=iAviones%></TD>
		</TR>
		<TR align="middle" bgcolor="#eeeeee">
			<td align="center" valign="top"><b>patrullas</b><br><%=iPatrullas%></TD>
			<td align="center" valign="top"><b>ambulancias</b><br><%=iAmbulancias%></TD>
			<td align="center" valign="top"><b>camiones 10 ton</b><br><%=iCamiones%></TD>
			<td align="center" valign="top"><b>otros</b><br><%=iOtros3%></TD>
		</TR>
		<TR align="middle">
			<td class="TituloMenu">Armamento</TD>
			<td align="center"><%=iArmamento%></TD>
			<td align="center" valign="top"><br>&nbsp;</TD>
			<td align="center" valign="top"><br>&nbsp;</TD>
			<td align="center" valign="top"><br>&nbsp;</TD>
			<td align="center" valign="top"><br>&nbsp;</TD>
		</TR>
		<TR align="middle" bgcolor="#eeeeee">
			<td class="TituloMenu">Obras de Arte y Decoración</TD>
			<td align="center"><%=iCuadros + iMurales + iEsculturas + iOtros4 %></TD>
			<td align="center" valign="top"><b>cuadros</b><br><%=iCuadros%></TD>
			<td align="center" valign="top"><b>murales</b><br><%=iMurales%></TD>
			<td align="center" valign="top"><b>esculturas</b><br><%=iEsculturas%></TD>
			<td align="center" valign="top"><b>otros</b><br><%=iOtros4%></TD>
		</TR>
		<TR align="middle">
			<td class="TituloMenu">Libros, Publicaciones y Material Bibliográfico e Informativo</TD>
			<td align="center"><%=iLibros + iPublicaciones + iMaterial + iOtros5 %></TD>
			<td align="center" valign="top"><b>libros</b><br><%=iLibros%></TD>
			<td align="center" valign="top"><b>publicaciones</b><br><%=iPublicaciones%></TD>
			<td align="center" valign="top"><b>material bibliográfico e informativo</b><br><%=iMaterial%></TD>
			<td align="center" valign="top"><b>otros</b><br><%=iOtros5%></TD>
		</TR>
	</TABLE><%
} else { %>
	<TABLE width="100%">
		<TR>
			<TD align="center"><H1 style="size=+2"><br>ESTE ANEXO NO APLICA</H1></TD>
		</TR>
	</TABLE><%
}%>
</FORM>
</td>
	<!-- Contenido -->
</tr>
</table>
<%@include file="Footer.jsp"%>
</body>
</html>
