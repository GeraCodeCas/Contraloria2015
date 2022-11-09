<%
/*********************************************************************************************************
Nombre:		Anexo 3.13
Elaboro:	Jesus Manuel Limon Mireles
Lugar:		Monterrey, NL, Mexico
Fecha:		7.Ene.2003
Compa�ia:	CONSISS
*********************************************************************************************************/
%>
<%

if (oArchivo.AbreArchivo(sRutaHistoria,"fAnexo3XIII.html") && oArchivowa.AbreArchivo(sRutaAttach,"fAnexo3XIII.html")){
	sAnexo 					= "III.13";
	Anexo3XIII oAnexo		= new Anexo3XIII();
	iIdAnexo 				= oAnexo.GetIdAnexo();
	oAnexoEstatus.Get(iIdFuncionario, iIdAnexo);
	sEstatus 				= oAnexoEstatus.GetEstatus();
	sAux = "\n				<tr><TD class='TituloParrafo' width='70%'>&nbsp;&nbsp;ANEXO III.13 - RELACI�N DE COMPROMISOS PRESIDENCIALES PENDIENTES&nbsp;&nbsp;</TD></tr>";
%>
				<%@include file="HeaderAnexoHistorico.jsp"%>
<%
	sArchivo = "\n	<TABLE cellPadding='0' cellSpacing='0' width='100%' BORDER='1' BORDERCOLOR='white'>";
	sArchivo += "\n		<TR align='middle'>";
	sArchivo += "\n			<td class='TituloMenu'>No. de Compromiso</TD>";
	sArchivo += "\n			<td class='TituloMenu'>Fecha</TD>";
	sArchivo += "\n			<td class='TituloMenu'>Descripci�n del Compromiso</TD>";
	sArchivo += "\n			<td class='TituloMenu'>Situaci�n Actual</TD>";
	sArchivo += "\n			<td class='TituloMenu'>% Avance F�sico</TD>";
	sArchivo += "\n			<td class='TituloMenu'>% Avance Financiero</TD>";
	sArchivo += "\n		</TR>";
	oArchivo.Escribe(sArchivo);
	oArchivowa.Escribe(sArchivo);
if(!sEstatus.equals("0")){
		int intContador = 0;
		String sBackColor = "";
		oAnexo.GetAll(iIdFuncionario);
		for(int i=0;i<oAnexo.GetAll(iIdFuncionario);i++){
			int 	iIdRenglon			= oAnexo.GetIdRenglon(i)!=-1?			oAnexo.GetIdRenglon(i):0;
			String 	sNoCompromiso		= oAnexo.GetNoCompromiso(i)!=null?		oAnexo.GetNoCompromiso(i)+"":"";
			String 	sFechaAnexo			= oAnexo.GetFecha(i)!=null?				oAnexo.GetFecha(i):"";
			String 	sDescripcion	  	= oAnexo.GetDescripcion(i)!=null?		oAnexo.GetDescripcion(i):"";
			int 	iSituacion 			= oAnexo.GetSituacion(i)!=-1?			oAnexo.GetSituacion(i):0;
			String 	sSituacion 			= oAnexo.GetSituacionDescripcion(i)!=null?		oAnexo.GetSituacionDescripcion(i):"";
			String 	sAvanceFisico 		= oAnexo.GetAvanceFisico(i)!=null?		oAnexo.GetAvanceFisico(i):"";
			String 	sAvanceFinanciero	= oAnexo.GetAvanceFinanciero(i)!=null?	oAnexo.GetAvanceFinanciero(i):"";
			intContador = intContador + 1;
			if(intContador%2 == 0){
				sBackColor = "#ffffff";
			}else{
				sBackColor = "#eeeeee";
			}
	sArchivo = "\n		<TR align='left' bgcolor='" +sBackColor + "'";
	sArchivo += "\n			onMouseOver = 'MouseDentro(this);'";
	sArchivo += "\n			onMouseOut  = " + c + "MouseFuera(this,'" +sBackColor + "');" + c + ">";
	sArchivo += "\n			<TD align='right'><a onmouseover=" + c + "this.style.cursor='hand'" + c + " style='cursor:normal' onclick='edit(" +iIdRenglon + ");'>" +sNoCompromiso + "&nbsp;</a></TD>";
	sArchivo += "\n			<TD>&nbsp;<a onmouseover=" + c + "this.style.cursor='hand'" + c + " style='cursor:normal' onclick='edit(" +iIdRenglon + ");'>" +sFechaAnexo + "</a></TD>";
	sArchivo += "\n			<TD>&nbsp;<a onmouseover=" + c + "this.style.cursor='hand'" + c + " style='cursor:normal' onclick='edit(" +iIdRenglon + ");'>" +sDescripcion + "</a></TD>";
	sArchivo += "\n			<TD >&nbsp;<a onmouseover=" + c + "this.style.cursor='hand'" + c + " style='cursor:normal' onclick='edit(" +iIdRenglon + ");'>" +sSituacion + "</a></TD>";
	sArchivo += "\n			<TD align='right'><a onmouseover=" + c + "this.style.cursor='hand'" + c + " style='cursor:normal' onclick='edit(" +iIdRenglon + ");'>" +sAvanceFisico + "&nbsp;</a></TD>";
	sArchivo += "\n			<TD align='right'><a onmouseover=" + c + "this.style.cursor='hand'" + c + " style='cursor:normal' onclick='edit(" +iIdRenglon + ");'>" +sAvanceFinanciero + "&nbsp;</a></TD>";
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
