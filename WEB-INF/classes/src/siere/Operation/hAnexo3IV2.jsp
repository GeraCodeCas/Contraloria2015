<%
/*********************************************************************************************************
Nombre:		Anexo 3.4.2
Elaboro:	Jesus Manuel Limon Mireles
Lugar:		Monterrey, NL, Mexico
Fecha:		6.Ene.2003
Compañia:	CONSISS
*********************************************************************************************************/
%>
<%
if (oArchivo.AbreArchivo(sRutaHistoria,"fAnexo3IV2.html") && oArchivowa.AbreArchivo(sRutaAttach,"fAnexo3IV2.html")){
	sAnexo 					= "III.4.2";
	Anexo3IV2 oAnexo3IV2 	= new Anexo3IV2();
	iIdAnexo 				= oAnexo3IV2.GetIdAnexo();
	oAnexoEstatus.Get(iIdFuncionario, iIdAnexo);
	sEstatus 				= oAnexoEstatus.GetEstatus();
	sAux = "\n				<tr><TD  colspan='3' class='TituloParrafo' width='70%'>ANEXO III.4.2 - PERSONAL CON LICENCIA, PERMISO O COMISIÓN</TD></tr>";
%>
				<%@include file="HeaderAnexoHistorico.jsp"%>
<%
	sArchivo = "\n	<TABLE cellPadding='0' cellSpacing='0' width='100%' BORDER='1' BORDERCOLOR='white'>";
	sArchivo += "\n		<TR align='middle'>";
	sArchivo += "\n			<td class='TituloMenu'>Nomina</TD>";
	sArchivo += "\n			<td class='TituloMenu'>Nombre</TD>";
	sArchivo += "\n			<td class='TituloMenu'>Situación</TD>";
	sArchivo += "\n			<td class='TituloMenu' height='100%'><table cellPadding='0' cellSpacing='0' width='100%'  height='100%'> ";
	sArchivo += "\n									<tr align='middle'><td class='TituloMenu' colspan='2'>Comisión</td></tr>";
	sArchivo += "\n									<tr align='middle' ><td width='50%' class='TituloMenu'>De</td><td width='50%' class='TituloMenu'>A</td></tr>";
	sArchivo += "\n									</table></TD>";
	sArchivo += "\n			<td class='TituloMenu' height='100%'><table cellPadding='0' cellSpacing='0' width='100%'  height='100%'> ";
	sArchivo += "\n									<tr align='middle'><td class='TituloMenu' colspan='2'>Período</td></tr>";
	sArchivo += "\n									<tr align='middle' ><td width='50%' class='TituloMenu'>De</td><td width='50%' class='TituloMenu'>A</td></tr>";
	sArchivo += "\n									</table></TD>";
	sArchivo += "\n			<td class='TituloMenu'>Observaciones</TD>";
	sArchivo += "\n		</TR>";
	oArchivo.Escribe(sArchivo);
	oArchivowa.Escribe(sArchivo);

		if(!sEstatus.equals("0")){

			int intContador = 0;
			String sBackColor = "";
			oAnexo3IV2.GetAll(iIdFuncionario);
		for(int i=0;i<oAnexo3IV2.GetAll(iIdFuncionario);i++){
		    String vIdRenglon 				= oAnexo3IV2.GetIdRenglon(i)!=-1?oAnexo3IV2.GetIdRenglon(i)+"":"0";
			String vNomina 					= oAnexo3IV2.GetNomina(i)!=null?oAnexo3IV2.GetNomina(i):"";
			String vNombre 					= oAnexo3IV2.GetNombre(i)!=null?oAnexo3IV2.GetNombre(i):"";
			String vSituacion				= oAnexo3IV2.GetSituacion(i)!=null?oAnexo3IV2.GetSituacion(i):"";
			String vDeComisionado 		= oAnexo3IV2.GetDeComisionado(i)!=null?oAnexo3IV2.GetDeComisionado(i):"";
			String vAComisionado 		= oAnexo3IV2.GetAComisionado(i)!=null?oAnexo3IV2.GetAComisionado(i):"";
			String vFechaDePeriodo 			= oAnexo3IV2.GetFechaDePeriodo(i)!=null?oAnexo3IV2.GetFechaDePeriodo(i):"";
			String vFechaAPeriodo 			= oAnexo3IV2.GetFechaAPeriodo(i)!=null?oAnexo3IV2.GetFechaAPeriodo(i):"";
			String vObservaciones 			= oAnexo3IV2.GetObservaciones(i)!=null?oAnexo3IV2.GetObservaciones(i):"";

			intContador = intContador + 1;
		 if (intContador%2 == 0){
					sBackColor = "#ffffff";
				}else{
					sBackColor = "#eeeeee";
			  }

	sArchivo = "\n		<TR align='left' bgcolor='" + sBackColor + "' ";
	sArchivo += "\n			onMouseOver = 'MouseDentro(this);'";
	sArchivo += "\n			onMouseOut  = " + c + "MouseFuera(this,'" + sBackColor + "');" + c + ">";
	sArchivo += "\n			<TD align='center'>&nbsp;<a onmouseover=" + c + "this.style.cursor='hand'" + c + " style='cursor:normal'>" + vNomina + "</a></TD>";
	sArchivo += "\n			<TD>&nbsp;<a onmouseover=" + c + "this.style.cursor='hand'" + c + " style='cursor:normal' >" + vNombre + "</a></TD>";
	sArchivo += "\n			<TD align='center'>&nbsp;<a onmouseover=" + c + "this.style.cursor='hand'" + c + " style='cursor:normal' >" + vSituacion + "</a></TD>";
	sArchivo += "\n			<TD>";
	sArchivo += "\n						<table cellPadding='0' cellSpacing='0' width='100%'> ";
	sArchivo += "\n						 <tr align='middle'>";
	sArchivo += "\n							<td width='50%'>&nbsp;<a onmouseover=" + c + "this.style.cursor='hand'" + c + " style='cursor:normal' >" + vDeComisionado + "</a></td>";
	sArchivo += "\n							<td width='50%'>&nbsp;<a onmouseover=" + c + "this.style.cursor='hand'" + c + " style='cursor:normal' >" + vAComisionado + "</a></td>";
	sArchivo += "\n						 </tr>";
	sArchivo += "\n						</table></TD>";
	sArchivo += "\n			<TD>";
	sArchivo += "\n						<table cellPadding='0' cellSpacing='0' width='100%'> ";
	sArchivo += "\n						 <tr align='middle'>";
	sArchivo += "\n							<td width='50%'>&nbsp;<a onmouseover=" + c + "this.style.cursor='hand'" + c + " style='cursor:normal' >" + vFechaDePeriodo + "</a></td>";
	sArchivo += "\n							<td width='50%'>&nbsp;<a onmouseover=" + c + "this.style.cursor='hand'" + c + " style='cursor:normal' >" + vFechaAPeriodo + "</a></td>";
	sArchivo += "\n						 </tr>";
	sArchivo += "\n						</table></TD>";
	sArchivo += "\n			<TD>&nbsp;<a onmouseover=" + c + "this.style.cursor='hand'" + c + " style='cursor:normal' >" + vObservaciones + "</a></TD>";
	sArchivo += "\n		</TR>";
	oArchivo.Escribe(sArchivo);
	oArchivowa.Escribe(sArchivo);
		}
	sArchivo = "\n	<TR><td colspan='2' ></td><TD class='ContenidoParrafo'>SITUACIÓN:</TD><td colspan='3'></td></TR>";
	sArchivo += "\n	<TR><td colspan='2' ></td><TD class='ContenidoParrafo'>LICENCIA (L)</TD><td colspan='3' ></td></TR>";
	sArchivo += "\n	<TR><td colspan='2' ></td><TD class='ContenidoParrafo'>PERMISO (P)</TD><td colspan='3' ></td></TR>";
	sArchivo += "\n	<TR><td colspan='2' ></td><TD class='ContenidoParrafo'>COMISIONADO (C)</TD><td colspan='3' ></td></TR>";
	sArchivo += "\n	</TABLE>";
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

