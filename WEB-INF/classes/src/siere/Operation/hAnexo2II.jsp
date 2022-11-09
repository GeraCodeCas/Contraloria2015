<%
/*********************************************************************************************************
Nombre:		Anexo 2.2
Elaboro:	Jesus Manuel Limon Mireles
Lugar:		Monterrey, NL, Mexico
Fecha:		3.Ene.2003
Compañia:	CONSISS
*********************************************************************************************************/
%>
<%
if (oArchivo.AbreArchivo(sRutaHistoria,"fAnexo2II.html") && oArchivowa.AbreArchivo(sRutaAttach,"fAnexo2II.html")){
	sAnexo 								= "II.2";
	Anexo2II oAnexo2II 					= new Anexo2II();
	DetalleAnexo2II oDetalleAnexo2II 	= new DetalleAnexo2II();
	iIdAnexo 							= oAnexo2II.GetIdAnexo();
	oAnexoEstatus.Get(iIdFuncionario, iIdAnexo);
	sEstatus 							= oAnexoEstatus.GetEstatus();
	sAux = "\n				<tr><TD colspan='3' class='TituloParrafo' width='100%'>ANEXO II.2 - SITUACIÓN DE FONDOS REVOLVENTES</TD></tr>";
%>
				<%@include file="HeaderAnexoHistorico.jsp"%>
<%
	sArchivo = "\n	<TABLE cellPadding='0' cellSpacing='0' width='100%' BORDER='1' BORDERCOLOR='white'>";
	sArchivo += "\n		<TR align='middle'><td class='TituloMenu'>Departamento</TD><td class='TituloMenu'>Monto Total Fondo</TD><td class='TituloMenu'>Efectivo</TD><td class='TituloMenu'>Comprobantes</TD><td class='TituloMenu'>Vales Provisionales</TD><td class='TituloMenu'>Otros</TD><td class='TituloMenu'>Responsable del Fondo</TD></TR>";
	oArchivo.Escribe(sArchivo);
	oArchivowa.Escribe(sArchivo);
		if(!sEstatus.equals("0")){
			int intContador = 0;
			String sBackColor = "";
			oAnexo2II.GetAll(iIdFuncionario);
		for(int i=0;i<oAnexo2II.GetAll(iIdFuncionario);i++){
		  String vIdRenglon 				= oAnexo2II.GetIdRenglon(i)!=-1?oAnexo2II.GetIdRenglon(i)+"":"0";
			String vDepartamento 			= oAnexo2II.GetDepartamento(i)!=null?oAnexo2II.GetDepartamento(i):"";
			String vMontoTotal		  		= oAnexo2II.GetMontoTotal(i)!=null?oAnexo2II.GetMontoTotal(i):"";
			String vEfectivo 				= oAnexo2II.GetEfectivo(i)!=null?oAnexo2II.GetEfectivo(i):"";
			String vComprobantes 			= oAnexo2II.GetComprobantes(i)!=null?oAnexo2II.GetComprobantes(i):"";
			String vValesProvisionales 		= oAnexo2II.GetValesProvisionales(i)!=null?oAnexo2II.GetValesProvisionales(i):"";
			String vOtros		            = oAnexo2II.GetOtros(i)!=null?oAnexo2II.GetOtros(i):"";
			String vResponsableFondo 		= oAnexo2II.GetResponsableFondo(i)!=null?oAnexo2II.GetResponsableFondo(i):"";
			intContador = intContador + 1;
		 if (intContador%2 == 0){
					sBackColor = "#ffffff";
				}else{
					sBackColor = "#eeeeee";
			  }
	sArchivo = "\n		<TR align='left' bgcolor='" + sBackColor + "' ";
	sArchivo += "\n			onMouseOver = 'MouseDentro(this);'";
	sArchivo += "\n			onMouseOut  = " + c + "MouseFuera(this,'" + sBackColor + "');" + c + ">";
	sArchivo += "\n			<TD>&nbsp;<a onmouseover=" + c + "this.style.cursor='hand'" + c + " style='cursor:normal'>" + vDepartamento + "</a></TD>";
	sArchivo += "\n			<TD align='right'>&nbsp;<a onmouseover=" + c + "this.style.cursor='hand'" + c + " style='cursor:normal'>" + FormatoDecimal.format(new Float(!vMontoTotal.equals("")?vMontoTotal:"0")) + "</a>&nbsp;&nbsp;</TD>";
	sArchivo += "\n			<TD align='right'>&nbsp;<a onmouseover=" + c + "this.style.cursor='hand'" + c + " style='cursor:normal'>" + FormatoDecimal.format(new Float(!vEfectivo.equals("")?vEfectivo:"0")) + "</a>&nbsp;&nbsp;</TD>";
	sArchivo += "\n			<TD align='right'>&nbsp;<a onmouseover=" + c + "this.style.cursor='hand'" + c + " style='cursor:normal'>" + FormatoDecimal.format(new Float(!vComprobantes.equals("")?vComprobantes:"0")) + "</a>&nbsp;&nbsp;</TD>";
	sArchivo += "\n			<TD align='right'>&nbsp;<a onmouseover=" + c + "this.style.cursor='hand'" + c + " style='cursor:normal'>" + FormatoDecimal.format(new Float(!vValesProvisionales.equals("")?vValesProvisionales:"0")) + "</a>&nbsp;&nbsp;</TD>";
	sArchivo += "\n			<TD align='right'>&nbsp;<a onmouseover=" + c + "this.style.cursor='hand'" + c + " style='cursor:normal'>" + FormatoDecimal.format(new Float(!vOtros.equals("")?vOtros:"0")) + "</a>&nbsp;&nbsp;</TD>";
	sArchivo += "\n			<TD>&nbsp;<a onmouseover=" + c + "this.style.cursor='hand'" + c + " style='cursor:normal'>" + vResponsableFondo + "</a></TD>";
	sArchivo += "\n		</TR>";
	oArchivo.Escribe(sArchivo);
	oArchivowa.Escribe(sArchivo);
		}
	sArchivo = "\n</TABLE>";
	sArchivo += "\n<br><br>";
	sArchivo += "\n<TABLE cellPadding='0' cellSpacing='0' width='150' BORDER='1' BORDERCOLOR='white' align='left'>";
	sArchivo += "\n		<TR align='middle'><td class='TituloMenu'><a onmouseover=" + c + "this.style.cursor='hand'" + c + " style='cursor:normal'>Fecha Corte</a></TD></TR>";
	oArchivo.Escribe(sArchivo);
	oArchivowa.Escribe(sArchivo);

			oAnexoEstatus.Get(iIdFuncionario, iIdAnexo);
			String vFechaCorte 		= oAnexoEstatus.GetObservacion()!=null?oAnexoEstatus.GetObservacion():"";
			sBackColor = "#ffffff";

	sArchivo = "\n		<TR align='left' bgcolor='" + sBackColor + "'>";
	sArchivo += "\n			<TD align='center'>&nbsp;<a onmouseover=" + c + "this.style.cursor='hand'" + c + " style='cursor:normal'><INPUT readonly style='BORDER:0;background-color:transparent;CURSOR:HAND;text-align:center' type='text' name='sFechaCorte' id='sFechaCorte' value='" + vFechaCorte + "'></a></TD>";
	sArchivo += "\n		</tr>";
	sArchivo += "\n					</table></TD>";
	sArchivo += "\n		</TR>";
	oArchivo.Escribe(sArchivo);
	oArchivowa.Escribe(sArchivo);
} else {
	sArchivo = "\n	</TABLE>";
	sArchivo += "\n	<TABLE width='100%'>";
	sArchivo += "\n		<TR>";
	sArchivo += "\n			<TD align='center'><H1 style='size=+2'><br>ESTE ANEXO NO APLICA</H1></TD>";
	sArchivo += "\n		</TR>";
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
