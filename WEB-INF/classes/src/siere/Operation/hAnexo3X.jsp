<%
/*********************************************************************************************************
Nombre:		Anexo 3.10
Elaboro:	Jesus Manuel Limon Mireles
Lugar:		Monterrey, NL, Mexico
Fecha:		7.Ene.2003
Compañia:	CONSISS
*********************************************************************************************************/
%>
<%
if (oArchivo.AbreArchivo(sRutaHistoria,"fAnexo3X.html") && oArchivowa.AbreArchivo(sRutaAttach,"fAnexo3X.html")){
	sAnexo 					= "III.10";
	Anexo3X oAnexo			= new Anexo3X();
	iIdAnexo 				= oAnexo.GetIdAnexo();
	oAnexoEstatus.Get(iIdFuncionario, iIdAnexo);
	sEstatus 				= oAnexoEstatus.GetEstatus();
	int 	sIdTipoOrigen	= 0;
	sAux = "\n				<tr><TD class='TituloParrafo' width='70%'>&nbsp;&nbsp;ANEXO III.10 - RELACIÓN DE OBRAS EN PROCESO&nbsp;&nbsp;</TD></tr>";
%>
				<%@include file="HeaderAnexoHistorico.jsp"%>
<%
	sArchivo = "\n	<TABLE cellPadding='0' cellSpacing='0' width='100%' BORDER='1' BORDERCOLOR='white'>";
	sArchivo += "\n		<TR align='middle'>";
	sArchivo += "\n			<td class='TituloMenu'>Clave</TD>";
	sArchivo += "\n			<td class='TituloMenu'>Programa<br>Subprograma<br>Obra Localización</TD>";
	sArchivo += "\n			<td class='TituloMenu'>Contrato ó Admón.</TD>";
	sArchivo += "\n			<td class='TituloMenu'>Monto Total Aprobado</TD>";
	sArchivo += "\n			<td class='TituloMenu'>Monto Total Ejercido</TD>";
	sArchivo += "\n			<td class='TituloMenu'>Diferencia</TD>";
	sArchivo += "\n			<td class='TituloMenu' colspan='2' width='100%' height='100%'><table cellPadding='0' cellSpacing='0' width='100%'  height='100%'> ";
	sArchivo += "\n									<tr align='middle'><td class='TituloMenu' colspan='2'>Fecha</td></tr>";
	sArchivo += "\n									<tr align='middle' ><td width='50%' class='TituloMenu'>Inicial</td><td width='50%' class='TituloMenu'>Final</td></tr>";
	sArchivo += "\n									</table></td>";
	sArchivo += "\n			<td class='TituloMenu' colspan='2' width='100%' height='100%'><table cellPadding='0' cellSpacing='0' width='100%'  height='100%'> ";
	sArchivo += "\n									<tr align='middle'><td class='TituloMenu' colspan='2'>% Avance</td></tr>";
	sArchivo += "\n									<tr align='middle' ><td width='50%' class='TituloMenu'>Físico</td><td width='50%' class='TituloMenu'>Financ.</td></tr>";
	sArchivo += "\n									</table></td>";
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
			int 	iIdRenglon			= oAnexo.GetIdRenglon(i)!=-1?			oAnexo.GetIdRenglon(i):0;
			String 	sClave				= oAnexo.GetClave(i)!=null?				oAnexo.GetClave(i)+"":"";
			String 	sPrograma			= oAnexo.GetPrograma(i)!=null?			oAnexo.GetPrograma(i)+"":"";
			int 	iTipo		 		= oAnexo.GetTipo(i)!=-1?				oAnexo.GetTipo(i):0;
			String 	sTipo		 		= oAnexo.GetTipoDescripcion(i);
			String 	iFechaInicial 		= oAnexo.GetFechaInicial(i)!=null?		oAnexo.GetFechaInicial(i):"";
			String 	iFechaFinal 		= oAnexo.GetFechaFinal(i)!=null?		oAnexo.GetFechaFinal(i):"";
			String	fMontoAprobado		= oAnexo.GetMontoAprobado(i)!=null?		oAnexo.GetMontoAprobado(i):"";
			String	fMontoEjercido		= oAnexo.GetMontoEjercido(i)!=null?		oAnexo.GetMontoEjercido(i):"";
			String 	sAvanceFisico		= oAnexo.GetAvanceFisico(i)!=null?		oAnexo.GetAvanceFisico(i)+"":"";
			String 	sAvanceFinanciado	= oAnexo.GetAvanceFinanciado(i)!=null?	oAnexo.GetAvanceFinanciado(i)+"":"";
			String 	sObservaciones 		= oAnexo.GetObservacion(i)!=null?		oAnexo.GetObservacion(i):"";
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
	sArchivo = "\n					<TR bgcolor='#A9A374' align='middle'><TD colspan='2'></TD><TD colspan='11'>" + sTipoOrigen + "<TD></tr>";
	oArchivo.Escribe(sArchivo);
	oArchivowa.Escribe(sArchivo);
				}
				vAntTipoOrigen=iTipoOrigen;
			}
	sArchivo = "\n		<TR align='left' bgcolor='" + sBackColor + "'";
	sArchivo += "\n			onMouseOver = 'MouseDentro(this);'";
	sArchivo += "\n			onMouseOut  = " + c + "MouseFuera(this,'" + sBackColor + "');" + c + ">";
	sArchivo += "\n			<TD>&nbsp;<a onmouseover=" + c + "this.style.cursor='hand'" + c + "  style='cursor:normal'>" + sClave + "</a></TD>";
	sArchivo += "\n			<TD>&nbsp;<a onmouseover=" + c + "this.style.cursor='hand'" + c + "  style='cursor:normal'>" + sPrograma + "</a></TD>";
	sArchivo += "\n			<TD>&nbsp;<a onmouseover=" + c + "this.style.cursor='hand'" + c + "  style='cursor:normal'>" + sTipo + "</a></TD>";
	sArchivo += "\n			<TD align='right'><a onmouseover=" + c + "this.style.cursor='hand'" + c + "  style='cursor:normal'>" + FormatoDecimal.format(java.lang.Double.parseDouble(fMontoAprobado)) + "&nbsp;</a></TD>";
	sArchivo += "\n			<TD align='right'><a onmouseover=" + c + "this.style.cursor='hand'" + c + "  style='cursor:normal'>" + FormatoDecimal.format(java.lang.Double.parseDouble(fMontoEjercido)) + "&nbsp;</a></TD>";
	sArchivo += "\n			<TD align='right'><a onmouseover=" + c + "this.style.cursor='hand'" + c + "  style='cursor:normal'>" + FormatoDecimal.format(java.lang.Double.parseDouble(fMontoAprobado) - java.lang.Double.parseDouble(fMontoEjercido)) + "&nbsp;</a></TD>";
	sArchivo += "\n			<TD >&nbsp;<a onmouseover=" + c + "this.style.cursor='hand'" + c + "  style='cursor:normal'>" + iFechaInicial + "</a></TD>";
	sArchivo += "\n			<TD >&nbsp;<a onmouseover=" + c + "this.style.cursor='hand'" + c + "  style='cursor:normal'>" + iFechaFinal + "</a></TD>";
	sArchivo += "\n			<TD >&nbsp;<a onmouseover=" + c + "this.style.cursor='hand'" + c + "  style='cursor:normal'>" + sAvanceFisico + "</a></TD>";
	sArchivo += "\n			<TD >&nbsp;<a onmouseover=" + c + "this.style.cursor='hand'" + c + "  style='cursor:normal'>" + sAvanceFinanciado + "</a></TD>";
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

