<%@page import="com.consiss.util.tools.*"%>
<%@page import="com.gob.*"%>
<%@page import="java.util.*" %>
<%
/********************************************************************************************************
'Elaboro:	Jesus Limon
'Lugar:		Monterrey, NL
'Fecha:		11.Dic.2002
'Compañia:	CONSISS
'Ultima Modificacion:
'By:
'
'Distintas opciones:
'
'********************************************************************************************************/
%>
<%
//Valida la permanencia del usuario en session
if ((String)session.getValue("ok")!="Consiss")
			response.sendRedirect("Error.html");
String	sOpcion = request.getParameter("sOpcion")!= null ? request.getParameter("sOpcion"): "";
String	sOrigen = request.getParameter("sOrigen")!= null ? request.getParameter("sOrigen"): "0";
int 	iOrigen =  java.lang.Integer.parseInt(sOrigen );

String	sCodigo = request.getParameter("sCodigo")!= null ? request.getParameter("sCodigo"): "";
int iIdFuncionario =  java.lang.Integer.parseInt((String)(session.getValue("iIdFuncionario")!= null?session.getValue("iIdFuncionario"):"0") );
java.text.DecimalFormat myFormatter = new java.text.DecimalFormat("###,##0.00");

Anexo3XVIII oAnexo		= new Anexo3XVIII();
int iIdAnexo 			= oAnexo.GetIdAnexo();
String sPath 			= "../";
AnexoEstatus oAnexoEstatus		= new AnexoEstatus();
oAnexoEstatus.Get(iIdFuncionario, iIdAnexo);
String sEstatus 		= oAnexoEstatus.GetEstatus();
String sAnexo = "III.18";
%>
<html>
<head>
	<title>Gobierno - Anexo III.18</title>
	<link rel="stylesheet" type="text/css" href="<%=sPath%>Styles/Gobierno.css">
	<script language="JavaScript" src="<%=sPath%>Scripts/Gobierno.js"></script>
	<script language="JavaScript" src="<%=sPath%>Scripts/Libreria.js"></script>
	<script language="JavaScript">	
		function imprimir(iIdFuncionario,vIdTipoOrigen){
			var strUrl  = "iAnexo3XVIII.jsp?iIdFuncionario=" + iIdFuncionario + "&sIdTipoOrigen=" + vIdTipoOrigen;
			popBox('Imprimir', 550, 500, strUrl);		
		}
	</script>
