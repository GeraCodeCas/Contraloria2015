<%
/*********************************************************************************************************
Nombre:		Anexo 1.2
Elaboro:	Jesus Manuel Limon Mireles
Lugar:		Monterrey, NL, Mexico
Fecha:		2.Ene.2003
Compañia:	CONSISS
*********************************************************************************************************/
%>
<%
//Valida la permanencia del usuario en session
if ((String)session.getValue("ok")!="Consiss")
			response.sendRedirect("Error.html");



if (oArchivo.AbreArchivo(sRutaHistoria,"fAnexo1II.html") && oArchivowa.AbreArchivo(sRutaAttach,"fAnexo1II.html")){
	sAnexo 				= "I.2";
	Anexo1II oAnexo1II 	= new Anexo1II();
 	iIdAnexo 			= oAnexo1II.GetIdAnexo();
	oAnexoEstatus.Get(iIdFuncionario, iIdAnexo);
	sEstatus 				= oAnexoEstatus.GetEstatus();
	sAux = "\n				<tr>			<TD  colspan='3' class='TituloParrafo' width='70%'>ANEXO I.2 - RELACIÓN DE ACUERDOS, CONVENIOS, CONTRATOS Y DOCUMENTOS LEGALES</TD></tr>";
%>
				<%@include file="HeaderAnexoHistorico.jsp"%>
<%

	sArchivo = "\n				<TABLE cellPadding='0' cellSpacing='0' width='100%' BORDER='1' BORDERCOLOR='white'>";
	sArchivo += "\n					<!-- Etiqueta donde se aplican los encabezados de las tablas-->";
	sArchivo += "\n					<TR align='middle'>	<td class='TituloMenu'>Tipo</TD><td class='TituloMenu'>No.</TD><td class='TituloMenu'>Fecha de Suscripción</TD><td class='TituloMenu'>Duración</TD><td class='TituloMenu'>Descripción</TD><td class='TituloMenu'>Importe Total</TD><td class='TituloMenu'>Entidad Con Quien Suscribe</TD><td class='TituloMenu'>Observaciones</TD></TR>";
	oArchivo.Escribe(sArchivo);
	oArchivowa.Escribe(sArchivo);
	sArchivo = "";
				
		if(!sEstatus.equals("0")){
			int intContador = 0;
			String sBackColor = "";
			oAnexo1II.GetAll(iIdFuncionario);
		for(int i=0;i<oAnexo1II.GetAll(iIdFuncionario);i++){
		  	String vIdRenglon 				= oAnexo1II.GetIdRenglon(i)!=-1?oAnexo1II.GetIdRenglon(i)+"":"0";
			String vIdTipo 					= oAnexo1II.GetIdTipo(i)!=-1?oAnexo1II.GetIdTipo(i)+"":"0";
			String vNumero 					= oAnexo1II.GetNumero(i)!=null?oAnexo1II.GetNumero(i):"";
			String vFechaSuscripcion		= oAnexo1II.GetFechaSuscripcion(i)!=null?oAnexo1II.GetFechaSuscripcion(i):"";
			String vDuracion 				= oAnexo1II.GetDuracion(i)!=null?oAnexo1II.GetDuracion(i):"";
			String vDescripcion 			= oAnexo1II.GetDescripcion(i)!=null?oAnexo1II.GetDescripcion(i):"";
			String vImporteTotal 			= oAnexo1II.GetImporteTotal(i)!=null?oAnexo1II.GetImporteTotal(i):"";
			String vEntidad		            = oAnexo1II.GetEntidad(i)!=null?oAnexo1II.GetEntidad(i):"";
			String vObservaciones 			= oAnexo1II.GetObservaciones(i)!=null?oAnexo1II.GetObservaciones(i):"";
			intContador = intContador + 1;
		 if (intContador%2 == 0){
					sBackColor = "#ffffff";
				}else{
					sBackColor = "#eeeeee";
			  }
			  
	sArchivo = "\n		<TR align='left' bgcolor='" + sBackColor + "'";
	sArchivo += "\n			onMouseOver = " + c + "MouseDentro(this);" + c;
	sArchivo += "\n			onMouseOut  = " + c + "MouseFuera(this,'" + sBackColor + "');" + c + ">";
	sArchivo += "\n			<TD align='center'>&nbsp;<a onmouseover=" + c + "this.style.cursor='hand'" + c + " style='cursor:normal'>" + vIdTipo + "</a></TD>";
	sArchivo += "\n			<TD>&nbsp;<a onmouseover=" + c + "this.style.cursor='hand'" + c + " style='cursor:normal'>" + vNumero + "</a></TD>";
	sArchivo += "\n			<TD align='center'>&nbsp;<a onmouseover=" + c + "this.style.cursor='hand'" + c + " style='cursor:normal'> " + vFechaSuscripcion + "</a></TD>";
	sArchivo += "\n			<TD align='center'>&nbsp;<a onmouseover=" + c + "this.style.cursor='hand'" + c + " style='cursor:normal'> " + vDuracion + "</a></TD>";
	sArchivo += "\n			<TD>&nbsp;<a onmouseover=" + c + "this.style.cursor='hand'" + c + " style='cursor:normal'>" + vDescripcion + "</a></TD>";
	sArchivo += "\n			<TD align='right'>&nbsp;<a onmouseover=" + c + "this.style.cursor='hand'" + c + " style='cursor:normal'>" + FormatoDecimal.format(new Float(!vImporteTotal.equals("")?vImporteTotal:"0")) + "</a>&nbsp;&nbsp;</TD>";
	sArchivo += "\n			<TD>&nbsp;<a onmouseover=" + c + "this.style.cursor='hand'" + c + " style='cursor:normal'>" + vEntidad + "</a></TD>";
	sArchivo += "\n			<TD>&nbsp;<a onmouseover=" + c + "this.style.cursor='hand'" + c + " style='cursor:normal'>" + vObservaciones + "</a></TD>";
	sArchivo += "\n		</TR>";
	sArchivo += "\n		";
	oArchivo.Escribe(sArchivo);
	oArchivowa.Escribe(sArchivo);
	sArchivo = "";
	}
	sArchivo += "\n		</TABLE>";
	oArchivo.Escribe(sArchivo);
	oArchivowa.Escribe(sArchivo);
	sArchivo = "";
} else {
		sArchivo = "\n	</TABLE>";
		sArchivo += "\n	<TABLE width='100%'>";
		sArchivo += "\n		<TR>";
		sArchivo += "\n			<TD align='center'><H1 style='size=+2'><br>ESTE ANEXO NO APLICA</H1></TD>";
		sArchivo += "\n		</TR>";
		sArchivo += "\n	</TABLE>";
		oArchivo.Escribe(sArchivo);
		oArchivowa.Escribe(sArchivo);
		sArchivo = "";
}
	sArchivo = "\n</td>	<!-- Contenido -->";
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
