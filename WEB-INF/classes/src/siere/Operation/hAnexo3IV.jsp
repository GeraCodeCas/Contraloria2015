<%
/*********************************************************************************************************
Nombre:		Anexo 3.4
Elaboro:	Jesus Manuel Limon Mireles
Lugar:		Monterrey, NL, Mexico
Fecha:		6.Ene.2003
Compañia:	CONSISS
*********************************************************************************************************/
%>
<%
if (oArchivo.AbreArchivo(sRutaHistoria,"fAnexo3IV.html") && oArchivowa.AbreArchivo(sRutaAttach,"fAnexo3IV.html")){
	sAnexo 					= "III.4";
	Anexo3IV oAnexo3IV		= new Anexo3IV();
	iIdAnexo 				= oAnexo3IV.GetIdAnexo();
	oAnexoEstatus.Get(iIdFuncionario, iIdAnexo);
	sEstatus 				= oAnexoEstatus.GetEstatus();
	sAux = "\n				<tr><TD  colspan='3' class='TituloParrafo' width='70%'>ANEXO III.4 - RESUMEN DE PLAZAS AUTORIZADAS</TD></tr>";
%>
				<%@include file="HeaderAnexoHistorico.jsp"%>
<%
	sArchivo = "\n	<TABLE cellPadding='0' cellSpacing='0' width='100%' BORDER='1' BORDERCOLOR='white'>";
	sArchivo += "\n		<TR align='middle'>";
	sArchivo += "\n			<td class='TituloMenu'>Categoría</TD><td class='TituloMenu'>Total de Personas</TD>";
	sArchivo += "\n			<td class='TituloMenu'>Total de Sueldos</TD>";
	sArchivo += "\n			<td class='TituloMenu' width='40%' height='100%'><table cellPadding='0' cellSpacing='0' width='100%'  height='100%'> ";
	sArchivo += "\n					<tr align='middle'><td class='TituloMenu' colspan='3'>Clasificación de Personal</td></tr>";
	sArchivo += "\n					<tr align='middle'><td width='33%' class='TituloMenu'>Confianza</td><td width='34%' class='TituloMenu'>Base</td><td width='33%' class='TituloMenu'>Otros</td></tr>";
	sArchivo += "\n					</table></td>";
	sArchivo += "\n		</TR>";
	oArchivo.Escribe(sArchivo);
	oArchivowa.Escribe(sArchivo);

		if(!sEstatus.equals("0")){
			int intContador = 0;
			String sBackColor = "";
			oAnexo3IV.GetAll(iIdFuncionario);
		for(int i=0;i<oAnexo3IV.GetAll(iIdFuncionario);i++){
		  String vIdRenglon 				= oAnexo3IV.GetIdRenglon(i)!=-1?oAnexo3IV.GetIdRenglon(i)+"":"0";
			String vCategoria 			= oAnexo3IV.GetCategoria(i)!=null?oAnexo3IV.GetCategoria(i):"";
			String vTotalPersonas		  				= oAnexo3IV.GetTotalPersonas(i)!=null?oAnexo3IV.GetTotalPersonas(i):"";
			String vTotalSueldos 					= oAnexo3IV.GetTotalSueldos(i)!=null?oAnexo3IV.GetTotalSueldos(i):"";
			
			try{vTotalSueldos = FormatoDecimal.format(new Double(!vTotalSueldos.trim().equals("")?vTotalSueldos:"0"));} 
			catch(Throwable z){System.out.println("iAnexo3v1.GetTotalSueldos: " + z + " " + vTotalSueldos);}
			
			String vConfianza 					= oAnexo3IV.GetConfianza(i)!=null?oAnexo3IV.GetConfianza(i):"";
			String vBase 		= oAnexo3IV.GetBase(i)!=null?oAnexo3IV.GetBase(i):"";
			String vOtros 		= oAnexo3IV.GetOtros(i)!=null?oAnexo3IV.GetOtros(i):"";
			intContador = intContador + 1;
		 if (intContador%2 == 0){
					sBackColor = "#ffffff";
				}else{
					sBackColor = "#eeeeee";
			  }

	sArchivo = "\n		<TR align='left' bgcolor='" + sBackColor + "'";
	sArchivo += "\n			onMouseOver = 'MouseDentro(this);'";
	sArchivo += "\n			onMouseOut  = " + c + "MouseFuera(this,'" + sBackColor + "');" + c + ">";
	sArchivo += "\n			<TD>&nbsp;";
	sArchivo += "\n				<a onmouseover=" + c + "this.style.cursor='hand'" + c + " style='cursor:normal'>" + vCategoria + "</a>";
	sArchivo += "\n			</TD>";
	sArchivo += "\n			<TD align='center'>&nbsp;";
	sArchivo += "\n				<a onmouseover=" + c + "this.style.cursor='hand'" + c + " style='cursor:normal'>" + vTotalPersonas + "</a>";
	sArchivo += "\n			</TD>";
	sArchivo += "\n			<TD align='right'>&nbsp;";
	sArchivo += "\n				<a onmouseover=" + c + "this.style.cursor='hand'" + c + " style='cursor:normal'>" + vTotalSueldos + "</a>";
	sArchivo += "\n			</TD>";
	sArchivo += "\n			<td width='40%' height='100%'>";
	sArchivo += "\n			        <table cellPadding='0' cellSpacing='0' width='100%'  height='100%'> ";
	sArchivo += "\n					<tr align='middle' >";
	sArchivo += "\n					     <td width='33%' align='center'>&nbsp;<a onmouseover=" + c + "this.style.cursor='hand'" + c + " style='cursor:normal'>" + vConfianza + "</a>&nbsp;&nbsp;</td>";
	sArchivo += "\n						 <td width='34%' align='center'>&nbsp;<a onmouseover=" + c + "this.style.cursor='hand'" + c + " style='cursor:normal'>" + vBase + "</a>&nbsp;&nbsp;</td>";
	sArchivo += "\n						 <td width='33%' align='center'>&nbsp;<a onmouseover=" + c + "this.style.cursor='hand'" + c + " style='cursor:normal'>" + vOtros + "</a>&nbsp;&nbsp;</td>";
	sArchivo += "\n					</table></td>";
	sArchivo += "\n		</TR>";
	oArchivo.Escribe(sArchivo);
	oArchivowa.Escribe(sArchivo);
		}
	sArchivo = "\n</TABLE>";
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

