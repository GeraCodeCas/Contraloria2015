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
if (oArchivo.AbreArchivo(sRutaHistoria,"fAnexo2IV1.html") && oArchivowa.AbreArchivo(sRutaAttach,"fAnexo2IV1.html")){
	sAnexo 						= "II.4.1";
	Anexo2IV1 oAnexo2IV1 	= new Anexo2IV1();
	DetalleAnexo2IV1 oDetalleAnexo2IV1 	= new DetalleAnexo2IV1();
	iIdAnexo 					= oAnexo2IV1.GetIdAnexo();
	oAnexoEstatus.Get(iIdFuncionario, iIdAnexo);
	sEstatus 					= oAnexoEstatus.GetEstatus();
	sAux = "\n				<tr><TD colspan='3' class='TituloParrafo' width='100%'>ANEXO II.4.1 - DETALLE DE LA SITUACIÓN DE BANCOS</TD></tr>" + sSalto;
%>
				<%@include file="HeaderAnexoHistorico.jsp"%>
<%
	sArchivo = "	<TABLE cellPadding='0' cellSpacing='0' width='100%' BORDER='1' BORDERCOLOR='white'>" + sSalto;
	sArchivo += "		<TR align='middle'>" + sSalto;
	sArchivo += "			<td class='TituloMenu'>No. Cuenta</TD>" + sSalto;
	sArchivo += "			<td class='TituloMenu'>Nombre de la Institución</TD>" + sSalto;
	sArchivo += "			<td class='TituloMenu' width='100%' height='100%'>" + sSalto;
	sArchivo += "					<table cellPadding='0' cellSpacing='0' width='100%'  height='100%'> " + sSalto;
	sArchivo += "						<tr align='middle'><td class='TituloMenu' colspan='2'>Saldo Según</td></tr>" + sSalto;
	sArchivo += "						<tr align='middle' ><td width='50%' class='TituloMenu'>Chequera</td><td width='50%' class='TituloMenu'>Banco</td></tr>" + sSalto;
	sArchivo += "					</table></TD>" + sSalto;
	sArchivo += "			<td class='TituloMenu' width='100%' height='100%'>" + sSalto;
	sArchivo += "					<table cellPadding='0' cellSpacing='0' width='100%'  height='100%'> " + sSalto;
	sArchivo += "						<tr align='middle'><td class='TituloMenu' colspan='2'>Relación de Talonarios/Póliza</td></tr>" + sSalto;
	sArchivo += "						<tr align='middle' ><td width='50%' class='TituloMenu'>Inicial</td>" + sSalto;
	sArchivo += "					<td width='50%' class='TituloMenu'>Final</td></tr>" + sSalto;
	sArchivo += "					</table></TD>" + sSalto;
	sArchivo += "			<td class='TituloMenu' width='300' height='100%'>" + sSalto;
	sArchivo += "					<table cellPadding='0' cellSpacing='0' width='300'  height='100%'> " + sSalto;
	sArchivo += "						<tr align='middle'><td class='TituloMenu' colspan='3'>Último Cheque Expedido por cada Chequera</td></tr>" + sSalto;
	sArchivo += "						<tr align='middle' ><td class='TituloMenu' width='30%'>Número</td>" + sSalto;
	sArchivo += "						<td class='TituloMenu' width='40%'>Fecha</td>" + sSalto;
	sArchivo += "						<td class='TituloMenu' width='30%'>Importe</td></tr>" + sSalto;
	sArchivo += "					</table></TD>" + sSalto;
	sArchivo += "		</TR>" + sSalto;
	oArchivo.Escribe(sArchivo);
	oArchivowa.Escribe(sArchivo);
	sArchivo = "";
	if(!sEstatus.equals("0")){
		int intContador = 0;
		String sBackColor = "";
		oAnexo2IV1.GetAll(iIdFuncionario);
		for(int i=0;i<oAnexo2IV1.GetAll(iIdFuncionario);i++){
			String vIdRenglon=oAnexo2IV1.GetIdRenglon(i)!=-1?oAnexo2IV1.GetIdRenglon(i)+"":"0";
			String vNoCuenta= oAnexo2IV1.GetNoCuenta(i)!=null?oAnexo2IV1.GetNoCuenta(i):"";
			String vNombre 	= oAnexo2IV1.GetNombre(i)!=null?oAnexo2IV1.GetNombre(i):"";
			String vChequera= oAnexo2IV1.GetChequera(i)!=null?oAnexo2IV1.GetChequera(i):"";
			String vBanco 	= oAnexo2IV1.GetBanco(i)!=null?oAnexo2IV1.GetBanco(i):"";
			String vInicial = oAnexo2IV1.GetInicial(i)!=null?oAnexo2IV1.GetInicial(i):"";
			String vFinal 	= oAnexo2IV1.GetFinal(i)!=null?oAnexo2IV1.GetFinal(i):"";
			String vNumero	= oAnexo2IV1.GetNumero(i)!=null?oAnexo2IV1.GetNumero(i):"";
			String vFecha 	= oAnexo2IV1.GetFecha(i)!=null?oAnexo2IV1.GetFecha(i):"";
			String vImporte = oAnexo2IV1.GetImporte(i)!=null?oAnexo2IV1.GetImporte(i):"";
			intContador = intContador + 1;
			if (intContador%2 == 0)	{sBackColor = "#ffffff";}
			else					{sBackColor = "#eeeeee";}
			sArchivo = "		<TR align='left' bgcolor='" + sBackColor + "' " + sSalto;
			sArchivo += "			onMouseOver = 'MouseDentro(this);'" + sSalto;
			sArchivo += "			onMouseOut  = " + c + "MouseFuera(this,'" + sBackColor + "');" + c + ">" + sSalto;
			sArchivo += "			<TD>&nbsp;<a onmouseover=" + c + "this.style.cursor='hand'" + c + " style='cursor:normal'>" + vNoCuenta + "</a></TD>" + sSalto;
			sArchivo += "			<TD>&nbsp;<a onmouseover=" + c + "this.style.cursor='hand'" + c + " style='cursor:normal'>" + vNombre + "</a></TD>" + sSalto;
			sArchivo += "			<TD><table cellPadding='0' cellSpacing='0' width='100%'> " + sSalto;
			sArchivo += "						<tr align='middle'>" + sSalto;
			sArchivo += "							<td width='50%'>&nbsp;<a onmouseover=" + c + "this.style.cursor='hand'" + c + " style='cursor:normal'>" + FormatoDecimal.format(new Float(!vChequera.equals("")?vChequera:"0")) + "</a></td>" + sSalto;
			sArchivo += "							<td width='50%'>&nbsp;<a onmouseover=" + c + "this.style.cursor='hand'" + c + " style='cursor:normal'>" + FormatoDecimal.format(new Float(!vBanco.equals("")?vBanco:"0")) + "</a></td>" + sSalto;
			sArchivo += "						</tr>" + sSalto;
			sArchivo += "					</table></TD>" + sSalto;
			sArchivo += "			<TD><table cellPadding='0' cellSpacing='0' width='100%'> " + sSalto;
			sArchivo += "						<tr align='middle'>" + sSalto;
			sArchivo += "							<td width='50%'>&nbsp;<a onmouseover=" + c + "this.style.cursor='hand'" + c + " style='cursor:normal'>" + vInicial + "</a></td>" + sSalto;
			sArchivo += "							<td width='50%'>&nbsp;<a onmouseover=" + c + "this.style.cursor='hand'" + c + " style='cursor:normal'>" + vFinal + "</a></td>" + sSalto;
			sArchivo += "						</tr>" + sSalto;
			sArchivo += "					</table></TD>" + sSalto;
			sArchivo += "			<TD><table cellPadding='0' cellSpacing='0' width='100%'> " + sSalto;
			sArchivo += "						<tr align='middle'>" + sSalto;
			sArchivo += "							<td width='33%'>&nbsp;<a onmouseover=" + c + "this.style.cursor='hand'" + c + " style='cursor:normal'>" + vNumero + "</a></td>" + sSalto;
			sArchivo += "							<td width='33%'>&nbsp;<a onmouseover=" + c + "this.style.cursor='hand'" + c + " style='cursor:normal'>" + vFecha + "</a></td>" + sSalto;
			sArchivo += "							<td width='33%' align='right'>&nbsp;<a onmouseover=" + c + "this.style.cursor='hand'" + c + " style='cursor:normal'>" + FormatoDecimal.format(new Float(!vImporte.equals("")?vImporte:"0")) + "</a></td>" + sSalto;
			sArchivo += "						</tr>" + sSalto;
			sArchivo += "					</table></TD>" + sSalto;
			sArchivo += "		</TR>" + sSalto;
			oArchivo.Escribe(sArchivo);
			oArchivowa.Escribe(sArchivo);
			sArchivo = "";
		}
		sArchivo = "	</TABLE>" + sSalto;
		sArchivo += "<br>" + sSalto;
		sArchivo += "<TABLE cellPadding='0' cellSpacing='0' width='80%' BORDER='0' align='center'>" + sSalto;
		sArchivo += "		<tr>" + sSalto;
		sArchivo += "			<td width='50%' valign='top' align='center'>" + sSalto;
		sArchivo += "				<TABLE cellPadding='0' cellSpacing='0' width='90%' BORDER='1' BORDERCOLOR='white'>" + sSalto;
		sArchivo += "					<TR align='middle'><td class='TituloMenu' colspan='4'>Firmas Registradas</TD></TR>" + sSalto;
		sArchivo += "					<TR align='middle'><td class='TituloMenu'>NoCuenta</TD><td class='TituloMenu'>Cargo</TD></TR>" + sSalto;
		oArchivo.Escribe(sArchivo);
		oArchivowa.Escribe(sArchivo);
		sArchivo = "";
		
		intContador = 0;
		sBackColor = "";	
		oDetalleAnexo2IV1.GetAll(iIdFuncionario);
		for(int i=0;i<oDetalleAnexo2IV1.GetAll(iIdFuncionario);i++){
			String vIdRenglonDetalle= oDetalleAnexo2IV1.GetIdRenglon(i)!=-1?oDetalleAnexo2IV1.GetIdRenglon(i)+"":"0";
			String vNombreFirma = oDetalleAnexo2IV1.GetNombreFirma(i)!=null?oDetalleAnexo2IV1.GetNombreFirma(i):"";
			String vCargo = oDetalleAnexo2IV1.GetCargo(i)!=null?oDetalleAnexo2IV1.GetCargo(i):"";
			intContador = intContador + 1;
			if (intContador%2 == 0)	{sBackColor = "#ffffff";}
			else			{sBackColor = "#eeeeee";}
			sArchivo = "	<TR align='left' bgcolor='" + sBackColor + "' " + sSalto;
			sArchivo += "		onMouseOver = 'MouseDentro(this);'" + sSalto;
			sArchivo += "		onMouseOut  = " + c + "MouseFuera(this,'" + sBackColor + "');" + c + ">" + sSalto;
			sArchivo += "		<TD width='50%' align='center'>&nbsp;<a onmouseover=" + c + "this.style.cursor='hand'" + c + " style='cursor:normal'>" + vNombreFirma + "</a></TD>" + sSalto;
			sArchivo += "		<TD width='50%' align='center'>&nbsp;<a onmouseover=" + c + "this.style.cursor='hand'" + c + " style='cursor:normal'>" + vCargo + "</a></TD>" + sSalto;
			sArchivo += "	</TR>" + sSalto;
			oArchivo.Escribe(sArchivo);
			oArchivowa.Escribe(sArchivo);
			sArchivo = "";
		}
		sArchivo = "	</TABLE></td>" + sSalto;
		sArchivo += "	<td align='center' width='50%' valign='top'>" + sSalto;
		oAnexoEstatus.Get(iIdFuncionario, iIdAnexo);
		String vChequesSinEntregar 		= oAnexoEstatus.GetObservacion()!=null?oAnexoEstatus.GetObservacion():"";
		sArchivo += "	<TABLE cellPadding='0' cellSpacing='0' width='50%' BORDER='1' BORDERCOLOR='white'>" + sSalto;
		sArchivo += "		<TR align='middle'><td class='TituloMenu' colspan='2'><a onmouseover=" + c + "this.style.cursor='hand'" + c + " style='cursor:normal'>Cantidad de Cheques sin Entregar</a></TD></TR>" + sSalto;
	   	sBackColor = "#ffffff";
		sArchivo += "		<TR align='left' bgcolor='" + sBackColor + "'>" + sSalto;
		sArchivo += "			<TD align='center'>&nbsp;<a onmouseover=" + c + "this.style.cursor='hand'" + c + " style='cursor:normal'><INPUT readonly style='BORDER:0;background-color: transparent;CURSOR:HAND;text-align:center' class='txtNumeric' name='sChequesSinEntregar' id='sChequesSinEntregar' type='Text' size='10' value='" + vChequesSinEntregar + "'></a></TD></TR>" + sSalto;
		sArchivo += "	</TABLE></td>" + sSalto;
		sArchivo += "	</tr>" + sSalto;
		sArchivo += "	</table><br>" + sSalto;
		oArchivo.Escribe(sArchivo);
		oArchivowa.Escribe(sArchivo);
		sArchivo = "";
	} else {
		sArchivo += "	<TABLE width='100%'>" + sSalto;
		sArchivo += "		<TR><TD align='center'><H1 style='size=+2'><br>ESTE ANEXO NO APLICA</H1></TD></TR>" + sSalto;
		sArchivo += "	</TABLE>" + sSalto;
		oArchivo.Escribe(sArchivo);
		oArchivowa.Escribe(sArchivo);
		sArchivo = "";
	}
	sArchivo += "\n</td>" + sSalto;
	sArchivo += "\n</tr>" + sSalto;
	sArchivo += "\n</table>" + sSalto;
	sArchivo += "\n</body>" + sSalto;
	sArchivo += "\n</html>" + sSalto;
	oArchivo.Escribe(sArchivo);
	oArchivowa.Escribe(sArchivo);
	oArchivo.CierraArchivo();
	oArchivowa.CierraArchivo();
}else{
	out.println("Error");
}
%>

