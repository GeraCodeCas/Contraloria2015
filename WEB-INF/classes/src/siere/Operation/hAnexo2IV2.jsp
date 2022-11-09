<%
/*********************************************************************************************************
Nombre:		Anexo 2.4.2
Elaboro:	Jesus Manuel Limon Mireles
Lugar:		Monterrey, NL, Mexico
Fecha:		3.Ene.2003
Compañia:	CONSISS
*********************************************************************************************************/
%>
<%
if (oArchivo.AbreArchivo(sRutaHistoria,"fAnexo2IV2.html") && oArchivowa.AbreArchivo(sRutaAttach,"fAnexo2IV2.html")){
	sAnexo 						= "II.4.2";
	Anexo2IV2 oAnexo2IV2 		= new Anexo2IV2();
	iIdAnexo 					= oAnexo2IV2.GetIdAnexo();
	oAnexoEstatus.Get(iIdFuncionario, iIdAnexo);
	sEstatus 					= oAnexoEstatus.GetEstatus();
	sAux = "\n				<tr><TD colspan='3' class='TituloParrafo' width='100%'>ANEXO II.4.2 - RELACIÓN DE CHEQUES EXPEDIDOS SIN ENTREGAR</TD></tr>";
%>
				<%@include file="HeaderAnexoHistorico.jsp"%>
<%
	sArchivo = "\n	<TABLE cellPadding='0' cellSpacing='0' width='100%' BORDER='1' BORDERCOLOR='white'>";
	sArchivo += "\n		<TR align='middle'><td class='TituloMenu'>Fecha</TD><td class='TituloMenu'>Número de Cuenta</TD><td class='TituloMenu'>Banco</TD><td class='TituloMenu'>Beneficiario</TD><td class='TituloMenu'>Número de Cheque</TD><td class='TituloMenu'>Importe</TD></TR>";
	oArchivo.Escribe(sArchivo);
	oArchivowa.Escribe(sArchivo);
		if(!sEstatus.equals("0")){
			int intContador = 0;
			String sBackColor = "";
			oAnexo2IV2.GetAll(iIdFuncionario);
		for(int i=0;i<oAnexo2IV2.GetAll(iIdFuncionario);i++){
		  String vIdRenglon 						= oAnexo2IV2.GetIdRenglon(i)!=-1?oAnexo2IV2.GetIdRenglon(i)+"":"0";
			String vFecha 							  = oAnexo2IV2.GetFecha(i)!=null?oAnexo2IV2.GetFecha(i):"";
			String vNoCuenta		  = oAnexo2IV2.GetNoCuenta(i)!=null?oAnexo2IV2.GetNoCuenta(i):"";
			String vBanco 				      = oAnexo2IV2.GetBanco(i)!=null?oAnexo2IV2.GetBanco(i):"";
			String vBeneficiario 					= oAnexo2IV2.GetBeneficiario(i)!=null?oAnexo2IV2.GetBeneficiario(i):"";
			String vNoCheque 					= oAnexo2IV2.GetNoCheque(i)!=null?oAnexo2IV2.GetNoCheque(i):"";
			String vImporte		            = oAnexo2IV2.GetImporte(i)!=null?oAnexo2IV2.GetImporte(i):"";

			intContador = intContador + 1;
		 if (intContador%2 == 0){
					sBackColor = "#ffffff";
				}else{
					sBackColor = "#eeeeee";
			  }
	sArchivo = "\n		<TR align='left' bgcolor='" + sBackColor + "' ";
	sArchivo += "\n			onMouseOver = 'MouseDentro(this);'";
	sArchivo += "\n			onMouseOut  = " + c + "MouseFuera(this,'" + sBackColor + "');" + c + ">";
	sArchivo += "\n			<TD>&nbsp;<a onmouseover=" + c + "this.style.cursor='hand'" + c + " style='cursor:normal'>" + vFecha + "</a></TD>";
	sArchivo += "\n			<TD align='right'>&nbsp;<a onmouseover=" + c + "this.style.cursor='hand'" + c + " style='cursor:normal'>" + vNoCuenta + "</a>&nbsp;&nbsp;</TD>";
	sArchivo += "\n			<TD align='right'>&nbsp;<a onmouseover=" + c + "this.style.cursor='hand'" + c + " style='cursor:normal'>" + vBanco + "</a>&nbsp;&nbsp;</TD>";
	sArchivo += "\n			<TD align='right'>&nbsp;<a onmouseover=" + c + "this.style.cursor='hand'" + c + " style='cursor:normal'>" + vBeneficiario + "</a>&nbsp;&nbsp;</TD>";
	sArchivo += "\n			<TD align='right'>&nbsp;<a onmouseover=" + c + "this.style.cursor='hand'" + c + " style='cursor:normal'>" + vNoCheque + "</a>&nbsp;&nbsp;</TD>";
	sArchivo += "\n			<TD align='right'>&nbsp;<a onmouseover=" + c + "this.style.cursor='hand'" + c + " style='cursor:normal'>" + FormatoDecimal.format(new Float(!vImporte.equals("")?vImporte:"0")) + "</a>&nbsp;&nbsp;</TD>";
	sArchivo += "\n		</TR>";
	oArchivo.Escribe(sArchivo);
	oArchivowa.Escribe(sArchivo);
		}
	sArchivo = "\n</TABLE>";
	sArchivo += "\n<br><br>";
	sArchivo += "\n<TABLE cellPadding='0' cellSpacing='0' width='300' BORDER='1' BORDERCOLOR='WHITE' align='left'>";
	sArchivo += "\n		<TR align='middle'>";
	sArchivo += "\n			<td class='TituloMenu'><a onmouseover=" + c + "this.style.cursor='hand'" + c + " style='cursor:normal'>Los Cheques de la presente relación son todos los que obran en poder de esta Unidad Administrativa al</a></TD>";
	sArchivo += "\n		</TR>";
	oArchivo.Escribe(sArchivo);
	oArchivowa.Escribe(sArchivo);
			oAnexoEstatus.Get(iIdFuncionario, iIdAnexo);
			String vChequesObran 		= oAnexoEstatus.GetObservacion()!=null?oAnexoEstatus.GetObservacion():"";
			sBackColor = "#ffffff";
	sArchivo = "\n		<TR align='left' bgcolor='" + sBackColor + "'>";
	sArchivo += "\n			<TD align='center'>&nbsp;<a onmouseover=" + c + "this.style.cursor='hand'" + c + " style='cursor:normal'><INPUT readonly style='BORDER:0;background-color: transparent;CURSOR:HAND;text-align:center' class='txtBox' name='sChequesObran' id='sChequesObran' type='Text' size='40' value='" + vChequesObran + "'></a></TD></tr>";
	sArchivo += "\n					</table></TD>";
	sArchivo += "\n		</TR>";
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

