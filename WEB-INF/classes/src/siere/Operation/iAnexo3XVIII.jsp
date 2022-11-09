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
//String	sOrigen = request.getParameter("sOrigen")!= null ? request.getParameter("sOrigen"): "0";
String	sOrigen = request.getParameter("sIdTipoOrigen")!= null ? request.getParameter("sIdTipoOrigen"): "0";
int 	iOrigen =  java.lang.Integer.parseInt(sOrigen );

String	sCodigo = request.getParameter("sCodigo")!= null ? request.getParameter("sCodigo"): "";
int iIdFuncionario =  java.lang.Integer.parseInt(
			(request.getParameter("iIdFuncionario")!= null?request.getParameter("iIdFuncionario"):"0") );

java.text.DecimalFormat myFormatter = new java.text.DecimalFormat("###,##0.00");

Anexo3XVIII oAnexo		= new Anexo3XVIII();
int iIdAnexo 			= oAnexo.GetIdAnexo();
String sPath 			= "../";
AnexoEstatus oAnexoEstatus		= new AnexoEstatus();
oAnexoEstatus.Get(iIdFuncionario, iIdAnexo);
String sEstatus 		= oAnexoEstatus.GetEstatus();
String sAnexo = "III.18";
int numpag =0;
int numtot = 0;
%>
<html>
<head>
	<title>Entrega - Recepción : Anexo III.18 (Impresión)</title>
	<link rel="stylesheet" type="text/css" href="<%=sPath%>Styles/Gobierno.css">
	<script language="JavaScript">	
	
	function Imprimir()
	{
	var WebBrowser = '<OBJECT ID="WebBrowser1"  WIDTH=0 HEIGHT=0 CLASSID="CLSID:8856F961-340A-11D0-A96B-00C04FD705A2"></OBJECT>';
	// insert object
	this.document.body.insertAdjacentHTML('afterBegin', WebBrowser); 
	this.focus();
//	if (confirm("Seguro que desea imprimir?"))
//	{
		printVB();
//	}
	WebBrowser1.outerHTML = '';
	//window.location.reload();
}
DelAll = 0;
</script>
<script language="VBScript">
sub printVB()
    const OLECMDID_PRINT = 7
	const OLECMDEXECOPT_DODEFAULT      =  0 
    const OLECMDEXECOPT_PROMPTUSER     =  1 
    const OLECMDEXECOPT_DONTPROMPTUSER =  2 
    const OLECMDEXECOPT_SHOWHELP       =  3  
	on error resume next
	WebBrowser1.ExecWB OLECMDID_PRINT, OLECMDEXECOPT_DONTPROMPTUSER,9,""
