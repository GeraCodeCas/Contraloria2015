<%
/*********************************************************************************************************
Nombre:		Anexo 3.15
Elaboro:	Jesus Manuel Limon Mireles
Lugar:		Monterrey, NL, Mexico
Fecha:		7.Ene.2003
Compañia:	CONSISS
*********************************************************************************************************/
%>
<%
if (oArchivo.AbreArchivo(sRutaHistoria,"fAnexo3XV.html") && oArchivowa.AbreArchivo(sRutaAttach,"fAnexo3XV.html")){
	sAnexo 					= "III.15";
	Anexo3XV oAnexo	 	 	= new Anexo3XV();
	iIdAnexo 				= oAnexo.GetIdAnexo();
	oAnexoEstatus.Get(iIdFuncionario, iIdAnexo);
	sEstatus 				= oAnexoEstatus.GetEstatus();
	sAux = "\n				<tr><td class='TituloParrafo' width='70%'>&nbsp;&nbsp;ANEXO III.15 - RELACIÓN DE ARCHIVO VIGENTE&nbsp;&nbsp;</td></tr>";
%>
				<%@include file="HeaderAnexoHistorico.jsp"%>
<%
	sArchivo = "\n	<TABLE cellPadding='0' cellSpacing='0' width='100%' BORDER='1' BORDERCOLOR='white'>";
	sArchivo += "\n		<TR align='middle'>";
	sArchivo += "\n			<td class='TituloMenu'>Identificación del Archivo</TD>";
	sArchivo += "\n			<td class='TituloMenu'>Expediente</TD>";
	sArchivo += "\n			<td class='TituloMenu'>Período Comprendido</TD>";
	sArchivo += "\n			<td class='TituloMenu'>Ubicación</TD>";
	sArchivo += "\n			<td class='TituloMenu'>Documentos o Planos</TD>";
	sArchivo += "\n		</TR>";
	oArchivo.Escribe(sArchivo);
	oArchivowa.Escribe(sArchivo);
if(!sEstatus.equals("0")){
		int intContador = 0;
		String sBackColor = "";
		oAnexo.GetAll(iIdFuncionario);
		for(int i=0;i<oAnexo.GetAll(iIdFuncionario);i++){
			int 	iIdRenglon			= oAnexo.GetIdRenglon(i)!=-1?			oAnexo.GetIdRenglon(i):0;
			String 	sIdentificacion		= oAnexo.GetIdentificacion(i)!=null?	oAnexo.GetIdentificacion(i)+"":"";
			String 	sExpediente 		= oAnexo.GetExpediente(i)!=null?		oAnexo.GetExpediente(i):"";
			String 	sPeriodo 			= oAnexo.GetPeriodo(i)!=null?			oAnexo.GetPeriodo(i):"";
			String 	sUbicacion 			= oAnexo.GetUbicacion(i)!=null?			oAnexo.GetUbicacion(i):"";
			String 	sDocumento 			= oAnexo.GetDocumento(i)!=null?	oAnexo.GetDocumento(i):"";
			intContador = intContador + 1;
			if(intContador%2 == 0){
				sBackColor = "#ffffff";
			}else{
				sBackColor = "#eeeeee";
			}
	sArchivo = "\n		<TR align='left' bgcolor='" +sBackColor + "'";
	sArchivo += "\n			onMouseOver = 'MouseDentro(this);'";
	sArchivo += "\n			onMouseOut  = " + c + "MouseFuera(this,'" +sBackColor + "');" + c + ">";
	sArchivo += "\n			<TD>&nbsp;<a onmouseover=" + c + "this.style.cursor='hand'" + c + " style='cursor:normal'>" +sIdentificacion + "</a></TD>";
	sArchivo += "\n			<TD>&nbsp;<a onmouseover=" + c + "this.style.cursor='hand'" + c + " style='cursor:normal'>" +sExpediente + "</a></TD>";
	sArchivo += "\n			<TD>&nbsp;<a onmouseover=" + c + "this.style.cursor='hand'" + c + " style='cursor:normal'>" +sPeriodo + "</a></TD>";
	sArchivo += "\n			<TD >&nbsp;<a onmouseover=" + c + "this.style.cursor='hand'" + c + " style='cursor:normal'>" +sUbicacion + "</a></TD>";
	sArchivo += "\n			<TD >&nbsp;<a onmouseover=" + c + "this.style.cursor='hand'" + c + " style='cursor:normal'>" +sDocumento + "</a></TD>";
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
