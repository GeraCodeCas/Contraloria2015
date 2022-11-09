<%
/*********************************************************************************************************
Nombre:		Anexo 2.6
Elaboro:	Jesus Manuel Limon Mireles
Lugar:		Monterrey, NL, Mexico
Fecha:		6.Ene.2003
Compañia:	CONSISS
*********************************************************************************************************/
%>
<%
if (oArchivo.AbreArchivo(sRutaHistoria,"fAnexo2VI.html") && oArchivowa.AbreArchivo(sRutaAttach,"fAnexo2VI.html")){
	sAnexo 					= "II.6";
	Anexo2VI oAnexo2VI 		= new Anexo2VI();
	iIdAnexo 				= oAnexo2VI.GetIdAnexo();
	oAnexoEstatus.Get(iIdFuncionario, iIdAnexo);
	sEstatus 				= oAnexoEstatus.GetEstatus();
	sAux = "\n				<tr><TD  colspan='3' class='TituloParrafo' width='70%'>ANEXO II.6 - RELACIÓN DE DOCUMENTOS Y CUENTAS POR PAGAR</TD></tr>";
%>
				<%@include file="HeaderAnexoHistorico.jsp"%>
<%
	sArchivo = "\n	<TABLE cellPadding='0' cellSpacing='0' width='100%' BORDER='1' BORDERCOLOR='white'>";
	sArchivo += "\n		<TR align='middle'><td class='TituloMenu'>Número de Documento</TD><td class='TituloMenu'>Nombre del Acreedor</TD><td class='TituloMenu'>Concepto</TD><td class='TituloMenu'>Fecha de Vencimiento</TD><td class='TituloMenu'>Importe</TD><td class='TituloMenu'>Saldo</TD></TR>";
	oArchivo.Escribe(sArchivo);
	oArchivowa.Escribe(sArchivo);
		if(!sEstatus.equals("0")){
			int intContador = 0;
			String sBackColor = "";
			oAnexo2VI.GetAll(iIdFuncionario);
		for(int i=0;i<oAnexo2VI.GetAll(iIdFuncionario);i++){
		    String vIdRenglon 				= oAnexo2VI.GetIdRenglon(i)!=-1?oAnexo2VI.GetIdRenglon(i)+"":"0";
			String vNumeroDocumento 			= oAnexo2VI.GetNumeroDocumento(i)!=null?oAnexo2VI.GetNumeroDocumento(i):"";
			String vNombreAcreedor 					= oAnexo2VI.GetNombreAcreedor(i)!=null?oAnexo2VI.GetNombreAcreedor(i):"";
			String vConcepto 		= oAnexo2VI.GetConcepto(i)!=null?oAnexo2VI.GetConcepto(i):"";
			String vFechaVencimiento		  				= oAnexo2VI.GetFechaVencimiento(i)!=null?oAnexo2VI.GetFechaVencimiento(i):"";
			String vImporte 					= oAnexo2VI.GetImporte(i)!=null?oAnexo2VI.GetImporte(i):"";
			String vSaldo 					= oAnexo2VI.GetSaldo(i)!=null?oAnexo2VI.GetSaldo(i):"";
			intContador = intContador + 1;
		 if (intContador%2 == 0){
					sBackColor = "#ffffff";
				}else{
					sBackColor = "#eeeeee";
			  }
	sArchivo = "\n		<TR align='left' bgcolor='" + sBackColor + "' ";
	sArchivo += "\n			onMouseOver = 'MouseDentro(this);'";
	sArchivo += "\n			onMouseOut  = " + c + "MouseFuera(this,'" + sBackColor + "');" + c + ">";
	sArchivo += "\n			<TD>&nbsp;<a onmouseover=" + c + "this.style.cursor='hand'" + c + " style='cursor:normal'>" + vNumeroDocumento + "</a></TD>";
	sArchivo += "\n			<TD >&nbsp;<a onmouseover=" + c + "this.style.cursor='hand'" + c + " style='cursor:normal'>" + vNombreAcreedor + "</a></TD>";
	sArchivo += "\n			<TD >&nbsp;<a onmouseover=" + c + "this.style.cursor='hand'" + c + " style='cursor:normal'>" + vConcepto + "</a></TD>";
	sArchivo += "\n			<TD align='center'>&nbsp;<a onmouseover=" + c + "this.style.cursor='hand'" + c + " style='cursor:normal'>" + vFechaVencimiento + "</a></TD>";
	sArchivo += "\n			<TD align='right'>&nbsp;<a onmouseover=" + c + "this.style.cursor='hand'" + c + " style='cursor:normal'>" + FormatoDecimal.format(new Float(!vImporte.equals("")?vImporte:"0")) + "</a>&nbsp;&nbsp;</TD>";
	sArchivo += "\n			<TD align='right'>&nbsp;<a onmouseover=" + c + "this.style.cursor='hand'" + c + " style='cursor:normal'>" + FormatoDecimal.format(new Float(!vSaldo.equals("")?vSaldo:"0")) + "</a>&nbsp;&nbsp;</TD>";
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