end sub
</script>
</HEAD>
<body topmargin="2" leftmargin="2" onload="Imprimir();"><%
if(sOrigen.equals("0")){
	oAnexo.GetAll(iIdFuncionario);
	if(oAnexo.GetAll(iIdFuncionario)==0){%>
	<%@include file="HeaderAnexo.jsp"%>
		<TABLE cellPadding="0" cellSpacing="0" width="100%" BORDER="1" BORDERCOLOR="white">
		<!-- Etiqueta donde se aplican los encabezados de las tablas-->
			<TR align="middle">
				<td align="left" colspan="2"> &nbsp;<b>RELACIÓN DE PLANES, ESTUDIOS Y PROYECTOS NO DESARROLLADOS.</b></td>
			</TR>
				<tr>
					<td colspan="2">
						<table border="1" cellspacing="0" cellpadding="0" width="100%" bordercolor="black">
							<TR align="middle">
								<td align="left" width="220px"> &nbsp;CONSECUTIVO:&nbsp;</td>
								<td align="center">DESCRIPCIÓN</td>
							</TR>
							<TR align="middle">
								<td align="left"> &nbsp;CLAVE:&nbsp;
									<br>
								&nbsp;1.- ESTUDIO
									<br>
								&nbsp;2.- PROYECTO
									<br>
									<br>
								&nbsp;JUSTIFICACIÓN:
								&nbsp;
								 </td>
								 <td align="center">&nbsp;</td>
							</TR>
						</table>	
					</td>
				</tr>
				<TR align="middle">
					<td valign="top">
						<table border="1" cellspacing="0" cellpadding="0" width="100%" bordercolor="black">
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
									<table border="1" cellspacing="0" cellpadding="0" width="100%" bordercolor="black">
										<TR align="middle">
											<td width="15px" colspan="2" align="center">&nbsp;</td>
										</TR>
										<TR align="middle">
											<td width="15px" align="center">&nbsp;SI</td>
											<td width="15px" align="center">&nbsp;NO</td>
										</TR>
										<TR align="middle">
											<td width="15px" align="center">&nbsp;SI</td>
											<td width="15px" align="center">&nbsp;NO</td>
										</TR>
										<TR align="middle">
											<td width="15px" align="center">&nbsp;SI</td>
											<td width="15px" align="center">&nbsp;NO</td>
										</TR>
										<TR align="middle">
											<td width="15px" colspan="2" align="center">&nbsp;</td>
										</TR>
										<TR align="middle">
											<td width="15px" align="center">&nbsp;SI</td>
											<td width="15px" align="center">&nbsp;NO</td>
										</TR>
										<TR align="middle">
											<td width="15px" colspan="2" align="center">&nbsp;</td>
										</TR>
										<TR align="middle">
											<td width="15px" align="center">&nbsp;SI</td>
											<td width="15px" align="center">&nbsp;NO</td>
										</TR>
										<TR align="middle">
											<td width="15px" colspan="2" align="center">&nbsp;</td>
										</TR>
									</table>
								</td>
								<td rowspan="9" align="center" valign="top">&nbsp;</td>
							</tr>
						</TABLE>
						<%@include file="FooterAnexo.jsp"%>
					</TD>
				</TR>
		</TABLE>
	<%}
	for(int i=0;i<oAnexo.GetAll(iIdFuncionario);i++){
		iOrigen	= oAnexo.GetIdRenglon(i)!=-1?		oAnexo.GetIdRenglon(i):0;
		sOrigen = iOrigen + "";
		if (i > 0){%><p style="page-break-after:always"></p><%}%>
	<%@include file="HeaderAnexo.jsp"%>
		<table border="0" cellspacing="0" cellpadding="0" width="900">
		<tr>
			<td valign="top"><%
		if(!sEstatus.equals("0")){		%>
			<TABLE cellPadding="0" cellSpacing="0" width="900" BORDER="1" BORDERCOLOR="white">
			<!-- Etiqueta donde se aplican los encabezados de las tablas-->
				<TR align="middle">
					<td align="left" colspan="2"> &nbsp;<b>RELACIÓN DE PLANES, ESTUDIOS Y PROYECTOS NO DESARROLLADOS.</b></td>
				</TR>
				<tr>
					<td colspan="2">
						<table border="1" cellspacing="0" cellpadding="0" width="100%" bordercolor="black">
							<TR align="middle">
								<td align="left" width="220px"> &nbsp;CONSECUTIVO:&nbsp;<%=oAnexo.GetConsecutivo(i)%></td>
								<td align="center">DESCRIPCIÓN</td>
							</TR>
							<TR align="middle">
								<td align="left"> &nbsp;CLAVE:
								&nbsp;<%if(oAnexo.GetClave(i).equals("1")){%>1<%}else{%>2<%}%>
									</select>
									<br>
								&nbsp;1.- ESTUDIO
									<br>
								&nbsp;2.- PROYECTO
									<br>
									<br>
								&nbsp;JUSTIFICACIÓN:
								&nbsp;<%=oAnexo.GetJustificacion(i)%>
								 </td>
								 <td align="center"><%=oAnexo.GetDescripcion(i)%></td>
							</TR>
						</table>	
					</td>
				</tr>
				<TR align="middle">
					<td valign="top">
						<table border="1" cellspacing="0" cellpadding="0" width="100%" bordercolor="black">
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
									<table border="1" cellspacing="0" cellpadding="0" width="100%" bordercolor="black">
										<TR align="middle">
											<td width="15px" colspan="2" align="center">&nbsp;</td>
										</TR>
										<TR align="middle">
											<td width="15px" align="center">&nbsp;<%if(oAnexo.GetTecnico(i).equals("0")){%>SI<%}%></td>
											<td width="15px" align="center">&nbsp;<%if(oAnexo.GetTecnico(i).equals("1")){%>NO<%}%></td>
										</TR>
										<TR align="middle">
											<td width="15px" align="center">&nbsp;<%if(oAnexo.GetFinanciero(i).equals("0")){%>SI<%}%></td>
											<td width="15px" align="center">&nbsp;<%if(oAnexo.GetFinanciero(i).equals("1")){%>NO<%}%></td>
										</TR>
										<TR align="middle">
											<td width="15px" align="center">&nbsp;<%if(oAnexo.GetSocioEconomico(i).equals("0")){%>SI<%}%></td>
											<td width="15px" align="center">&nbsp;<%if(oAnexo.GetSocioEconomico(i).equals("1")){%>NO<%}%></td>
										</TR>
										<TR align="middle">
											<td width="15px" colspan="2" align="center">&nbsp;</td>
										</TR>
										<TR align="middle">
											<td width="15px" align="center">&nbsp;<%if(oAnexo.GetPlanoEjecutivo(i).equals("0")){%>SI<%}%></td>
											<td width="15px" align="center">&nbsp;<%if(oAnexo.GetPlanoEjecutivo(i).equals("1")){%>NO<%}%></td>
										</TR>
										<TR align="middle">
											<td width="15px" colspan="2" align="center">&nbsp;</td>
										</TR>
										<TR align="middle">
											<td width="15px" align="center">&nbsp;<%if(oAnexo.GetPlanoDetalle(i).equals("0")){%>SI<%}%></td>
											<td width="15px" align="center">&nbsp;<%if(oAnexo.GetPlanoDetalle(i).equals("1")){%>NO<%}%></td>
										</TR>
										<TR align="middle">
											<td width="15px" colspan="2" align="center">&nbsp;</td>
										</TR>
									</table>
								</td>
								<td rowspan="9" align="center" valign="top"><%=oAnexo.GetObservacion(i)%></td>
							</tr>
						</TABLE>
						<%@include file="FooterAnexo.jsp"%>
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
			<%@include file="FooterAnexo.jsp"%>
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
		oAnexo.Get(iIdFuncionario, iOrigen);
%>
		<%@include file="HeaderAnexo.jsp"%>
		<table border="0" cellspacing="0" cellpadding="0" width="100%">
		<tr>
			<!-- Contenido -->
			<td valign="top">
		<%
		if(!sEstatus.equals("0")){
		%>
			<TABLE cellPadding="0" cellSpacing="0" width="100%" BORDER="1" BORDERCOLOR="white">
			<!-- Etiqueta donde se aplican los encabezados de las tablas-->
				<TR align="middle">
					<td align="left" colspan="2"> &nbsp;RELACIÓN DE PLANES, ESTUDIOS Y PROYECTOS NO DESARROLLADOS.</td>
				</TR>
				<tr>
					<td colspan="2">
						<table border="1" cellspacing="0" cellpadding="0" width="100%" bordercolor="black">
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
								 <td align="center">&nbsp;<%=oAnexo.GetDescripcion()%></td>
							</TR>
						</table>	
					</td>
				</tr>
				<TR align="middle">
					<td valign="top">
						<table border="1" cellspacing="0" cellpadding="0" width="100%" bordercolor="black">
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
									<table border="1" cellspacing="0" cellpadding="0" width="100%" bordercolor="black">
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
								<td rowspan="9" align="center" valign="top">&nbsp;<%=oAnexo.GetObservacion()%></td>
							</tr>
						</TABLE>
						<%@include file="FooterAnexo.jsp"%>
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
			<%@include file="FooterAnexo.jsp"%>
		<%
		}
		%>	
		</td>
		</tr>
		</table>

<%
	}
%>

</body>
</html>
