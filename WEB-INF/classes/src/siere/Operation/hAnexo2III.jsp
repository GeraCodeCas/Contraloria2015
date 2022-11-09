<%
/*********************************************************************************************************
Nombre:		Anexo 2.3
Elaboro:	Jesus Manuel Limon Mireles
Lugar:		Monterrey, NL, Mexico
Fecha:		3.Ene.2003
Compañia:	CONSISS
*********************************************************************************************************/
%>
<%
if (oArchivo.AbreArchivo(sRutaHistoria,"fAnexo2III.html") && oArchivowa.AbreArchivo(sRutaAttach,"fAnexo2III.html")){
	sAnexo 								= "II.3";
	Anexo2III oAnexo2III 	= new Anexo2III();
	iIdAnexo 							= oAnexo2III.GetIdAnexo();
	oAnexoEstatus.Get(iIdFuncionario, iIdAnexo);
	sEstatus 							= oAnexoEstatus.GetEstatus();
	sAux = "\n				<tr><TD  colspan='3' class='TituloParrafo' width='70%'>ANEXO II.3 - RELACIÓN DE GASTOS PENDIENTES DE COMPROBAR</TD></tr>";
%>
				<%@include file="HeaderAnexoHistorico.jsp"%>
<%
	sArchivo = "\n	<TABLE cellPadding='0' cellSpacing='0' width='100%' BORDER='1' BORDERCOLOR='white'>";
	sArchivo += "\n		<TR align='middle'><td class='TituloMenu'>No. de Oficio</TD><td class='TituloMenu'>Fecha</TD><td class='TituloMenu'>Concepto</TD><td class='TituloMenu'>Importe Pendiente de Comprobar</TD><td class='TituloMenu'>Observaciones</TD></TR>";
	oArchivo.Escribe(sArchivo);
	oArchivowa.Escribe(sArchivo);

		if(!sEstatus.equals("0")){
			int intContador = 0;
			String sBackColor = "";
			oAnexo2III.GetAll(iIdFuncionario);
		for(int i=0;i<oAnexo2III.GetAll(iIdFuncionario);i++){
		  String vIdRenglon 				= oAnexo2III.GetIdRenglon(i)!=-1?oAnexo2III.GetIdRenglon(i)+"":"0";
			String vNumeroOficio 			= oAnexo2III.GetNumeroOficio(i)!=null?oAnexo2III.GetNumeroOficio(i):"";
			String vFecha		  				= oAnexo2III.GetFecha(i)!=null?oAnexo2III.GetFecha(i):"";
			String vConcepto 					= oAnexo2III.GetConcepto(i)!=null?oAnexo2III.GetConcepto(i):"";
			String vImporte 					= oAnexo2III.GetImporte(i)!=null?oAnexo2III.GetImporte(i):"";
			String vObservaciones 		= oAnexo2III.GetObservaciones(i)!=null?oAnexo2III.GetObservaciones(i):"";

			intContador = intContador + 1;
		 if (intContador%2 == 0){
					sBackColor = "#ffffff";
				}else{
					sBackColor = "#eeeeee";
			  }
	sArchivo = "\n		<TR align='left' bgcolor='" + sBackColor + "' ";
	sArchivo += "\n			onMouseOver = 'MouseDentro(this);'";
	sArchivo += "\n			onMouseOut  = " + c + "MouseFuera(this,'" + sBackColor + "');" + c + ">";
	sArchivo += "\n			<TD>&nbsp;<a onmouseover=" + c + "this.style.cursor='hand'" + c + " style='cursor:normal'>" + vNumeroOficio + "</a></TD>";
	sArchivo += "\n			<TD>&nbsp;<a onmouseover=" + c + "this.style.cursor='hand'" + c + " style='cursor:normal'>" + vFecha + "</a></TD>";
	sArchivo += "\n			<TD >&nbsp;<a onmouseover=" + c + "this.style.cursor='hand'" + c + " style='cursor:normal'>" + vConcepto + "</a></TD>";
	sArchivo += "\n			<TD align='right'>&nbsp;<a onmouseover=" + c + "this.style.cursor='hand'" + c + " style='cursor:normal'>" + FormatoDecimal.format(new Float(!vImporte.equals("")?vImporte:"0")) + "</a>&nbsp;&nbsp;</TD>";
	sArchivo += "\n			<TD >&nbsp;<a onmouseover=" + c + "this.style.cursor='hand'" + c + " style='cursor:normal'>" + vObservaciones + "</a></TD>";
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
