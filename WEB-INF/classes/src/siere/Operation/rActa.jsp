<jsp:useBean id="oActa" class="com.gob.Acta" scope="session"/>
<%@page import="com.gob.*"%>
<%@page import="com.consiss.util.*"%>
<%
response.setHeader("Cache-Control","no-cache");
response.setHeader("Pragma","no-cache");
response.setDateHeader ("Expires", -1);
/**************************************************************************************
Elaboró:	Julio Enrique Espinosa Torres
Lugar:		Monterrey, NL
Fecha:		25.Oct.2002
Compañia:	CONSISS

Modificó : 	Enrique Martinez
Fecha :		25.Feb.2003

***************************************************************************************/
String	iIdFuncionario = request.getParameter("iIdFuncionario")!= null ? request.getParameter("iIdFuncionario"): "0";
//String	iTipoActa = request.getParameter("iTipoActa")!= null ? request.getParameter("iTipoActa"): "0";
String sPath ="../";
oActa = new com.gob.Acta();
oActa.Get(java.lang.Integer.parseInt(iIdFuncionario));
String 	sRutaBaseWeb	= "../Attachment";
%>
<html>
<head>
<title>Entrega - Recepción : Acta Administrativa (Consulta)</title>
<link rel="stylesheet" type="text/css" href="<%=sPath%>Styles/Gobierno.css">
<script language="JavaScript" src="<%=sPath%>Scripts/Gobierno.js"></script>
<script language="JavaScript" src="<%=sPath%>Scripts/Libreria.js"></script>
<script language="javascript">
<!--
function Imprimir(iIdFuncionario,iTipoActa){
	var ancho = 600;
	var alto = 500;
	var x = (screen.width - ancho) / 2;
	var y = (screen.height - alto)- 150 / 2;		
	var strUrl  = "iActa.jsp?iIdFuncionario=" + iIdFuncionario;
	window.open(strUrl, "SubirArchivo", "width=" + ancho + ",height=" + alto + ",top=" + y + ",left=" + x + ",toolbar=0,location=0,directories=0,status=0,menubar=0,scrollbars=1,resizable=0");
}
/*
function AdjuntarActa(pIdFuncionario){
	vLoadAd = 0;
	popBox("Attachments", 550, 280, "pUpLoadActa.jsp?sIdFuncionario=" + pIdFuncionario );
}*/
function ArchivoAdjunto(pIdFuncionario){
	window.open("<%=sRutaBaseWeb + "/" + "/Funcionario" + iIdFuncionario + "/Acta/" + oActa.GetArchivoAnexo()%>?dd");
}
// -->
</script>
</head>
<body topmargin="0" leftmargin="0">
<!-- Encabezado -->
<%@include file="Header.jsp"%>
<!-- Encabezado -->
<br>
<form name="forma" action="rActa.jsp">
	<input type="Hidden" name="iIdFuncionario" value="<%=iIdFuncionario%>">
</form>
<table border="0" cellspacing="0" cellpadding="0" width="100%">
  <tr>
  <!-- Menu -->
	 	<td width="135" valign="top"><%@include file="Menu.jsp"%></td>
  <!-- Menu -->
  <!-- Contenido -->
	<td valign="top">
<table align="center" cellpadding="0" cellspacing="0" width="500" border="0">
<tbody>
<tr>
<td align="right">
	<img onmouseover="this.style.cursor='hand'" alt="Imprimir Acta Administrativa" onclick="Imprimir('<%=iIdFuncionario%>');" style="cursor:hand;" src="<%=sPath%>Images/Impresora.gif">
</td>
</tr>
<tr>
<td colspan="2">
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
En la Ciudad de <b><%=oActa.GetCiudad()%></b>, siendo las <b><%=oActa.GetHora()%></b> horas del
<b><%=oActa.RegresaDiayMes(oActa.GetFechaActa())%></b> de 20<b><%=oActa.RegresaAnio(oActa.GetFechaActa())%></b>, se reunieron en las oficinas de
<b><%=oActa.GetUnidadGobierno()%></b> ubicadas en <b><%=oActa.GetDireccion()%></b> el C. <b><%=oActa.GetNombreEntrega()%>, 
<%=oActa.GetCargo()%></b> saliente y el C. <b><%=oActa.GetNombreRecibe()%></b> entrante, con motivo de la designación 
de que fue objeto por parte del <b><%=oActa.GetNombreExpide() + ", " + oActa.GetPuestoExpide()%></b> para 
ocupar con fecha <b><%=oActa.RegresaDiayMes(oActa.GetFechaEntrante()) + " de 20" + oActa.RegresaAnio(oActa.GetFechaEntrante())%></b> la titularidad del puesto 
vacante, procediéndose a la Entrega-Recepción de los recursos asignados a esta 
unidad Administrativa.</p>
<p align="center" class="SubTituloParrafo">HECHOS
</p>
<p align="justify" class="ContenidoParrafo">

