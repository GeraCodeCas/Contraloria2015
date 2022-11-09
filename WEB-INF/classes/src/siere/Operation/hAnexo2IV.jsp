<%
/*********************************************************************************************************
Nombre:		Anexo 2.4
Elaboro:	Jesus Manuel Limon Mireles
Lugar:		Monterrey, NL, Mexico
Fecha:		3.Ene.2003
Compañia:	CONSISS
*********************************************************************************************************/
%>
<%
if (oArchivo.AbreArchivo(sRutaHistoria,"fAnexo2IV.html") && oArchivowa.AbreArchivo(sRutaAttach,"fAnexo2IV.html")){
	sAnexo 						= "II.4";
	Anexo2IV oAnexo2IV 			= new Anexo2IV();
	iIdAnexo 					= oAnexo2IV.GetIdAnexo();
	oAnexoEstatus.Get(iIdFuncionario, iIdAnexo);
	sEstatus 					= oAnexoEstatus.GetEstatus();
	sAux = "\n				<tr><TD  colspan='3' class='TituloParrafo' width='70%'>ANEXO II.4 - RELACIÓN DE CUENTAS BANCARIAS, INVERSIONES, DEPÓSITOS, TÍTULOS O CUALQUIER OTRO CONTRATO CON INSTITUCIONES DE CRÉDITO, CASAS DE BOLSA U OTRA INSTITUCIÓN SIMILAR</TD></tr>";
%>
				<%@include file="HeaderAnexoHistorico.jsp"%>
<%
	sArchivo = "\n	<TABLE cellPadding='0' cellSpacing='0' width='100%' BORDER='1' BORDERCOLOR='white'>";
	sArchivo += "\n		<TR align='middle'><td class='TituloMenu'>Nombre de la Institución</TD><td class='TituloMenu'>No. de Cuenta o Contrato</TD><td class='TituloMenu'>Tipo de Inversion</TD><td class='TituloMenu'>Saldo $</TD>	<td class='TituloMenu'>Fecha de Vencimiento</TD></TR>";
	oArchivo.Escribe(sArchivo);
	oArchivowa.Escribe(sArchivo);

		if(!sEstatus.equals("0")){
			int intContador = 0;
			String sBackColor = "";
			oAnexo2IV.GetAll(iIdFuncionario);
		for(int i=0;i<oAnexo2IV.GetAll(iIdFuncionario);i++){
		    String vIdRenglon 				= oAnexo2IV.GetIdRenglon(i)!=-1?oAnexo2IV.GetIdRenglon(i)+"":"0";
			String vNombreInstitucion 			= oAnexo2IV.GetNombreInstitucion(i)!=null?oAnexo2IV.GetNombreInstitucion(i):"";
			String vNoCuenta 					= oAnexo2IV.GetNoCuenta(i)!=null?oAnexo2IV.GetNoCuenta(i):"";
			String vTipoInversion 		= oAnexo2IV.GetTipoInversion(i)!=null?oAnexo2IV.GetTipoInversion(i):"";
			String vSaldo 					= oAnexo2IV.GetSaldo(i)!=null?oAnexo2IV.GetSaldo(i):"";
			String vFechaVencimiento		  				= oAnexo2IV.GetFechaVencimiento(i)!=null?oAnexo2IV.GetFechaVencimiento(i):"";

			intContador = intContador + 1;
		 if (intContador%2 == 0){
					sBackColor = "#ffffff";
				}else{
					sBackColor = "#eeeeee";
			  }
	sArchivo = "\n		<TR align='left' bgcolor='" + sBackColor + "' ";
	sArchivo += "\n			onMouseOver = 'MouseDentro(this);'";
	sArchivo += "\n			onMouseOut  = " + c + "MouseFuera(this,'" + sBackColor + "');" + c + ">";
	sArchivo += "\n			<TD>&nbsp;<a onmouseover=" + c + "this.style.cursor='hand'" + c + " style='cursor:normal'>" + vNombreInstitucion + "</a></TD>";
	sArchivo += "\n			<TD >&nbsp;<a onmouseover=" + c + "this.style.cursor='hand'" + c + " style='cursor:normal'>" + vNoCuenta + "</a></TD>";
	sArchivo += "\n			<TD >&nbsp;<a onmouseover=" + c + "this.style.cursor='hand'" + c + " style='cursor:normal'>" + vTipoInversion + "</a></TD>";
	sArchivo += "\n			<TD align='right'>&nbsp;<a onmouseover=" + c + "this.style.cursor='hand'" + c + " style='cursor:normal'>" + FormatoDecimal.format(new Float(!vSaldo.equals("")?vSaldo:"0")) + "</a>&nbsp;&nbsp;</TD>";
	sArchivo += "\n			<TD align='center'>&nbsp;<a onmouseover=" + c + "this.style.cursor='hand'" + c + " style='cursor:normal'>" + vFechaVencimiento + "</a></TD>";
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
