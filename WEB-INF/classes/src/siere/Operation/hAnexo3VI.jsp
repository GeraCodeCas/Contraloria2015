<%
/*********************************************************************************************************
Nombre:		Anexo 3.6
Elaboro:	Jesus Manuel Limon Mireles
Lugar:		Monterrey, NL, Mexico
Fecha:		7.Ene.2003
Compañia:	CONSISS
*********************************************************************************************************/
%>
<%
if (oArchivo.AbreArchivo(sRutaHistoria,"fAnexo3VI.html") && oArchivowa.AbreArchivo(sRutaAttach,"fAnexo3VI.html")){
	sAnexo 					= "III.6";
	Anexo3VI oAnexo3VI 		= new Anexo3VI();
	iIdAnexo 				= oAnexo3VI.GetIdAnexo();
	oAnexoEstatus.Get(iIdFuncionario, iIdAnexo);
	sEstatus 				= oAnexoEstatus.GetEstatus();
	sAux = "\n				<tr><TD colspan='3' class='TituloParrafo' width='100%'>&nbsp;&nbsp;ANEXO III.6 - INVENTARIO DE ALMACEN</TD></tr>";
%>
				<%@include file="HeaderAnexoHistorico.jsp"%>
<%
	sArchivo = "\n	<TABLE cellPadding='0' cellSpacing='0' width='100%' BORDER='1' BORDERCOLOR='white'>";
	sArchivo += "\n		<TR align='center'>";
	sArchivo += "\n			<td class='TituloMenu' rowspan='2'>No. y Nombre del Artículo</TD>";
	sArchivo += "\n			<td class='TituloMenu' rowspan='2'>Unidad de<BR>Medida</TD>";
	sArchivo += "\n			<td class='TituloMenu' rowspan='2'>Precio<BR>Unitario</TD>";
	sArchivo += "\n			<td class='TituloMenu' colspan='2'>Inventario Físico</TD>";
	sArchivo += "\n			<td class='TituloMenu' rowspan='2'>Observaciones</TD>";
	sArchivo += "\n		</TR>";
	sArchivo += "\n		<TR align='center'>";
	sArchivo += "\n			<td class='TituloMenu'>Existencia</td>";
	sArchivo += "\n			<td class='TituloMenu'>Importe Total</td>";
	sArchivo += "\n		</TR>";
	oArchivo.Escribe(sArchivo);
	oArchivowa.Escribe(sArchivo);
	if(!sEstatus.equals("0")){
		int intContador = 0;
		String sBackColor = "";
		oAnexo3VI.GetAll(iIdFuncionario);
		for(int i=0;i<oAnexo3VI.GetAll(iIdFuncionario);i++){
			String vIdRenglon 			= oAnexo3VI.GetIdRenglon(i)!=-1?oAnexo3VI.GetIdRenglon(i)+"":"0";
			intContador = intContador + 1;
			if (intContador%2 == 0){	sBackColor = "#ffffff";	}
			else{						sBackColor = "#eeeeee"; }
	sArchivo = "\n		<TR align='left' bgcolor='" + sBackColor + "' onMouseOver = 'MouseDentro(this);' onMouseOut  = " + c + "MouseFuera(this,'" + sBackColor + "');" + c + ">";
	sArchivo += "\n			<TD>&nbsp;<a onmouseover=" + c + "this.style.cursor='hand'" + c + "  style='cursor:normal'>";
	sArchivo += oAnexo3VI.GetNoNombre(i)!=null? oAnexo3VI.GetNoNombre(i) + "</a></TD>":"</a></TD>";
	sArchivo += "\n			<TD>&nbsp;<a onmouseover=" + c + "this.style.cursor='hand'" + c + "  style='cursor:normal'>";
	sArchivo += oAnexo3VI.GetUnidad(i)!=null? oAnexo3VI.GetUnidad(i) + "</a></TD>":"</a></TD>";
	sArchivo += "\n			<TD align='right'><a onmouseover=" + c + "this.style.cursor='hand'" + c + "  style='cursor:normal'>";
	sArchivo += oAnexo3VI.GetPrecioUnitario(i)!=null? FormatoDecimal.format(new Float(oAnexo3VI.GetPrecioUnitario(i))) + "</a>&nbsp;</TD>": "</a>&nbsp;</TD>";
	sArchivo += "\n			<TD align='right'><a onmouseover=" + c + "this.style.cursor='hand'" + c + "  style='cursor:normal'>";
	sArchivo += oAnexo3VI.GetExistencia(i)!=null? oAnexo3VI.GetExistencia(i) + "</a>&nbsp;</TD>":"</a>&nbsp;</TD>";
	sArchivo += "\n			<TD align='right'><a onmouseover=" + c + "this.style.cursor='hand'" + c + "  style='cursor:normal'>";
	sArchivo += oAnexo3VI.GetImporte(i)!=null? FormatoDecimal.format(new Float(oAnexo3VI.GetImporte(i)))  + "</a>&nbsp;</TD>":"</a>&nbsp;</TD>";
	sArchivo += "\n			<TD>&nbsp;<a onmouseover=" + c + "this.style.cursor='hand'" + c + "  style='cursor:normal'>";
	sArchivo += oAnexo3VI.GetObservacion(i)!=null? oAnexo3VI.GetObservacion(i)  + "</a></TD>":"</a></TD>";
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
