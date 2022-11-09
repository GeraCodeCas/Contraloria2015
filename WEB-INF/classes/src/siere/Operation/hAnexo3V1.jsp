<%
/*********************************************************************************************************
Nombre:		Anexo 3.5.1
Elaboro:	Jesus Manuel Limon Mireles
Lugar:		Monterrey, NL, Mexico
Fecha:		6.Ene.2003
Compañia:	CONSISS
*********************************************************************************************************/
%>
<%
if (oArchivo.AbreArchivo(sRutaHistoria,"fAnexo3V1.html") && oArchivowa.AbreArchivo(sRutaAttach,"fAnexo3V1.html")){
	sAnexo 					= "III.5.1";
	Anexo3V1 oAnexo3V1 		= new Anexo3V1();
	iIdAnexo 				= oAnexo3V1.GetIdAnexo();
	oAnexoEstatus.Get(iIdFuncionario, iIdAnexo);
	sEstatus 				= oAnexoEstatus.GetEstatus();
	sAux = "\n				<tr><TD colspan='3' class='TituloParrafo' width='100%'>&nbsp;&nbsp;ANEXO III.5.1 - MOBILIARIO Y EQUIPO DE OFICINA</TD></tr>";
%>
				<%@include file="HeaderAnexoHistorico.jsp"%>
<%
	sArchivo = "\n	<TABLE cellPadding='0' cellSpacing='0' width='100%' BORDER='1' BORDERCOLOR='white'>";
	sArchivo += "\n		<TR align='middle'>";
	sArchivo += "\n			<td class='TituloMenu' style='font-size:9px;'>No. de<br>Inventario</TD>";
	sArchivo += "\n			<td class='TituloMenu' style='font-size:9px;'>Descripción<br>del Artículo</TD>";
	sArchivo += "\n			<td class='TituloMenu' style='font-size:9px;'>Marca</TD>";
	sArchivo += "\n			<td class='TituloMenu' style='font-size:9px;'>Modelo</TD>";
	sArchivo += "\n			<td class='TituloMenu' style='font-size:9px;'>Serie</TD>";
	sArchivo += "\n			<td class='TituloMenu' style='font-size:9px;'>Valor</TD>";
	sArchivo += "\n			<td class='TituloMenu' style='font-size:9px;'>Ubicación</TD>";
	sArchivo += "\n			<td class='TituloMenu' style='font-size:9px;'>Resguardante y Referencia<br>del Resguardo</TD>";
	sArchivo += "\n			<td class='TituloMenu' style='font-size:9px;'>Tipo</TD>";
	sArchivo += "\n		</TR>";
	oArchivo.Escribe(sArchivo);
	oArchivowa.Escribe(sArchivo);

	if(!sEstatus.equals("0")){ // DETALLE DE ANEXO	
		int intContador = 0;
		String sBackColor = "";
		oAnexo3V1.GetAll(iIdFuncionario);
		
		for(int i=0;i<oAnexo3V1.GetAll(iIdFuncionario);i++){
			String vIdRenglon 			= oAnexo3V1.GetIdRenglon(i)!=-1?oAnexo3V1.GetIdRenglon(i)+"":"0";
			intContador = intContador + 1;
			if (intContador%2 == 0){	sBackColor = "#ffffff";	}
			else{						sBackColor = "#eeeeee"; }

	sArchivo = "\n		<TR align='left' bgcolor='" + sBackColor + "' onMouseOver = 'MouseDentro(this);' onMouseOut  = " + c + "MouseFuera(this,'" + sBackColor + "');" + c + ">";
	sArchivo += "\n			<TD>&nbsp;<a onmouseover=" + c + "this.style.cursor='hand'" + c + " style='cursor:normal'>";
	sArchivo += oAnexo3V1.GetNoInventario(i)!=null? oAnexo3V1.GetNoInventario(i) + "</a></TD>": "</a></TD>";
	sArchivo += "\n			<TD>&nbsp;<a onmouseover=" + c + "this.style.cursor='hand'" + c + " style='cursor:normal'>";
	sArchivo += oAnexo3V1.GetDescripcion(i)!=null? oAnexo3V1.GetDescripcion(i) + "</a></TD>":"</a></TD>";
	sArchivo += "\n			<TD>&nbsp;<a onmouseover=" + c + "this.style.cursor='hand'" + c + " style='cursor:normal'>";
	sArchivo += oAnexo3V1.GetMarca(i)!=null? oAnexo3V1.GetMarca(i) + "</a></TD>":"</a></TD>";
	sArchivo += "\n			<TD>&nbsp;<a onmouseover=" + c + "this.style.cursor='hand'" + c + " style='cursor:normal'>";
	sArchivo += oAnexo3V1.GetModelo(i)!=null? oAnexo3V1.GetModelo(i) + "</a></TD>":"</a></TD>";
	sArchivo += "\n			<TD>&nbsp;<a onmouseover=" + c + "this.style.cursor='hand'" + c + " style='cursor:normal'>";
	sArchivo += oAnexo3V1.GetSerie(i)!=null? oAnexo3V1.GetSerie(i) + "</a></TD>":"</a></TD>";
	sArchivo += "\n			<TD align='right'>&nbsp;<a onmouseover=" + c + "this.style.cursor='hand'" + c + " style='cursor:normal'>" + FormatoDecimal.format(new Float(oAnexo3V1.GetValor(i)!=null&&!("").equals(oAnexo3V1.GetValor(i).trim())?oAnexo3V1.GetValor(i):"0")) + "</a></TD>";
	sArchivo += "\n			<TD>&nbsp;<a onmouseover=" + c + "this.style.cursor='hand'" + c + " style='cursor:normal'>";
	sArchivo += oAnexo3V1.GetUbicacion(i)!=null? oAnexo3V1.GetUbicacion(i) + "</a></TD>":"</a></TD>";
	sArchivo += "\n			<TD>&nbsp;<a onmouseover=" + c + "this.style.cursor='hand'" + c + " style='cursor:normal'>";
	sArchivo += oAnexo3V1.GetResguardante(i)!=null? oAnexo3V1.GetResguardante(i) + "</a></TD>":"</a></TD>";
	String vDesTipo = "";
	try{
		vDesTipo = oAnexo3V1.GetDesTipo(oAnexo3V1.GetTipoPos(oAnexo3V1.GetTipo(i)));
	}catch(Throwable z){
		System.out.println("iAnexo3v1.Tipo: " + z + " " + oAnexo3V1.GetTipo(i)); 
		vDesTipo = oAnexo3V1.GetTipo(i);
	}
	sArchivo += "\n			<TD>&nbsp;<a onmouseover=" + c + "this.style.cursor='hand'" + c + " style='cursor:normal'>" + vDesTipo + "</a></TD>";
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

