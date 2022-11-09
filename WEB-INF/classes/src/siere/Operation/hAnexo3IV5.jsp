<%
/*********************************************************************************************************
Nombre:		Anexo 3.4.5
Elaboro:	Jesus Manuel Limon Mireles
Lugar:		Monterrey, NL, Mexico
Fecha:		6.Ene.2003
Compañia:	CONSISS
*********************************************************************************************************/
%>
<%
if (oArchivo.AbreArchivo(sRutaHistoria,"fAnexo3IV5.html") && oArchivowa.AbreArchivo(sRutaAttach,"fAnexo3IV5.html")){
	sAnexo 					= "III.4.5";
	Anexo3IV5 oAnexo3IV5 	= new Anexo3IV5();
	iIdAnexo 				= oAnexo3IV5.GetIdAnexo();
	oAnexoEstatus.Get(iIdFuncionario, iIdAnexo);
	sEstatus 				= oAnexoEstatus.GetEstatus();
	sAux = "\n				<tr><TD colspan='3' class='TituloParrafo' width='100%'>&nbsp;&nbsp;ANEXO III.4.5 - RELACIÓN DE EXPEDIENTES DE PERSONAL</TD></tr>";
%>
				<%@include file="HeaderAnexoHistorico.jsp"%>
<%
	sArchivo = "\n	<TABLE cellPadding='0' cellSpacing='0' width='100%' BORDER='1' BORDERCOLOR='white'>";
	sArchivo += "\n		<TR align='middle'>";
	sArchivo += "\n			<td class='TituloMenu'>Número de<BR>Empleado</TD><td class='TituloMenu'>Nombre</TD><td class='TituloMenu'>Puesto</TD><td class='TituloMenu'>Unidad Administrativa</TD></TR>";
	oArchivo.Escribe(sArchivo);
	oArchivowa.Escribe(sArchivo);
	if( !sEstatus.equals(oAnexoEstatus.GetEstatusNoAplica()) ){ // DETALLE DE ANEXO
		int intContador = 0;
		String sBackColor = "";
		oAnexo3IV5.GetAll(iIdFuncionario);
		for(int i=0;i<oAnexo3IV5.GetAll(iIdFuncionario);i++){
			String vIdRenglon 			= oAnexo3IV5.GetIdRenglon(i)!=-1?oAnexo3IV5.GetIdRenglon(i)+"":"0";
			String vNumero 				= oAnexo3IV5.GetNumero(i)!=null?oAnexo3IV5.GetNumero(i):"";
			String vNombre 				= oAnexo3IV5.GetNombre(i)!=null?oAnexo3IV5.GetNombre(i):"";
			String vPuesto				= oAnexo3IV5.GetPuesto(i)!=null?oAnexo3IV5.GetPuesto(i):"";
			String vUnidadAdministrativa= oAnexo3IV5.GetUnidadAdministrativa(i)!=null?oAnexo3IV5.GetUnidadAdministrativa(i):"";
			intContador = intContador + 1;
			if (intContador%2 == 0){	sBackColor = "#ffffff";	}
			else{						sBackColor = "#eeeeee"; }

	sArchivo = "\n		<TR align='left' bgcolor='" + sBackColor + "' onMouseOver = 'MouseDentro(this);' onMouseOut  = " + c + "MouseFuera(this,'" + sBackColor + "');" + c + ">";
	sArchivo += "\n			<TD>&nbsp;<a onmouseover=" + c + "this.style.cursor='hand'" + c + " style='cursor:normal'>" + vNumero + "</a></TD>";
	sArchivo += "\n			<TD>&nbsp;<a onmouseover=" + c + "this.style.cursor='hand'" + c + " style='cursor:normal'>" + vNombre + "</a></TD>";
	sArchivo += "\n			<TD>&nbsp;<a onmouseover=" + c + "this.style.cursor='hand'" + c + " style='cursor:normal'>" + vPuesto + "</a></TD>";
	sArchivo += "\n			<TD>&nbsp;<a onmouseover=" + c + "this.style.cursor='hand'" + c + " style='cursor:normal'>" + vUnidadAdministrativa + "</a></TD>";
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

