<%
/*********************************************************************************************************
Nombre:		Anexo 3.12
Elaboro:	Jesus Manuel Limon Mireles
Lugar:		Monterrey, NL, Mexico
Fecha:		7.Ene.2003
Compañia:	CONSISS
*********************************************************************************************************/
%>
<%
if (oArchivo.AbreArchivo(sRutaHistoria,"fAnexo3XII.html") && oArchivowa.AbreArchivo(sRutaAttach,"fAnexo3XII.html")){
	sAnexo 					= "III.12";
	Anexo3XII oAnexo		= new Anexo3XII();
	iIdAnexo 				= oAnexo.GetIdAnexo();
	oAnexoEstatus.Get(iIdFuncionario, iIdAnexo);
	sEstatus 				= oAnexoEstatus.GetEstatus();
	int 	sIdTipoOrigen	= 0;
	sAux = "\n				<tr><TD class='TituloParrafo' width='70%'>&nbsp;&nbsp;ANEXO III.12 - RELACIÓN DE ANTICIPOS DE OBRAS POR AMORTIZAR&nbsp;&nbsp;</TD></tr>";
%>
				<%@include file="HeaderAnexoHistorico.jsp"%>
<%
	sArchivo = "\n	<TABLE cellPadding='0' cellSpacing='0' width='100%' BORDER='1' BORDERCOLOR='white'>";
	sArchivo += "\n		<TR align='middle'>";
	sArchivo += "\n			<td class='TituloMenu'>Clave</TD>";
	sArchivo += "\n			<td class='TituloMenu'>Obra</TD>";
	sArchivo += "\n			<td class='TituloMenu'>No Contrato</TD>";
	sArchivo += "\n			<td class='TituloMenu'>Nombre del Contratista</TD>";
	sArchivo += "\n			<td class='TituloMenu'>Costo Total</TD>";
	sArchivo += "\n			<td class='TituloMenu' colspan='2' width='100%' height='100%'><table cellPadding='0' cellSpacing='0' width='100%'  height='100%'> ";
	sArchivo += "\n									<tr align='middle'><td class='TituloMenu' colspan='2'>Importe</td></tr>";
	sArchivo += "\n									<tr align='middle' ><td width='50%' class='TituloMenu'>Anticipos Otorgados</td><td width='50%' class='TituloMenu'>Anticipos Amortizados</td></tr>";
	sArchivo += "\n									</table></td>";
	sArchivo += "\n			<td class='TituloMenu'>Saldo Anticipo por Amortizar</TD>";
	sArchivo += "\n			<td class='TituloMenu'>Observaciones</TD>";
	sArchivo += "\n		</TR>";
	oArchivo.Escribe(sArchivo);
	oArchivowa.Escribe(sArchivo);
if(!sEstatus.equals("0")){
		int vAntTipoOrigen=0;
		int intContador = 0;
		String sBackColor = "";
		oAnexo.GetAll(iIdFuncionario,sIdTipoOrigen);
		for(int i=0;i<oAnexo.GetAll(iIdFuncionario,sIdTipoOrigen);i++){
			int 	iIdRenglon				= oAnexo.GetIdRenglon(i)!=-1?				oAnexo.GetIdRenglon(i):0;
			String 	sClave					= oAnexo.GetClave(i)!=null?					oAnexo.GetClave(i)+"":"";
			String 	sNombreContratista		= oAnexo.GetNombreContratista(i)!=null?		oAnexo.GetNombreContratista(i)+"":"";
			String 	sObra					= oAnexo.GetObra(i)!=null?					oAnexo.GetObra(i)+"":"";
			String 	iNoContrato				= oAnexo.GetNoContrato(i)!=null?			oAnexo.GetNoContrato(i):"";
			String	fCostoTotal				= oAnexo.GetCostoTotal(i)!=null?			oAnexo.GetCostoTotal(i):"";
			String	fAnticipoOtorgado		= oAnexo.GetAnticipoOtorgado(i)!=null?		oAnexo.GetAnticipoOtorgado(i):"";
			String 	fAnticipoAmortizado 	= oAnexo.GetAnticipoAmortizado(i)!=null?	oAnexo.GetAnticipoAmortizado(i):"";
			String 	fSaldoAnticipoAmortizar = oAnexo.GetSaldoAnticipoAmortizar(i)!=null?oAnexo.GetSaldoAnticipoAmortizar(i):"0";
			String 	sObservaciones 			= oAnexo.GetObservacion(i)!=null?			oAnexo.GetObservacion(i):"";
			int 	iTipoOrigen		 		= oAnexo.GetTipoOrigen(i)!=-1?				oAnexo.GetTipoOrigen(i):0;
			String 	sTipoOrigen		 		= oAnexo.GetTipoOrigenDescripcion(i);
			intContador = intContador + 1;
			if(intContador%2 == 0){
				sBackColor = "#ffffff";
			}else{
				sBackColor = "#eeeeee";
			}
			if (sIdTipoOrigen==0){
				if(vAntTipoOrigen!=iTipoOrigen ){
	sArchivo = "\n					<TR bgcolor='#A9A374' align='middle'>";
	sArchivo += "\n	        			<TD colspan='2'></TD><TD colspan='11'>" + sTipoOrigen + "<TD>";
	sArchivo += "\n					</tr>";
	oArchivo.Escribe(sArchivo);
	oArchivowa.Escribe(sArchivo);
				}
				vAntTipoOrigen=iTipoOrigen;
			}
	sArchivo = "\n		<TR align='left' bgcolor='" + sBackColor + "'";
	sArchivo += "\n			onMouseOver = 'MouseDentro(this);'";
	sArchivo += "\n			onMouseOut  = " + c + "MouseFuera(this,'" + sBackColor + "');" + c + ">";
	sArchivo += "\n			<TD>&nbsp;<a onmouseover=" + c + "this.style.cursor='hand'" + c + "  style='cursor:normal'>" + sClave + "</a></TD>";
	sArchivo += "\n			<TD>&nbsp;<a onmouseover=" + c + "this.style.cursor='hand'" + c + "  style='cursor:normal'>" + sObra + "</a></TD>";
	sArchivo += "\n			<TD align='right'><a onmouseover=" + c + "this.style.cursor='hand'" + c + "  style='cursor:normal'>" + iNoContrato + "&nbsp;</a></TD>";
	sArchivo += "\n			<TD >&nbsp;<a onmouseover=" + c + "this.style.cursor='hand'" + c + "  style='cursor:normal'>" + sNombreContratista + "</a></TD>";
	sArchivo += "\n			<TD align='right'><a onmouseover=" + c + "this.style.cursor='hand'" + c + "  style='cursor:normal'>" + FormatoDecimal.format(java.lang.Double.parseDouble(fCostoTotal)) + "&nbsp;</a></TD>";
	sArchivo += "\n			<TD align='right'><a onmouseover=" + c + "this.style.cursor='hand'" + c + "  style='cursor:normal'>" + FormatoDecimal.format(java.lang.Double.parseDouble(fAnticipoOtorgado)) + "&nbsp;</a></TD>";
	sArchivo += "\n			<TD align='right'><a onmouseover=" + c + "this.style.cursor='hand'" + c + "  style='cursor:normal'>" + FormatoDecimal.format(java.lang.Double.parseDouble(fAnticipoAmortizado)) + "&nbsp;</a></TD>";
	sArchivo += "\n			<TD align='right'><a onmouseover=" + c + "this.style.cursor='hand'" + c + "  style='cursor:normal'>" + FormatoDecimal.format(java.lang.Double.parseDouble(fSaldoAnticipoAmortizar)) + "&nbsp;</a></TD>";
	sArchivo += "\n			<TD >&nbsp;<a onmouseover=" + c + "this.style.cursor='hand'" + c + "  style='cursor:normal'>" + sObservaciones + "</a></TD>";
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

