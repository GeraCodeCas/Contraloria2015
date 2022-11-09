<%
/*********************************************************************************************************
Nombre:		Anexo 3.17
Elaboro:	Jesus Manuel Limon Mireles
Lugar:		Monterrey, NL, Mexico
Fecha:		7.Ene.2003
Compañia:	CONSISS
*********************************************************************************************************/
%>
<%
if (oArchivo.AbreArchivo(sRutaHistoria,"fAnexo3XVII.html") && oArchivowa.AbreArchivo(sRutaAttach,"fAnexo3XVII.html")){
	sAnexo 					= "III.17";
	Anexo3XVII oAnexo	 	= new Anexo3XVII();
	iIdAnexo 				= oAnexo.GetIdAnexo();
	oAnexoEstatus.Get(iIdFuncionario, iIdAnexo);
	sEstatus 				= oAnexoEstatus.GetEstatus();
	sAux = "\n				<tr><td class='TituloParrafo' width='70%'>&nbsp;&nbsp;ANEXO III.17 - RELACIÓN DE ASUNTOS EN TRÁMITE&nbsp;&nbsp;</td></tr>";
%>
				<%@include file="HeaderAnexoHistorico.jsp"%>
<%
	sArchivo = "\n	<TABLE cellPadding='0' cellSpacing='0' width='100%' BORDER='1' BORDERCOLOR='white'>";
	sArchivo += "\n		<TR align='middle'>";
	sArchivo += "\n			<td class='TituloMenu'>Número de Expediente</TD>";
	sArchivo += "\n			<td class='TituloMenu'>Nombre del Asunto</TD>";
	sArchivo += "\n			<td class='TituloMenu'>Fecha de Inicio</TD>";
	sArchivo += "\n			<td class='TituloMenu'>Situación del Trámite</TD>";
	sArchivo += "\n			<td class='TituloMenu'>Fecha Probable de Solución</TD>";
	sArchivo += "\n		</TR>";
	oArchivo.Escribe(sArchivo);
	oArchivowa.Escribe(sArchivo);
if(!sEstatus.equals("0")){
		int intContador = 0;
		String sBackColor = "";
		oAnexo.GetAll(iIdFuncionario);
		for(int i=0;i<oAnexo.GetAll(iIdFuncionario);i++){
			int 	iIdRenglon			= oAnexo.GetIdRenglon(i)!=-1?			oAnexo.GetIdRenglon(i):0;
			String 	sExpediente		= oAnexo.GetExpediente(i)!=null?	oAnexo.GetExpediente(i)+"":"";
			String 	sAsunto 		= oAnexo.GetAsunto(i)!=null?		oAnexo.GetAsunto(i):"";
			String 	sFechaInicio 			= oAnexo.GetFechaInicio(i)!=null?			oAnexo.GetFechaInicio(i):"";
			String 	sSituacion 			= oAnexo.GetSituacion(i)!=null?			oAnexo.GetSituacion(i):"";
			String 	sFechaSolucion 			= oAnexo.GetFechaSolucion(i)!=null?	oAnexo.GetFechaSolucion(i):"";
			intContador = intContador + 1;
			if(intContador%2 == 0){
				sBackColor = "#ffffff";
			}else{
				sBackColor = "#eeeeee";
			}
	sArchivo = "\n		<TR align='left' bgcolor='" +sBackColor + "'";
	sArchivo += "\n			onMouseOver = 'MouseDentro(this);'";
	sArchivo += "\n			onMouseOut  = " + c + "MouseFuera(this,'" +sBackColor + "');" + c + ">";
	sArchivo += "\n			<TD>&nbsp;<a onmouseover=" + c + "this.style.cursor='hand'" + c + " style='cursor:normal'>" +sExpediente + "</a></TD>";
	sArchivo += "\n			<TD>&nbsp;<a onmouseover=" + c + "this.style.cursor='hand'" + c + " style='cursor:normal'>" +sAsunto + "</a></TD>";
	sArchivo += "\n			<TD>&nbsp;<a onmouseover=" + c + "this.style.cursor='hand'" + c + " style='cursor:normal'>" +sFechaInicio + "</a></TD>";
	sArchivo += "\n			<TD >&nbsp;<a onmouseover=" + c + "this.style.cursor='hand'" + c + " style='cursor:normal'>" +sSituacion + "</a></TD>";
	sArchivo += "\n			<TD >&nbsp;<a onmouseover=" + c + "this.style.cursor='hand'" + c + " style='cursor:normal'>" +sFechaSolucion + "</a></TD>";
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
