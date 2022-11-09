<%
/*********************************************************************************************************
Nombre:		Anexo 3.4.6
Elaboro:	Jesus Manuel Limon Mireles
Lugar:		Monterrey, NL, Mexico
Fecha:		6.Ene.2003
Compañia:	CONSISS
*********************************************************************************************************/
%>
<%
if (oArchivo.AbreArchivo(sRutaHistoria,"fAnexo3IV6.html") && oArchivowa.AbreArchivo(sRutaAttach,"fAnexo3IV6.html")){
	sAnexo 					= "III.4.6";
	Anexo3IV6 oAnexo3IV6 	= new Anexo3IV6();
	iIdAnexo 				= oAnexo3IV6.GetIdAnexo();
	oAnexoEstatus.Get(iIdFuncionario, iIdAnexo);
	sEstatus 				= oAnexoEstatus.GetEstatus();
	sAux = "				<tr><TD colspan='3' class='TituloParrafo' width='100%'>&nbsp;&nbsp;ANEXO III.4.6 - PROGRAMA DE AVANCE Y CAPACITACIÓN DE PERSONAL</TD></tr>";
%>
	<%@include file="HeaderAnexoHistorico.jsp"%>
<%
	if(!sEstatus.equals("0") ){ 
		sArchivo = "	<TABLE cellPadding='0' cellSpacing='0' width='100%' BORDER='1' BORDERCOLOR='white'>";
		sArchivo += "		<TR align='middle'>";
		sArchivo += "			<td class='TituloMenu' rowspan='2'>Nombre del Empleado</TD>";
		sArchivo += "			<td class='TituloMenu' ";
		sArchivo += oAnexo3IV6.GetCursoAll(iIdFuncionario)>0? "colspan=" + oAnexo3IV6.GetCursoAll(iIdFuncionario):"";
		sArchivo += ">Horas Invertidas en cada Curso</TD>";
		sArchivo += "		<td class='TituloMenu' rowspan='2'>Horas Totales Capacitación</TD>";
		sArchivo += "	</TR>";
		sArchivo += "	<TR align='top'>";
		oArchivo.Escribe(sArchivo);
		oArchivowa.Escribe(sArchivo);
		if(oAnexo3IV6.GetCursoAll(iIdFuncionario)>0){
			for(int i=0;i<oAnexo3IV6.GetCursoAll(iIdFuncionario);i++){
				sArchivo = "			<td class='TituloMenu' align='center'>" + oAnexo3IV6.GetNombreCurso(i) + "</TD>";
				oArchivo.Escribe(sArchivo);
				oArchivowa.Escribe(sArchivo);
			}
		} else {
			sArchivo = "			<td class='TituloMenu' align='center'>Curso</TD>";
			oArchivo.Escribe(sArchivo);
			oArchivowa.Escribe(sArchivo);
		}
		sArchivo = "		</TR>";
		oArchivo.Escribe(sArchivo);
		oArchivowa.Escribe(sArchivo);
		
		oAnexo3IV6.GetAll(iIdFuncionario);
		
		int intContador = 0;
		String sBackColor = "";
		int [] iHorasCursos = new int[oAnexo3IV6.GetCursoAll(iIdFuncionario)];
		for(int i=0;i<oAnexo3IV6.GetEmpleadoAll(iIdFuncionario);i++){
			String vIdEmpleado 			= oAnexo3IV6.GetIdEmpleado(i)!=-1?oAnexo3IV6.GetIdEmpleado(i)+"":"0";
			String vNombreEmpleado		= oAnexo3IV6.GetNombreEmpleado(i)!=null?oAnexo3IV6.GetNombreEmpleado(i):"";
			intContador = intContador + 1;
			if (intContador%2 == 0){	sBackColor = "#ffffff";	}
			else{						sBackColor = "#eeeeee"; }
			sArchivo = "		<TR align='left' bgcolor='" +sBackColor + "' onMouseOver = 'MouseDentro(this);' onMouseOut  = " + c + "MouseFuera(this,'" +sBackColor + "');" + c + ">";
			sArchivo += "			<TD>&nbsp;<a onmouseover=" + c + "this.style.cursor='hand'" + c + " style='cursor:normal'>" +vNombreEmpleado + "</a></TD>";
			oArchivo.Escribe(sArchivo);
			oArchivowa.Escribe(sArchivo);
			if(oAnexo3IV6.GetCursoAll(iIdFuncionario)>0){
			 	int horas = 0;
				for(int j=0;j<oAnexo3IV6.GetCursoAll(iIdFuncionario);j++){
					int iPos = oAnexo3IV6.GetPos(iIdFuncionario, oAnexo3IV6.GetIdCurso(j), oAnexo3IV6.GetIdEmpleado(i));
					horas = horas + (iPos>=0?java.lang.Integer.parseInt(oAnexo3IV6.GetHoras(iPos)):0);
					iHorasCursos[j] = iHorasCursos[j] + (iPos>=0?java.lang.Integer.parseInt(oAnexo3IV6.GetHoras(iPos)):0);
					sArchivo = "			<TD align='center'>&nbsp;<a onmouseover=" + c + "this.style.cursor='hand'" + c + " style='cursor:normal'>";
					sArchivo += (iPos>=0)?oAnexo3IV6.GetHoras(iPos) + "</a></TD>":"</a></TD>";
					oArchivo.Escribe(sArchivo);
					oArchivowa.Escribe(sArchivo);
				}
				sArchivo = "			<TD align='center'>" + horas + "</TD>";
				oArchivo.Escribe(sArchivo);
				oArchivowa.Escribe(sArchivo);
			}
			sArchivo = "		</TR>";
			oArchivo.Escribe(sArchivo);
			oArchivowa.Escribe(sArchivo);
		}
		sArchivo = "		<TR>";
		sArchivo += "			<TD class='TituloMenu'>Total Horas Capacitación</TD>";
		oArchivo.Escribe(sArchivo);
		oArchivowa.Escribe(sArchivo);
		if(oAnexo3IV6.GetCursoAll(iIdFuncionario)>0){
		 	int horas = 0;
			for(int j=0;j<oAnexo3IV6.GetCursoAll(iIdFuncionario);j++){
				horas = horas + iHorasCursos[j];
				sArchivo = "			<TD align='center'>&nbsp;" + iHorasCursos[j] + "</TD>";
				oArchivo.Escribe(sArchivo);
				oArchivowa.Escribe(sArchivo);
			}
			sArchivo = "			<TD align='center'>" + horas + "</TD>";
			oArchivo.Escribe(sArchivo);
			oArchivowa.Escribe(sArchivo);
		}
		sArchivo = "		</TR>";
		sArchivo += "	</TABLE>";
		oArchivo.Escribe(sArchivo);
		oArchivowa.Escribe(sArchivo);
		sArchivo = "	<BR><BR><BR>";
		sArchivo += "	<TABLE cellPadding='0' cellSpacing='0' width='50%' BORDER='1' BORDERCOLOR='white'>";
		sArchivo += "		<TR align='middle'>";
		sArchivo += "			<td class='TituloMenu'>Nombre del Curso</TD>";
		//sArchivo += "			<TD align=right>&nbsp;</TD>";
		sArchivo += "		</TR>";
		oArchivo.Escribe(sArchivo);
		oArchivowa.Escribe(sArchivo);
		if(!sEstatus.equals("0")){ 
			intContador = 0;
			sBackColor = "";
			for(int i=0;i<oAnexo3IV6.GetCursoAll(iIdFuncionario);i++){
				String vIdCurso 			= oAnexo3IV6.GetIdCurso(i)!=-1?oAnexo3IV6.GetIdCurso(i)+"":"0";
				String vNombreCurso			= oAnexo3IV6.GetNombreCurso(i)!=null?oAnexo3IV6.GetNombreCurso(i):"";
				intContador = intContador + 1;
				if (intContador%2 == 0){	sBackColor = "#ffffff";	}
				else{						sBackColor = "#eeeeee"; }
				sArchivo = "		<TR align='left' bgcolor='" + sBackColor + "' onMouseOver = 'MouseDentro(this);' onMouseOut  = " + c + "MouseFuera(this,'" + sBackColor + "');" + c + ">";
				sArchivo += "			<TD>&nbsp;<a onmouseover=" + c + "this.style.cursor='hand'" + c + " style='cursor:normal'>" + vNombreCurso + "</a></TD>";
				sArchivo += "		</TR>";
				oArchivo.Escribe(sArchivo);
				oArchivowa.Escribe(sArchivo);
			}
			sArchivo = "	</TABLE>";
			oArchivo.Escribe(sArchivo);
			oArchivowa.Escribe(sArchivo);
		}
		
	} else {
		sArchivo = "	<TABLE cellPadding='0' cellSpacing='0' width='100%' BORDER='1' BORDERCOLOR='white'>";
		sArchivo += "		<TR align='middle'>";
		sArchivo += "			<TD width='200' class='TituloMenu' rowspan='2'>Nombre del Empleado</TD>";
		sArchivo += "			<TD width='600' class='TituloMenu'>Horas Invertidas En Cada Curso</TD>";
		sArchivo += "			<TD width='100' class='TituloMenu' rowspan='2'>Horas Totales Capacitación</TD>";
		sArchivo += "		</TR>";
		sArchivo += "	</TABLE>";
		oArchivo.Escribe(sArchivo);
		oArchivowa.Escribe(sArchivo);
		
		sArchivo = "	<TABLE width='100%'>";
		sArchivo += "		<TR><TD align='center'><H1 style='size=+2'><br>ESTE ANEXO NO APLICA</H1></TD></TR>";
		sArchivo += "	</TABLE>";
	
		oArchivo.Escribe(sArchivo);
		oArchivowa.Escribe(sArchivo);
	}
	sArchivo = "</td>";
	sArchivo += "</tr>";
	sArchivo += "</table>";
	sArchivo += "</body>";
	sArchivo += "</html>";
	oArchivo.Escribe(sArchivo);
	oArchivowa.Escribe(sArchivo);
	oArchivo.CierraArchivo();
	oArchivowa.CierraArchivo();
}else{
	out.println("Error");
}
%>

