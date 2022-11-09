<%
/*********************************************************************************************************
Nombre:		Anexo 3.4.3
Elaboro:	Jesus Manuel Limon Mireles
Lugar:		Monterrey, NL, Mexico
Fecha:		6.Ene.2003
Compañia:	CONSISS
*********************************************************************************************************/
%>
<%
if (oArchivo.AbreArchivo(sRutaHistoria,"fAnexo3IV3.html") && oArchivowa.AbreArchivo(sRutaAttach,"fAnexo3IV3.html")){
	sAnexo 					= "III.4.3";
	Anexo3IV3 oAnexo3IV3 	= new Anexo3IV3();
	iIdAnexo 				= oAnexo3IV3.GetIdAnexo();
	oAnexoEstatus.Get(iIdFuncionario, iIdAnexo);
	sEstatus 				= oAnexoEstatus.GetEstatus();
	sAux = "\n				<tr><TD  colspan='3' class='TituloParrafo' width='70%'>ANEXO III.4.3 - RELACIÓN DE SUELDOS NO ENTREGADOS</TD></tr>";
%>
				<%@include file="HeaderAnexoHistorico.jsp"%>
<%
	sArchivo = "\n	<TABLE cellPadding='0' cellSpacing='0' width='100%' BORDER='1' BORDERCOLOR='white'>";
	sArchivo += "\n		<TR align='middle'><td class='TituloMenu'>No. De Empleado</TD><td class='TituloMenu'>Nombre</TD><td class='TituloMenu'>No. de Cheque</TD><td class='TituloMenu'>Importe</TD><td class='TituloMenu'>Observaciones</TD></TR>";
	oArchivo.Escribe(sArchivo);
	oArchivowa.Escribe(sArchivo);
		if(!sEstatus.equals("0")){
			int intContador = 0;
			String sBackColor = "";
			oAnexo3IV3.GetAll(iIdFuncionario);
		for(int i=0;i<oAnexo3IV3.GetAll(iIdFuncionario);i++){
		    String vIdRenglon 				= oAnexo3IV3.GetIdRenglon(i)!=-1?oAnexo3IV3.GetIdRenglon(i)+"":"0";
			String vNoEmpleado 				= oAnexo3IV3.GetNoEmpleado(i)!=null?oAnexo3IV3.GetNoEmpleado(i):"";
			String vNombre 					= oAnexo3IV3.GetNombre(i)!=null?oAnexo3IV3.GetNombre(i):"";
			String vNoCheque				= oAnexo3IV3.GetNoCheque(i)!=null?oAnexo3IV3.GetNoCheque(i):"";
			String vImporte			 		= oAnexo3IV3.GetImporte(i)!=null?oAnexo3IV3.GetImporte(i):"";
			String vObservaciones 			= oAnexo3IV3.GetObservaciones(i)!=null?oAnexo3IV3.GetObservaciones(i):"";
			intContador = intContador + 1;
		 if (intContador%2 == 0){
					sBackColor = "#ffffff";
				}else{
					sBackColor = "#eeeeee";
			  }
	sArchivo = "\n		<TR align='left' bgcolor='" + sBackColor + "'";
	sArchivo += "\n			onMouseOver = 'MouseDentro(this);'";
	sArchivo += "\n			onMouseOut  = " + c + "MouseFuera(this,'" + sBackColor + "');" + c + ">";
	sArchivo += "\n			<TD align='center'>&nbsp;<a onmouseover=" + c + "this.style.cursor='hand'" + c + " style='cursor:normal'>" + vNoEmpleado + "</a></TD>";
	sArchivo += "\n			<TD>&nbsp;<a onmouseover=" + c + "this.style.cursor='hand'" + c + " style='cursor:normal'>" + vNombre + "</a></TD>";
	sArchivo += "\n			<TD align='center'>&nbsp;<a onmouseover=" + c + "this.style.cursor='hand'" + c + " style='cursor:normal'>" + vNoCheque + "</a></TD>";
	sArchivo += "\n			<TD align='right'>&nbsp;<a onmouseover=" + c + "this.style.cursor='hand'" + c + " style='cursor:normal'>" + FormatoDecimal.format(new Float(!vImporte.equals("")?vImporte:"0")) + "</a>&nbsp;&nbsp;</TD>";
	sArchivo += "\n			<TD>&nbsp;<a onmouseover=" + c + "this.style.cursor='hand'" + c + " style='cursor:normal'>" + vObservaciones + "</a></TD>";
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

