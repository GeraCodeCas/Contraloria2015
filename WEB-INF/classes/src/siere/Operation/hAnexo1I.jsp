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
if (oArchivo.AbreArchivo(sRutaHistoria,"fAnexo1I.html") && oArchivowa.AbreArchivo(sRutaAttach,"fAnexo1I.html")){
	sAnexo 							= "I.1";
	Anexo1I oAnexo1I 				= new Anexo1I();
	DetalleAnexo1I oDetalleAnexo1I 	= new DetalleAnexo1I();
	iIdAnexo 						= oAnexo1I.GetIdAnexo();
	oAnexoEstatus.Get(iIdFuncionario, iIdAnexo);
	sEstatus 				= oAnexoEstatus.GetEstatus();
	sAux = "\n				<tr><TD colspan='3' class='TituloParrafo' width='100%'>ANEXO I.1 - DOCUMENTOS DE CREACIÓN, INTEGRACIÓN DEL ORGANO DE GOBIERNO Y ACTAS DE SESIONES</TD></tr>";
%>
				<%@include file="HeaderAnexoHistorico.jsp"%>
<%
	sArchivo = "\n				<TABLE cellPadding='0' cellSpacing='0' width='100%' BORDER='1' BORDERCOLOR='white'>";
	sArchivo += "\n					<TR align='center' valign='middle'>";
	sArchivo += "\n						<td class='TituloMenu'>Ley, Decreto, Acuerdo, Contrato de Fideicomiso, Acta Constitutiva</TD><td class='TituloMenu'>Nombre</TD><td class='TituloMenu'>Objetivo General</TD><td class='TituloMenu'>Fideicomitente</TD><td class='TituloMenu'>Fiduciario</TD><td class='TituloMenu'>Fideicomisario</TD><td class='TituloMenu'>Fecha de Creación</TD>";
	sArchivo += "\n						<td class='TituloMenu' height='100%'>";
	sArchivo += "\n							<table cellPadding='0' cellSpacing='0' width='100%'  height='100%'>";
	sArchivo += "\n								<tr align='middle'><td class='TituloMenu' colspan='2'>Publicación</td></tr>";
	sArchivo += "\n								<tr align='middle'><td width='50%' class='TituloMenu'>Fecha</td><td width='50%' class='TituloMenu'>Periódico Oficial No.</td></tr>";
	sArchivo += "\n							</table>";
	sArchivo += "\n						</TD>";
	sArchivo += "\n					</TR>";
	oArchivo.Escribe(sArchivo);
	oArchivowa.Escribe(sArchivo);
			if(!sEstatus.equals("0")){
				int intContador = 0;
				String sBackColor = "";
				oAnexo1I.GetAll(iIdFuncionario);
			for(int i=0;i<oAnexo1I.GetAll(iIdFuncionario);i++){
				String vIdRenglon 						= oAnexo1I.GetIdRenglon(i)!=-1?oAnexo1I.GetIdRenglon(i)+"":"0";
				String vLey 							= oAnexo1I.GetLey(i)!=null?oAnexo1I.GetLey(i):"";
				String vNombre 							= oAnexo1I.GetNombre(i)!=null?oAnexo1I.GetNombre(i):"";
				String vObjetivoGeneral					= oAnexo1I.GetObjetivoGeneral(i)!=null?oAnexo1I.GetObjetivoGeneral(i):"";
				String vFideicomitente 				    = oAnexo1I.GetFideicomitente(i)!=null?oAnexo1I.GetFideicomitente(i):"";
				String vFiduciario 						= oAnexo1I.GetFiduciario(i)!=null?oAnexo1I.GetFiduciario(i):"";
				String vFideicomisario 					= oAnexo1I.GetFideicomisario(i)!=null?oAnexo1I.GetFideicomisario(i):"";
				String vFechaCreacion		            = oAnexo1I.GetFechaCreacion(i)!=null?oAnexo1I.GetFechaCreacion(i):"";
				String vFechaPublicacion 				= oAnexo1I.GetFechaPublicacion(i)!=null?oAnexo1I.GetFechaPublicacion(i):"";
				String vPeriodicoOficial 				= oAnexo1I.GetPeriodicoOficial(i)!=null?oAnexo1I.GetPeriodicoOficial(i):"";
				intContador = intContador + 1;
			 	if (intContador%2 == 0)
					sBackColor = "#ffffff";
				else
					sBackColor = "#eeeeee";
	sArchivo = "\n					<TR valign='top' align='left' bgcolor='" + sBackColor + "' onMouseOver = 'MouseDentro(this);' onMouseOut  = " + c + "MouseFuera(this,'" + sBackColor + "');" + c + ">";
	sArchivo += "\n						<TD>&nbsp;" + vLey + "</TD>";
	sArchivo += "\n						<TD>&nbsp;" + vNombre + "</TD>";
	sArchivo += "\n						<TD>&nbsp;" + vObjetivoGeneral + "</TD>";
	sArchivo += "\n						<TD>&nbsp;" + vFideicomitente + "</TD>";
	sArchivo += "\n						<TD>&nbsp;" + vFiduciario + "</TD>";
	sArchivo += "\n						<TD>&nbsp;" + vFideicomisario + "</TD>";
	sArchivo += "\n						<TD>&nbsp;" + vFechaCreacion + "</TD>";
	sArchivo += "\n						<TD height='100%'>";
	sArchivo += "\n							<table cellPadding='0' cellSpacing='0' width='100%' border='0'width='100%' height='100%'> ";
	sArchivo += "\n								<tr align='middle' valign='top'>";
	sArchivo += "\n									<td width='50%'>&nbsp;" + vFechaPublicacion + "</td><td width='50%'>&nbsp;" + vPeriodicoOficial + "</td>";
	sArchivo += "\n								</tr>";
	sArchivo += "\n							</table>";
	sArchivo += "\n						</TD>";
	sArchivo += "\n					</TR>";
	oArchivo.Escribe(sArchivo);
	oArchivowa.Escribe(sArchivo);
			}
	sArchivo = "\n				</TABLE>";
	sArchivo += "\n				<br>";
	sArchivo += "\n				<br>";
	sArchivo += "\n				<TABLE cellPadding='0' cellSpacing='0' width='80%' BORDER='1' BORDERCOLOR='white' align='center'>";
	sArchivo += "\n					<TR align='middle'>";
	sArchivo += "\n						<td class='TituloMenu'>Integración del Organo de Gobierno</TD>";
	sArchivo += "\n						<td class='TituloMenu'>Actas de Sesión: Octubre 1997</TD>";
	sArchivo += "\n					</TR>";
	oArchivo.Escribe(sArchivo);
	oArchivowa.Escribe(sArchivo);
				oDetalleAnexo1I.Get(iIdFuncionario);
				String vIntegracion 		= oDetalleAnexo1I.GetIntegracion()!=null?oDetalleAnexo1I.GetIntegracion():"";
				String vActasSesion 		= oDetalleAnexo1I.GetActasSesion()!=null?oDetalleAnexo1I.GetActasSesion():"";
						sBackColor = "#ffffff";
		sArchivo = "\n					<TR align='left' bgcolor='" + sBackColor + "'>";
		sArchivo += "\n						<TD width='50%' align='center'>&nbsp;<textarea class='txtBox' style='background-color: transparent; transparent; width:'100%'; height='100%' name='sIntegracion' id='sIntegracion' rows='10' cols='40'>" + vIntegracion + "</textarea></TD>";
		sArchivo += "\n						<TD width='50%' align='center'>&nbsp;<textarea readonly class='txtBox' style='border: 0; background-color: transparent; transparent; width:'100%'; height='100%' name='sActasSesion' id='sActasSesion' rows='10' cols='40'>" + vActasSesion + "</textarea></TD>";
//		sArchivo += "\n						<TD width='50%' align='center'>&nbsp;<textarea class='txtBox' style='background-color: transparent; transparent;overflow-y:hidden; width:'100%'; height='100%' name='sIntegracion' id='sIntegracion' rows='10' cols='40'>" + vIntegracion + "</textarea></TD>";
//		sArchivo += "\n						<TD width='50%' align='center'>&nbsp;<textarea readonly class='txtBox' style='border: 0; background-color: transparent; transparent;overflow-y:hidden; width:'100%'; height='100%' name='sActasSesion' id='sActasSesion' rows='10' cols='40'>" + vActasSesion + "</textarea></TD>";
		sArchivo += "\n					</tr>";
		sArchivo += "\n				</TABLE> ";
		oArchivo.Escribe(sArchivo);
		oArchivowa.Escribe(sArchivo);
	} else {
		sArchivo = "\n			</TABLE>";
		sArchivo += "\n			<TABLE width='100%'>";
		sArchivo += "\n				<TR>";
		sArchivo += "\n					<TD align='center'><H1 style='size=+2'><br>ESTE ANEXO NO APLICA</H1></TD>";
		sArchivo += "\n				</TR>";
		sArchivo += "\n			</TABLE>";
		oArchivo.Escribe(sArchivo);
		oArchivowa.Escribe(sArchivo);
	}
	sArchivo = "\n		</td>";
	sArchivo += "\n	</tr>";
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