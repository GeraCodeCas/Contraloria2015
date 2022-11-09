<%
/*********************************************************************************************************
Nombre:		Anexo 3.5.2.2
Elaboro:	Jesus Manuel Limon Mireles
Lugar:		Monterrey, NL, Mexico
Fecha:		7.Ene.2003
Compañia:	CONSISS
*********************************************************************************************************/
%>
<%
if (oArchivo.AbreArchivo(sRutaHistoria,"fAnexo3V2II.html") && oArchivowa.AbreArchivo(sRutaAttach,"fAnexo3V2II.html")){
	sAnexo 					= "III.5.2.2";
	Anexo3V2II oAnexo3V2II 	= new Anexo3V2II();
	iIdAnexo 				= oAnexo3V2II.GetIdAnexo();
	oAnexoEstatus.Get(iIdFuncionario, iIdAnexo);
	sEstatus 				= oAnexoEstatus.GetEstatus();
	sAux = "\n				<tr><TD colspan='3' class='TituloParrafo' width='100%'>&nbsp;&nbsp;ANEXO III.5.2.2 - RELACIÓN DE PROGRAMAS TIPO PAQUETE</TD></tr>";
%>
				<%@include file="HeaderAnexoHistorico.jsp"%>
<%
	sArchivo = "\n	<TABLE cellPadding='0' cellSpacing='0' width='100%' BORDER='1' BORDERCOLOR='white'>";
	sArchivo += "\n		<TR align='middle'>";
	sArchivo += "\n			<td class='TituloMenu' >Software</TD>";
	sArchivo += "\n			<td class='TituloMenu' >Marca</TD>";
	sArchivo += "\n			<td class='TituloMenu' >Versión</TD>";
	sArchivo += "\n			<td class='TituloMenu' >Licencia</TD>";
	sArchivo += "\n			<td class='TituloMenu' >Discos</TD>";
	sArchivo += "\n			<td class='TituloMenu' >Manuales</TD>";
	sArchivo += "\n		</TR>";
	oArchivo.Escribe(sArchivo);
	oArchivowa.Escribe(sArchivo);
	if(!sEstatus.equals("0")){ // DETALLE DE ANEXO	
		int intContador = 0;
		String sBackColor = "";
		oAnexo3V2II.GetAll(iIdFuncionario);
		
		for(int i=0;i<oAnexo3V2II.GetAll(iIdFuncionario);i++){
			String vIdRenglon 			= oAnexo3V2II.GetIdRenglon(i)!=-1?oAnexo3V2II.GetIdRenglon(i)+"":"0";
			intContador = intContador + 1;
			if (intContador%2 == 0){	sBackColor = "#ffffff";	}
			else{						sBackColor = "#eeeeee"; }
	sArchivo = "\n		<TR align='left' bgcolor='" + sBackColor + "' onMouseOver = 'MouseDentro(this);' onMouseOut  = " + c + "MouseFuera(this,'" + sBackColor + "');" + c + "> ";
	sArchivo += "\n			<TD>&nbsp;<a onmouseover=" + c + "this.style.cursor='hand'" + c + " style='cursor:normal'> ";
	sArchivo += oAnexo3V2II.GetSoftware(i)!=null?oAnexo3V2II.GetSoftware(i) + "</a></TD>":"</a></TD> ";
	sArchivo += "\n			<TD>&nbsp;<a onmouseover=" + c + "this.style.cursor='hand'" + c + " style='cursor:normal'> ";
	sArchivo += oAnexo3V2II.GetMarca(i)!=null?oAnexo3V2II.GetMarca(i) + "</a></TD>":"</a></TD> ";
	sArchivo += "\n			<TD>&nbsp;<a onmouseover=" + c + "this.style.cursor='hand'" + c + " style='cursor:normal'> ";
	sArchivo += oAnexo3V2II.GetVersion(i)!=null?oAnexo3V2II.GetVersion(i) + "</a></TD>":"</a></TD> ";
	sArchivo += "\n			<TD>&nbsp;<a onmouseover=" + c + "this.style.cursor='hand'" + c + " style='cursor:normal'> ";
	sArchivo += oAnexo3V2II.GetLicencia(i)!=null?oAnexo3V2II.GetLicencia(i) + "</a></TD>":"</a></TD> ";
	sArchivo += "\n			<TD align='right'>&nbsp;<a onmouseover=" + c + "this.style.cursor='hand'" + c + " style='cursor:normal'> ";
	sArchivo += oAnexo3V2II.GetDiscos(i)!=null?oAnexo3V2II.GetDiscos(i) + "</a></TD>":"</a></TD> ";
	sArchivo += "\n			<TD align='right'>&nbsp;<a onmouseover=" + c + "this.style.cursor='hand'" + c + " style='cursor:normal'> "; 
	sArchivo += oAnexo3V2II.GetManuales(i)!=null?oAnexo3V2II.GetManuales(i) + "</a></TD>":"</a></TD>";
	sArchivo += "\n		</TR> ";
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