</head>
<body topmargin="0" leftmargin="0">
<%
	if(sOrigen.equals("0")){
			oAnexo.GetAll(iIdFuncionario);
			for(int i=0;i<oAnexo.GetAll(iIdFuncionario);i++){
				iOrigen	= oAnexo.GetIdRenglon(i)!=-1?		oAnexo.GetIdRenglon(i):0;
				sOrigen = iOrigen + "";
%>

		<%=iOrigen%>
		<br>
		<%=iIdFuncionario%>

		<%@include file="HeaderAnexo.jsp"%>
		<table border="0" cellspacing="0" cellpadding="0" width="100%">
		<tr>
			<td valign="top">
		<FORM action="pAnexo3XVIII.jsp" name="forma" method="post" >
			<input type="hidden" name="sOpcion" value="">
			<input type="hidden" name="sCodigo" value="<%=sOrigen%>"> 
		<%
		if(!sEstatus.equals("0")){
		%>
			<TABLE cellPadding="0" cellSpacing="0" width="100%" BORDER="1" BORDERCOLOR="white">
			<!-- Etiqueta donde se aplican los encabezados de las tablas-->
				<TR align="middle">
					<td align="left" colspan="2"> &nbsp;RELACIÓN DE PLANES, ESTUDIOS Y PROYECTOS NO DESARROLLADOS.</td>
				</TR>
		<%
				if(!sOrigen.equals("0")){
					oAnexo.Get(iIdFuncionario, iOrigen);
				}
		%>
				<tr>
					<td colspan="2">
						<table border="1" cellspacing="0" cellpadding="0" width="100%">
							<TR align="middle">
								<td align="left" width="220px"> &nbsp;CONSECUTIVO:&nbsp;<%=oAnexo.GetConsecutivo()%></td>
								<td align="center">DESCRIPCIÓN</td>
							</TR>
							<TR align="middle">
								<td align="left"> &nbsp;CLAVE:
								&nbsp;<%if(oAnexo.GetClave().equals("1")){%>1<%}else{%>2<%}%>
									</select>
									<br>
								&nbsp;1.- ESTUDIO
									<br>
								&nbsp;2.- PROYECTO
									<br>
									<br>
								&nbsp;JUSTIFICACIÓN:
								&nbsp;<%=oAnexo.GetJustificacion()%>
								 </td>
								 <td align="center"><textarea name="sDescripcion" value="<%=oAnexo.GetDescripcion()%>" cols="35" rows="5" <%if(sOrigen.equals("0") && !sOpcion.equals("NEW")){%>disabled<%}%>></textarea></td>
							</TR>
						</table>	
					</td>
				</tr>
				<TR align="middle">
					<td valign="top">
						<table border="1" cellspacing="0" cellpadding="0" width="100%">
							<TR align="middle">
								<td align="center" colspan="2">ESTUDIOS DE FACTIBILIDAD</td>
								<td align="center">OBSERVACIONES</td>
							</TR>
							<tr>
								<td width="280px" align="left" rowspan="9" valign="top">
									<table border="1" cellspacing="0" cellpadding="0" width="100%" bordercolor="#ffffff">
										<TR align="middle">
											<td align="center">&nbsp;</td>
										</TR>
										<TR align="middle">
											<td align="left"> &nbsp;TÉCNICOS</td>
										</TR>
										<TR align="middle">
											<td align="left"> &nbsp;FINANCIEROS</td>
										</TR>
										<TR align="middle">
											<td align="left"> &nbsp;SOCIO ECONÓMICOS</td>
										</TR>
										<tr>
											<td align="left">¿SE DISPONE DE</td>
										</tr>
										<TR align="middle">
											<td align="left">PLANOS EJECUTIVOS?</td>
										</TR>
										<tr>
											<td align="left">¿SE DISPONE DE</td>
										</tr>
										<TR align="middle">
											<td align="left">PLANOS EN DETALLE?</td>
										</TR>
										<tr>
											<td align="left">&nbsp;</td>
										</tr>
									</table>
								</td>
								<td align="left" rowspan="9" valign="top">
									<table border="1" cellspacing="0" cellpadding="0" width="100%">
										<TR align="middle">
											<td width="15px" colspan="2" align="center">&nbsp;</td>
										</TR>
										<TR align="middle">
											<td width="15px" align="center">&nbsp;<%if(oAnexo.GetTecnico().equals("0")){%>SI<%}%></td>
											<td width="15px" align="center">&nbsp;<%if(oAnexo.GetTecnico().equals("1")){%>NO<%}%></td>
										</TR>
										<TR align="middle">
											<td width="15px" align="center">&nbsp;<%if(oAnexo.GetFinanciero().equals("0")){%>SI<%}%></td>
											<td width="15px" align="center">&nbsp;<%if(oAnexo.GetFinanciero().equals("1")){%>NO<%}%></td>
										</TR>
										<TR align="middle">
											<td width="15px" align="center">&nbsp;<%if(oAnexo.GetSocioEconomico().equals("0")){%>SI<%}%></td>
											<td width="15px" align="center">&nbsp;<%if(oAnexo.GetSocioEconomico().equals("1")){%>NO<%}%></td>
										</TR>
										<TR align="middle">
											<td width="15px" colspan="2" align="center">&nbsp;</td>
										</TR>
										<TR align="middle">
											<td width="15px" align="center">&nbsp;<%if(oAnexo.GetPlanoEjecutivo().equals("0")){%>SI<%}%></td>
											<td width="15px" align="center">&nbsp;<%if(oAnexo.GetPlanoEjecutivo().equals("1")){%>NO<%}%></td>
										</TR>
										<TR align="middle">
											<td width="15px" colspan="2" align="center">&nbsp;</td>
										</TR>
										<TR align="middle">
											<td width="15px" align="center">&nbsp;<%if(oAnexo.GetPlanoDetalle().equals("0")){%>SI<%}%></td>
											<td width="15px" align="center">&nbsp;<%if(oAnexo.GetPlanoDetalle().equals("1")){%>NO<%}%></td>
										</TR>
										<TR align="middle">
											<td width="15px" colspan="2" align="center">&nbsp;</td>
										</TR>
									</table>
								</td>
								<td rowspan="9" align="center" valign="top"> <textarea name="sObservacion" value="<%=oAnexo.GetObservacion()%>" cols="35" rows="5" <%if(sOrigen.equals("0") && !sOpcion.equals("NEW")){%>disabled<%}%>></textarea></td>
							</tr>
						</TABLE>
					</TD>
				</TR>
		<%
		} else {
		%>
			</TABLE>
			<TABLE width="100%">
				<TR>
					<TD align="center"><H1 style="size=+2"><br>ESTE ANEXO NO APLICA</H1></TD>
				</TR>
			</TABLE>
		<%
		}
		%>	
		</FORM>
		</td>
		</tr>
		</table>
<%
				}
	}else{
%>
		<%@include file="HeaderAnexo.jsp"%>
		<table border="0" cellspacing="0" cellpadding="0" width="100%">
		<tr>
			<!-- Contenido -->
			<td valign="top">
		<FORM action="pAnexo3XVIII.jsp" name="forma" method="post" >
			<input type="hidden" name="sOpcion" value="">
			<input type="hidden" name="sCodigo" value="<%=sOrigen%>"> 
		<%
		if(!sEstatus.equals("0")){
		%>
			<TABLE cellPadding="0" cellSpacing="0" width="100%" BORDER="1" BORDERCOLOR="white">
			<!-- Etiqueta donde se aplican los encabezados de las tablas-->
				<TR align="middle">
					<td align="left" colspan="2"> &nbsp;RELACIÓN DE PLANES, ESTUDIOS Y PROYECTOS NO DESARROLLADOS.</td>
				</TR>
		<%
				if(!sOrigen.equals("0")){
					oAnexo.Get(iIdFuncionario, iOrigen);
				}
		%>
				<tr>
					<td colspan="2">
						<table border="1" cellspacing="0" cellpadding="0" width="100%">
							<TR align="middle">
								<td align="left" width="220px"> &nbsp;CONSECUTIVO:&nbsp;<%=oAnexo.GetConsecutivo()%></td>
								<td align="center">DESCRIPCIÓN</td>
							</TR>
							<TR align="middle">
								<td align="left"> &nbsp;CLAVE:
								&nbsp;<%if(oAnexo.GetClave().equals("1")){%>1<%}else{%>2<%}%>
									</select>
									<br>
								&nbsp;1.- ESTUDIO
									<br>
								&nbsp;2.- PROYECTO
									<br>
									<br>
								&nbsp;JUSTIFICACIÓN:
								&nbsp;<%=oAnexo.GetJustificacion()%>
								 </td>
								 <td align="center"><textarea name="sDescripcion" value="<%=oAnexo.GetDescripcion()%>" cols="35" rows="5" <%if(sOrigen.equals("0") && !sOpcion.equals("NEW")){%>disabled<%}%>></textarea></td>
							</TR>
						</table>	
					</td>
				</tr>
				<TR align="middle">
					<td valign="top">
						<table border="1" cellspacing="0" cellpadding="0" width="100%">
							<TR align="middle">
								<td align="center" colspan="2">ESTUDIOS DE FACTIBILIDAD</td>
								<td align="center">OBSERVACIONES</td>
							</TR>
							<tr>
								<td width="280px" align="left" rowspan="9" valign="top">
									<table border="1" cellspacing="0" cellpadding="0" width="100%" bordercolor="#ffffff">
										<TR align="middle">
											<td align="center">&nbsp;</td>
										</TR>
										<TR align="middle">
											<td align="left"> &nbsp;TÉCNICOS</td>
										</TR>
										<TR align="middle">
											<td align="left"> &nbsp;FINANCIEROS</td>
										</TR>
										<TR align="middle">
											<td align="left"> &nbsp;SOCIO ECONÓMICOS</td>
										</TR>
										<tr>
											<td align="left">¿SE DISPONE DE</td>
										</tr>
										<TR align="middle">
											<td align="left">PLANOS EJECUTIVOS?</td>
										</TR>
										<tr>
											<td align="left">¿SE DISPONE DE</td>
										</tr>
										<TR align="middle">
											<td align="left">PLANOS EN DETALLE?</td>
										</TR>
										<tr>
											<td align="left">&nbsp;</td>
										</tr>
									</table>
								</td>
								<td align="left" rowspan="9" valign="top">
									<table border="1" cellspacing="0" cellpadding="0" width="100%">
										<TR align="middle">
											<td width="15px" colspan="2" align="center">&nbsp;</td>
										</TR>
										<TR align="middle">
											<td width="15px" align="center">&nbsp;<%if(oAnexo.GetTecnico().equals("0")){%>SI<%}%></td>
											<td width="15px" align="center">&nbsp;<%if(oAnexo.GetTecnico().equals("1")){%>NO<%}%></td>
										</TR>
										<TR align="middle">
											<td width="15px" align="center">&nbsp;<%if(oAnexo.GetFinanciero().equals("0")){%>SI<%}%></td>
											<td width="15px" align="center">&nbsp;<%if(oAnexo.GetFinanciero().equals("1")){%>NO<%}%></td>
										</TR>
										<TR align="middle">
											<td width="15px" align="center">&nbsp;<%if(oAnexo.GetSocioEconomico().equals("0")){%>SI<%}%></td>
											<td width="15px" align="center">&nbsp;<%if(oAnexo.GetSocioEconomico().equals("1")){%>NO<%}%></td>
										</TR>
										<TR align="middle">
											<td width="15px" colspan="2" align="center">&nbsp;</td>
										</TR>
										<TR align="middle">
											<td width="15px" align="center">&nbsp;<%if(oAnexo.GetPlanoEjecutivo().equals("0")){%>SI<%}%></td>
											<td width="15px" align="center">&nbsp;<%if(oAnexo.GetPlanoEjecutivo().equals("1")){%>NO<%}%></td>
										</TR>
										<TR align="middle">
											<td width="15px" colspan="2" align="center">&nbsp;</td>
										</TR>
										<TR align="middle">
											<td width="15px" align="center">&nbsp;<%if(oAnexo.GetPlanoDetalle().equals("0")){%>SI<%}%></td>
											<td width="15px" align="center">&nbsp;<%if(oAnexo.GetPlanoDetalle().equals("1")){%>NO<%}%></td>
										</TR>
										<TR align="middle">
											<td width="15px" colspan="2" align="center">&nbsp;</td>
										</TR>
									</table>
								</td>
								<td rowspan="9" align="center" valign="top"> <textarea name="sObservacion" value="<%=oAnexo.GetObservacion()%>" cols="35" rows="5" <%if(sOrigen.equals("0") && !sOpcion.equals("NEW")){%>disabled<%}%>></textarea></td>
							</tr>
						</TABLE>
					</TD>
				</TR>
		<%
		} else {
		%>
			</TABLE>
			<TABLE width="100%">
				<TR>
					<TD align="center"><H1 style="size=+2"><br>ESTE ANEXO NO APLICA</H1></TD>
				</TR>
			</TABLE>
		<%
		}
		%>	
		</FORM>
		</td>
		</tr>
		</table>
<%
	}
%>
</body>
</html>
