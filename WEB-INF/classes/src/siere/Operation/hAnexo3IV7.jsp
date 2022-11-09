<%
/*********************************************************************************************************
Nombre:		Anexo 3.4.7
Elaboro:	Jesus Manuel Limon Mireles
Lugar:		Monterrey, NL, Mexico
Fecha:		6.Ene.2003
Compañia:	CONSISS
*********************************************************************************************************/
%>
<%
if (oArchivo.AbreArchivo(sRutaHistoria,"fAnexo3IV7.html") && oArchivowa.AbreArchivo(sRutaAttach,"fAnexo3IV7.html")){
	sAnexo 					= "III.4.7";
	Anexo3IV7 oAnexo3IV7 	= new Anexo3IV7();
	iIdAnexo 				= oAnexo3IV7.GetIdAnexo();
	oAnexoEstatus.Get(iIdFuncionario, iIdAnexo);
	sEstatus 				= oAnexoEstatus.GetEstatus();
	sAux = "\n				<tr><TD colspan='3' class='TituloParrafo' width='100%'>&nbsp;&nbsp;ANEXO III.4.7 - RELACIÓN DE LIBROS, PUBLICACIONES, MATERIAL BIBLIOGRÁFICO E INFORMATIVO</TD></tr>";
%>
				<%@include file="HeaderAnexoHistorico.jsp"%>
<%
	sArchivo = "\n	<TABLE cellPadding='0' cellSpacing='0' width='100%' BORDER='1' BORDERCOLOR='white'>";
	sArchivo += "\n		<TR align='middle'>";
	sArchivo += "\n			<td class='TituloMenu' rowspan='2'>&nbsp;</td>";
	sArchivo += "\n			<td class='TituloMenu' rowspan='2'>Nombre del Empleado</TD>";
	sArchivo += "\n			<td class='TituloMenu' ";
	sArchivo += oAnexo3V7.GetCursoAll(iIdFuncionario)>0? ("colspan="+oAnexo3V7.GetCursoAll(iIdFuncionario)):"";
	sArchivo += ">Horas Invertidas en cada Curso</TD>";
	sArchivo += "\n			<td class='TituloMenu' rowspan='2'>Horas Totales Capacitación</TD>";
	sArchivo += "\n		</TR>";
	sArchivo += "\n		<TR align='top'>";
	oArchivo.Escribe(sArchivo);
	oArchivowa.Escribe(sArchivo);
	if(oAnexo3V7.GetCursoAll(iIdFuncionario)>0){
		for(int i=0;i<oAnexo3V7.GetCursoAll(iIdFuncionario);i++){
	sArchivo = "\n			<td class='TituloMenu' align='center'>" + oAnexo3V7.GetNombreCurso(i) + "</TD>";
	oArchivo.Escribe(sArchivo);
	oArchivowa.Escribe(sArchivo);
		}
	} else {
	sArchivo = "\n		<td class='TituloMenu' align='center'>Curso</TD>";
	oArchivo.Escribe(sArchivo);
	oArchivowa.Escribe(sArchivo);
	}
	sArchivo = "\n		</TR>";
	oArchivo.Escribe(sArchivo);
	oArchivowa.Escribe(sArchivo);
oAnexo3V7.GetAll(iIdFuncionario);
if(!sEstatus.equals("0") ){ 
	int intContador = 0;
	String sBackColor = "";
	int [] iHorasCursos = new int[oAnexo3V7.GetCursoAll(iIdFuncionario)];
	for(int i=0;i<oAnexo3V7.GetEmpleadoAll(iIdFuncionario);i++){
		String vIdEmpleado 			= oAnexo3V7.GetIdEmpleado(i)!=-1?oAnexo3V7.GetIdEmpleado(i)+"":"0";
		String vNombreEmpleado		= oAnexo3V7.GetNombreEmpleado(i)!=null?oAnexo3V7.GetNombreEmpleado(i):"";
		intContador = intContador + 1;
		if (intContador%2 == 0){	sBackColor = "#ffffff";	}
		else{						sBackColor = "#eeeeee"; }
	sArchivo = "\n		<TR align='left' bgcolor='" + sBackColor + "' onMouseOver = 'MouseDentro(this);' onMouseOut  = " + c + "MouseFuera(this,'" + sBackColor + "');" + c + ">";
	sArchivo += "\n			<TD>&nbsp;<a onmouseover=" + c + "this.style.cursor='hand'" + c + " style='cursor:normal'>" + vNombreEmpleado + "</a></TD>";
	oArchivo.Escribe(sArchivo);
	oArchivowa.Escribe(sArchivo);
			 if(oAnexo3V7.GetCursoAll(iIdFuncionario)>0){
			 	int horas = 0;
				for(int j=0;j<oAnexo3V7.GetCursoAll(iIdFuncionario);j++){
					int iPos = oAnexo3V7.GetPos(iIdFuncionario, oAnexo3V7.GetIdCurso(j), oAnexo3V7.GetIdEmpleado(i));
					horas = horas + (iPos>=0?java.lang.Integer.parseInt(oAnexo3V7.GetHoras(iPos)):0);
					iHorasCursos[j] = iHorasCursos[j] + (iPos>=0?java.lang.Integer.parseInt(oAnexo3V7.GetHoras(iPos)):0);
	sArchivo = "\n			<TD align='center'>&nbsp;<a onmouseover=" + c + "this.style.cursor='hand'" + c + " style='cursor:normal'>";
	sArchivo += iPos>=0? oAnexo3V7.GetHoras(iPos) + "</a></TD>":"</a></TD>";
	oArchivo.Escribe(sArchivo);
	oArchivowa.Escribe(sArchivo);
				}
	sArchivo = "\n			<TD align='center'>" + horas + "</TD>";
	oArchivo.Escribe(sArchivo);
	oArchivowa.Escribe(sArchivo);
			}
	sArchivo = "\n		</TR>";
	oArchivo.Escribe(sArchivo);
	oArchivowa.Escribe(sArchivo);
	}
	sArchivo = "\n		<TR>";
	sArchivo += "\n			<TD colspan='2' class='TituloMenu'>Total Horas Capacitación</TD>";
	oArchivo.Escribe(sArchivo);
	oArchivowa.Escribe(sArchivo);
			if(oAnexo3V7.GetCursoAll(iIdFuncionario)>0){
			 	int horas = 0;
				for(int j=0;j<oAnexo3V7.GetCursoAll(iIdFuncionario);j++){
					horas = horas + iHorasCursos[j];
	sArchivo = "\n			<TD align='center'>&nbsp;" + iHorasCursos[j] + "</TD>";
	oArchivo.Escribe(sArchivo);
	oArchivowa.Escribe(sArchivo);
				}
	sArchivo = "\n			<TD align='center'>" + horas + "</TD>";
	oArchivo.Escribe(sArchivo);
	oArchivowa.Escribe(sArchivo);
			}
	sArchivo = "\n		</TR>";
	sArchivo += "\n	</TABLE>";
	oArchivo.Escribe(sArchivo);
	oArchivowa.Escribe(sArchivo);
}
	sArchivo = "\n	<BR><BR><BR>";
	sArchivo += "\n	<TABLE cellPadding='0' cellSpacing='0' width='50%' BORDER='1' BORDERCOLOR='white'>";
	sArchivo += "\n		<TR align='middle'>";
	sArchivo += "\n			<td class='TituloMenu'>&nbsp;</td>";
	sArchivo += "\n			<td class='TituloMenu'>Nombre del Curso</TD>";
	sArchivo += "\n			<TD align=right>&nbsp;";
	sArchivo += "\n			</TD>";
	sArchivo += "\n		</TR>";
	oArchivo.Escribe(sArchivo);
	oArchivowa.Escribe(sArchivo);

if(!sEstatus.equals("0")){ 
	int intContador = 0;
	String sBackColor = "";
	for(int i=0;i<oAnexo3V7.GetCursoAll(iIdFuncionario);i++){
		String vIdCurso 			= oAnexo3V7.GetIdCurso(i)!=-1?oAnexo3V7.GetIdCurso(i)+"":"0";
		String vNombreCurso			= oAnexo3V7.GetNombreCurso(i)!=null?oAnexo3V7.GetNombreCurso(i):"";
		intContador = intContador + 1;
		if (intContador%2 == 0){	sBackColor = "#ffffff";	}
		else{						sBackColor = "#eeeeee"; }
	sArchivo = "\n		<TR align='left' bgcolor='" + sBackColor + "' onMouseOver = 'MouseDentro(this);' onMouseOut  = " + c + "MouseFuera(this,'" + sBackColor + "');" + c + ">";
	sArchivo += "\n			<TD>&nbsp;<a onmouseover=" + c + "this.style.cursor='hand'" + c + " style='cursor:normal'>" + vNombreCurso + "</a></TD>";
	sArchivo += "\n		</TR>";
	oArchivo.Escribe(sArchivo);
	oArchivowa.Escribe(sArchivo);
	}
	sArchivo = "\n	</TABLE>";
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