<b>PRIMERO:</b> El C. <b><%=oActa.GetNombreEntrega()%>, <%=oActa.GetCargo()%></b> (funcionario 
saliente) se hace acompañar del C. <b><%=oActa.GetTestigoEntrega()%></b> manifestando 
prestar sus servicios en <b><%=oActa.GetUnidadTestigoEntrega()%></b> como <b>
<%=oActa.GetPuestoTestigoEntrega()%></b> y tener su domicilio en <b>
<%=oActa.GetDireccionTestigoEntrega()%></b> ; por su parte, el C. <b>
<%=oActa.GetNombreRecibe()%></b> (funcionario entrante) nombra al C. <b><%=oActa.GetTestigoRecibe()%></b>
manifestando prestar sus servicios en <b><%=oActa.GetUnidadTestigoRecibe()%></b> como <b>
<%=oActa.GetPuestoTestigoRecibe()%></b> y tener su domicilio en <b>
<%=oActa.GetDireccionTestigoRecibe()%></b> como testigos de asistencia para 
que den fe del desarrollo de esta diligencia.</p>

<p align="justify" class="ContenidoParrafo">
<%if(!oActa.GetResponsableOrgano().trim().equals("")){ %>
<%	if(!oActa.GetResponsableCoordinacion().trim().equals("")){ %>
<b>SEGUNDO:</b> Se encuentran presentes en el acto los C. C. <b><%=oActa.GetResponsableOrgano()%></b> y <b><%=oActa.GetResponsableCoordinacion()%><b>, responsables del 
Organo de Control Interno y/o de la Coordinación Administrativa de la Unidad 
Administrativa, respectivamente, así como el C. <b><%=oActa.GetResponsableSecretaria()%></b>, Representante de la Secretaría de la Contraloría 
General del Estado, quien asiste como testigo y ocupa el puesto de  
<b><%=oActa.GetPuestoRepresentante()%></b>.</p>
<%	}else{%>
<b>SEGUNDO:</b> Se encuentra presente en el acto el C. <b><%=oActa.GetResponsableOrgano()%></b>, responsable del 
Organo de Control Interno, así como el C. <b><%=oActa.GetResponsableSecretaria()%></b>, Representante de la Secretaría de la Contraloría 
General del Estado, quien asiste como testigo y ocupa el puesto de  
<b><%=oActa.GetPuestoRepresentante()%></b>.</p>
<%	}%>
<%}else{%>
<%	if(!oActa.GetResponsableCoordinacion().trim().equals("")){ %>
<b>SEGUNDO:</b> Se encuentra presente en el acto el C. <b><%=oActa.GetResponsableCoordinacion()%></b>, responsable de 
la Coordinación Administrativa de la Unidad 
Administrativa, así como el C. <b><%=oActa.GetResponsableSecretaria()%></b>, Representante de la Secretaría de la Contraloría 
General del Estado, quien asiste como testigo y ocupa el puesto de <b><%=oActa.GetPuestoRepresentante()%></b>.</p>
<%	}else{%>
<b>SEGUNDO:</b> Se encuentra presente en el acto el C. <b><%=oActa.GetResponsableSecretaria()%></b>, Representante de la Secretaría de la Contraloría 
General del Estado, quien asiste como testigo y ocupa el puesto de <b><%=oActa.GetPuestoRepresentante()%></b>.</p>
<%	}%>
<%}%>

<p align="justify" class="ContenidoParrafo">

<b>TERCERO</b>: Acto seguido, para llevar a cabo el proceso de Entrega-Recepción en 
forma ordenada y transparente y que garantice la debida continuidad en la 
prestación de los servicios públicos y en la ejecución de las obras y proyectos 
que se tienen en proceso, el C. <b><%=oActa.GetNombreEntrega()%> <%=oActa.GetCargo()%></b>
(funcionario saliente) de <b><%=oActa.GetUnidadGobierno()%></b> hace 
entrega al C. <b><%=oActa.GetNombreRecibe()%></b> (funcionario 
entrante), de un disco compacto con información congelada, 
conteniendo los siguientes:</p>

<p align="center" class="SubTituloParrafo">

ANEXOS</p>
<%
AnexoEstatus	oAnexoEstatus	= new AnexoEstatus();
Anexo			oAnexo			= new Anexo();
int iNumRows = oAnexoEstatus.GetAll(java.lang.Integer.parseInt(iIdFuncionario));
 %>
