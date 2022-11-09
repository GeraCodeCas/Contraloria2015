<%
/*********************************************************************************************************
Nombre:		Anexo 3.4.1
Elaboro:	Jesus Manuel Limon Mireles
Lugar:		Monterrey, NL, Mexico
Fecha:		6.Ene.2003
Compañia:	CONSISS
*********************************************************************************************************/
%>
<%
if (oArchivo.AbreArchivo(sRutaHistoria,"fAnexo3IV1.html") && oArchivowa.AbreArchivo(sRutaAttach,"fAnexo3IV1.html")){
	sAnexo 					= "III.4.1";
	Anexo3IV1 oAnexo3IV1 	= new Anexo3IV1();
	iIdAnexo 				= oAnexo3IV1.GetIdAnexo();
	oAnexoEstatus.Get(iIdFuncionario, iIdAnexo);
	sEstatus 				= oAnexoEstatus.GetEstatus();
	sAux = "\n				<tr><td colspan='3' class='TituloParrafo' width='100%'>ANEXO III.4.1 - PLANTILLA DE PERSONAL</td></tr>";
%>
	<%@include file="HeaderAnexoHistorico.jsp"%>
<%
	sArchivo = "\n	<TABLE cellPadding='0' cellSpacing='0' width='100%' BORDER='1' BORDERCOLOR='white'>";
	sArchivo += "\n		<TR align='middle'>";
	sArchivo += "\n			<td class='TituloMenu'>Nombre</td>";
	sArchivo += "\n			<td class='TituloMenu'>Puesto</td>";
	sArchivo += "\n			<td class='TituloMenu'>Categoria</td>";
	sArchivo += "\n			<td class='TituloMenu'>Adscripción</td>";
	sArchivo += "\n			<td class='TituloMenu' width='100%' height='100%'>";
	sArchivo += "\n			     <table cellPadding='0' cellSpacing='0' width='100%'  height='100%'> ";
	sArchivo += "\n						<tr align='middle'>";
	sArchivo += "\n						 <td class='TituloMenu' colspan='3'>Tipo de Plaza</td>";
	sArchivo += "\n						</tr>";
	sArchivo += "\n						<tr align='middle' >";
	sArchivo += "\n						 <td width='33%' class='TituloMenu'>Base</td>";
	sArchivo += "\n						 <td width='34%' class='TituloMenu'>Extr.</td>";
	sArchivo += "\n						 <td width='33%' class='TituloMenu'>Event.</td>";
	sArchivo += "\n						</tr>";
	sArchivo += "\n				  </table></td>";
	sArchivo += "\n			<td class='TituloMenu' width='350' height='100%'>";
	sArchivo += "\n			     <table cellPadding='0' cellSpacing='0' width='350'  height='100%'> ";
	sArchivo += "\n						<tr align='middle'>";
	sArchivo += "\n						 <td class='TituloMenu' colspan='4'>Percepcion Mensual</td>";
	sArchivo += "\n						</tr>";
	sArchivo += "\n						<tr align='middle' >";
	sArchivo += "\n						 <td width='25%' class='TituloMenu'>Sueldo Base</td>";
	sArchivo += "\n						 <td width='25%' class='TituloMenu'>Compensación</td>";
	sArchivo += "\n						 <td width='25%' class='TituloMenu'>Otras Prestaciones</td>";
	sArchivo += "\n						 <td width='25%' class='TituloMenu'>Total</td>";
	sArchivo += "\n						</tr>";
	sArchivo += "\n				  </table></td>";
	sArchivo += "\n			<td class='TituloMenu'>Observaciones</td>  ";
	sArchivo += "\n			<td class='TituloMenu'>Tipo de Nómina</td>  ";
	sArchivo += "\n		</TR>";
	oArchivo.Escribe(sArchivo);
	oArchivowa.Escribe(sArchivo);

	if(!sEstatus.equals("0")){
		int intContador = 0;
		String sBackColor = "";
		TipoNomina oTipoNomina = new TipoNomina();
		for(int i=0;i<oAnexo3IV1.GetAll(iIdFuncionario);i++){
			String vIdRenglon 		= oAnexo3IV1.GetIdRenglon(i)!=-1?oAnexo3IV1.GetIdRenglon(i)+"":"0";
			String vPuesto 			= oAnexo3IV1.GetPuesto(i)!=null?oAnexo3IV1.GetPuesto(i):"";
			String vNombre 			= oAnexo3IV1.GetNombre(i)!=null?oAnexo3IV1.GetNombre(i):"";
			String vCategoria		= oAnexo3IV1.GetCategoria(i)!=null?oAnexo3IV1.GetCategoria(i):"";
			String vAdscripcion		= oAnexo3IV1.GetAdscripcion(i)!=null?oAnexo3IV1.GetAdscripcion(i):"";
			String vTipoPlaza		= oAnexo3IV1.GetTipoPlaza(i)!=null?oAnexo3IV1.GetTipoPlaza(i):"";
			String vSueldoBase 		= oAnexo3IV1.GetSueldoBase(i)!=null?oAnexo3IV1.GetSueldoBase(i):"";
			String vCompensacion	= oAnexo3IV1.GetCompensacion(i)!=null?oAnexo3IV1.GetCompensacion(i):"";
			String vOtrasPrestaciones=oAnexo3IV1.GetOtrasPrestaciones(i)!=null?oAnexo3IV1.GetOtrasPrestaciones(i):"";
			String vTotal 			= oAnexo3IV1.GetTotal(i)!=null?oAnexo3IV1.GetTotal(i):"";
			String vObservaciones	= oAnexo3IV1.GetObservaciones(i)!=null?oAnexo3IV1.GetObservaciones(i):"";
			String vTipoNomina			= oAnexo3IV1.GetClaveTipoNomina(i);
			
			String sDescNomina = oTipoNomina.GetPosClave(vTipoNomina)>=0?oTipoNomina.GetDescripcion(oTipoNomina.GetPosClave(vTipoNomina)):"";
			
			intContador = intContador + 1;
			if (intContador%2 == 0){
				sBackColor = "#ffffff";
			}else{
				sBackColor = "#eeeeee";
			}
			sArchivo = "\n		<TR align='left' bgcolor='" + sBackColor + "'";
			sArchivo += "\n			onMouseOver = 'MouseDentro(this);'";
			sArchivo += "\n			onMouseOut  = " + c + "MouseFuera(this,'" + sBackColor + "');" + c + ">";
			sArchivo += "\n			<td>&nbsp;<a onmouseover=" + c + "this.style.cursor='hand'" + c + " style='cursor:normal' >" + vNombre + "</a></td>";
			sArchivo += "\n			<td>&nbsp;<a onmouseover=" + c + "this.style.cursor='hand'" + c + " style='cursor:normal' >" + vPuesto + "</a></td>";
			sArchivo += "\n			<td>&nbsp;<a onmouseover=" + c + "this.style.cursor='hand'" + c + " style='cursor:normal' >" + vCategoria + "</a></td>";
			sArchivo += "\n			<td>&nbsp;<a onmouseover=" + c + "this.style.cursor='hand'" + c + " style='cursor:normal' >" + vAdscripcion + "</a></td>";
			sArchivo += "\n			<td><table cellPadding='0' cellSpacing='0' width='100%'> ";
			sArchivo += "\n						<tr align='middle'>";
			sArchivo += "\n							<td width='33%' align='center'>&nbsp;<a onmouseover=" + c + "this.style.cursor='hand'" + c + " style='cursor:normal' >";
			sArchivo += (vTipoPlaza.equals("1")) ? "<img src='" + sPath + "Images/VinetaGde.gif'></a></td>":"</a></td>";
			sArchivo += "\n							<td width='34%' align='center'>&nbsp;<a onmouseover=" + c + "this.style.cursor='hand'" + c + " style='cursor:normal' >";
			sArchivo += (vTipoPlaza.equals("2")) ? "<img src='" + sPath + "Images/VinetaGde.gif'></a></td>":"</a></td>";
			sArchivo += "\n							<td width='33%' align='center'>&nbsp;<a onmouseover=" + c + "this.style.cursor='hand'" + c + " style='cursor:normal' >";
			sArchivo += (vTipoPlaza.equals("3")) ? "<img src='" + sPath + "Images/VinetaGde.gif'></a></td>":"</a></td>";
			sArchivo += "\n						</tr>";
			sArchivo += "\n					</table></td>";
			sArchivo += "\n			<td><table cellPadding='0' cellSpacing='0' width='100%'> ";
			sArchivo += "\n						<tr align='middle'>";
			sArchivo += "\n							<td width='25%' align='center'>&nbsp;<a onmouseover=" + c + "this.style.cursor='hand'" + c + " style='cursor:normal' >" + FormatoDecimal.format(new Float(!vSueldoBase.equals("")?vSueldoBase:"0")) + "</a></td>";
			sArchivo += "\n							<td width='25%' align='center'>&nbsp;<a onmouseover=" + c + "this.style.cursor='hand'" + c + " style='cursor:normal' >" + FormatoDecimal.format(new Float(!vCompensacion.equals("")?vCompensacion:"0")) + "</a></td>";
			sArchivo += "\n							<td width='25%' align='center'>&nbsp;<a onmouseover=" + c + "this.style.cursor='hand'" + c + " style='cursor:normal' >" + FormatoDecimal.format(new Float(!vOtrasPrestaciones.equals("")?vOtrasPrestaciones:"0")) + "</a></td>";
			sArchivo += "\n							<td width='25%' align='center'>&nbsp;<a onmouseover=" + c + "this.style.cursor='hand'" + c + " style='cursor:normal' >" + FormatoDecimal.format(new Float(!vTotal.equals("")?vTotal:"0")) + "</a></td>";
			sArchivo += "\n						</tr>";
			sArchivo += "\n					</table></td>";
			sArchivo += "\n			<td>&nbsp;<a onmouseover=" + c + "this.style.cursor='hand'" + c + " style='cursor:normal' >" + vObservaciones + "</a></td>";
			sArchivo += "\n			<td>&nbsp;<a onmouseover=" + c + "this.style.cursor='hand'" + c + " style='cursor:normal' >" + sDescNomina + "</a></td>";
			sArchivo += "\n		</TR>";
			oArchivo.Escribe(sArchivo);
			oArchivowa.Escribe(sArchivo);
			}
		sArchivo = "\n	</TABLE>";
		oArchivo.Escribe(sArchivo);
		oArchivowa.Escribe(sArchivo);
	} else {
		sArchivo = "\n	<TABLE width='100%'>";
		sArchivo += "\n		<TR><td align='center'><H1 style='size=+2'><br>ESTE ANEXO NO APLICA</H1></td></TR>";
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

