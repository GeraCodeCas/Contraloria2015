<%	
response.setHeader("Cache-Control","no-cache");
response.setHeader("Pragma","no-cache");
response.setDateHeader ("Expires", -1);
int	iItemsPagina = 50;
%><jsp:useBean id="oVMAlertas" class="com.consiss.util.tools.VMatrix" scope="application"/><%
try{
	String sNombreHeader = session.getValue("sNombre")!=null?(String)session.getValue("sNombre"):""; 
	String sNombreFuncionarioHeader = session.getValue("sNombreFuncionario")!=null?(String)session.getValue("sNombreFuncionario"):""; 
	String sNombreUnidadGobierno = session.getValue("sUnidadGobierno")!=null?(String)session.getValue("sUnidadGobierno"):""; 
	%>

<table border="0" cellspacing="0" cellpadding="0" width="100%">
  <tr>
    <td rowspan="2" valign="top"><img border="0" src="<%=sPath%>Images/EncaIzq.jpg" width="300" height="100"></td>
    <td valign="top" width="100%"><img border="0" src="<%=sPath%>Images/EncaCen.jpg" width="100%" height="74px"></td>
    <td height="75px" valign="top"><img border="0" src="<%=sPath%>Images/EncaDer.jpg" width="380"  height="75px"></td>
  </tr>
  <tr><td colspan="2" align="right" valign="top"><% 
	int iTipoUsuarioHeader = session.getValue("iTipoUsuario")!=null?java.lang.Integer.parseInt((String)session.getValue("iTipoUsuario")):0; 
	if(iTipoUsuarioHeader!=2){%>
  	<%=iTipoUsuarioHeader==4?"Enlace: ":(iTipoUsuarioHeader==5?"Representante: ":"")%><%=sNombreHeader.trim()%>&nbsp;
  	<%=(sNombreFuncionarioHeader!=null) && ((sNombreFuncionarioHeader+"").trim()!="") ?("<br>Funcionario:<b>" + sNombreFuncionarioHeader+"</b>&nbsp;"):"&nbsp;"%>
	<%=(sNombreUnidadGobierno!=null) && ((sNombreUnidadGobierno+"").trim()!="") ?("<br>Dependencia, Organismo o Tribunal:<b>" + sNombreUnidadGobierno+"</b>&nbsp;"):"&nbsp;"%>
	<%} else {%>
	Funcionario:<b><%=sNombreHeader%></b>
	<br>Dependencia, Organismo o Tribunal:<b><%=sNombreUnidadGobierno%></b>
	<%}%></td></tr>
 </table><%
/*com.gob.Sesion oSesion = new com.gob.Sesion();
String sIdSesionHeader = (String)(session.getValue("iIdSesion")!= null?session.getValue("iIdSesion"):"0");
oSesion.Get(sIdSesionHeader);

String sEstatusHeader = oSesion.GetEstatus();

if(! sEstatusHeader.equals(oSesion.GetEstatusAbierto()) ){
	oSesion = null;
	response.sendRedirect("Cerrar.html");
}
oSesion = null;*/
} catch(Throwable e){
	System.out.println("Error en Header.jsp " + e );
}%>