<table>
	<tr>
		<td><b>I.</b></td>
		<td colspan="3"><b>ASPECTOS JUR&Iacute;DICOS (en el caso de Entidades Paraestatales)</b></td>
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
<p align="justify" class="ContenidoParrafo"><b>CUARTO</b>:  El C. <b><%=oActa.GetNombreEntrega()%>, <%=oActa.GetCargo()%></b>, 
manifiesta haber proporcionado sin omisión alguna, todos los elementos necesarios para la formulación de la presente acta; 
así también, declara que todos los Pasivos de la unidad administrativa a su cargo, quedaron incluidos en el capítulo correspondiente 
de la presente acta y que no fue omitido ningún otro aspecto importante relativo a su gestión.
</p>
<p align="justify" class="ContenidoParrafo">
Los 46 anexos que se mencionan en esta acta y que se incluyen en el CD forman parte integrante de la misma. Dicho CD es firmado en su anverso en forma
autógrafa al margen y al calce, por ambos funcionarios y rubricada por los participantes en el presente acto, para su identificación y efectos legales
a que haya lugar.
</p>
<p align="justify" class="ContenidoParrafo">
La presente entrega no implica liberación alguna de responsabilidades administrativas, civiles, penales o laborales que pudieran llegarse a determinar   por   la   autoridad   
competente, con posterioridad para el C. <b><%=oActa.GetNombreEntrega()%>, <%=oActa.GetCargo()%></b>, asumiendo las responsabilidades que se deriven en su ejercicio 
administrativo y financiero, o de las que se adviertan que han ejercido partidas en egresos sin la debida justificación, o apartándose de las autorizaciones respectivas o de las normas 
y procedimientos que las leyes determinan para el manejo de los recursos económicos.
</p>
<p align="justify" class="ContenidoParrafo">Previa lectura de la presente acta y no habiendo mas que hacer constar, se da por concluida a las <b><%=oActa.GetHoraConclusionActa()%></b> horas del d&iacute;a 
<b><%=oActa.RegresaDiayMes(oActa.GetFechaFirma())%></b> de 20<b><%=oActa.RegresaAnio(oActa.GetFechaFirma())%></b> firmado para constancia en todas sus fojas al margen y al calce los que en ella intervinieron.
</td>
</tr>
</tbody>
</table>
<br>
<br>
<table align="center" cellpadding="0" cellspacing="0" width="550" border="0">
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
	<td align="center" <%=oActa.GetResponsableCoordinacion().trim().equals("")?"colspan=2":""%>><b><%=oActa.GetResponsableOrgano()%></b><br>RESPONSABLE DEL ORGANO DE CONTROL INTERNO</td>
	<%	if(!oActa.GetResponsableCoordinacion().trim().equals("")){ %>
	<td align="center"><b><%=oActa.GetResponsableCoordinacion()%></b><br>RESPONSABLE DE LA COORDINACI&Oacute;N ADMINISTRATIVA</td>
	<%	}%>
	<%}else{%>
	<%	if(!oActa.GetResponsableCoordinacion().trim().equals("")){ %>
	<td colspan="2" align="center"><b><%=oActa.GetResponsableCoordinacion()%></b><br>RESPONSABLE DE LA COORDINACI&Oacute;N ADMINISTRATIVA</td>
	<%	}%>
	<%}%>
</tr>
<%}%>
<tr height="40"><td  height="40" colspan="2">&nbsp;</td></tr>
<tr>
	<td colspan="2"  align="center">REPRESENTANTE DE LA SECRETAR&Iacute;A DE LA<br>CONTRALOR&Iacute;A GENERAL DEL ESTADO DE NUEVO LE&Oacute;N</td>
</tr>
<tr height="40"><td  height="40" colspan="2">&nbsp;</td></tr>
<tr>
	<td colspan="2"  align="center"><b><%=oActa.GetResponsableSecretaria()%></b></td>
</tr><%
	if(oActa.GetTipoActa().equals("2")) {%>
<tr>
	<td colspan="2" align="justify"><br>
	<textarea class="txtBox" name="sObservaciones" id="sObservaciones" style="border: 0; background-color: transparent; transparent;overflow-y:hidden; width:'100%'; height='100%'"><%=oActa.GetObservaciones()%></textarea>
	</p>
	</td>
</tr>
<%}%>
</table></td>
<!-- Contenido -->
  </tr>
</table>
<%@include file="Footer.jsp"%>
<!--ESTA ES LA ACTUALIZACION DEL 25-03-2003-->
</body>
</html>