<%  
/*********************************************************************************************************
Nombre:		Anexo 3.18
Elaboro:	Jesus Manuel Limon Mireles
Lugar:		Monterrey, NL, Mexico
Fecha:		7.Ene.2003
Compañia:	CONSISS
*********************************************************************************************************/
%>
<%
if (oArchivo.AbreArchivo(sRutaHistoria,"fAnexo3XVIII.html") && oArchivowa.AbreArchivo(sRutaAttach,"fAnexo3XVIII.html")){
	sAnexo 					= "III.18";
	Anexo3XVIII oAnexo3XVIII	 	= new Anexo3XVIII();
	iIdAnexo 				= oAnexo3XVIII.GetIdAnexo();
	oAnexoEstatus.Get(iIdFuncionario, iIdAnexo);
	sEstatus 				= oAnexoEstatus.GetEstatus();
	String sOrigen = "0";
	int iOrigen		= 0;
	sAux = "<TD  colspan='3' class='TituloParrafo' width='70%'>ANEXO III.18 - RELACIÓN DE PLANES, ESTUDIOS Y PROYECTOS NO DESARROLLADOS.";
	if(!sEstatus.equals("0")){ //if de estatus
		sAux +="	<br>";
		sAux +="	<br><form name='forma'>";
		sAux +="	&nbsp;&nbsp;Consecutivo:&nbsp;";
		sAux +="	<select class='cmbBox' name='sOrigen' onchange='CambioTipoOrigen();'>";
		sAux +="		<option value='0' >--- Seleccione Consecutivo ---</option>";
		oAnexo3XVIII.GetAll(iIdFuncionario);
		for(int i=0;i<oAnexo3XVIII.GetAll(iIdFuncionario);i++){
			int iRenglonPaso		= oAnexo3XVIII.GetIdRenglon(i)!=-1?		oAnexo3XVIII.GetIdRenglon(i):0;
			String 	sOrigenPaso		= oAnexo3XVIII.GetConsecutivo(i)!=null?	oAnexo3XVIII.GetConsecutivo(i):"";
			sAux +="	<option value='" + iRenglonPaso + "'>" + sOrigenPaso + "</option>";  
		}
		sAux +="			</select>";
		sAux +="</form>";
	}
	%><%@include file="HeaderAnexoHistorico.jsp"%> <%	
	oArchivo.Escribe(sArchivo);
	oArchivowa.Escribe(sArchivo);  
	sArchivo ="";
	if(!sEstatus.equals("0")){ //if de estatus
		if(sOrigen.equals("0")){ //if de origen
			oAnexo3XVIII.GetAll(iIdFuncionario);
			for(int i=0;i<oAnexo3XVIII.GetAll(iIdFuncionario);i++){
				iOrigen	= oAnexo3XVIII.GetIdRenglon(i)!=-1?		oAnexo3XVIII.GetIdRenglon(i):0;
				sOrigen = iOrigen + "";
	
					sArchivo ="						 				  <TABLE  id='tbl" + iOrigen + "' style='display:none;' cellPadding='0' cellSpacing='0' width='100%' BORDER='1' BORDERCOLOR='white'>";
				 	if(!sOrigen.equals("0")){
					     oAnexo3XVIII.Get(iIdFuncionario, iOrigen);
					}
					sArchivo +="				<tr>";
					sArchivo +="					<td colspan='2'>";
					sArchivo +="						<table border='1' cellspacing='0' cellpadding='0' width='100%' bordercolor='black'>";
					sArchivo +="							<TR align='middle'>";
					sArchivo +="								<td class='TituloMenu' align='left' width='220px'> &nbsp;Consecutivo:&nbsp;" + oAnexo3XVIII.GetConsecutivo() + "</td>";
					sArchivo +="								<td class='TituloMenu' align='center'>Descripción</td>";
					sArchivo +="							</TR>";
					sArchivo +="							<TR align='middle'>";
					sArchivo +="								<td align='left'> &nbsp;Clave:&nbsp;";
					if(oAnexo3XVIII.GetClave().equals("1")){
						sArchivo +="1";
					}else{
						sArchivo +="2";
					}
					oArchivo.Escribe(sArchivo);
					oArchivowa.Escribe(sArchivo);
					sArchivo ="									<br>";
					sArchivo +="								&nbsp;1.- Estudio";
					sArchivo +="									<br>";
					sArchivo +="								&nbsp;2.- Proyecto";
					sArchivo +="									<br>";
					sArchivo +="									<br>";
					sArchivo +="								&nbsp;Justificación:";
					sArchivo +="								&nbsp;<textarea readonly class='txtBox' style='border: 0; background-color: transparent; transparent;overflow-y:hidden; width:'100%'; height='100%' name='sJustificacion' id='sJustificacion'>" + oAnexo3XVIII.GetJustificacion() + "</textarea>";
					sArchivo +="								 </td>";
					sArchivo +="								 <td align='center'><textarea readonly class='txtBox' style='border: 0; background-color: transparent; transparent;overflow-y:hidden; width:'100%'; height='100%' name='sDescripcion' id='sDescripcion'>" + oAnexo3XVIII.GetDescripcion() + "</textarea></td>";
					sArchivo +="							</TR>";
					sArchivo +="						</table>	";
					sArchivo +="					</td>";
					sArchivo +="				</tr>";
					sArchivo +="				<TR align='middle'>";
					sArchivo +="					<td valign='top'>";
					sArchivo +="						<table border='1' cellspacing='0' cellpadding='0' width='100%' bordercolor='black'>";
					sArchivo +="							<TR align='middle'>";
					sArchivo +="								<td class='TituloMenu' align='center' colspan='2'>Estudios de Factibilidad</td>";
					sArchivo +="								<td class='TituloMenu' align='center'>Observaciones</td>";
					sArchivo +="							</TR>";
					sArchivo +="							<tr>";
					sArchivo +="								<td width='280px' align='left' rowspan='9' valign='top'>";
					sArchivo +="									<table border='1' cellspacing='0' cellpadding='0' width='100%' bordercolor='black'>";
					sArchivo +="										<TR align='middle'>";
					sArchivo +="											<td align='center'>&nbsp;</td>";
					sArchivo +="										</TR>";
					sArchivo +="										<TR align='middle'>";
					sArchivo +="											<td align='left'> &nbsp;Técnicos</td>";
					sArchivo +="										</TR>";
					sArchivo +="										<TR align='middle'>";
					oArchivo.Escribe(sArchivo);
					oArchivowa.Escribe(sArchivo);
					sArchivo ="											<td align='left'> &nbsp;Financieros</td>";
					sArchivo +="										</TR>";
					sArchivo +="										<TR align='middle'>";
					sArchivo +="											<td align='left'> &nbsp;Socio Económicos</td>";
					sArchivo +="										</TR>";
					sArchivo +="										<tr>";
					sArchivo +="											<td align='left'>¿Se dispone de</td>";
					sArchivo +="										</tr>";
					sArchivo +="										<TR align='middle'>";
					sArchivo +="											<td align='left'>Planos Ejecutivos?</td>";
					sArchivo +="										</TR>";
					sArchivo +="										<tr>";
					sArchivo +="											<td align='left'>¿Se dispone de</td>";
					sArchivo +="										</tr>";
					sArchivo +="										<TR align='middle'>";
					sArchivo +="											<td align='left'>Planos en Detalle?</td>";
					sArchivo +="										</TR>";
					sArchivo +="										<tr>";
					sArchivo +="											<td align='left'>&nbsp;</td>";
					sArchivo +="										</tr>";
					sArchivo +="									</table>";
					sArchivo +="								</td>";
					sArchivo +="								<td align='left' rowspan='9' valign='top'>";
					sArchivo +="									<table border='1' cellspacing='0' cellpadding='0' width='100%' bordercolor='black'>";
					sArchivo +="										<TR align='middle'>";
					sArchivo +="											<td width='15px' colspan='2' align='center'>&nbsp;</td>";
					sArchivo +="										</TR>";
					sArchivo +="										<TR align='middle'>";
					oArchivo.Escribe(sArchivo);
					oArchivowa.Escribe(sArchivo);
					sArchivo ="<td  width='15px' align='center'>&nbsp;";
					if(oAnexo3XVIII.GetTecnico().equals("0"))
			   			sArchivo +="Sí</td>";
					sArchivo +="<td  width='15px' align='center'>&nbsp;";
					if(oAnexo3XVIII.GetTecnico().equals("1"))
			   			sArchivo +="No</td>";
					sArchivo +="</TR>";
				
					sArchivo +="										<TR align='middle'>";
					sArchivo +="<td  width='15px' align='center'>&nbsp;";
					if(oAnexo3XVIII.GetFinanciero().equals("0"))
					   sArchivo +="Sí</td>";
					sArchivo +="<td  width='15px' align='center'>&nbsp;";
					if(oAnexo3XVIII.GetFinanciero().equals("1"))
						sArchivo +="No</td>";
					sArchivo +="</TR>";
				
					sArchivo +="										<TR align='middle'>";
					sArchivo +="<td  width='15px' align='center'>&nbsp;";
					if(oAnexo3XVIII.GetSocioEconomico().equals("0"))
						sArchivo +="Sí</td>";
					sArchivo +="<td  width='15px' align='center'>&nbsp;";
					if(oAnexo3XVIII.GetSocioEconomico().equals("1"))
				   		sArchivo +="No</td>";
					sArchivo +="										</TR>";
					sArchivo +="										<TR align='middle'>";
					sArchivo +="											<td width='15px' colspan='2' align='center'>&nbsp;</td>";
					sArchivo +="										</TR>";
					sArchivo +="										<TR align='middle'>";
					oArchivo.Escribe(sArchivo);
					oArchivowa.Escribe(sArchivo);
					sArchivo ="<td  width='15px' align='center'>&nbsp;";
					if(oAnexo3XVIII.GetPlanoEjecutivo().equals("0"))
						sArchivo +="Sí</td>";
					sArchivo +="<td  width='15px' align='center'>&nbsp;";
					if(oAnexo3XVIII.GetPlanoEjecutivo().equals("1"))
						sArchivo +="No</td>";
					sArchivo +="										</TR>";
					sArchivo +="										<TR align='middle'>";
					sArchivo +="											<td width='15px' colspan='2' align='center'>&nbsp;</td>" + sSalto;
					sArchivo +="										</TR>" + sSalto;
					
					sArchivo +="										<TR align='middle'>" + sSalto;
					sArchivo +="<td  width='15px' align='center'>&nbsp;" + sSalto;
					if(oAnexo3XVIII.GetPlanoDetalle().equals("0"))
						sArchivo +="Sí</td>" + sSalto;
					sArchivo +="<td  width='15px' align='center'>&nbsp;" + sSalto;
					if(oAnexo3XVIII.GetPlanoDetalle().equals("1"))
						sArchivo +="No</td>" + sSalto;
					oArchivo.Escribe(sArchivo);
					oArchivowa.Escribe(sArchivo);
					sArchivo ="										</TR>" + sSalto;
					
					sArchivo +="										<TR align='middle'>" + sSalto;
					sArchivo +="											<td width='15px' colspan='2' align='center'>&nbsp;</td>" + sSalto;
					sArchivo +="										</TR>" + sSalto;
					sArchivo +="									</table>" + sSalto;
					sArchivo +="								</td>" + sSalto;
					sArchivo +="    							<td rowspan='9' align='center' valign='top'><textarea readonly class='txtBox' style='border: 0; background-color: transparent; transparent;overflow-y:hidden; width:'100%'; height='100%' name='sObservacion' id='sObservacion'>" + oAnexo3XVIII.GetObservacion() + "</textarea></td>" + sSalto;
					sArchivo +="															 </tr>" + sSalto;
					sArchivo +="													     </TABLE></TD>" + sSalto;
					sArchivo +="										</TR>" + sSalto;
					sArchivo +="					 				 </TABLE>" + sSalto;
				
				oArchivo.Escribe(sArchivo);
				oArchivowa.Escribe(sArchivo);
		     } // for 		 
		}else{
			sArchivo +="</TABLE>" + sSalto;
			sArchivo +="		<table border='0' cellspacing='0' cellpadding='0' width='100%'>" + sSalto;
			sArchivo +="		<tr>" + sSalto;
			sArchivo +="			<td valign='top' align='center'>" + sSalto;
			if(!sEstatus.equals("0")){
				if(!sOrigen.equals("0")){
					oAnexo3XVIII.Get(iIdFuncionario, iOrigen);
				}
				sArchivo ="				<tr>" + sSalto;
				sArchivo +="			<td colspan='2'>" + sSalto;
				sArchivo +="				<table border='1' cellspacing='0' cellpadding='0' width='100%' bordercolor='black'>" + sSalto;
				sArchivo +="					<TR align='middle'>" + sSalto;
				sArchivo +="						<td class='TituloMenu' align='left' width='220px'> &nbsp;Consecutivo:&nbsp;" + oAnexo3XVIII.GetConsecutivo() + "</td>" + sSalto;
				sArchivo +="						<td class='TituloMenu' align='center'>Descripción</td>" + sSalto;
				sArchivo +="					</TR>" + sSalto;
				sArchivo +="					<TR align='middle'>" + sSalto;
				sArchivo +="						<td align='left'> &nbsp;Clave:&nbsp;" + sSalto;
	
				if(oAnexo3XVIII.GetClave().equals("1")){
					sArchivo +="1";
				}else{
					sArchivo +="2";
				}
				oArchivo.Escribe(sArchivo);
				oArchivowa.Escribe(sArchivo);
				sArchivo ="	</select>" + sSalto;
				sArchivo +="<br>" + sSalto;
				sArchivo +="&nbsp;1.- Estudio" + sSalto;
				sArchivo +="<br>" + sSalto;
				sArchivo +="&nbsp;2.- Proyecto" + sSalto;
				sArchivo +="<br>" + sSalto;
				sArchivo +="<br>" + sSalto;
				sArchivo +="&nbsp;Justificación:" + sSalto;
				sArchivo +="&nbsp;" + oAnexo3XVIII.GetJustificacion() + "" + sSalto;
				sArchivo +="</td>" + sSalto;
				sArchivo +="<td align='center'>" + oAnexo3XVIII.GetDescripcion() + "</td>" + sSalto;
				sArchivo +="</TR>" + sSalto;
				sArchivo +="</table>" + sSalto;
				sArchivo +="</td>" + sSalto;
				sArchivo +="</tr>" + sSalto;
				sArchivo +="<TR align='middle'>" + sSalto;
				sArchivo +="<td valign='top'>" + sSalto;
				sArchivo +="<table border='1' cellspacing='0' cellpadding='0' width='100%' bordercolor='black'>" + sSalto;
				sArchivo +="	<TR align='middle'>" + sSalto;
				sArchivo +="		<td class='TituloMenu' align='center' colspan='2'>Estudios de Factibilidad</td>" + sSalto;
				sArchivo +="		<td class='TituloMenu' align='center'>Observaciones</td>" + sSalto;
				sArchivo +="	</TR>" + sSalto;
				sArchivo +="	<tr>" + sSalto;
				sArchivo +="		<td width='280px' align='left' rowspan='9' valign='top'>" + sSalto;
				sArchivo +="			<table border='1' cellspacing='0' cellpadding='0' width='100%' bordercolor='black'>" + sSalto;
				sArchivo +="				<TR align='middle'>" + sSalto;
				sArchivo +="					<td align='center'>&nbsp;</td>" + sSalto;
				sArchivo +="				</TR>" + sSalto;
				sArchivo +="				<TR align='middle'>" + sSalto;
				sArchivo +="					<td align='left'> &nbsp;Técnicos</td>" + sSalto;
				sArchivo +="				</TR>" + sSalto;
				sArchivo +="				<TR align='middle'>" + sSalto;
				sArchivo +="					<td align='left'> &nbsp;Financieros</td>" + sSalto;
				sArchivo +="				</TR>" + sSalto;
				sArchivo +="				<TR align='middle'>" + sSalto;
				sArchivo +="					<td align='left'> &nbsp;Socio Económicos</td>" + sSalto;
				oArchivo.Escribe(sArchivo);
				oArchivowa.Escribe(sArchivo);
				sArchivo ="					</TR>" + sSalto;
				sArchivo +="				<tr>" + sSalto;
				sArchivo +="					<td align='left'>¿Se dispone de</td>" + sSalto;
				sArchivo +="				</tr>" + sSalto;
				sArchivo +="				<TR align='middle'>" + sSalto;
				sArchivo +="					<td align='left'>Planos Ejecutivos?</td>" + sSalto;
				sArchivo +="				</TR>" + sSalto;
				sArchivo +="				<tr>" + sSalto;
				sArchivo +="					<td align='left'>¿Se dispone de</td>" + sSalto;
				sArchivo +="				</tr>" + sSalto;
				sArchivo +="				<TR align='middle'>" + sSalto;
				sArchivo +="					<td align='left'>Planos en Detalle?</td>" + sSalto;
				sArchivo +="				</TR>" + sSalto;
				sArchivo +="				<tr>" + sSalto;
				sArchivo +="					<td align='left'>&nbsp;</td>" + sSalto;
				sArchivo +="				</tr>" + sSalto;
				sArchivo +="			</table>" + sSalto;
				sArchivo +="		</td>" + sSalto;
				sArchivo +="		<td align='left' rowspan='9' valign='top'>" + sSalto;
				sArchivo +="			<table border='1' cellspacing='0' cellpadding='0' width='100%' bordercolor='black'>" + sSalto;
				sArchivo +="				<TR align='middle'>" + sSalto;
				sArchivo +="					<td width='15px' colspan='2' align='center'>&nbsp;</td>" + sSalto;
				sArchivo +="				</TR>" + sSalto;
				sArchivo +="				<TR align='middle'>" + sSalto;
				oArchivo.Escribe(sArchivo);
				oArchivowa.Escribe(sArchivo);
				sArchivo ="<td  width='15px' align='center'>&nbsp;" + sSalto;
				if(oAnexo3XVIII.GetTecnico().equals("0"))
				   sArchivo +="	Sí" + sSalto;
				sArchivo +="</td>" + sSalto;
				sArchivo +="<td  width='15px' align='center'>&nbsp;" + sSalto;
				if(oAnexo3XVIII.GetTecnico().equals("1"))
				   sArchivo +="	No" + sSalto;
				sArchivo +="</td>" + sSalto;
				sArchivo +="</TR>" + sSalto;
				sArchivo +="<TR align='middle'>" + sSalto;
				sArchivo +="<td  width='15px' align='center'>&nbsp;" + sSalto;
				if(oAnexo3XVIII.GetFinanciero().equals("0"))
				   sArchivo +="	Sí" + sSalto;
				sArchivo +="</td>" + sSalto;
				sArchivo +="<td  width='15px' align='center'>&nbsp;" + sSalto;
				if(oAnexo3XVIII.GetFinanciero().equals("1"))
				   sArchivo +="	No" + sSalto;
				sArchivo +="</td>" + sSalto;
				sArchivo +="</TR>" + sSalto;
				sArchivo +="<TR align='middle'>" + sSalto;
				sArchivo +="<td  width='15px' align='center'>&nbsp;" + sSalto;
				if(oAnexo3XVIII.GetSocioEconomico().equals("0"))
				   sArchivo +="	Sí" + sSalto;
				sArchivo +="</td>" + sSalto;
				sArchivo +="<td  width='15px' align='center'>&nbsp;" + sSalto;
				if(oAnexo3XVIII.GetSocioEconomico().equals("1"))
				   sArchivo +="	No" + sSalto;
				sArchivo +="</td>" + sSalto;
				sArchivo +="</TR>" + sSalto;
				sArchivo +="<TR align='middle'>" + sSalto;
				sArchivo +="	<td width='15px' colspan='2' align='center'>&nbsp;</td>" + sSalto;
				sArchivo +="</TR>" + sSalto;
				sArchivo +="<TR align='middle'>" + sSalto;
				oArchivo.Escribe(sArchivo);
				oArchivowa.Escribe(sArchivo);
				sArchivo ="<td  width='15px' align='center'>&nbsp;" + sSalto;
				if(oAnexo3XVIII.GetPlanoEjecutivo().equals("0"))
				   sArchivo +="	Sí" + sSalto;
				sArchivo +="</td>" + sSalto;
				sArchivo +="<td  width='15px' align='center'>&nbsp;" + sSalto;
				if(oAnexo3XVIII.GetPlanoEjecutivo().equals("1"))
				   sArchivo +="	No";
				sArchivo +="</td>";
				sArchivo +="</TR>" + sSalto;
				sArchivo +="	<TR align='middle'>" + sSalto;
				sArchivo +="		<td width='15px' colspan='2' align='center'>&nbsp;</td>" + sSalto;
				sArchivo +="	</TR>" + sSalto;
				sArchivo +="	<TR align='middle'>" + sSalto;
				oArchivo.Escribe(sArchivo);
				oArchivowa.Escribe(sArchivo);
				sArchivo ="<td  width='15px' align='center'>&nbsp;" + sSalto;
				if(oAnexo3XVIII.GetPlanoDetalle().equals("0"))
				   sArchivo +="	Sí" + sSalto;
				sArchivo +="</td>" + sSalto;
				sArchivo +="<td  width='15px' align='center'>&nbsp;" + sSalto;
				if(oAnexo3XVIII.GetPlanoDetalle().equals("1"))
				   sArchivo +="	No" + sSalto;
				sArchivo +="</td>" + sSalto;
				sArchivo +="										</TR>" + sSalto;
				sArchivo +="										<TR align='middle'>" + sSalto;
				sArchivo +="											<td width='15px' colspan='2' align='center'>&nbsp;</td>" + sSalto;
				sArchivo +="										</TR>" + sSalto;
				sArchivo +="									</table>" + sSalto;
				sArchivo +="								</td>" + sSalto;
				sArchivo +="    							<td rowspan='9' align='center' valign='top'>" + oAnexo3XVIII.GetObservacion() + "</td>" + sSalto;
				sArchivo +="							</tr>" + sSalto;
				sArchivo +="						</TABLE>" + sSalto;
				sArchivo +="					</TD>" + sSalto;
				sArchivo +="				</TR>" + sSalto;
				sArchivo +="			</TABLE>" + sSalto;
			} else {
				sArchivo +="				<H1 style='size=+2'><br>ESTE ANEXO NO APLICA</H1></TD>" + sSalto;
				sArchivo +="					</TR>" + sSalto;
				sArchivo +="				</TABLE>" + sSalto;
			}
		}
		sArchivo +="	</td>" + sSalto;
		sArchivo +="	</tr>" + sSalto;
		sArchivo +="	</table>" + sSalto;
		sArchivo += "</body>" + sSalto;
		sArchivo += "</html>" + sSalto;
		oArchivo.Escribe(sArchivo);
		oArchivowa.Escribe(sArchivo);
		
		sArchivo = "<script language='JavaScript'>" + sSalto;	
		sArchivo += "	function CambioTipoOrigen(){" + sSalto;
		
		for(int x=0;x<oAnexo3XVIII.GetAll(iIdFuncionario);x++){
			int iRenglonPaso		= oAnexo3XVIII.GetIdRenglon(x)!=-1?		oAnexo3XVIII.GetIdRenglon(x):0;
			sArchivo +=	" document.all['tbl" + iRenglonPaso + "'].style.display='none'; " + sSalto;
		}
		sArchivo +=	" 		if(document.forma.sOrigen.value != 0){" + sSalto;
		sArchivo +=	" 		   Opcion = 'tbl' + document.forma.sOrigen.value;" + sSalto;
		sArchivo +=	" 		   document.all[Opcion].style.display='';" + sSalto;
		sArchivo +=	" 		}" + sSalto;
		sArchivo +=	" 	}" + sSalto;
		sArchivo +=	" </script>" + sSalto;
		oArchivo.Escribe(sArchivo);
		oArchivowa.Escribe(sArchivo);
		sArchivo = "";
	}else{
		sArchivo +="		 					 <TABLE width='100%'>" + sSalto;
		sArchivo +="			 					 <TR>" + sSalto;
		sArchivo +="		 		 			 		 <TD align='center'><H1 style='size=+2'><br>ESTE ANEXO NO APLICA</H1></TD>" + sSalto;
		sArchivo +="			 					 </TR>" + sSalto;
		sArchivo +="		 					 </TABLE>" + sSalto;
		oArchivo.Escribe(sArchivo);
		oArchivowa.Escribe(sArchivo);
			
		sArchivo ="	</td>" + sSalto;
		sArchivo +="	</tr>" + sSalto;
		sArchivo +="	</table>" + sSalto;
		sArchivo += "</body>" + sSalto;
		sArchivo += "</html>" + sSalto;
		oArchivo.Escribe(sArchivo);
		oArchivowa.Escribe(sArchivo);
		sArchivo="";
	}
	
} else {
	out.println("Error");
}

oArchivo.Escribe(sArchivo);
oArchivowa.Escribe(sArchivo);
oArchivo.CierraArchivo();
oArchivowa.CierraArchivo();
%>