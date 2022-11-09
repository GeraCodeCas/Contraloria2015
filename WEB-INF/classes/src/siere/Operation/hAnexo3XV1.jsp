<%
/*********************************************************************************************************
Nombre:		Anexo 3.15.1
Elaboro:	Jesus Manuel Limon Mireles
Lugar:		Monterrey, NL, Mexico
Fecha:		7.Ene.2003
Compañia:	CONSISS
*********************************************************************************************************/
%>
<%
if (oArchivo.AbreArchivo(sRutaHistoria,"fAnexo3XV1.html") && oArchivowa.AbreArchivo(sRutaAttach,"fAnexo3XV1.html")){
	sAnexo 					= "III.15.1";
	Anexo3XV1 oAnexo	 	= new Anexo3XV1();
	iIdAnexo 				= oAnexo.GetIdAnexo();
	oAnexoEstatus.Get(iIdFuncionario, iIdAnexo);
	sEstatus 				= oAnexoEstatus.GetEstatus();
	sAux = "\n				<tr><td class='TituloParrafo' width='70%'>&nbsp;&nbsp;ANEXO III.15.1 - RELACIÓN DE RESPALDO DE ARCHIVOS Y CARPETAS EN DISKETTES O CD's&nbsp;&nbsp;</td></tr>";
%>
				<%@include file="HeaderAnexoHistorico.jsp"%>
<%
	sArchivo = "\n	<TABLE cellPadding='0' cellSpacing='0' width='100%' BORDER='1' BORDERCOLOR='white'>";
	sArchivo += "\n		<TR align='middle'>";
	sArchivo += "\n			<td class='TituloMenu'>Identificación del Archivo</TD>";
	sArchivo += "\n			<td class='TituloMenu'>Diskette</TD>";
	sArchivo += "\n			<td class='TituloMenu'>C.D.</TD>";
	sArchivo += "\n			<td class='TituloMenu'>Período Comprendido</TD>";
	sArchivo += "\n			<td class='TituloMenu'>Ubicación</TD>";
	sArchivo += "\n			<td class='TituloMenu'>Programa</TD>";
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
			String 	sDiskette 			= oAnexo.GetDiskette(i)!=null?			oAnexo.GetDiskette(i):"";
			String 	sCD 				= oAnexo.GetCD(i)!=null?				oAnexo.GetCD(i):"";
			String 	sPeriodo 			= oAnexo.GetPeriodo(i)!=null?			oAnexo.GetPeriodo(i):"";
			String 	sUbicacion 			= oAnexo.GetUbicacion(i)!=null?			oAnexo.GetUbicacion(i):"";
			String 	sPrograma 			= oAnexo.GetPrograma(i)!=null?			oAnexo.GetPrograma(i):"";
			intContador = intContador + 1;
			if(intContador%2 == 0){
				sBackColor = "#ffffff";
			}else{
				sBackColor = "#eeeeee";
			}
	sArchivo = "\n		<TR align='left' bgcolor='" +sBackColor + "'";
	sArchivo += "\n			onMouseOver = 'MouseDentro(this);'";
	sArchivo += "\n			onMouseOut  = " + c + "MouseFuera(this,'" + sBackColor + "');" + c + ">";
	sArchivo += "\n			<TD>&nbsp;<a onmouseover=" + c + "this.style.cursor='hand'" + c + " style='cursor:normal'>" +sIdentificacion + "</a></TD>";
	sArchivo += "\n			<TD>&nbsp;<a onmouseover=" + c + "this.style.cursor='hand'" + c + " style='cursor:normal'>";
	sArchivo += (sDiskette.equals("1")) ? "SI</a></TD>" : "NO</a></TD>";
	sArchivo += "\n			<TD>&nbsp;<a onmouseover=" + c + "this.style.cursor='hand'" + c + " style='cursor:normal'>";
	sArchivo += (sCD.equals("1")) ? "SI</a></TD>":"NO</a></TD>";
	sArchivo += "\n			<TD>&nbsp;<a onmouseover=" + c + "this.style.cursor='hand'" + c + " style='cursor:normal'>" +sPeriodo + "</a></TD>";
	sArchivo += "\n			<TD >&nbsp;<a onmouseover=" + c + "this.style.cursor='hand'" + c + " style='cursor:normal'>" +sUbicacion + "</a></TD>";
	sArchivo += "\n			<TD >&nbsp;<a onmouseover=" + c + "this.style.cursor='hand'" + c + " style='cursor:normal'>" +sPrograma + "</a></TD>";
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
