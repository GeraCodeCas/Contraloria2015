<%
/*********************************************************************************************************
Nombre:		Anexo 3.5.7
Elaboro:	Jesus Manuel Limon Mireles
Lugar:		Monterrey, NL, Mexico
Fecha:		7.Ene.2003
Compañia:	CONSISS
*********************************************************************************************************/
%>
<%
if (oArchivo.AbreArchivo(sRutaHistoria,"fAnexo3V7.html") && oArchivowa.AbreArchivo(sRutaAttach,"fAnexo3V7.html")){
	sAnexo 					= "III.5.7";
	Anexo3V7 oAnexo3V7 		= new Anexo3V7();
	iIdAnexo 				= oAnexo3V7.GetIdAnexo();
	oAnexoEstatus.Get(iIdFuncionario, iIdAnexo);
	sEstatus 				= oAnexoEstatus.GetEstatus();
	sAux = "\n				<tr><TD colspan='3' class='TituloParrafo' width='100%'>&nbsp;&nbsp;ANEXO III.5.7 - RELACIÓN DE LIBROS, PUBLICACIONES, MATERIAL BIBLIOGRÁFICO E INFORMATIVO</TD></tr>";
%>
				<%@include file="HeaderAnexoHistorico.jsp"%>
<%
	sArchivo = "\n	<TABLE cellPadding='0' cellSpacing='0' width='100%' BORDER='1' BORDERCOLOR='white'>";
	sArchivo += "\n		<TR align='center'>";
	sArchivo += "\n			<td class='TituloMenu' rowspan='2'>Título</TD>";
	sArchivo += "\n			<td class='TituloMenu' rowspan='2'>Fecha de<BR>Edición o<BR>Elaboración</TD>";
	sArchivo += "\n			<td class='TituloMenu' rowspan='2'>Autor(es) y Editorial<BR>(Responsable de Elabo-<BR>ración o Publicación)</TD>";
	sArchivo += "\n			<td class='TituloMenu' colspan='2'>Responsable de la Custodia</TD>";
	sArchivo += "\n			<td class='TituloMenu' rowspan='2'>Tipo</TD>";
	sArchivo += "\n		</TR>";
	sArchivo += "\n		<TR align='center'>";
	sArchivo += "\n			<td class='TituloMenu'>Nombre</td>";
	sArchivo += "\n			<td class='TituloMenu'>Departamento</td>";
	sArchivo += "\n		</TR>";
	oArchivo.Escribe(sArchivo);
	oArchivowa.Escribe(sArchivo);
	if(!sEstatus.equals("0")){
		int intContador = 0;
		String sBackColor = "";
		oAnexo3V7.GetAll(iIdFuncionario);
		for(int i=0;i<oAnexo3V7.GetAll(iIdFuncionario);i++){
			String vIdRenglon 			= oAnexo3V7.GetIdRenglon(i)!=-1?oAnexo3V7.GetIdRenglon(i)+"":"0";
			intContador = intContador + 1;
			if (intContador%2 == 0){	sBackColor = "#ffffff";	}
			else{						sBackColor = "#eeeeee"; }
	sArchivo = "\n		<TR align='left' bgcolor='" + sBackColor + "' onMouseOver = 'MouseDentro(this);' onMouseOut  = " + c + "MouseFuera(this,'" + sBackColor + "');" + c + ">";
	sArchivo += "\n			<TD>&nbsp;<a onmouseover=" + c + "this.style.cursor='hand'" + c + " style='cursor:normal'>";
	sArchivo += oAnexo3V7.GetTitulo(i)!=null?oAnexo3V7.GetTitulo(i) + "</a></TD>":"</a></TD>";
	sArchivo += "\n			<TD>&nbsp;<a onmouseover=" + c + "this.style.cursor='hand'" + c + " style='cursor:normal'>";
	sArchivo += oAnexo3V7.GetFecha(i)!=null?oAnexo3V7.GetFecha(i) + "</a></TD>":"</a></TD>";
	sArchivo += "\n			<TD>&nbsp;<a onmouseover=" + c + "this.style.cursor='hand'" + c + " style='cursor:normal'>";
	sArchivo += oAnexo3V7.GetAutores(i)!=null?oAnexo3V7.GetAutores(i) + "</a></TD>":"</a></TD>";
	sArchivo += "\n			<TD>&nbsp;<a onmouseover=" + c + "this.style.cursor='hand'" + c + " style='cursor:normal'>";
	sArchivo += oAnexo3V7.GetNombre(i)!=null?oAnexo3V7.GetNombre(i) + "</a></TD>":"</a></TD>";
	sArchivo += "\n			<TD>&nbsp;<a onmouseover=" + c + "this.style.cursor='hand'" + c + " style='cursor:normal'>";
	sArchivo += oAnexo3V7.GetDepartamento(i)!=null?oAnexo3V7.GetDepartamento(i) + "</a></TD>":"</a></TD>";
	sArchivo += "\n			<TD>&nbsp;<a onmouseover=" + c + "this.style.cursor='hand'" + c + " style='cursor:normal'>" + oAnexo3V7.GetDesTipo(oAnexo3V7.GetTipoPos(oAnexo3V7.GetTipo(i))) + "</a></TD>";
	sArchivo += "\n		</TR>";
	oArchivo.Escribe(sArchivo);
	oArchivowa.Escribe(sArchivo);
		}
	sArchivo = "\n	</TABLE>";
	oArchivo.Escribe(sArchivo);
	oArchivowa.Escribe(sArchivo);
	} else {
	sArchivo = "\n	</TABLE>";
	sArchivo += "\n	<TABLE width='100%'><TR><TD align='center'><H1 style='size=+2'><br>ESTE ANEXO NO APLICA</H1></TD></TR>";
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