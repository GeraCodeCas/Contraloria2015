<jsp:useBean id="oActa" class="com.gob.Acta" scope="session"/>
<%
response.setHeader("Cache-Control","no-cache");
response.setHeader("Pragma","no-cache");
response.setDateHeader ("Expires", -1);
/**************************************************************************************
Elaboro:	Julio Enrique Espinosa Torres
Lugar:		Monterrey, NL
Fecha:		25.Oct.2002
Compañia:	CONSISS

***************************************************************************************/
//int iIdFuncionario =  java.lang.Integer.parseInt(
//		(String)(session.getValue("iIdFuncionario")!= null?session.getValue("iIdFuncionario"):"0") );
int	iIdFuncionario = java.lang.Integer.parseInt(request.getParameter("iIdFuncionario")!= null ? request.getParameter("iIdFuncionario"): "0");

//String	iTipoActa = request.getParameter("iTipoActa")!= null ? request.getParameter("iTipoActa"): "0";

String sAnexo = "";
String sPath ="../";
oActa = new com.gob.Acta();
oActa.Get(iIdFuncionario);
int numpag =0;
int numtot = 0;
%>

<html>
<head>
<title>Entrega - Recepción : Acta Administrativa (Impresión)</title>
<link rel="stylesheet" type="text/css" href="../Styles/Gobierno.css">
<script language="JavaScript">
function closewin(){
				 window.close();
}
</script>
<SCRIPT LANGUAGE="javascript">
	var da = (document.all) ? 1 : 0;
	var pr = (window.print) ? 1 : 0;
	var mac = (navigator.userAgent.indexOf("Mac") != -1); 

	function Imprimir() {
	  if (pr){
		/* NS4, IE5 */
		window.print();
	  }else if (da && !mac){ 
		/* IE4 (Windows) */
	   print();
	  }else /* other browsers */
	    alert("Lo siento, su browser no permite esta accion.");
	}
	
	function print()
	{
	
	var WebBrowser = '<OBJECT ID="WebBrowser1"  WIDTH=0 HEIGHT=0 CLASSID="CLSID:8856F961-340A-11D0-A96B-00C04FD705A2"></OBJECT>';
	// insert object
	this.document.body.insertAdjacentHTML('afterBegin', WebBrowser); 
	this.focus();
	//if (confirm("Seguro que desea imprimir?"))
	//{
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
<body topmargin="2" leftmargin="2" onLoad="javascript:Imprimir();">
<%@include file="HeaderActa.jsp"%>

<br>
<table align="center" cellpadding="0" cellspacing="0" width="500">
<tbody>
<tr>
<td>
<p align="center" class="TituloParrafo">ACTA ADMINISTRATIVA DE ENTREGA-RECEPCI&Oacute;N&nbsp;</p>
<p align="justify" class="SubTituloParrafo">DE LA <b><%=oActa.GetUnidadGobierno()%></b></p>
<p align="justify" class="ContenidoParrafo">Con fundamento en los Acuerdos publicados en el Periódico Oficial del Estado 
con fechas 1º de Octubre de 1999 y 14 de Abril de 2003, que establecen las Bases 
y Procedimientos, respectivamente, para el Proceso de Entrega Recepción de las 
Dependencias, Entidades, Organismos Paraestatales y Tribunales Administrativos 
de la Administración Pública del Estado, por los que los servidores públicos 
a que se refiere el Artículo 105 de la Constitución Política del Estado de Nuevo 
León, adscritos a la Administración Pública Estatal, deberán entregar a quienes 
los sustituyan al término de su empleo, cargo o comisión, las oficinas y asuntos, 
así como los recursos humanos, materiales y financieros que les hayan sido asignados, 
se elabora la presente Acta Administrativa.
<br>
En la Ciudad de <%=oActa.GetCiudad()%>, siendo las <%=oActa.GetHora()%> horas del 
<%=oActa.RegresaDiayMes(oActa.GetFechaActa())%> de 20<%=oActa.RegresaAnio(oActa.GetFechaActa())%>, se reunieron en las oficinas de 
<%=oActa.GetUnidadGobierno()%> ubicadas en <%=oActa.GetDireccion()%> el C. <%=oActa.GetNombreEntrega()%>, 
<%=oActa.GetCargo()%> saliente y el C. <%=oActa.GetNombreRecibe()%> entrante, con motivo de la designación 
de que fue objeto por parte del <%=oActa.GetNombreExpide() + ", " + oActa.GetPuestoExpide()%> para 
ocupar con fecha <%=oActa.RegresaDiayMes(oActa.GetFechaEntrante()) + " de 20" + oActa.RegresaAnio(oActa.GetFechaEntrante())%> la titularidad del puesto 
vacante, procediéndose a la Entrega-Recepción de los recursos asignados a esta unidad Administrativa.</p>
<p align="center" class="SubTituloParrafo">HECHOS
<br />

</p>
<p align="justify" class="ContenidoParrafo">

<b>PRIMERO:</b> El C. <%=oActa.GetNombreEntrega()%>, <%=oActa.GetCargo()%> (funcionario 
saliente) se hace acompañar del C. <%=oActa.GetTestigoEntrega()%> manifestando 
prestar sus servicios en <%=oActa.GetUnidadTestigoEntrega()%> como  
<%=oActa.GetPuestoTestigoEntrega()%> y tener su domicilio en  
<%=oActa.GetDireccionTestigoEntrega()%>; por su parte, el C. 
<%=oActa.GetNombreRecibe()%> (funcionario entrante) nombra al C. <%=oActa.GetTestigoRecibe()%>
manifestando prestar sus servicios en  
<%=oActa.GetUnidadTestigoRecibe()%> como  
<%=oActa.GetPuestoTestigoRecibe()%> y tener su domicilio en  
<%=oActa.GetDireccionTestigoRecibe()%> como testigos de asistencia para 
que den fe del desarrollo de esta diligencia.</p>

<p align="justify" class="ContenidoParrafo">
<%if(!oActa.GetResponsableOrgano().trim().equals("")){ %>
<%	if(!oActa.GetResponsableCoordinacion().trim().equals("")){ %>
<b>SEGUNDO:</b> Se encuentran presentes en el acto los C. C. <%=oActa.GetResponsableOrgano()%> y <%=oActa.GetResponsableCoordinacion()%>, responsables del 
Organo de Control Interno y/o de la Coordinación Administrativa de la Unidad 
Administrativa, respectivamente, así como el C. <%=oActa.GetResponsableSecretaria()%>, Representante de la Secretaría de la Contraloría 
General del Estado, quien asiste como testigo y ocupa el puesto de  
<%=oActa.GetPuestoRepresentante()%>.</p>
<%	}else{%>
<b>SEGUNDO:</b> Se encuentra presente en el acto el C. <%=oActa.GetResponsableOrgano()%>, responsable del 
Organo de Control Interno, así como el C. <%=oActa.GetResponsableSecretaria()%>, Representante de la Secretaría de la Contraloría 
General del Estado, quien asiste como testigo y ocupa el puesto de  
<%=oActa.GetPuestoRepresentante()%>.</p>
<%	}%>
<%}else{%>
<%	if(!oActa.GetResponsableCoordinacion().trim().equals("")){ %>
<b>SEGUNDO:</b> Se encuentra presente en el acto el C. <%=oActa.GetResponsableCoordinacion()%>, responsable de 
la Coordinación Administrativa de la Unidad Administrativa, así como el C. <%=oActa.GetResponsableSecretaria()%>, Representante de la Secretaría de la Contraloría 
General del Estado, quien asiste como testigo y ocupa el puesto de <%=oActa.GetPuestoRepresentante()%>.</p>
<%	}else{%>
<b>SEGUNDO:</b> Se encuentra presente en el acto el C. <%=oActa.GetResponsableSecretaria()%>, Representante de la Secretaría de la Contraloría 
General del Estado, quien asiste como testigo y ocupa el puesto de <%=oActa.GetPuestoRepresentante()%>.</p>
<%	}%>
<%}%>

<p align="justify" class="ContenidoParrafo">

<b>TERCERO</b>: Acto seguido, para llevar a cabo el proceso de Entrega-Recepción en 
forma ordenada y transparente y que garantice la debida continuidad en la 
prestación de los servicios públicos y en la ejecución de las obras y proyectos 
que se tienen en proceso, el C. <%=oActa.GetNombreEntrega()%>, <%=oActa.GetCargo()%>
(funcionario saliente) de <%=oActa.GetUnidadGobierno()%> hace 
entrega al C. <%=oActa.GetNombreRecibe()%> (funcionario 
entrante), de un disco compacto con información congelada, conteniendo los siguientes:</p>

<p align="center" class="SubTituloParrafo">

ANEXOS</p>
<%
AnexoEstatus	oAnexoEstatus	= new AnexoEstatus();
Anexo			oAnexo			= new Anexo();
int iNumRows = oAnexoEstatus.GetAll(iIdFuncionario);
 %>
<table>
	<tr>
		<td><b>I.</b></td>
		<td colspan="3"><b>ASPECTOS JURÍDICOS (en el caso de Entidades Paraestatales)</b></td>
	</tr>
	<%for(int i=0;i<=1;i++){ %>
	<tr>
		<td>&nbsp;</td>
		<td><%=oAnexo.GetPos(oAnexoEstatus.GetIdAnexo(i))>=0?
						oAnexo.GetNombre(oAnexo.GetPos(oAnexoEstatus.GetIdAnexo(i))):oAnexoEstatus.GetIdAnexo(i)+"" %></td>
		<td><%=oAnexo.GetPos(oAnexoEstatus.GetIdAnexo(i))>=0?
						oAnexo.GetClave(oAnexo.GetPos(oAnexoEstatus.GetIdAnexo(i))).substring(5):oAnexoEstatus.GetIdAnexo(i)+"" %></td>
		<td width="50px"><%=oAnexoEstatus.GetEstatusNoAplica().equals(oAnexoEstatus.GetEstatus(i))?"No Aplica":""%></td>
	</tr>
	<%}%>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td><b>II.</b></td>
		<td colspan="3"><b>ASPECTOS PRESUPUESTALES Y FINANCIEROS</b></td>
	</tr>
	<tr>
		<td></td>
		<td colspan="3"><b>Situación Programática Presupuestal</b></td>
	</tr>
	<%for(int i=2;i<=2;i++){ %>
	<tr>
		<td>&nbsp;</td>
		<td><%=oAnexo.GetPos(oAnexoEstatus.GetIdAnexo(i))>=0?
						oAnexo.GetNombre(oAnexo.GetPos(oAnexoEstatus.GetIdAnexo(i))):oAnexoEstatus.GetIdAnexo(i)+"" %></td>
		<td><%=oAnexo.GetPos(oAnexoEstatus.GetIdAnexo(i))>=0?
						oAnexo.GetClave(oAnexo.GetPos(oAnexoEstatus.GetIdAnexo(i))).substring(5):oAnexoEstatus.GetIdAnexo(i)+"" %></td>
		<td width="50px"><%=oAnexoEstatus.GetEstatusNoAplica().equals(oAnexoEstatus.GetEstatus(i))?"No Aplica":""%></td>
	</tr>
	<%}%>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td></td>
		<td colspan="3"><b>Recursos Financieros</b></td>
	</tr>
	<%for(int i=3;i<=11;i++){ %>
	<tr>
		<td>&nbsp;</td>
		<td><%=oAnexo.GetPos(oAnexoEstatus.GetIdAnexo(i))>=0?
						oAnexo.GetNombre(oAnexo.GetPos(oAnexoEstatus.GetIdAnexo(i))):oAnexoEstatus.GetIdAnexo(i)+"" %></td>
		<td><%=oAnexo.GetPos(oAnexoEstatus.GetIdAnexo(i))>=0?
						oAnexo.GetClave(oAnexo.GetPos(oAnexoEstatus.GetIdAnexo(i))).substring(5):oAnexoEstatus.GetIdAnexo(i)+"" %></td>
		<td width="50px"><%=oAnexoEstatus.GetEstatusNoAplica().equals(oAnexoEstatus.GetEstatus(i))?"No Aplica":""%></td>
	</tr>
	<%}%>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td><b>III</b></td>
		<td colspan="3"><b>ASPECTOS OPERATIVOS</b></td>
	</tr>
	<%for(int i=12;i<=14;i++){ %>
	<tr>
		<td>&nbsp;</td>
		<td><%=oAnexo.GetPos(oAnexoEstatus.GetIdAnexo(i))>=0?
						oAnexo.GetNombre(oAnexo.GetPos(oAnexoEstatus.GetIdAnexo(i))):oAnexoEstatus.GetIdAnexo(i)+"" %></td>
		<td><%=oAnexo.GetPos(oAnexoEstatus.GetIdAnexo(i))>=0?
						oAnexo.GetClave(oAnexo.GetPos(oAnexoEstatus.GetIdAnexo(i))).substring(5):oAnexoEstatus.GetIdAnexo(i)+"" %></td>
		<td width="50px"><%=oAnexoEstatus.GetEstatusNoAplica().equals(oAnexoEstatus.GetEstatus(i))?"No Aplica":""%></td>
	</tr>
	<%}%>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td></td>
		<td colspan="3"><b>Recursos Humanos</b></td>
	</tr>
	<%for(int i=15;i<=21;i++){ %>
	<tr>
		<td>&nbsp;</td>
		<td><%=oAnexo.GetPos(oAnexoEstatus.GetIdAnexo(i))>=0?
						oAnexo.GetNombre(oAnexo.GetPos(oAnexoEstatus.GetIdAnexo(i))):oAnexoEstatus.GetIdAnexo(i)+"" %></td>
		<td><%=oAnexo.GetPos(oAnexoEstatus.GetIdAnexo(i))>=0?
						oAnexo.GetClave(oAnexo.GetPos(oAnexoEstatus.GetIdAnexo(i))).substring(5):oAnexoEstatus.GetIdAnexo(i)+"" %></td>
		<td width="50px"><%=oAnexoEstatus.GetEstatusNoAplica().equals(oAnexoEstatus.GetEstatus(i))?"No Aplica":""%></td>
	</tr>
	<%}%>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td></td>
		<td colspan="3"><b>Recursos Materiales</b></td>
	</tr>
	<%for(int i=22;i<=35;i++){ %>
	<tr>
		<td>&nbsp;</td>
		<td><%=oAnexo.GetPos(oAnexoEstatus.GetIdAnexo(i))>=0?
						oAnexo.GetNombre(oAnexo.GetPos(oAnexoEstatus.GetIdAnexo(i))):oAnexoEstatus.GetIdAnexo(i)+"" %></td>
		<td><%=oAnexo.GetPos(oAnexoEstatus.GetIdAnexo(i))>=0?
						oAnexo.GetClave(oAnexo.GetPos(oAnexoEstatus.GetIdAnexo(i))).substring(5):oAnexoEstatus.GetIdAnexo(i)+"" %></td>
		<td width="50px"><%=oAnexoEstatus.GetEstatusNoAplica().equals(oAnexoEstatus.GetEstatus(i))?"No Aplica":""%></td>
	</tr>
	<%}%>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td></td>
		<td colspan="3"><b>Obras Públicas</b></td>
	</tr>
	<%for(int i=36;i<=40;i++){ %>
	<tr>
		<td>&nbsp;</td>
		<td><%=oAnexo.GetPos(oAnexoEstatus.GetIdAnexo(i))>=0?
						oAnexo.GetNombre(oAnexo.GetPos(oAnexoEstatus.GetIdAnexo(i))):oAnexoEstatus.GetIdAnexo(i)+"" %></td>
		<td><%=oAnexo.GetPos(oAnexoEstatus.GetIdAnexo(i))>=0?
						oAnexo.GetClave(oAnexo.GetPos(oAnexoEstatus.GetIdAnexo(i))).substring(5):oAnexoEstatus.GetIdAnexo(i)+"" %></td>
		<td width="50px"><%=oAnexoEstatus.GetEstatusNoAplica().equals(oAnexoEstatus.GetEstatus(i))?"No Aplica":""%></td>
	</tr>
	<%}%>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td></td>
		<td colspan="3"><b>Archivos Y Documentos</b></td>
	</tr>
	<%for(int i=41;i<=43;i++){ %>
	<tr>
		<td>&nbsp;</td>
		<td><%=oAnexo.GetPos(oAnexoEstatus.GetIdAnexo(i))>=0?
						oAnexo.GetNombre(oAnexo.GetPos(oAnexoEstatus.GetIdAnexo(i))):oAnexoEstatus.GetIdAnexo(i)+"" %></td>
		<td><%=oAnexo.GetPos(oAnexoEstatus.GetIdAnexo(i))>=0?
						oAnexo.GetClave(oAnexo.GetPos(oAnexoEstatus.GetIdAnexo(i))).substring(5):oAnexoEstatus.GetIdAnexo(i)+"" %></td>
		<td width="50px"><%=oAnexoEstatus.GetEstatusNoAplica().equals(oAnexoEstatus.GetEstatus(i))?"No Aplica":""%></td>
	</tr>
	<%}%>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td></td>
		<td colspan="3"><b>Otros Asuntos En Trámite</b></td>
	</tr>
	<%for(int i=44;i<=45;i++){ %>
	<tr>
		<td>&nbsp;</td>
		<td><%=oAnexo.GetPos(oAnexoEstatus.GetIdAnexo(i))>=0?
						oAnexo.GetNombre(oAnexo.GetPos(oAnexoEstatus.GetIdAnexo(i))):oAnexoEstatus.GetIdAnexo(i)+"" %></td>
		<td><%=oAnexo.GetPos(oAnexoEstatus.GetIdAnexo(i))>=0?
						oAnexo.GetClave(oAnexo.GetPos(oAnexoEstatus.GetIdAnexo(i))).substring(5):oAnexoEstatus.GetIdAnexo(i)+"" %></td>
		<td width="50px"><%=oAnexoEstatus.GetEstatusNoAplica().equals(oAnexoEstatus.GetEstatus(i))?"No Aplica":""%></td>
	</tr>
	<%}%>
</table>
<br>
<%if(oActa.GetTipoActa().equals("2")) {%>
<p align="justify" class="ContenidoParrafo">
Así mismo en el CD se incluyen los archivos de los anexos correspondientes a cada una de las áreas administrativas 
que integran la Unidad Administrativa que se entrega.
</p>
<%}%>
<p align="justify" class="ContenidoParrafo"><b>CUARTO</b>:  El C. <%=oActa.GetNombreEntrega()%>, <%=oActa.GetCargo()%>, 
manifiesta haber proporcionado sin omisión alguna, todos los elementos necesarios para la formulación de la presente acta; 
así también, declara que todos los Pasivos de la unidad administrativa a su cargo, quedaron incluidos en el capítulo correspondiente 
de la presente acta y que no fue omitido ningún otro aspecto importante relativo a su gestión.
</p>
<p align="justify" class="ContenidoParrafo">
Los  46 anexos que se mencionan en esta acta y que se incluyen en el CD forman parte integrante de la misma. Dicho CD es firmado en su anverso en forma
autógrafa al margen y al calce, por ambos funcionarios y rubricada por los participantes en el presente acto, para su identificación y efectos legales
a que haya lugar.
</p>
<p align="justify" class="ContenidoParrafo">
La presente entrega no implica liberación alguna de responsabilidades administrativas, civiles, penales o laborales que pudieran llegarse a determinar   por   la   autoridad   
competente, con posterioridad para el C. <%=oActa.GetNombreEntrega()%>, <%=oActa.GetCargo()%>, asumiendo las responsabilidades que se deriven en su ejercicio 
administrativo y financiero, o de las que se adviertan que han ejercido partidas en egresos sin la debida justificación, o apartándose de las autorizaciones respectivas o de las normas 
y procedimientos que las leyes determinan para el manejo de los recursos económicos.
</p>
<p align="justify" class="ContenidoParrafo">Previa lectura de la presente acta y no habiendo mas que hacer constar, se da por concluida a las <%=oActa.GetHoraConclusionActa()%> horas del d&iacute;a 
<%=oActa.RegresaDiayMes(oActa.GetFechaFirma())%> de 20<%=oActa.RegresaAnio(oActa.GetFechaFirma())%> firmado para constancia en todas sus fojas al margen y al calce los que en ella intervinieron.
</td>
</tr>
</tbody>
</table>
<table align="center" cellpadding="0" cellspacing="0" width="500" border="0">
<tr height="40"><td  height="40" colspan="2">&nbsp;</td></tr>
<tr>
	<td align="center"><b><%=oActa.GetNombreEntrega()%></b><br>FUNCIONARIO SALIENTE</td>
	<td align="center"><b><%=oActa.GetNombreRecibe()%></b><br>FUNCIONARIO ENTRANTE</td>
</tr>
<tr valign="top">
	<td></td>
	<td align="justify" width="50%"><font style="font-size:9px;">Se firma la presente Acta, aceptando solamente el aspecto formal de los documentos recibidos.</font></td>
</tr>
<tr height="40"><td  height="40" colspan="2">&nbsp;</td></tr>
<tr>
<td align="center"><b><%=oActa.GetTestigoEntrega()%></b><br>TESTIGO</td>
<td align="center"><b><%=oActa.GetTestigoRecibe()%></b><br>TESTIGO</td>
</tr>
<%if( !oActa.GetResponsableOrgano().trim().equals("") || !oActa.GetResponsableCoordinacion().trim().equals("") ){%>
<tr height="40"><td  height="40" colspan="2">&nbsp;</td></tr>
<tr>
	<%if (!oActa.GetResponsableOrgano().trim().equals("")){%>
	<td align="center" <%=oActa.GetResponsableCoordinacion().trim().equals("")?"colspan=2":""%>><b><%=oActa.GetResponsableOrgano()%></b><br>RESPONSABLE DEL ORGANO DE CONTROL <br>INTERNO</td>
	<%	if(!oActa.GetResponsableCoordinacion().trim().equals("")){ %>
	<td align="center"><b><%=oActa.GetResponsableCoordinacion()%></b><br>RESPONSABLE DE LA COORDINACIÓN ADMINISTRATIVA</td>
	<%	}%>
	<%}else{%>
	<%	if(!oActa.GetResponsableCoordinacion().trim().equals("")){ %>
	<td colspan="2" align="center"><b><%=oActa.GetResponsableCoordinacion()%></b><br>RESPONSABLE DE LA COORDINACIÓN ADMINISTRATIVA</td>
	<%	}%>
	<%}%>
</tr>
<%}%>
<tr height="40"><td  height="40" colspan="2">&nbsp;</td></tr>
<tr>
	<td colspan="2"  align="center">REPRESENTANTE DE LA SECRETARÍA DE LA<br>CONTRALORÍA GENERAL DEL ESTADO DE NUEVO LEÓN</td>
</tr>
<tr height="40"><td  height="40" colspan="2">&nbsp;</td></tr>
<tr>
<td colspan="2"  align="center"><b><%=oActa.GetResponsableSecretaria()%></b></td>
</tr>
<%if(oActa.GetTipoActa().equals("2")) {%>
<tr>
	<td colspan="2" align="justify"><br>
	<p align="justify" class="ContenidoParrafo">
	<textarea cols="100" rows="60" name="sObservaciones" id="sObservaciones" class="txtBox" 
	style="border: 0; background-color: transparent;overflow-y:hidden"><%=oActa.GetObservaciones()%>
	</textarea>
	</p>
	</td>
</tr>
<%}%>
</table>
<!--ESTA ES LA ACTUALIZACION DEL 25-03-2003-->
</body>
</html>