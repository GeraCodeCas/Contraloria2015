<%
/*********************************************************************************************************
Nombre:		Anexo 2.7
Elaboro:	Jesus Manuel Limon Mireles
Lugar:		Monterrey, NL, Mexico
Fecha:		6.Ene.2003
Compañia:	CONSISS
*********************************************************************************************************/
%>
<%
if (oArchivo.AbreArchivo(sRutaHistoria,"fAnexo2VII.html") && oArchivowa.AbreArchivo(sRutaAttach,"fAnexo2VII.html")){
	sAnexo 					= "II.7";
	Anexo2VII oAnexo2VII 	= new Anexo2VII();
	iIdAnexo 				= oAnexo2VII.GetIdAnexo();
	oAnexoEstatus.Get(iIdFuncionario, iIdAnexo);
	sEstatus 				= oAnexoEstatus.GetEstatus();
	sAux = "\n				<tr><TD  colspan='3' class='TituloParrafo' width='70%'>ANEXO II.7 - ESTADOS FINANCIEROS DICTAMINADOS</TD></tr>";
%>
	<%@include file="HeaderAnexoHistorico.jsp"%>
<%
	sArchivo = "\n<table align='center' cellspacing='0' cellpadding='0' border='0' width='100%'>";
	sArchivo += "\n<tr><td width='450' align='center' class='TituloMenu'>Concepto</td><td  align='center' class='TituloMenu'>Sí</td><td  align='center' class='TituloMenu'>No</td><td  align='center' class='TituloMenu'>Fecha de cierre de la Información</td></tr>";
	sArchivo += "\n<tr><TD valign='top' width='450'>";
	sArchivo += "\n     <TABLE cellPadding='0' cellSpacing='0' width='452' BORDER='0'>";
	sArchivo += "\n		 <TR height='25'><TD class='TituloMenu'><a onmouseover=" + c + "this.style.cursor='hand'" + c + " style='cursor:normal'>Se Entrega (*)</a></TD></TR>";
	sArchivo += "\n		 <TR height='25'><TD class='TituloMenu'><a onmouseover=" + c + "this.style.cursor='hand'" + c + " style='cursor:normal'>Balance General</a></TD></TR>";
	sArchivo += "\n		 <TR height='25'><TD class='TituloMenu'><a onmouseover=" + c + "this.style.cursor='hand'" + c + " style='cursor:normal'>Estado de Resultados</a></TD></TR>";
	sArchivo += "\n		 <TR height='25'><TD class='TituloMenu'><a onmouseover=" + c + "this.style.cursor='hand'" + c + " style='cursor:normal'>Estado de Origen y Aplicación</a></TD></TR>";
	sArchivo += "\n		 <TR height='25'><TD class='TituloMenu'><a onmouseover=" + c + "this.style.cursor='hand'" + c + " style='cursor:normal'>Libros y Registros de Contabilidad al Corriente</a></TD></TR>";
	sArchivo += "\n		 <TR height='1'><td height='1' bgcolor='Black'></td></tr>";
	sArchivo += "\n		 <TR height='50'><TD class='TituloMenu'><a onmouseover=" + c + "this.style.cursor='hand'" + c + " style='cursor:normal'>Los Estados Financieros fueron auditados externamente</a></TD></TR>";		
	sArchivo += "\n	  </TABLE></TD>";
	oArchivo.Escribe(sArchivo);
	oArchivowa.Escribe(sArchivo);
	sArchivo = "";
	if(!sEstatus.equals("0")){
		sArchivo += "\n<TD valign='top'>";
		sArchivo += "\n	  <TABLE cellPadding='0' cellSpacing='0' width='100%' BORDER='0'>";
		oArchivo.Escribe(sArchivo);
		oArchivowa.Escribe(sArchivo);

		oAnexo2VII.Get(iIdFuncionario);
//		String vEntrega 			= oAnexo2VII.GetEntrega()!=null?oAnexo2VII.GetEntrega():"";
		String vBalanceGeneral 		= oAnexo2VII.GetBalanceGeneral()!=null?oAnexo2VII.GetBalanceGeneral():"";
		String vEstadoResultados	= oAnexo2VII.GetEstadoResultados()!=null?oAnexo2VII.GetEstadoResultados():"";
		String vEstadoOrigen 		= oAnexo2VII.GetEstadoOrigen()!=null?oAnexo2VII.GetEstadoOrigen():"";
		String vLibrosRegistros 	= oAnexo2VII.GetLibrosRegistros()!=null?oAnexo2VII.GetLibrosRegistros():"";
		String vEstadosFinancieros 	= oAnexo2VII.GetEstadosFinancieros()!=null?oAnexo2VII.GetEstadosFinancieros():"";
		String vQuienAudito		    = oAnexo2VII.GetQuienAudito()!=null?oAnexo2VII.GetQuienAudito():"";
		String vFechaCierre 		= oAnexo2VII.GetFechaCierre()!=null?oAnexo2VII.GetFechaCierre():"";
		String vFechaAuditoria 		= oAnexo2VII.GetFechaAuditoria()!=null?oAnexo2VII.GetFechaAuditoria():"";

	//	sArchivo = "\n			<TR height='25'><td>" ;
	//	sArchivo += (vEntrega.equals("1")) ? "<img src='" + sPath + "Images/VinetaGde.gif'></td></tr>":"</td></tr>";
		sArchivo = "\n			<TR height='25'><td>";
		sArchivo += (vBalanceGeneral.equals("1"))? "<img src='" + sPath + "Images/VinetaGde.gif'></td></tr>":"</td></tr>";
		sArchivo += "\n			<TR height='25'><td>";
		sArchivo += (vEstadoResultados.equals("1"))? "<img src='" + sPath + "Images/VinetaGde.gif'></td></tr>":"</td></tr>";
		sArchivo += "\n			<TR height='25'><td>";
		sArchivo += (vEstadoOrigen.equals("1"))? "<img src='" + sPath + "Images/VinetaGde.gif'></td></tr>":"</td></tr>";
		sArchivo += "\n			<TR height='25'><td>";
		sArchivo += (vLibrosRegistros.equals("1")) ? "<img src='" + sPath + "Images/VinetaGde.gif'></td></tr>":"</td></tr>";
		sArchivo += "\n			<TR height='2'><td height='2'></td></tr>";
		sArchivo += "\n			<TR height='50'><td>";
		sArchivo += (vEstadosFinancieros.equals("1"))? "<img src='" + sPath + "Images/VinetaGde.gif'></td></tr>":"</td></tr>";
		sArchivo += "\n       </TABLE>";
		sArchivo += "\n</td>";
		oArchivo.Escribe(sArchivo);
		oArchivowa.Escribe(sArchivo);
		sArchivo = "\n<TD valign='top'>";
		sArchivo += "\n      <TABLE cellPadding='0' cellSpacing='0' width='100%' BORDER='0' bgcolor='#eeeeee'>";
	//	sArchivo += "\n			<TR height='25'><td>";
	//	sArchivo += (vEntrega.equals("2")) ? "<img src='" + sPath + "Images/VinetaGde.gif'></td></tr>":"</td></tr>";
		sArchivo += "\n			<TR height='25'><td>";
		sArchivo += (vBalanceGeneral.equals("2")) ? "<img src='" + sPath + "Images/VinetaGde.gif'></td></tr>":"</td></tr>";
		sArchivo += "\n			<TR height='25'><td>";
		sArchivo += (vEstadoResultados.equals("2")) ? "<img src='" + sPath + "Images/VinetaGde.gif'></td></tr>":"</td></tr>";
		sArchivo += "\n			<TR height='25'><td>";
		sArchivo += (vEstadoOrigen.equals("2")) ? "<img src='" + sPath + "Images/VinetaGde.gif'></td></tr>":"</td></tr>";
		sArchivo += "\n			<TR height='25'><td>";
		sArchivo += (vLibrosRegistros.equals("2"))? "<img src='" + sPath + "Images/VinetaGde.gif'></td></tr>":"</td></tr>";
		sArchivo += "\n			<TR height='2'><td height='2'></td></tr>";
		sArchivo += "\n			<TR height='50'><td>";
		sArchivo += (vEstadosFinancieros.equals("2"))? "<img src='" + sPath + "Images/VinetaGde.gif'></td></tr>":"</td></tr>";
		sArchivo += "\n      </TABLE></td>";
		oArchivo.Escribe(sArchivo);
		oArchivowa.Escribe(sArchivo);
		sArchivo = "\n<TD valign='top'>";
		sArchivo += "\n      <TABLE cellPadding='0' cellSpacing='0' width='100%' BORDER='0'>";
		sArchivo += "\n        	<TR height='25'><td align='center'>";
		sArchivo += "\n				&nbsp;<a onmouseover=" + c + "this.style.cursor='hand'" + c + " style='cursor:normal'>" + vFechaCierre + "</a>";
		sArchivo += "\n			</td></tr>";
		sArchivo += "\n			<TR height='25'><td></td></tr>";
		sArchivo += "\n			<TR height='25'><td></td></tr>";
		sArchivo += "\n			<TR height='25'><td></td></tr>";
		sArchivo += "\n			<TR height='25'><td></td></tr>";
		sArchivo += "\n			<TR height='2'><td height='2' bgcolor='black'></td></tr>";
		sArchivo += "\n			<TR height='50' valign='top'><td valign='top'>";
		sArchivo += "\n			 <TABLE cellPadding='0' cellSpacing='0' width='100%' BORDER='0'>";
		sArchivo += "\n        	    <TR height='25'><td align='center' width='100%' class='TituloMenu'>Fecha de la Auditoría</td></tr>";
		sArchivo += "\n				<TR height='25'><td  width='100%' align='center'>";
		sArchivo += "\n				&nbsp;<a onmouseover=" + c + "this.style.cursor='hand'" + c + " style='cursor:normal'>" + vFechaAuditoria + "</a>";
		sArchivo += "\n				</td></tr>";
		sArchivo += "\n			 </TABLE></td></tr>";
		sArchivo += "\n      </TABLE></td>";
		sArchivo += "\n</tr>";
		sArchivo += "\n<TR>";
		sArchivo += "\n	<TD height='25' class='TituloMenu'><a onmouseover=" + c + "this.style.cursor='hand'" + c + " style='cursor:normal'>¿Quién Auditó?</a></TD>";
		sArchivo += "\n	<td colspan='3'>";
		sArchivo += "\n	&nbsp;<a onmouseover=" + c + "this.style.cursor='hand'" + c + " style='cursor:normal'>" + vQuienAudito + "</a>";
		sArchivo += "\n	</td>";
		sArchivo += "\n</TR>";
		sArchivo += "\n<TR>";
		sArchivo += "\n	<TD height='25' colspan='4' class='SubTituloMenu'>* Adjuntar Últimos Estados Financieros Auditados y Relación de los Estados Financieros Anteriores, Auditados</td>";
		sArchivo += "\n</TR>";
		sArchivo += "\n</table>";
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

