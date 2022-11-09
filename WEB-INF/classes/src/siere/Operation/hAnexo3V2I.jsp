<%
/*********************************************************************************************************
Nombre:		Anexo 3.5.2.1
Elaboro:	Jesus Manuel Limon Mireles
Lugar:		Monterrey, NL, Mexico
Fecha:		7.Ene.2003
Compañia:	CONSISS
*********************************************************************************************************/
%>
<%
if (oArchivo.AbreArchivo(sRutaHistoria,"fAnexo3V2I.html") && oArchivowa.AbreArchivo(sRutaAttach,"fAnexo3V2I.html")){
	sAnexo 					= "III.5.2.1";
	Anexo3V2I oAnexo3V2I 		= new Anexo3V2I();
	iIdAnexo 				= oAnexo3V2I.GetIdAnexo();
	oAnexoEstatus.Get(iIdFuncionario, iIdAnexo);
	sEstatus 				= oAnexoEstatus.GetEstatus();
	sAux = "\n				<tr><TD colspan='3' class='TituloParrafo' width='100%'>&nbsp;&nbsp;ANEXO III.5.2.1 - RELACIÓN DE SISTEMAS DESARROLLADOS INTERNAMENTE</TD></tr>";
%>
				<%@include file="HeaderAnexoHistorico.jsp"%>
<%
	sArchivo = "\n	<TABLE cellPadding='0' cellSpacing='0' width='100%' BORDER='1' BORDERCOLOR='white'>";
	sArchivo += "\n		<TR align='middle'>";
	sArchivo += "\n			<td class='TituloMenu' width='20%'>Sistema</TD>";
	sArchivo += "\n			<td class='TituloMenu' width='14%'>Programa<br>Fuente</TD>";
	sArchivo += "\n			<td class='TituloMenu' width='14%'>Tablas</TD>";
	sArchivo += "\n			<td class='TituloMenu' width='14%'>Manual<BR>Técnico</TD>";
	sArchivo += "\n			<td class='TituloMenu' width='14%'>Manual<BR>Operación</TD>";
	sArchivo += "\n			<td class='TituloMenu' width='24%'>Ubicación</TD>";
	sArchivo += "\n		</TR>";
	oArchivo.Escribe(sArchivo);
	oArchivowa.Escribe(sArchivo);

	if(!sEstatus.equals("0")){
		int intContador = 0;
		String sBackColor = "";
		oAnexo3V2I.GetAll(iIdFuncionario);
		for(int i=0;i<oAnexo3V2I.GetAll(iIdFuncionario);i++){
			String vIdRenglon 			= oAnexo3V2I.GetIdRenglon(i)!=-1?oAnexo3V2I.GetIdRenglon(i)+"":"0";
			intContador = intContador + 1;
			if (intContador%2 == 0){	sBackColor = "#ffffff";	}
			else{						sBackColor = "#eeeeee"; }
	sArchivo = "\n		<TR align='left' bgcolor='" + sBackColor + "' onMouseOver = 'MouseDentro(this);' onMouseOut  = " + c + "MouseFuera(this,'" + sBackColor + "');" + c + ">";
	sArchivo += "\n			<TD>&nbsp;<a onmouseover=" + c + "this.style.cursor='hand'" + c + " style='cursor:normal'>";
	sArchivo += oAnexo3V2I.GetSistema(i)!=null?oAnexo3V2I.GetSistema(i) + "</a></TD>":"</a></TD>";
	sArchivo += "\n			<TD>&nbsp;<a onmouseover=" + c + "this.style.cursor='hand'" + c + " style='cursor:normal'>";
	sArchivo += oAnexo3V2I.GetPrograma(i)!=null?oAnexo3V2I.GetPrograma(i) + "</a></TD>":"</a></TD>";
	sArchivo += "\n			<TD>&nbsp;<a onmouseover=" + c + "this.style.cursor='hand'" + c + " style='cursor:normal'>";
	sArchivo += oAnexo3V2I.GetTablas(i)!=null?oAnexo3V2I.GetTablas(i) + "</a></TD>":"</a></TD>";
	sArchivo += "\n			<TD align='center'>&nbsp;<a onmouseover=" + c + "this.style.cursor='hand'" + c + " style='cursor:normal'>";
	sArchivo += oAnexo3V2I.GetManualTecnico(i).equals("1")?"Sí</a></TD>":"No</a></TD>";
	sArchivo += "\n			<TD align='center'>&nbsp;<a onmouseover=" + c + "this.style.cursor='hand'" + c + " style='cursor:normal'>";
	sArchivo += oAnexo3V2I.GetManualOperacion(i).equals("1")?"Sí</a></TD>":"No</a></TD>";
	sArchivo += "\n			<TD>&nbsp;<a onmouseover=" + c + "this.style.cursor='hand'" + c + " style='cursor:normal'>";
	sArchivo += oAnexo3V2I.GetUbicacion(i)!=null ? oAnexo3V2I.GetUbicacion(i) + "</a></TD>":"</a></TD>";
	sArchivo += "\n		</TR>";
	oArchivo.Escribe(sArchivo);
	oArchivowa.Escribe(sArchivo);
		}
	sArchivo = "\n	</TABLE>";
	oArchivo.Escribe(sArchivo);
	oArchivowa.Escribe(sArchivo);
	} else {
	sArchivo = "\n	</TABLE>";
	sArchivo += "\n	<TABLE width='100%'>";
	sArchivo += "\n		<TR><TD align='center'><H1 style='size=+2'><br>ESTE ANEXO NO APLICA</H1></TD></TR>";
	sArchivo += "\n	</TABLE>";
	oArchivo.Escribe(sArchivo);
	oArchivowa.Escribe(sArchivo);
	}
	sArchivo = "\n</td>";
	sArchivo += "\n</tr>";
	sArchivo += "\n</table>";
	sArchivo += "\n</body>";
	sArchivo += "\n</html>";
	oArchivo.Escribe(sArchivo);
	oArchivowa.Escribe(sArchivo);
	oArchivo.CierraArchivo();
	oArchivowa.CierraArchivo();
}else{
	out.println("Error");
}
%>

