<%
/*********************************************************************************************************
Nombre:		Anexo 3.5.4
Elaboro:	Jesus Manuel Limon Mireles
Lugar:		Monterrey, NL, Mexico
Fecha:		7.Ene.2003
Compañia:	CONSISS
*********************************************************************************************************/
%>
<%
if (oArchivo.AbreArchivo(sRutaHistoria,"fAnexo3V4.html") && oArchivowa.AbreArchivo(sRutaAttach,"fAnexo3V4.html")){
	sAnexo 					= "III.5.4";
	Anexo3V4 oAnexo3V4 		= new Anexo3V4();
	iIdAnexo 				= oAnexo3V4.GetIdAnexo();
	oAnexoEstatus.Get(iIdFuncionario, iIdAnexo);
	sEstatus 				= oAnexoEstatus.GetEstatus();
	sAux = "\n				<tr><TD colspan='3' class='TituloParrafo' width='100%'>&nbsp;&nbsp;ANEXO III.5.4 - RELACIÓN DE EQUIPO DE TRANSPORTE Y MAQUINARIA</TD></tr>";
%>
				<%@include file="HeaderAnexoHistorico.jsp"%>
<%
	sArchivo = "\n	<TABLE cellPadding='0' cellSpacing='0' width='100%' BORDER='1' BORDERCOLOR='white'>";
	sArchivo += "\n		<TR align='middle'>";
	sArchivo += "\n			<td class='TituloMenu' colspan='2'>Código<br>Programático</TD>";
	sArchivo += "\n			<td class='TituloMenu' rowspan='2'>Marca</TD>";
	sArchivo += "\n			<td class='TituloMenu' rowspan='2'>Modelo</TD>";
	sArchivo += "\n			<td class='TituloMenu' rowspan='2'>Color</TD>";
	sArchivo += "\n			<td class='TituloMenu' rowspan='2'>Placas</TD>";
	sArchivo += "\n			<td class='TituloMenu' rowspan='2'>Tipo</TD>";
	sArchivo += "\n			<td class='TituloMenu' rowspan='2'>Serie<BR>Motor</TD>";
	sArchivo += "\n			<td class='TituloMenu' rowspan='2'>Nombre y Cargo del<BR>Resguardante</TD>";
	sArchivo += "\n			<td class='TituloMenu' rowspan='2'>Observaciones</TD>";
	sArchivo += "\n		</TR>";
	sArchivo += "\n		<TR align='middle'>";
	sArchivo += "\n			<td class='TituloMenu'>No.Inv.</td>";
	sArchivo += "\n			<td class='TituloMenu'>No.Eco.</td>";
	sArchivo += "\n		</TR>";
	oArchivo.Escribe(sArchivo);
	oArchivowa.Escribe(sArchivo);
	if(!sEstatus.equals("0")){
		int intContador = 0;
		String sBackColor = "";
		oAnexo3V4.GetAll(iIdFuncionario);		
		for(int i=0;i<oAnexo3V4.GetAll(iIdFuncionario);i++){
			String vIdRenglon 			= oAnexo3V4.GetIdRenglon(i)!=-1?oAnexo3V4.GetIdRenglon(i)+"":"0";
			intContador = intContador + 1;
			if (intContador%2 == 0){	sBackColor = "#ffffff";	}
			else{						sBackColor = "#eeeeee"; }
	sArchivo = "\n		<TR align='left' bgcolor='" + sBackColor + "' onMouseOver = 'MouseDentro(this);' onMouseOut  = " + c + "MouseFuera(this,'" + sBackColor + "');" + c + ">";
	sArchivo += "\n        	<TD>&nbsp;<a onmouseover=" + c + "this.style.cursor='hand'" + c + " style='cursor:normal'>" + oAnexo3V4.GetNoInventario(i) + "</a></TD>";
	sArchivo += "\n			<TD>&nbsp;<a onmouseover=" + c + "this.style.cursor='hand'" + c + " style='cursor:normal'>" + oAnexo3V4.GetNoEconomico(i) + "</a></TD>";
	sArchivo += "\n			<TD>&nbsp;<a onmouseover=" + c + "this.style.cursor='hand'" + c + " style='cursor:normal'>" + oAnexo3V4.GetMarca(i) + "</a></TD>";
	sArchivo += "\n			<TD>&nbsp;<a onmouseover=" + c + "this.style.cursor='hand'" + c + " style='cursor:normal'>" + oAnexo3V4.GetModelo(i) + "</a></TD>";
	sArchivo += "\n			<TD>&nbsp;<a onmouseover=" + c + "this.style.cursor='hand'" + c + " style='cursor:normal'>" + oAnexo3V4.GetColor(i) + "</a></TD>";
	sArchivo += "\n        	<TD>&nbsp;<a onmouseover=" + c + "this.style.cursor='hand'" + c + " style='cursor:normal'>" + oAnexo3V4.GetPlacas(i) + "</a></TD>";
	sArchivo += "\n			<TD>&nbsp;<a onmouseover=" + c + "this.style.cursor='hand'" + c + " style='cursor:normal'>" + oAnexo3V4.GetDesTipo(oAnexo3V4.GetTipoPos(oAnexo3V4.GetTipo(i))) + "</a></TD>";
	sArchivo += "\n			<TD>&nbsp;<a onmouseover=" + c + "this.style.cursor='hand'" + c + " style='cursor:normal'>" + oAnexo3V4.GetSerie(i) + "</a></TD>";
	sArchivo += "\n			<TD>&nbsp;<a onmouseover=" + c + "this.style.cursor='hand'" + c + " style='cursor:normal'>" + oAnexo3V4.GetResguardante(i) + "</a></TD>";
	sArchivo += "\n			<TD>&nbsp;<a onmouseover=" + c + "this.style.cursor='hand'" + c + " style='cursor:normal'>" + oAnexo3V4.GetObservaciones(i) + "</a></TD>";
	sArchivo += "\n		</TR>";
	oArchivo.Escribe(sArchivo);
	oArchivowa.Escribe(sArchivo);
		}
	sArchivo = "\n	</TABLE><BR>";
	sArchivo += "\n	ANEXAR RESGUARDOS CORRESPONDIENTES SEGUN RELACIÓN";
	oArchivo.Escribe(sArchivo);
	oArchivowa.Escribe(sArchivo);
	} else {
	sArchivo = "\n	</TABLE>";
	sArchivo += "\n	<TABLE width='100%'>";
	sArchivo += "\n		<TR>";
	sArchivo += "\n			<TD align='center'><H1 style='size=+2'><br>ESTE ANEXO NO APLICA</H1></TD>";
	sArchivo += "\n		</TR>";
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
