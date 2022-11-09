<%
/*********************************************************************************************************
Nombre:		Anexo 2.4.3
Elaboro:	Jesus Manuel Limon Mireles
Lugar:		Monterrey, NL, Mexico
Fecha:		6.Ene.2003
Compañia:	CONSISS
*********************************************************************************************************/
%>
<%
if (oArchivo.AbreArchivo(sRutaHistoria,"fAnexo2IV3.html") && oArchivowa.AbreArchivo(sRutaAttach,"fAnexo2IV3.html")){
	sAnexo 								= "II.4.3";
	Anexo2IV3 oAnexo2IV3 				= new Anexo2IV3();
	DetalleAnexo2IV3 oDetalleAnexo2IV3 	= new DetalleAnexo2IV3();
	iIdAnexo 							= oAnexo2IV3.GetIdAnexo();
	oAnexoEstatus.Get(iIdFuncionario, iIdAnexo);
	sEstatus 							= oAnexoEstatus.GetEstatus();
	sAux = "\n				<tr><TD colspan='3' class='TituloParrafo' width='100%'>ANEXO II.4.3 - DETALLE DE CUENTAS DE INVERSIONES</TD></tr>";
%>
				<%@include file="HeaderAnexoHistorico.jsp"%>
<%
	sArchivo = "\n	<TABLE cellPadding='0' cellSpacing='0' width='100%' BORDER='1' BORDERCOLOR='white'>";
	sArchivo += "\n		<TR align='middle'><td class='TituloMenu'>Fecha</TD><td class='TituloMenu'>Número de Cuenta</TD><td class='TituloMenu'>Nombre de la Institución</TD><td class='TituloMenu'>Tipo de Inversión</TD><td class='TituloMenu'>Vencimiento</TD><td class='TituloMenu'>Saldo en Libros</TD></TR>";
	oArchivo.Escribe(sArchivo);
	oArchivowa.Escribe(sArchivo);

		if(!sEstatus.equals("0")){
			int intContador = 0;
			String sBackColor = "";
			oAnexo2IV3.GetAll(iIdFuncionario);
		for(int i=0;i<oAnexo2IV3.GetAll(iIdFuncionario);i++){
			String vIdRenglon 						= oAnexo2IV3.GetIdRenglon(i)!=-1?oAnexo2IV3.GetIdRenglon(i)+"":"0";
			String vFecha 							= oAnexo2IV3.GetFecha(i)!=null?oAnexo2IV3.GetFecha(i):"";
			String vNoCuenta 							= oAnexo2IV3.GetNoCuenta(i)!=null?oAnexo2IV3.GetNoCuenta(i):"";
			String vNombreInstitucion					= oAnexo2IV3.GetNombreInstitucion(i)!=null?oAnexo2IV3.GetNombreInstitucion(i):"";
			String vTipoInversion 				    = oAnexo2IV3.GetTipoInversion(i)!=null?oAnexo2IV3.GetTipoInversion(i):"";
			String vVencimiento 						= oAnexo2IV3.GetVencimiento(i)!=null?oAnexo2IV3.GetVencimiento(i):"";
			String vSaldo 					= oAnexo2IV3.GetSaldo(i)!=null?oAnexo2IV3.GetSaldo(i):"";
			intContador = intContador + 1;
		 if (intContador%2 == 0){
					sBackColor = "#ffffff";
				}else{
					sBackColor = "#eeeeee";
			  }
	sArchivo = "\n		<TR align='left' bgcolor='" + sBackColor + "'";
	sArchivo += "\n			onMouseOver = 'MouseDentro(this);'";
	sArchivo += "\n			onMouseOut  = "+ c + "MouseFuera(this,'" + sBackColor + "');"+ c + ">";
	sArchivo += "\n			<TD>&nbsp;<a onmouseover=" + c + "this.style.cursor='hand'"+ c + " style='cursor:normal'>" + vFecha + "</a></TD>";
	sArchivo += "\n			<TD>&nbsp;<a onmouseover=" + c + "this.style.cursor='hand'"+ c + " style='cursor:normal'>" + vNoCuenta + "</a></TD>";
	sArchivo += "\n			<TD>&nbsp;<a onmouseover=" + c + "this.style.cursor='hand'"+ c + " style='cursor:normal'>" + vNombreInstitucion + "</a></td>";
	sArchivo += "\n			<td>&nbsp;<a onmouseover=" + c + "this.style.cursor='hand'"+ c + " style='cursor:normal'>" + vTipoInversion + "</a></td>";
	sArchivo += "\n			<td>&nbsp;<a onmouseover=" + c + "this.style.cursor='hand'"+ c + " style='cursor:normal'>" + vVencimiento + "</a></td>";				
	sArchivo += "\n			<td align='right'>&nbsp;<a onmouseover=" + c + "this.style.cursor='hand'"+ c + " style='cursor:normal'>" + FormatoDecimal.format(new Float(!vSaldo.equals("")?vSaldo:"0")) + "</a>&nbsp;&nbsp;</td>";
	sArchivo += "\n		</TR>";
	oArchivo.Escribe(sArchivo);
	oArchivowa.Escribe(sArchivo);
		}
	sArchivo = "\n	</TABLE><br><br>";
	sArchivo += "\n	<TABLE cellPadding='0' cellSpacing='0' width='50%' BORDER='1' BORDERCOLOR='white'>";
	sArchivo += "\n		<TR align='middle'><td class='TituloMenu' colspan='4'>Firmas Registradas</TD></TR>";
	sArchivo += "\n		<TR align='middle'><td class='TituloMenu'>NoCuenta</TD><td class='TituloMenu'>Cargo</TD></TR>";
	oArchivo.Escribe(sArchivo);
	oArchivowa.Escribe(sArchivo);
		intContador = 0;
		sBackColor = "";	
		oDetalleAnexo2IV3.GetAll(iIdFuncionario);
		for(int i=0;i<oDetalleAnexo2IV3.GetAll(iIdFuncionario);i++){
			String vIdRenglonDetalle			= oDetalleAnexo2IV3.GetIdRenglon(i)!=-1?oDetalleAnexo2IV3.GetIdRenglon(i)+"":"0";
			String vNombreFirma 				= oDetalleAnexo2IV3.GetNombreFirma(i)!=null?oDetalleAnexo2IV3.GetNombreFirma(i):"";
			String vCargo						= oDetalleAnexo2IV3.GetCargo(i)!=null?oDetalleAnexo2IV3.GetCargo(i):"";
			intContador = intContador + 1;
		  if (intContador%2 == 0){
					sBackColor = "#ffffff";
				}else{
					sBackColor = "#eeeeee";
			}
	sArchivo = "\n		<TR align='left' bgcolor='" + sBackColor + "'";
	sArchivo += "\n			onMouseOver = 'MouseDentro(this);'";
	sArchivo += "\n			onMouseOut  = " + c + "MouseFuera(this,'" + sBackColor + "');" + c + ">";
	sArchivo += "\n			<TD width='50%' align='center'>&nbsp;<a onmouseover=" + c + "this.style.cursor='hand'" + c + " style='cursor:normal'>" + vNombreFirma + "</a></TD>";
	sArchivo += "\n			<TD width='50%' align='center'>&nbsp;<a onmouseover=" + c + "this.style.cursor='hand'" + c + " style='cursor:normal'>" + vCargo + "</a></TD>";
	sArchivo += "\n		</TR>";
	oArchivo.Escribe(sArchivo);
	oArchivowa.Escribe(sArchivo);
		}
	sArchivo = "\n	</TABLE>";
	oArchivo.Escribe(sArchivo);
	oArchivowa.Escribe(sArchivo);
} else {
	sArchivo = "\n	<TABLE width='100%'>";
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

