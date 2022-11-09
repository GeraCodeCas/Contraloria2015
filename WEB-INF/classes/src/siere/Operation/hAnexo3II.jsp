<%
/*********************************************************************************************************
Nombre:		Anexo 3.2
Elaboro:	Jesus Manuel Limon Mireles
Lugar:		Monterrey, NL, Mexico
Fecha:		6.Ene.2003
Compañia:	CONSISS
*********************************************************************************************************/
%>
<%
if (oArchivo.AbreArchivo(sRutaHistoria,"fAnexo3II.html") && oArchivowa.AbreArchivo(sRutaAttach,"fAnexo3II.html")){
	sAnexo 					= "III.2";
	Anexo3II oAnexo3II 		= new Anexo3II();
	iIdAnexo 				= oAnexo3II.GetIdAnexo();
	oAnexoEstatus.Get(iIdFuncionario, iIdAnexo);
	sEstatus 				= oAnexoEstatus.GetEstatus();
	sAux = "\n				<tr><TD  colspan='3' class='TituloParrafo' width='70%'>ANEXO III.2 - MARCO JURÍDICO DE ACTUACIÓN</TD></tr>";
%>
				<%@include file="HeaderAnexoHistorico.jsp"%>
<%
	sArchivo = "\n<table align='center' cellspacing='0' cellpadding='0' border='0' width='100%'>";
	sArchivo += "\n		<TR align='middle'>";
	sArchivo += "\n			<td class='TituloMenu' colspan='2'><a onmouseover=" + c + "this.style.cursor='hand'" + c + " style='cursor:normal'>Marco Jurídico de Actuación</a></td>";
	sArchivo += "\n		</TR>";
	oArchivo.Escribe(sArchivo);
	oArchivowa.Escribe(sArchivo);
if(!sEstatus.equals("0")){
	oAnexo3II.Get(iIdFuncionario);
	String vMarcoJuridico 			= oAnexo3II.GetMarcoJuridico()!=null?oAnexo3II.GetMarcoJuridico():"";
	sArchivo = "\n		<TR>";
	sArchivo += "\n  		<TD>&nbsp;<a onmouseover=" + c + "this.style.cursor='hand'" + c + " style='cursor:normal'><textarea readonly class='txtBox' style='border: 0; background-color: transparent; overflow-y:hidden; width:100%; height=100%' name='sEstructuraOrganizacional' id='sEstructuraOrganizacional'>" + vMarcoJuridico + "</textarea></a></TD>";
	sArchivo += "\n		</TR>";
	sArchivo += "\n</TABLE>";
	oArchivo.Escribe(sArchivo);
	oArchivowa.Escribe(sArchivo);
} else {
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

