<%
/*********************************************************************************************************
Nombre:		Anexo 3.3
Elaboro:	Jesus Manuel Limon Mireles
Lugar:		Monterrey, NL, Mexico
Fecha:		6.Ene.2003
Compañia:	CONSISS
*********************************************************************************************************/
%>
<%
if (oArchivo.AbreArchivo(sRutaHistoria,"fAnexo3III.html") && oArchivowa.AbreArchivo(sRutaAttach,"fAnexo3III.html")){
	sAnexo 					= "III.3";
	Anexo3III oAnexo3III	= new Anexo3III();
	iIdAnexo 				= oAnexo3III.GetIdAnexo();
	oAnexoEstatus.Get(iIdFuncionario, iIdAnexo);
	sEstatus 				= oAnexoEstatus.GetEstatus();
	sAux = "\n				<tr><TD  colspan='3' class='TituloParrafo' width='70%'>ANEXO III.3 - RELACIÓN DE MANUALES DE ORGANIZACIÓN, POLÍTICAS Y NORMAS DE ADMINISTRACIÓN INTERNA</TD></tr>";
%>
				<%@include file="HeaderAnexoHistorico.jsp"%>
<%

	sArchivo = "\n	<TABLE cellPadding='0' cellSpacing='0' width='100%' BORDER='1' BORDERCOLOR='white'>";
	sArchivo += "\n		<TR align='middle'>";
	sArchivo += "\n			<td class='TituloMenu'>Título</TD>";
	sArchivo += "\n			<td class='TituloMenu'>Área de Aplicación</TD>";
	sArchivo += "\n		</TR>";
	oArchivo.Escribe(sArchivo);
	oArchivowa.Escribe(sArchivo);
		if(!sEstatus.equals("0")){
			int intContador = 0;
			String sBackColor = "";
			oAnexo3III.GetAll(iIdFuncionario);
		for(int i=0;i<oAnexo3III.GetAll(iIdFuncionario);i++){
		    String vIdRenglon 				= oAnexo3III.GetIdRenglon(i)!=-1?oAnexo3III.GetIdRenglon(i)+"":"0";
			String vTitulo 			= oAnexo3III.GetTitulo(i)!=null?oAnexo3III.GetTitulo(i):"";
			String vAreaAplicacion 					= oAnexo3III.GetAreaAplicacion(i)!=null?oAnexo3III.GetAreaAplicacion(i):"";
			intContador = intContador + 1;
		 if (intContador%2 == 0){
					sBackColor = "#ffffff";
				}else{
					sBackColor = "#eeeeee";
			  }
	sArchivo = "\n		<TR align='left' bgcolor='" + sBackColor + "' ";
	sArchivo += "\n			onMouseOver = 'MouseDentro(this);'";
	sArchivo += "\n			onMouseOut  = " + c + "MouseFuera(this,'" + sBackColor + "');" + c + ">";
	sArchivo += "\n			<TD>&nbsp;<a onmouseover=" + c + "this.style.cursor='hand'" + c + " style='cursor:normal'>" + vTitulo + "</a></TD>";
	sArchivo += "\n			<TD >&nbsp;<a onmouseover=" + c + "this.style.cursor='hand'" + c + " style='cursor:normal'>" + vAreaAplicacion + "</a></TD>";
	sArchivo += "\n		</TR>";
	oArchivo.Escribe(sArchivo);
	oArchivowa.Escribe(sArchivo);
		}
	sArchivo = "\n</TABLE>";
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

