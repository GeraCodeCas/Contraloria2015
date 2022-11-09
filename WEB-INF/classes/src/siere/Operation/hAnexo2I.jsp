<%
/*********************************************************************************************************
Nombre:		Anexo 2.1
Elaboro:	Jesus Manuel Limon Mireles
Lugar:		Monterrey, NL, Mexico
Fecha:		3.Ene.2003
Compañia:	CONSISS
*********************************************************************************************************/
%>
<%
if (oArchivo.AbreArchivo(sRutaHistoria,"fAnexo2I.html") && oArchivowa.AbreArchivo(sRutaAttach,"fAnexo2I.html")){
	sAnexo 					= "II.1";
	Anexo2I oAnexo2I 		= new Anexo2I();
	iIdAnexo 				= oAnexo2I.GetIdAnexo();
	oAnexoEstatus.Get(iIdFuncionario, iIdAnexo);
	sEstatus 				= oAnexoEstatus.GetEstatus();
	sAux = "\n				<tr><TD  colspan='3' class='TituloParrafo' width='70%'>ANEXO II.1 - PRESUPUESTO GLOBAL DEL EJERCICIO</TD></tr>";
%>
				<%@include file="HeaderAnexoHistorico.jsp"%>
<%
	sArchivo = "\n		<TABLE cellPadding='0' cellSpacing='0' width='100%' BORDER='1' BORDERCOLOR='white'>";
	sArchivo += "\n		<TR><TD class='TituloMenu' align='center'>Concepto</TD><TD class='TituloMenu' align='center'>Importe</TD></TR>";
	sArchivo += "\n		<TR><TD valign='top'>";
	sArchivo += "\n				<TABLE cellPadding='0' cellSpacing='0' width='100%' BORDER='1' BORDERCOLOR='white'>";
	sArchivo += "\n					 <TR height='25'><TD class='SubTituloMenu'><a onmouseover=" + c + "this.style.cursor='hand'" + c + " style='cursor:normal'>1. Presupuesto Aprobado</a></TD></TR>";
	sArchivo += "\n					 <TR height='25'><TD class='SubTituloMenu'><a onmouseover=" + c + "this.style.cursor='hand'" + c + " style='cursor:normal'>2. Incrementos</a></TD></TR>";
	sArchivo += "\n					 <TR height='25'><TD class='SubTituloMenu'><a onmouseover=" + c + "this.style.cursor='hand'" + c + " style='cursor:normal'>3. Reducciones</a></TD></TR>";
	sArchivo += "\n					 <TR height='25'><TD class='SubTituloMenu'><a onmouseover=" + c + "this.style.cursor='hand'" + c + " style='cursor:normal'>4. Programas Especiales Aprobados</a></TD></TR>";
	sArchivo += "\n					 <TR height='25'><TD class='SubTituloMenu'><a onmouseover=" + c + "this.style.cursor='hand'" + c + " style='cursor:normal'>5. Total Aprobado</a></TD></TR>";
	sArchivo += "\n					 <TR height='25'><TD class='SubTituloMenu'><a onmouseover=" + c + "this.style.cursor='hand'" + c + " style='cursor:normal'>6. Total Ejercido</a></TD></TR>";
	sArchivo += "\n					 <TR height='25'><TD class='SubTituloMenu'><a onmouseover=" + c + "this.style.cursor='hand'" + c + " style='cursor:normal'>7. Total por Ejercer: Presupuesto Disponible</a></TD></TR>";
	sArchivo += "\n				</TABLE></TD>";
	sArchivo += "\n			<TD valign='top'>";
	sArchivo += "\n				<TABLE cellPadding='0' cellSpacing='0' width='100%' BORDER='1' BORDERCOLOR='white'>";
	oArchivo.Escribe(sArchivo);
	oArchivowa.Escribe(sArchivo);

	if(!sEstatus.equals("0")){
			oAnexo2I.Get(iIdFuncionario);
			String vPresupuestoAprobado 	= oAnexo2I.GetPresupuestoAprobado()!=null?oAnexo2I.GetPresupuestoAprobado():"";
			String vIncrementos		        = oAnexo2I.GetIncrementos()!=null?oAnexo2I.GetIncrementos():"";
			String vReducciones 				  = oAnexo2I.GetReducciones()!=null?oAnexo2I.GetReducciones():"";
			String vProgramasEspeciales 	= oAnexo2I.GetProgramasEspeciales()!=null?oAnexo2I.GetProgramasEspeciales():"";
			String vTotalAprobado 				= oAnexo2I.GetTotalAprobado()!=null?oAnexo2I.GetTotalAprobado():"";
			String vTotalEjercido		      = oAnexo2I.GetTotalEjercido()!=null?oAnexo2I.GetTotalEjercido():"";
			String vTotalPorEjercer 			= oAnexo2I.GetTotalPorEjercer()!=null?oAnexo2I.GetTotalPorEjercer():"";
			String vObservaciones 			= oAnexo2I.GetObservaciones()!=null?oAnexo2I.GetObservaciones():"";
	sArchivo = "\n		<TR height='25'><TD align='right'>&nbsp;<a onmouseover=" + c + "this.style.cursor='hand'" + c + " style='cursor:normal'>" + FormatoDecimal.format(new Float(!vPresupuestoAprobado.equals("")?vPresupuestoAprobado:"0")) + "</a>&nbsp;&nbsp;</TD></TR>";
	sArchivo += "\n		<TR height='25'><TD align='right'>&nbsp;<a onmouseover=" + c + "this.style.cursor='hand'" + c + " style='cursor:normal'>" + FormatoDecimal.format(new Float(!vIncrementos.equals("")?vIncrementos:"0")) + "</a>&nbsp;&nbsp;</TD></TR>";
	sArchivo += "\n		<TR height='25'><TD align='right'>&nbsp;<a onmouseover=" + c + "this.style.cursor='hand'" + c + " style='cursor:normal'>" + FormatoDecimal.format(new Float(!vReducciones.equals("")?vReducciones:"0")) + "</a>&nbsp;&nbsp;</TD></TR>";
	sArchivo += "\n		<TR height='25'><TD align='right'>&nbsp;<a onmouseover=" + c + "this.style.cursor='hand'" + c + " style='cursor:normal'>" + FormatoDecimal.format(new Float(!vProgramasEspeciales.equals("")?vProgramasEspeciales:"0")) + "</a>&nbsp;&nbsp;</TD></TR>";
	sArchivo += "\n		<TR height='25'><TD align='right'>&nbsp;<a onmouseover=" + c + "this.style.cursor='hand'" + c + " style='cursor:normal'>" + FormatoDecimal.format(new Float(!vTotalAprobado.equals("")?vTotalAprobado:"0")) + "</a>&nbsp;&nbsp;</TD></TR>";
	sArchivo += "\n		<TR height='25'><TD align='right'>&nbsp;<a onmouseover=" + c + "this.style.cursor='hand'" + c + " style='cursor:normal'>" + FormatoDecimal.format(new Float(!vTotalEjercido.equals("")?vTotalEjercido:"0")) + "</a>&nbsp;&nbsp;</TD></TR>";
	sArchivo += "\n		<TR height='25'><TD align='right'>&nbsp;<a onmouseover=" + c + "this.style.cursor='hand'" + c + " style='cursor:normal'>" + FormatoDecimal.format(new Float(!vTotalPorEjercer.equals("")?vTotalPorEjercer:"0")) + "</a>&nbsp;&nbsp;</TD></TR>";
	sArchivo += "\n				</TABLE></TD>";
	sArchivo += "\n		</TR>";
	sArchivo += "\n 	</TABLE>";
	sArchivo += "\n	<br>";
	sArchivo += "\n	<TABLE align='center' cellPadding='0' cellSpacing='0' width='40%' BORDER='1' BORDERCOLOR='black'>";
	sArchivo += "\n		<TR><TD class='TituloMenu' align='center'><a onmouseover=" + c + "this.style.cursor='hand'" + c + " style='cursor:normal'>Observaciones</a></TD></TR>";
	sArchivo += "\n		<TR><TD>&nbsp;<a onmouseover=" + c + "this.style.cursor='hand'" + c + " style='cursor:normal'><textarea readonly class='txtBox' style='border: 0; background-color: transparent; transparent;overflow-y:hidden; width:'100%;' height='100%' name='sObservaciones' id='sObservaciones'>" + vObservaciones + "</textarea></a></TD></TR>";
	sArchivo += "\n</TABLE>";
	sArchivo += "\n<br>";
	sArchivo += "\n<TABLE border=0 cellPadding=0 cellSpacing=0 width='100%'>";
	sArchivo += "\n			 <TR><TD class='SubTituloMenu'>ADJUNTAR PRESUPUESTOS AUTORIZADOS</TD></TR>";
	sArchivo += "\n</TABLE>	";
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
