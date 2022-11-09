<%
/*********************************************************************************************************
Nombre:		Anexo 3.5.6
Elaboro:	Jesus Manuel Limon Mireles
Lugar:		Monterrey, NL, Mexico
Fecha:		8.Ene.2003
Compañia:	CONSISS
*********************************************************************************************************/
%>
<%
if (oArchivo.AbreArchivo(sRutaHistoria,"fAnexo3V6.html") && oArchivowa.AbreArchivo(sRutaAttach,"fAnexo3V6.html")){
	sAnexo 					= "III.5.6";
	Anexo3V6 oAnexo3V6 		= new Anexo3V6();
	iIdAnexo 				= oAnexo3V6.GetIdAnexo();
	oAnexoEstatus.Get(iIdFuncionario, iIdAnexo);
	sEstatus 				= oAnexoEstatus.GetEstatus();
	sAux = "\n				<tr><TD colspan='3' class='TituloParrafo' width='100%'>&nbsp;&nbsp;ANEXO III.5.6 - RELACIÓN DE OBRAS DE ARTE Y DECORACIÓN</TD></tr>";
%>
				<%@include file="HeaderAnexoHistorico.jsp"%>
<%
	sArchivo = "\n	<TABLE cellPadding='0' cellSpacing='0' width='100%' BORDER='1' BORDERCOLOR='white'>";
	sArchivo += "\n		<TR align='middle'>";
	sArchivo += "\n			<td class='TituloMenu'>Clave<br>Inventario</TD>";
	sArchivo += "\n			<td class='TituloMenu'>Número de<br>Factura</TD>";
	sArchivo += "\n			<td class='TituloMenu'>Fecha<BR>Factura</TD>";
	sArchivo += "\n			<td class='TituloMenu'>Concepto</TD>";
	sArchivo += "\n			<td class='TituloMenu'>Importe</TD>";
	sArchivo += "\n			<td class='TituloMenu'>Tipo</TD>";
	sArchivo += "\n		</TR>";
	oArchivo.Escribe(sArchivo);
	oArchivowa.Escribe(sArchivo);
	if(!sEstatus.equals("0")){
		int intContador = 0;
		String sBackColor = "";
		oAnexo3V6.GetAll(iIdFuncionario);
		for(int i=0;i<oAnexo3V6.GetAll(iIdFuncionario);i++){
			String vIdRenglon 			= oAnexo3V6.GetIdRenglon(i)!=-1?oAnexo3V6.GetIdRenglon(i)+"":"0";
			intContador = intContador + 1;
			if (intContador%2 == 0){	sBackColor = "#ffffff";	}
			else{						sBackColor = "#eeeeee"; }
	sArchivo = "\n		<TR align='left' bgcolor='" + sBackColor + "' onMouseOver = 'MouseDentro(this);' onMouseOut  = " + c + "MouseFuera(this,'" + sBackColor + "');" + c + ">";
	sArchivo += "\n			<TD>&nbsp;<a onmouseover=" + c + "this.style.cursor='hand'" + c + " style='cursor:normal'>";
	sArchivo += oAnexo3V6.GetClave(i)!=null?oAnexo3V6.GetClave(i) + "</a></TD>":"</a></TD>";
	sArchivo += "\n			<TD>&nbsp;<a onmouseover=" + c + "this.style.cursor='hand'" + c + " style='cursor:normal'>";
	sArchivo += oAnexo3V6.GetNumFactura(i)!=null?oAnexo3V6.GetNumFactura(i) + "</a></TD>":"</a></TD>";
	sArchivo += "\n			<TD>&nbsp;<a onmouseover=" + c + "this.style.cursor='hand'" + c + " style='cursor:normal'>";
	sArchivo += oAnexo3V6.GetFecha(i)!=null?oAnexo3V6.GetFecha(i) + "</a></TD>":"</a></TD>";
	sArchivo += "\n			<TD>&nbsp;<a onmouseover=" + c + "this.style.cursor='hand'" + c + " style='cursor:normal'>";
	sArchivo += oAnexo3V6.GetConcepto(i)!=null?oAnexo3V6.GetConcepto(i) + "</a></TD>":"</a></TD>";
	sArchivo += "\n			<TD align='right'>&nbsp;<a onmouseover=" + c + "this.style.cursor='hand'" + c + " style='cursor:normal'>";
	sArchivo += FormatoDecimal.format(new Float(oAnexo3V6.GetImporte(i)!=null?oAnexo3V6.GetImporte(i):"0")) + "</a></TD>";
	sArchivo += "\n			<TD>&nbsp;<a onmouseover=" + c + "this.style.cursor='hand'" + c + " style='cursor:normal'>" + oAnexo3V6.GetDesTipo(oAnexo3V6.GetTipoPos(oAnexo3V6.GetTipo(i))) + "</a></TD>";
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
