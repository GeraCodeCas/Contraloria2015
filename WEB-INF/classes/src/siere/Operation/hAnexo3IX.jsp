<%
/*********************************************************************************************************
Nombre:		Anexo 3.9
Elaboro:	Jesus Manuel Limon Mireles
Lugar:		Monterrey, NL, Mexico
Fecha:		6.Ene.2003
Compañia:	CONSISS
*********************************************************************************************************/
%>
<%
if (oArchivo.AbreArchivo(sRutaHistoria,"fAnexo3IX.html") && oArchivowa.AbreArchivo(sRutaAttach,"fAnexo3IX.html")){
	sAnexo 					= "III.9";
	Anexo3IX oAnexo 		= new Anexo3IX();
	iIdAnexo 				= oAnexo.GetIdAnexo();
	oAnexoEstatus.Get(iIdFuncionario, iIdAnexo);
	sEstatus 				= oAnexoEstatus.GetEstatus();
	sAux = "\n				<tr><TD class='TituloParrafo' width='70%'>&nbsp;&nbsp;ANEXO III.9 - RELACIÓN BIENES INMUEBLES&nbsp;&nbsp;</TD></tr>";	
%>
				<%@include file="HeaderAnexoHistorico.jsp"%>
<%
	sArchivo = "\n	<TABLE cellPadding='0' cellSpacing='0' width='100%' BORDER='1' BORDERCOLOR='white'>";
	sArchivo += "\n		<TR align='middle'>";
	sArchivo += "\n			<td class='TituloMenu'>No. de Exp. Catastral asignado por cada Municipio</TD><td class='TituloMenu'>No.Progresivo</TD><td class='TituloMenu'>Nombre o Identificación del Bien Inmueble, Ubicación y Superficie</TD><td class='TituloMenu'>Destino</TD><td class='TituloMenu'>Estado que guerda el Inmueble</TD><td class='TituloMenu'>Tipo de Bien Inmueble</TD><td class='TituloMenu'>Tipo de Acción Legal</TD><td class='TituloMenu'>Observaciones</TD></TR>";
	oArchivo.Escribe(sArchivo);
	oArchivowa.Escribe(sArchivo);

if(!sEstatus.equals("0")){
		int intContador = 0;
		String sBackColor = "";
		oAnexo.GetAll(iIdFuncionario);
		for(int i=0;i<oAnexo.GetAll(iIdFuncionario);i++){
			int 	iIdRenglon			= oAnexo.GetIdRenglon(i)!=-1?			oAnexo.GetIdRenglon(i):0;
			String 	sNoExpediente		= oAnexo.GetNoExpediente(i)!=null?		oAnexo.GetNoExpediente(i)+"":"";
			String 	sNoProgresivo		= oAnexo.GetNoProgresivo(i)!=null?		oAnexo.GetNoProgresivo(i)+"":"";
			String 	sNombre				= oAnexo.GetNombre(i)!=null?			oAnexo.GetNombre(i)+"":"";
			String 	sDestino			= oAnexo.GetDestino(i)!=null?			oAnexo.GetDestino(i)+"":"";
			int 	iEstadoInmueble 	= oAnexo.GetEstadoInmueble(i)!=-1?		oAnexo.GetEstadoInmueble(i):0;
			String  sEstadoInmueble		= oAnexo.GetEstadoInmuebleDescripcion(i);
			int 	iTipoInmueble 		= oAnexo.GetTipoInmueble(i)!=-1?		oAnexo.GetTipoInmueble(i):0;
			String  sTipoInmueble		= oAnexo.GetTipoInmuebleDescripcion(i);
			int 	iTipoAccion 		= oAnexo.GetTipoAccion(i)!=-1?			oAnexo.GetTipoAccion(i):0;
			String  sTipoAccion			= oAnexo.GetTipoAccionDescripcion(i);
			String 	sObservacion 		= oAnexo.GetObservacion(i)!=null?		oAnexo.GetObservacion(i):"";
			intContador = intContador + 1;
			if(intContador%2 == 0){
				sBackColor = "#ffffff";
			}else{
				sBackColor = "#eeeeee";
			}
	sArchivo = "\n		<TR align='left' bgcolor='" + sBackColor + "'";
	sArchivo += "\n			onMouseOver = 'MouseDentro(this);'";
	sArchivo += "\n			onMouseOut  = " + c + "MouseFuera(this,'" + sBackColor + "');" + c + ">";
	sArchivo += "\n			<TD>&nbsp;<a onmouseover=" + c + "this.style.cursor='hand'" + c + " style='cursor:normal'>" + sNoExpediente + "</a></TD>";
	sArchivo += "\n			<TD>&nbsp;<a onmouseover=" + c + "this.style.cursor='hand'" + c + " style='cursor:normal'>" + sNoProgresivo + "</a></TD>";
	sArchivo += "\n			<TD>&nbsp;<a onmouseover=" + c + "this.style.cursor='hand'" + c + " style='cursor:normal'>" + sNombre + "</a></TD>";
	sArchivo += "\n			<TD>&nbsp;<a onmouseover=" + c + "this.style.cursor='hand'" + c + " style='cursor:normal'>" + sDestino + "</a></TD>";
	sArchivo += "\n			<TD>&nbsp;<a onmouseover=" + c + "this.style.cursor='hand'" + c + " style='cursor:normal'>" + sEstadoInmueble + "</a></TD>";
	sArchivo += "\n			<TD>&nbsp;<a onmouseover=" + c + "this.style.cursor='hand'" + c + " style='cursor:normal'>" + sTipoInmueble + "</a></TD>";
	sArchivo += "\n			<TD>&nbsp;<a onmouseover=" + c + "this.style.cursor='hand'" + c + " style='cursor:normal'>" + sTipoAccion + "</a></TD>";
	sArchivo += "\n			<TD>&nbsp;<a onmouseover=" + c + "this.style.cursor='hand'" + c + " style='cursor:normal'>" + sObservacion + "</a></TD>";
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