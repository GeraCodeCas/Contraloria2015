<%
/*********************************************************************************************************
Nombre:		Anexo 3.5.2
Elaboro:	Jesus Manuel Limon Mireles
Lugar:		Monterrey, NL, Mexico
Fecha:		7.Ene.2003
Compa�ia:	CONSISS
*********************************************************************************************************/
%>
<%
if (oArchivo.AbreArchivo(sRutaHistoria,"fAnexo3V2.html") && oArchivowa.AbreArchivo(sRutaAttach,"fAnexo3V2.html")){
	sAnexo 					= "III.5.2";
	Anexo3V2 oAnexo3V2 		= new Anexo3V2();
	iIdAnexo 				= oAnexo3V2.GetIdAnexo();
	oAnexoEstatus.Get(iIdFuncionario, iIdAnexo);
	sEstatus 				= oAnexoEstatus.GetEstatus();
	sAux = "\n				<tr><TD colspan='3' class='TituloParrafo' width='100%'>&nbsp;&nbsp;ANEXO III.5.2 - RELACI�N DE EQUIPO DE COMPUTO</TD></tr>";
%>
				<%@include file="HeaderAnexoHistorico.jsp"%>
<%
	sArchivo = "\n	<TABLE cellPadding='0' cellSpacing='0' width='100%' BORDER='1' BORDERCOLOR='white'>";
	sArchivo += "\n		<TR align='middle'>";
	sArchivo += "\n			<td class='TituloMenu'>Clave<br>Inventario</TD>";
	sArchivo += "\n			<td class='TituloMenu'>N�mero de<br>Factura</TD>";
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
		oAnexo3V2.GetAll(iIdFuncionario);
		
		for(int i=0;i<oAnexo3V2.GetAll(iIdFuncionario);i++){
			String vIdRenglon 			= oAnexo3V2.GetIdRenglon(i)!=-1?oAnexo3V2.GetIdRenglon(i)+"":"0";
			intContador = intContador + 1;
			if (intContador%2 == 0){	sBackColor = "#ffffff";	}
			else{						sBackColor = "#eeeeee"; }
	sArchivo = "\n		<TR align='left' bgcolor='" + sBackColor + "' onMouseOver = 'MouseDentro(this);' onMouseOut  = " + c + "MouseFuera(this,'" + sBackColor + "');" + c + ">";
	sArchivo += "\n			<TD>&nbsp;<a onmouseover=" + c + "this.style.cursor='hand'" + c + " style='cursor:normal'>";
	sArchivo += oAnexo3V2.GetClave(i)!=null? oAnexo3V2.GetClave(i) + "</a></TD>":"</a></TD>";
	sArchivo += "\n			<TD>&nbsp;<a onmouseover=" + c + "this.style.cursor='hand'" + c + " style='cursor:normal'>";
	sArchivo += oAnexo3V2.GetNumFactura(i)!=null? oAnexo3V2.GetNumFactura(i) + "</a></TD>":"</a></TD>";
	sArchivo += "\n			<TD>&nbsp;<a onmouseover=" + c + "this.style.cursor='hand'" + c + " style='cursor:normal'>";
	sArchivo += oAnexo3V2.GetFecha(i)!=null? oAnexo3V2.GetFecha(i) + "</a></TD>":"</a></TD>";
	sArchivo += "\n			<TD>&nbsp;<a onmouseover=" + c + "this.style.cursor='hand'" + c + " style='cursor:normal'>";
	sArchivo += oAnexo3V2.GetConcepto(i)!=null?oAnexo3V2.GetConcepto(i):"" + "</a></TD>";
	sArchivo += "\n			<TD align='right'>&nbsp;<a onmouseover=" + c + "this.style.cursor='hand'" + c + " style='cursor:normal'>" + FormatoDecimal.format(new Float(oAnexo3V2.GetImporte(i)!=null?oAnexo3V2.GetImporte(i):"0")) + "</a></TD>";
	sArchivo += "\n			<TD>&nbsp;<a onmouseover=" + c + "this.style.cursor='hand'" + c + " style='cursor:normal'>" + oAnexo3V2.GetDesTipo(oAnexo3V2.GetTipoPos(oAnexo3V2.GetTipo(i))) + "</a></TD>";
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
