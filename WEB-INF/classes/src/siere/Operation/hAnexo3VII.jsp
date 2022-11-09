<%
/*********************************************************************************************************
Nombre:		Anexo 3.7
Elaboro:	Jesus Manuel Limon Mireles
Lugar:		Monterrey, NL, Mexico
Fecha:		7.Ene.2003
Compañia:	CONSISS
*********************************************************************************************************/
%>
<%
if (oArchivo.AbreArchivo(sRutaHistoria,"fAnexo3VII.html") && oArchivowa.AbreArchivo(sRutaAttach,"fAnexo3VII.html")){
	sAnexo 					= "III.7";
	Anexo3VII oAnexo		= new Anexo3VII();
	iIdAnexo 				= oAnexo.GetIdAnexo();
	oAnexoEstatus.Get(iIdFuncionario, iIdAnexo);
	sEstatus 				= oAnexoEstatus.GetEstatus();
	sAux = "\n				<tr><td class='TituloParrafo' width='70%'>&nbsp;&nbsp;ANEXO III.7 - RELACIÓN DE FORMAS OFICIALES&nbsp;&nbsp;</td></tr>";
%>
				<%@include file="HeaderAnexoHistorico.jsp"%>
<%
	sArchivo = "\n	<TABLE cellPadding='0' cellSpacing='0' width='100%' BORDER='1' BORDERCOLOR='white'>";
	sArchivo += "\n		<TR align=middle>";
	sArchivo += "\n			<td class=TituloMenu>No. Forma</TD>";
	sArchivo += "\n			<td class=TituloMenu>Cantidad</TD>";
	sArchivo += "\n			<td class=TituloMenu>Nombre o Descripción</TD>";
	sArchivo += "\n			<td class=TituloMenu>Precio Unitario</TD>";
	sArchivo += "\n			<td class=TituloMenu>Importe Total</TD>";
	sArchivo += "\n			<td class=TituloMenu>Área Responsable</TD>";
	sArchivo += "\n		</TR>";
	oArchivo.Escribe(sArchivo);
	oArchivowa.Escribe(sArchivo);
	if(!sEstatus.equals("0")){
		int intContador = 0;
		String sBackColor = "";
		oAnexo.GetAll(iIdFuncionario);
		for(int i=0;i<oAnexo.GetAll(iIdFuncionario);i++){
			int 	iIdRenglon			= oAnexo.GetIdRenglon(i)!=-1?			oAnexo.GetIdRenglon(i):0;
			String 	sNoForma			= oAnexo.GetNoForma(i)!=null?			oAnexo.GetNoForma(i)+"":"";
			int 	iCantidad 			= oAnexo.GetCantidad(i)!=-1?			oAnexo.GetCantidad(i):0;
			String 	sNombre 		  	= oAnexo.GetNombre(i)!=null?			oAnexo.GetNombre(i):"";
			float 	iPrecioUnitario  	= oAnexo.GetPrecioUnitario(i)!=-1?		oAnexo.GetPrecioUnitario(i):0;
			String 	sAreaResponsable 	= oAnexo.GetAreaResponsable(i)!=null?	oAnexo.GetAreaResponsable(i):"";
			intContador = intContador + 1;
			if(intContador%2 == 0){
				sBackColor = "#ffffff";
			}else{
				sBackColor = "#eeeeee";
			}
	sArchivo = "\n		<TR align='left' bgcolor='" + sBackColor + "'";
	sArchivo += "\n			onMouseOver = 'MouseDentro(this);'";
	sArchivo += "\n			onMouseOut  = " + c + "MouseFuera(this,'" + sBackColor + "');" + c + ">";
	sArchivo += "\n			<TD>&nbsp;<a onmouseover=" + c + "this.style.cursor='hand'" + c + "  style='cursor:normal'>" + sNoForma + "</a></TD>";
	sArchivo += "\n			<TD align='right'><a onmouseover=" + c + "this.style.cursor='hand'" + c + "  style='cursor:normal'>" + FormatoDecimal.format(iCantidad) + "&nbsp;</a></TD>";
	sArchivo += "\n			<TD>&nbsp;<a onmouseover=" + c + "this.style.cursor='hand'" + c + "  style='cursor:normal'>" + sNombre + "</a></TD>";
	sArchivo += "\n			<TD align='right'><a onmouseover=" + c + "this.style.cursor='hand'" + c + "  style='cursor:normal'>" + FormatoDecimal.format(iPrecioUnitario) + "&nbsp;</a></TD>";
	sArchivo += "\n			<TD align='right'><a onmouseover=" + c + "this.style.cursor='hand'" + c + "  style='cursor:normal'>" + FormatoDecimal.format(iPrecioUnitario * iCantidad) + "&nbsp;</a></TD>";
	sArchivo += "\n			<TD>&nbsp;<a onmouseover=" + c + "this.style.cursor='hand'" + c + "  style='cursor:normal'>" + sAreaResponsable + "</a></TD>";
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
