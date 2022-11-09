<%
/*********************************************************************************************************
Nombre:		Anexo 3.5
Elaboro:	Jesus Manuel Limon Mireles
Lugar:		Monterrey, NL, Mexico
Fecha:		7.Ene.2003
Compañia:	CONSISS
*********************************************************************************************************/
%>
<%
if (oArchivo.AbreArchivo(sRutaHistoria,"fAnexo3V.html") && oArchivowa.AbreArchivo(sRutaAttach,"fAnexo3V.html")){
	sAnexo 					= "III.5";
	Anexo3V1	 oAnexo3V1	 	= new Anexo3V1();
	Anexo3V2	 oAnexo3V2	 	= new Anexo3V2();
	Anexo3V2I	 oAnexo3V2I	 	= new Anexo3V2I();
	Anexo3V2II	 oAnexo3V2II	= new Anexo3V2II();
	Anexo3V3	 oAnexo3V3	 	= new Anexo3V3();
	Anexo3V4	 oAnexo3V4	 	= new Anexo3V4();
	Anexo3V5	 oAnexo3V5	 	= new Anexo3V5();
	Anexo3V6	 oAnexo3V6	 	= new Anexo3V6();
	Anexo3V7	 oAnexo3V7	 	= new Anexo3V7();
	iIdAnexo 				= 23;
	oAnexoEstatus.Get(iIdFuncionario, iIdAnexo);
	sEstatus 				= oAnexoEstatus.GetEstatus();
	sAux = "<tr><TD colspan='3' class='TituloParrafo' width='100%'>&nbsp;&nbsp;ANEXO III.5 - RESUMEN DE INVENTARIOS</TD></tr>" + sSalto;
%>
				<%@include file="HeaderAnexoHistorico.jsp"%>
<%
if(!sEstatus.equals("0")){ 
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
	
	sArchivo = "	<TABLE cellPadding='0' cellSpacing='0' width='100%' BORDER='1' BORDERCOLOR='white'>" + sSalto;
	sArchivo += "		<TR align='middle'>" + sSalto;
	sArchivo += "			<td class='TituloMenu' align='center'>Concepto</TD>" + sSalto;
	sArchivo += "			<td class='TituloMenu' align='center'>Total</TD>" + sSalto;
	sArchivo += "			<td class='TituloMenu' align='center'>Cantidades</TD>" + sSalto;
	sArchivo += "			<td class='TituloMenu' align='center'>Cantidades</TD>" + sSalto;
	sArchivo += "			<td class='TituloMenu' align='center'>Cantidades</TD>" + sSalto;
	sArchivo += "			<td class='TituloMenu' align='center'>Cantidades</TD>" + sSalto;
	sArchivo += "		</TR>" + sSalto;
	sArchivo += "		<TR align='middle'>" + sSalto;
	sArchivo += "			<td class='TituloMenu' rowspan='2'>Mobiliario y Equipo de Oficina</TD>" + sSalto;
	sArchivo += "			<td align='center' rowspan='2' bgcolor='#eeeeee' valign='middle'>" + (iEscritorios+iSilleria+iArchiveros+iMaquinas+iFotocopiadoras+iFax+iOtros1)  + "</TD>" + sSalto;
	sArchivo += "			<td align='center' valign='top'><b>escritorios</b><br>" + iEscritorios + "</TD>" + sSalto;
	sArchivo += "			<td align='center' valign='top'><b>sillería</b><br>" + iSilleria + "</TD>" + sSalto;
	sArchivo += "			<td align='center' valign='top'><b>archiveros</b><br>" + iArchiveros + "</TD>" + sSalto;
	sArchivo += "			<td align='center' rowspan='2' valign='middle'><b>otros</b><br>" + iOtros1 + "</TD>" + sSalto;
	sArchivo += "		</TR>" + sSalto;
	oArchivo.Escribe(sArchivo);
	oArchivowa.Escribe(sArchivo);
	sArchivo = "		<TR align='middle' bgcolor='#eeeeee'>" + sSalto;
	sArchivo += "			<td align='center' valign='top'><b>máquinas escribir</b><br>" + iMaquinas + "</TD>" + sSalto;
	sArchivo += "			<td align='center' valign='top'><b>fotocopiadoras</b><br>" + iFotocopiadoras + "</TD>" + sSalto;
	sArchivo += "			<td align='center' valign='top'><b>fax</b><br>" + iFax + "</TD>" + sSalto;
	sArchivo += "		</TR>" + sSalto;
	oArchivo.Escribe(sArchivo);
	oArchivowa.Escribe(sArchivo);
	sArchivo = "		<TR align='middle'>" + sSalto;
	sArchivo += "			<td class='TituloMenu'>Equipo de Computo</TD>" + sSalto;
	sArchivo += "			<td align='center'>" + (iMinicomputadoras+iMicrocomputadoras+iImpresoras+iOtros2)  + "</TD>" + sSalto;
	sArchivo += "			<td align='center' valign='top'><b>minicomputadoras</b><br>" + iMinicomputadoras + "</TD>" + sSalto;
	sArchivo += "			<td align='center' valign='top'><b>microcomputadoras</b><br>" + iMicrocomputadoras + "</TD>" + sSalto;
	sArchivo += "			<td align='center' valign='top'><b>impresoras</b><br>" + iImpresoras + "</TD>" + sSalto;
	sArchivo += "			<td align='center' valign='top'><b>otros</b><br>" + iOtros2 + "</TD>" + sSalto;
	sArchivo += "		</TR>" + sSalto;
	oArchivo.Escribe(sArchivo);
	oArchivowa.Escribe(sArchivo);
	sArchivo = "		<TR align='middle'>" + sSalto;
	sArchivo += "			<td class='TituloMenu'>Sistemas Desarrollados Internamente</TD>" + sSalto;
	sArchivo += "			<td align='center' bgcolor='#eeeeee'>" + iSistemas  + "</TD>" + sSalto;
	sArchivo += "			<td align='center' valign='top'><br>&nbsp;</TD>" + sSalto;
	sArchivo += "			<td align='center' valign='top'><br>&nbsp;</TD>" + sSalto;
	sArchivo += "			<td align='center' valign='top'><br>&nbsp;</TD>" + sSalto;
	sArchivo += "			<td align='center' valign='top'><br>&nbsp;</TD>" + sSalto;
	sArchivo += "		</TR>" + sSalto;
	oArchivo.Escribe(sArchivo);
	oArchivowa.Escribe(sArchivo);
	sArchivo = "		<TR align='middle'>" + sSalto;
	sArchivo += "			<td class='TituloMenu'>Programas Tipo Paquete</TD>" + sSalto;
	sArchivo += "			<td align='center'>" + iProgramas + "</TD>" + sSalto;
	sArchivo += "			<td align='center' valign='top'><br>&nbsp;</TD>" + sSalto;
	sArchivo += "			<td align='center' valign='top'><br>&nbsp;</TD>" + sSalto;
	sArchivo += "			<td align='center' valign='top'><br>&nbsp;</TD>" + sSalto;
	sArchivo += "			<td align='center' valign='top'><br>&nbsp;</TD>" + sSalto;
	sArchivo += "		</TR>" + sSalto;
	oArchivo.Escribe(sArchivo);
	oArchivowa.Escribe(sArchivo);
	sArchivo = "		<TR align='middle' bgcolor='#eeeeee'>" + sSalto;
	sArchivo += "			<td class='TituloMenu'>Equipo de Video</TD>" + sSalto;
	sArchivo += "			<td align='center'>" + (iMonitores+iVideocaseteras+iCamaras+iProyectores) + "</TD>" + sSalto;
	sArchivo += "			<td align='center' valign='top'><b>monitores</b><br>" + iMonitores + "</TD>" + sSalto;
	sArchivo += "			<td align='center' valign='top'><b>videocaseteras</b><br>" + iVideocaseteras + "</TD>" + sSalto;
	sArchivo += "			<td align='center' valign='top'><b>cámaras</b><br>" + iCamaras + "</TD>" + sSalto;
	sArchivo += "			<td align='center' valign='top'><b>proyectores</b><br>" + iProyectores + "</TD>" + sSalto;
	sArchivo += "		</TR>" + sSalto;
	oArchivo.Escribe(sArchivo);
	oArchivowa.Escribe(sArchivo);
	sArchivo = "		<TR align='middle'>" + sSalto;
	sArchivo += "			<td class='TituloMenu' rowspan='2'>Equipo de Transporte y Maquinaria</TD>" + sSalto;
	sArchivo += "			<td align='center' rowspan='2' bgcolor='#eeeeee'>" + (iPickUp + i5Pasajeros + iAutobuses + iAviones + iPatrullas + iAmbulancias + iCamiones + iOtros3)  + "</TD>" + sSalto;
	sArchivo += "			<td align='center' valign='top'><b>pick up</b><br>" + iPickUp + "</TD>" + sSalto;
	sArchivo += "			<td align='center' valign='top'><b>5 pasajeros</b><br>" + i5Pasajeros + "</TD>" + sSalto;
	sArchivo += "			<td align='center' valign='top'><b>autobuses</b><br>" + iAutobuses + "</TD>" + sSalto;
	sArchivo += "			<td align='center' valign='top'><b>aviones</b><br>" + iAviones + "</TD>" + sSalto;
	sArchivo += "		</TR>" + sSalto;
	oArchivo.Escribe(sArchivo);
	oArchivowa.Escribe(sArchivo);
	sArchivo = "		<TR align='middle' bgcolor='#eeeeee'>" + sSalto;
	sArchivo += "			<td align='center' valign='top'><b>patrullas</b><br>" + iPatrullas + "</TD>" + sSalto;
	sArchivo += "			<td align='center' valign='top'><b>ambulancias</b><br>" + iAmbulancias + "</TD>" + sSalto;
	sArchivo += "			<td align='center' valign='top'><b>camiones 10 ton</b><br>" + iCamiones + "</TD>" + sSalto;
	sArchivo += "			<td align='center' valign='top'><b>otros</b><br>" + iOtros3 + "</TD>" + sSalto;
	sArchivo += "		</TR>" + sSalto;
	oArchivo.Escribe(sArchivo);
	oArchivowa.Escribe(sArchivo);
	sArchivo = "		<TR align='middle'>" + sSalto;
	sArchivo += "			<td class='TituloMenu'>Armamento</TD>" + sSalto;
	sArchivo += "			<td align='center'>" + iArmamento + "</TD>" + sSalto;
	sArchivo += "			<td align='center' valign='top'><br>&nbsp;</TD>" + sSalto;
	sArchivo += "			<td align='center' valign='top'><br>&nbsp;</TD>" + sSalto;
	sArchivo += "			<td align='center' valign='top'><br>&nbsp;</TD>" + sSalto;
	sArchivo += "			<td align='center' valign='top'><br>&nbsp;</TD>" + sSalto;
	sArchivo += "		</TR>" + sSalto;
	oArchivo.Escribe(sArchivo);
	oArchivowa.Escribe(sArchivo);
	sArchivo = "		<TR align='middle' bgcolor='#eeeeee'>" + sSalto;
	sArchivo += "			<td class='TituloMenu'>Obras de Arte y Decoración</TD>" + sSalto;
	sArchivo += "			<td align='center'>" + (iCuadros + iMurales + iEsculturas + iOtros4)  + "</TD>" + sSalto;
	sArchivo += "			<td align='center' valign='top'><b>cuadros</b><br>" + iCuadros + "</TD>" + sSalto;
	sArchivo += "			<td align='center' valign='top'><b>murales</b><br>" + iMurales + "</TD>" + sSalto;
	sArchivo += "			<td align='center' valign='top'><b>esculturas</b><br>" + iEsculturas + "</TD>" + sSalto;
	sArchivo += "			<td align='center' valign='top'><b>otros</b><br>" + iOtros4 + "</TD>" + sSalto;
	sArchivo += "		</TR>" + sSalto;
	oArchivo.Escribe(sArchivo);
	oArchivowa.Escribe(sArchivo);
	sArchivo = "		<TR align='middle'>" + sSalto;
	sArchivo += "			<td class='TituloMenu'>Libros, Publicaciones y Material Bibliográfico e Informativo</TD>" + sSalto;
	sArchivo += "			<td align='center'>" + (iLibros + iPublicaciones + iMaterial + iOtros5)  + "</TD>" + sSalto;
	sArchivo += "			<td align='center' valign='top'><b>libros</b><br>" + iLibros + "</TD>" + sSalto;
	sArchivo += "			<td align='center' valign='top'><b>publicaciones</b><br>" + iPublicaciones + "</TD>" + sSalto;
	sArchivo += "			<td align='center' valign='top'><b>material bibliográfico e informativo</b><br>" + iMaterial + "</TD>" + sSalto;
	sArchivo += "			<td align='center' valign='top'><b>otros</b><br>" + iOtros5 + "</TD>" + sSalto;
	sArchivo += "		</TR>" + sSalto;
	sArchivo += "	</TABLE>" + sSalto;
	oArchivo.Escribe(sArchivo);
	oArchivowa.Escribe(sArchivo);
	sArchivo = "";
} else {
	sArchivo += "<TABLE width='100%'>" + sSalto;
	sArchivo += "	<TR><TD align='center'><H1 style='size=+2'><br>ESTE ANEXO NO APLICA</H1></TD></TR>" + sSalto;
	sArchivo += "</TABLE>" + sSalto;
	oArchivo.Escribe(sArchivo);
	oArchivowa.Escribe(sArchivo);
	sArchivo = "";
}
	sArchivo = "</td>" + sSalto;
	sArchivo += "</tr>" + sSalto;
	sArchivo += "</table>" + sSalto;
	sArchivo += "</body>" + sSalto;
	sArchivo += "</html>" + sSalto;
	oArchivo.Escribe(sArchivo);
	oArchivowa.Escribe(sArchivo);
	oArchivo.CierraArchivo();
	oArchivowa.CierraArchivo();
}else{
	out.println("Error");
}
%>
