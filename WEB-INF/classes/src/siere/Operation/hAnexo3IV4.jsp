<%
/*********************************************************************************************************
Nombre:		Anexo 3.4.4
Elaboro:	Jesus Manuel Limon Mireles
Lugar:		Monterrey, NL, Mexico
Fecha:		6.Ene.2003
Compañia:	CONSISS
*********************************************************************************************************/
%>
<%
if (oArchivo.AbreArchivo(sRutaHistoria,"fAnexo3IV4.html") && oArchivowa.AbreArchivo(sRutaAttach,"fAnexo3IV4.html")){
	sAnexo 					= "III.4.4";
	Anexo3IV4 oAnexo3IV4 	= new Anexo3IV4();
	iIdAnexo 				= oAnexo3IV4.GetIdAnexo();
	oAnexoEstatus.Get(iIdFuncionario, iIdAnexo);
	sEstatus 				= oAnexoEstatus.GetEstatus();
	sAux = "\n				<tr><TD colspan='3' class='TituloParrafo' width='100%'>&nbsp;&nbsp;ANEXO III.4.4 - VACACIONES DEL PERSONAL PENDIENTES DE DISFRUTAR</TD></tr>";
%>
				<%@include file="HeaderAnexoHistorico.jsp"%>
<%
	sArchivo = "\n	<TABLE cellPadding='0' cellSpacing='0' width='100%' BORDER='1' BORDERCOLOR='white'>";
	sArchivo += "\n		<TR align='middle'><td class='TituloMenu'>Fecha</TD><td class='TituloMenu'>Nombre</TD><td class='TituloMenu'>Observaciones</TD></TR>";
	oArchivo.Escribe(sArchivo);
	oArchivowa.Escribe(sArchivo);
	sArchivo = "";
	if(!sEstatus.equals("0")){
		int intContador = 0;
		String sBackColor = "";
		oAnexo3IV4.GetAll(iIdFuncionario);
		for(int i=0;i<oAnexo3IV4.GetAll(iIdFuncionario);i++){
			String vIdRenglon 			= oAnexo3IV4.GetIdRenglon(i)!=-1?oAnexo3IV4.GetIdRenglon(i)+"":"0";
			String vFecha 				= oAnexo3IV4.GetFecha(i)!=null?oAnexo3IV4.GetFecha(i):"";
			String vNombre 				= oAnexo3IV4.GetNombre(i)!=null?oAnexo3IV4.GetNombre(i):"";
			String vObservaciones 		= oAnexo3IV4.GetObservaciones(i)!=null?oAnexo3IV4.GetObservaciones(i):"";
			intContador = intContador + 1;
			if (intContador%2 == 0){	sBackColor = "#ffffff";	}
			else{						sBackColor = "#eeeeee"; }

	sArchivo = "\n		<TR align='left' bgcolor='" + sBackColor + "' onMouseOver = 'MouseDentro(this);' onMouseOut  = " + c + "MouseFuera(this,'" + sBackColor + "');" + c + ">";
	sArchivo += "\n			<TD>&nbsp;<a onmouseover=" + c + "this.style.cursor='hand'" + c + " style='cursor:normal'>" + vFecha + "</a></TD>";
	sArchivo += "\n			<TD>&nbsp;<a onmouseover=" + c + "this.style.cursor='hand'" + c + " style='cursor:normal'>" + vNombre + "</a></TD>";
	sArchivo += "\n			<TD>&nbsp;<a onmouseover=" + c + "this.style.cursor='hand'" + c + " style='cursor:normal'>" + vObservaciones + "</a></TD>";
	sArchivo += "\n		</TR>";
	oArchivo.Escribe(sArchivo);
	oArchivowa.Escribe(sArchivo);
	sArchivo = "";
		}
	sArchivo += "\n	</TABLE>";
	oArchivo.Escribe(sArchivo);
	oArchivowa.Escribe(sArchivo);
	sArchivo = "";
	} else {
	sArchivo = "\n	</TABLE>";
	sArchivo += "\n	<TABLE width='100%'>";
	sArchivo += "\n		<TR><TD align='center'><H1 style='size=+2'><br>ESTE ANEXO NO APLICA</H1></TD></TR>";
	sArchivo += "\n	</TABLE>";
	oArchivo.Escribe(sArchivo);
	oArchivowa.Escribe(sArchivo);
	sArchivo = "";
	}
	sArchivo = "\n</td>";
	sArchivo += "\n</tr>";
	sArchivo += "\n</table>";
	sArchivo += "\n</body>";
	sArchivo += "\n</html>";
	oArchivo.Escribe(sArchivo);
	oArchivowa.Escribe(sArchivo);
	sArchivo = "";
	oArchivo.CierraArchivo();
	oArchivowa.CierraArchivo();
}else{
	out.println("Error");
}
%>

