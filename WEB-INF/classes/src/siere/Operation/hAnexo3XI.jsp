<%
/*********************************************************************************************************
Nombre:		Anexo 3.11
Elaboro:	Jesus Manuel Limon Mireles
Lugar:		Monterrey, NL, Mexico
Fecha:		7.Ene.2003
Compañia:	CONSISS
*********************************************************************************************************/
%>
<%
if (oArchivo.AbreArchivo(sRutaHistoria,"fAnexo3XI.html") && oArchivowa.AbreArchivo(sRutaAttach,"fAnexo3XI.html")){
	sAnexo 					= "III.11";
	Anexo3XI oAnexo			= new Anexo3XI();
	iIdAnexo 				= oAnexo.GetIdAnexo();
	oAnexoEstatus.Get(iIdFuncionario, iIdAnexo);
	sEstatus 				= oAnexoEstatus.GetEstatus();
	int 	sIdTipoOrigen	= 0;
	sAux = "\n				<tr><TD class='TituloParrafo' width='70%'>&nbsp;&nbsp;ANEXO III.11 - RELACIÓN DE OBRAS TERMINADAS POR PROGRAMA&nbsp;&nbsp;</TD></tr>";
%>
				<%@include file="HeaderAnexoHistorico.jsp"%>
<%
	sArchivo = "\n	<TABLE cellPadding='0' cellSpacing='0' width='100%' BORDER='1' BORDERCOLOR='white'>";
	sArchivo += "\n		<TR align='middle'>";
	sArchivo += "\n			<td class='TituloMenu'>Clave</TD>";
	sArchivo += "\n			<td class='TituloMenu'>Programa<br>Subprograma<br>Obra Localización</TD>";
	sArchivo += "\n			<td class='TituloMenu'>Núm. Oficio Aprobación</TD>";
	sArchivo += "\n			<td class='TituloMenu'>Inversión Aprobada</TD>";
	sArchivo += "\n			<td class='TituloMenu'>Inversión Ejercida</TD>";
	sArchivo += "\n			<td class='TituloMenu'>Saldos</TD>";
	sArchivo += "\n			<td class='TituloMenu' colspan='2' width='100%' height='100%'><table cellPadding='0' cellSpacing='0' width='100%'  height='100%'> ";
	sArchivo += "\n									<tr align='middle'><td class='TituloMenu' colspan='2'>Metas</td></tr>";
	sArchivo += "\n									<tr align='middle' ><td width='50%' class='TituloMenu'>Unidad de Medida</td><td width='50%' class='TituloMenu'>Cantidad Total</td></tr>";
	sArchivo += "\n									</table></td>";
	sArchivo += "\n			<td class='TituloMenu' colspan='2' width='100%' height='100%'><table cellPadding='0' cellSpacing='0' width='100%'  height='100%'> ";
	sArchivo += "\n									<tr align='middle'><td class='TituloMenu' colspan='2'>% Num. Obras</td></tr>";
	sArchivo += "\n									<tr align='middle' ><td width='50%' class='TituloMenu'>Entregadas</td><td width='50%' class='TituloMenu'>Por Entregar</td></tr>";
	sArchivo += "\n									</table></td>";
	sArchivo += "\n			<td class='TituloMenu'>Observaciones</TD>";
	sArchivo += "\n		</TR>";
	oArchivo.Escribe(sArchivo);
	oArchivowa.Escribe(sArchivo);
if(!sEstatus.equals("0")){
		int vAntTipoOrigen=0;
		int intContador = 0;
		String sBackColor = "";
		oAnexo.GetAll(iIdFuncionario, sIdTipoOrigen);
		for(int i=0;i<oAnexo.GetAll(iIdFuncionario,sIdTipoOrigen);i++){
			int 	iIdRenglon			= oAnexo.GetIdRenglon(i)!=-1?			oAnexo.GetIdRenglon(i):0;
			String 	sClave				= oAnexo.GetClave(i)!=null?				oAnexo.GetClave(i)+"":"";
			String 	sPrograma			= oAnexo.GetPrograma(i)!=null?			oAnexo.GetPrograma(i)+"":"";
			String 	sNoAprobacion		= oAnexo.GetNoAprobacion(i)!=null?		oAnexo.GetNoAprobacion(i)+"":"";
			int 	iObrasEntregadas 	= oAnexo.GetObrasEntregadas(i)!=-1?		oAnexo.GetObrasEntregadas(i):0;
			int 	iObrasPorEntregar 	= oAnexo.GetObrasPorEntregar(i)!=-1?	oAnexo.GetObrasPorEntregar(i):0;
			String	fInversionAprobada	= oAnexo.GetInversionAprobada(i)!=null?	oAnexo.GetInversionAprobada(i):"";
			String	fInversionEjercida	= oAnexo.GetInversionEjercida(i)!=null?	oAnexo.GetInversionEjercida(i):"";
			String 	sUnidadMedida		= oAnexo.GetUnidadMedida(i)!=null?		oAnexo.GetUnidadMedida(i)+"":"";
			String 	sCantidadTotal		= oAnexo.GetCantidadTotal(i)!=null && 
						!(oAnexo.GetCantidadTotal(i)+"").trim().equals("") ?	oAnexo.GetCantidadTotal(i)+"":"0";
			String 	sObservaciones 		= oAnexo.GetObservacion(i)!=null?		oAnexo.GetObservacion(i):"";
			int 	iTipoOrigen		 	= oAnexo.GetTipoOrigen(i)!=-1?				oAnexo.GetTipoOrigen(i):0;
			String 	sTipoOrigen		 	= oAnexo.GetTipoOrigenDescripcion(i);
			intContador = intContador + 1;
			if(intContador%2 == 0){
				sBackColor = "#ffffff";
			}else{
				sBackColor = "#eeeeee";
			}
			if (sIdTipoOrigen==0){
				if(vAntTipoOrigen!=iTipoOrigen ){
	sArchivo = "\n					<TR bgcolor='#A9A374' align='middle'>";
	sArchivo += "\n        			<TD colspan='2'></TD><TD colspan='11'>" + sTipoOrigen + "<TD>";
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
	sArchivo += "\n			<TD>&nbsp;<a onmouseover=" + c + "this.style.cursor='hand'" + c + "  style='cursor:normal'>" + sPrograma + "</a></TD>";
	sArchivo += "\n			<TD align='right'><a onmouseover=" + c + "this.style.cursor='hand'" + c + "  style='cursor:normal'>" + sNoAprobacion + "&nbsp;</a></TD>";
	sArchivo += "\n			<TD align='right'><a onmouseover=" + c + "this.style.cursor='hand'" + c + "  style='cursor:normal'>" + FormatoDecimal.format(java.lang.Double.parseDouble(fInversionAprobada)) + "&nbsp;</a></TD>";
	sArchivo += "\n			<TD align='right'><a onmouseover=" + c + "this.style.cursor='hand'" + c + "  style='cursor:normal'>" + FormatoDecimal.format(java.lang.Double.parseDouble(fInversionEjercida)) + "&nbsp;</a></TD>";
	sArchivo += "\n			<TD align='right'><a onmouseover=" + c + "this.style.cursor='hand'" + c + "  style='cursor:normal'>" + FormatoDecimal.format(java.lang.Double.parseDouble(fInversionAprobada) - java.lang.Double.parseDouble(fInversionEjercida)) + "&nbsp;</a></TD>";
	sArchivo += "\n			<TD>&nbsp;<a onmouseover=" + c + "this.style.cursor='hand'" + c + "  style='cursor:normal'>" + sUnidadMedida + "</a></TD>";
	sArchivo += "\n			<TD align='right'><a onmouseover=" + c + "this.style.cursor='hand'" + c + "  style='cursor:normal'>" + FormatoDecimal.format(java.lang.Float.parseFloat(sCantidadTotal)) + "&nbsp;</a></TD>";
	sArchivo += "\n			<TD align='right'><a onmouseover=" + c + "this.style.cursor='hand'" + c + "  style='cursor:normal'>" + iObrasEntregadas + "&nbsp;</a></TD>";
	sArchivo += "\n			<TD align='right'><a onmouseover=" + c + "this.style.cursor='hand'" + c + "  style='cursor:normal'>" + iObrasPorEntregar + "&nbsp;</a></TD>";
	sArchivo += "\n			<TD>&nbsp;<a onmouseover=" + c + "this.style.cursor='hand'" + c + "  style='cursor:normal'>" + sObservaciones + "</a></TD>";
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

