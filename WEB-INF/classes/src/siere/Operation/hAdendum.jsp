<%
/*********************************************************************************************************
Nombre:		Anexo 3.17
Elaboro:	Jesus Manuel Limon Mireles
Lugar:		Monterrey, NL, Mexico
Fecha:		7.Ene.2003
Compañia:	CONSISS
*********************************************************************************************************/
%>
<%
if (oArchivo.AbreArchivo(sRutaHistoria,"fAdendum.html") && oArchivowa.AbreArchivo(sRutaAttach,"fAdendum.html")){
Adendum oAdendum = new Adendum();
Anexo	oAnexo = new Anexo();
sAnexo = "";
	sAux = "\n				<tr><td class='TituloParrafo' width='70%'>&nbsp;&nbsp;ADENDUM&nbsp;&nbsp;</td></tr>";
%>
				<%@include file="HeaderAnexoHistorico.jsp"%>
<%
	sArchivo = "\n	<TABLE cellPadding='0' cellSpacing='0' width='100%' BORDER='1' BORDERCOLOR='white'>";
	sArchivo += "\n		<TR align='middle'>";
	sArchivo += "\n			<td class='TituloMenu'>RENGLON</TD>";
	sArchivo += "\n			<td class='TituloMenu'>ANEXO</TD>";
	sArchivo += "\n			<td class='TituloMenu'>OBSERVACION</TD>";
	sArchivo += "\n		</TR>";
	oArchivo.Escribe(sArchivo);
	oArchivowa.Escribe(sArchivo);
	int intContador = 0;
	String sBackColor = "";
	for(int i=0;i<oAdendum.GetAllNvo(iIdFuncionario).getNumRows();i++){
		int iIdRenglon		= oAdendum.GetIdRenglon(i);
		int iIdAnexoAdendum	= oAdendum.GetIdAnexo(i);
		String sObservacion	= oAdendum.GetObservacion(i);
		intContador = intContador + 1;
		if(intContador%2 == 0){
			sBackColor = "#ffffff";
		}else{
			sBackColor = "#eeeeee";
		}
		sArchivo = "\n		<TR align='left' bgcolor='" +sBackColor + "'";
		sArchivo += "\n			onMouseOver = 'MouseDentro(this);'";
		sArchivo += "\n			onMouseOut  = " + c + "MouseFuera(this,'" +sBackColor + "');" + c + ">";
		sArchivo += "\n			<TD>&nbsp;<a onmouseover=" + c + "this.style.cursor='hand'" + c + " style='cursor:normal'>" + iIdRenglon + "</a></TD>";
		sArchivo += "\n			<TD>&nbsp;<a onmouseover=" + c + "this.style.cursor='hand'" + c + " style='cursor:normal'>" + oAnexo.GetClave(oAnexo.GetPos(iIdAnexoAdendum)) + "</a></TD>";
		sArchivo += "\n			<TD>&nbsp;<a onmouseover=" + c + "this.style.cursor='hand'" + c + " style='cursor:normal'>" + sObservacion + "</a></TD>";
		sArchivo += "\n		</TR>";
		oArchivo.Escribe(sArchivo);
		oArchivowa.Escribe(sArchivo);
	}
	sArchivo = "\n	</TABLE>";
	oArchivo.Escribe(sArchivo);
	oArchivowa.Escribe(sArchivo);

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
