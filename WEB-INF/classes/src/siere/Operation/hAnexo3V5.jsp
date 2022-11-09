<%
/*********************************************************************************************************
Nombre:		Anexo 3.5.5
Elaboro:	Jesus Manuel Limon Mireles
Lugar:		Monterrey, NL, Mexico
Fecha:		7.Ene.2003
Compañia:	CONSISS
*********************************************************************************************************/
%>
<%
if (oArchivo.AbreArchivo(sRutaHistoria,"fAnexo3V5.html") && oArchivowa.AbreArchivo(sRutaAttach,"fAnexo3V5.html")){
	sAnexo 					= "III.5.5";
	Anexo3V5 oAnexo3V5 		= new Anexo3V5();
	iIdAnexo 				= oAnexo3V5.GetIdAnexo();
	oAnexoEstatus.Get(iIdFuncionario, iIdAnexo);
	sEstatus 				= oAnexoEstatus.GetEstatus();
	sAux = "\n				<tr><TD colspan='3' class='TituloParrafo' width='100%'>&nbsp;&nbsp;ANEXO III.5.5 - RELACIÓN DE ARMAMENTO</TD></tr>";
%>
				<%@include file="HeaderAnexoHistorico.jsp"%>
<%
	sArchivo = "\n	<TABLE cellPadding='0' cellSpacing='0' width='100%' BORDER='1' BORDERCOLOR='white'>";
	sArchivo += "\n		<TR align='middle'>";
	sArchivo += "\n			<td class='TituloMenu' rowspan='2'>Clave<br>Inventario</TD>";
	sArchivo += "\n			<td class='TituloMenu' rowspan='2'>Calibre</TD>";
	sArchivo += "\n			<td class='TituloMenu' rowspan='2'>Matrícula</TD>";
	sArchivo += "\n			<td class='TituloMenu' colspan='2'>Servidor Público Resguardante</TD>";
	sArchivo += "\n		</TR>";
	sArchivo += "\n		<TR>";
	sArchivo += "\n			<td class='TituloMenu' align='center'>Nombre</TD>";
	sArchivo += "\n			<td class='TituloMenu' align='center'>Cargo</TD>";
	sArchivo += "\n		</TR>";
	oArchivo.Escribe(sArchivo);
	oArchivowa.Escribe(sArchivo);
	if(!sEstatus.equals("0")){
		int intContador = 0;
		String sBackColor = "";
		oAnexo3V5.GetAll(iIdFuncionario);
		for(int i=0;i<oAnexo3V5.GetAll(iIdFuncionario);i++){
			String vIdRenglon 			= oAnexo3V5.GetIdRenglon(i)!=-1?oAnexo3V5.GetIdRenglon(i)+"":"0";
			intContador = intContador + 1;
			if (intContador%2 == 0){	sBackColor = "#ffffff";	}
			else{						sBackColor = "#eeeeee"; }
	sArchivo = "\n		<TR align='left' bgcolor='" + sBackColor + "' onMouseOver = 'MouseDentro(this);' onMouseOut  = " + c + "MouseFuera(this,'" + sBackColor + "');" + c + ">";
	sArchivo += "\n			<TD>&nbsp;<a onmouseover=" + c + "this.style.cursor='hand'" + c + " style='cursor:normal'>";
	sArchivo += oAnexo3V5.GetClave(i)!=null? oAnexo3V5.GetClave(i) + "</a></TD>":"</a></TD>";
	sArchivo += "\n			<TD>&nbsp;<a onmouseover=" + c + "this.style.cursor='hand'" + c + " style='cursor:normal'>";
	sArchivo += oAnexo3V5.GetCalibre(i)!=null? oAnexo3V5.GetCalibre(i) + "</a></TD>":"</a></TD>";
	sArchivo += "\n			<TD>&nbsp;<a onmouseover=" + c + "this.style.cursor='hand'" + c + " style='cursor:normal'>";
	sArchivo += oAnexo3V5.GetMatricula(i)!=null? oAnexo3V5.GetMatricula(i) + "</a></TD>":"</a></TD>";
	sArchivo += "\n			<TD>&nbsp;<a onmouseover=" + c + "this.style.cursor='hand'" + c + " style='cursor:normal'>";
	sArchivo += oAnexo3V5.GetNombre(i)!=null? oAnexo3V5.GetNombre(i) + "</a></TD>":"</a></TD>";
	sArchivo += "\n			<TD>&nbsp;<a onmouseover=" + c + "this.style.cursor='hand'" + c + " style='cursor:normal'>";
	sArchivo += oAnexo3V5.GetCargo(i)!=null? oAnexo3V5.GetCargo(i) + "</a></TD>":"</a></TD>";
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
