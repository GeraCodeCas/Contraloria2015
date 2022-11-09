<%
/*********************************************************************************************************
Nombre:		Anexo 3.8
Elaboro:	Jesus Manuel Limon Mireles
Lugar:		Monterrey, NL, Mexico
Fecha:		7.Ene.2003
Compañia:	CONSISS
*********************************************************************************************************/
%>
<%
if (oArchivo.AbreArchivo(sRutaHistoria,"fAnexo3VIII.html") && oArchivowa.AbreArchivo(sRutaAttach,"fAnexo3VIII.html")){
	sAnexo 					= "III.8";
	Anexo3VIII oAnexo3VIII	= new Anexo3VIII();
	iIdAnexo 				= oAnexo3VIII.GetIdAnexo();
	oAnexoEstatus.Get(iIdFuncionario, iIdAnexo);
	sEstatus 				= oAnexoEstatus.GetEstatus();
	sAux = "\n				<tr><TD class='TituloParrafo' width='70%'>&nbsp;&nbsp;ANEXO III.8 - SOBRE CERRADO CON LA COMBINACIÓN DE LAS CAJAS FUERTES&nbsp;&nbsp;</TD></tr>";
%>
				<%@include file="HeaderAnexoHistorico.jsp"%>
<%
if(sEstatus.equals("0")){
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

