<%String sPath = "../";%>
<html>
<head>
<meta name="AUTHOR" content="Julio Enrique Espinosa Torres">
<title>Sistema de Entrega - Recepción</title>
<link rel="stylesheet" type="text/css" href="<%=sPath%>Styles/Gobierno.css">
<script language="JavaScript">
	function del(pCODE){
	   if(confirm("¿Desea Eliminar el Registro?")){ 
		    document.forma.sCodigo.value = pCODE;
		    document.forma.sOpcion.value = 'DEL';
			document.forma.submit();
	   }
	}
</script>
</head>
<%
String	sOpcion = request.getParameter("sOpcion")!= null ? request.getParameter("sOpcion"): "";
String	sCodigo = request.getParameter("sCodigo")!= null ? request.getParameter("sCodigo"): "";
%>
<body topmargin="0" leftmargin="0">
<%if ((String)session.getValue("ok")!="ConsissRH") response.sendRedirect("../Operation/Error.html");%>
<!-- Encabezado -->
<%@include file="Header.jsp"%>
<!-- Encabezado -->
<script language="JavaScript" src="<%=sPath%>Scripts/Gobierno.js"></script>
<table border="0" cellspacing="0" cellpadding="0" width="100%">
  <tr>
  <!-- Menu -->
	 	<td width="135" valign="top"><%@include file="MenuRH.jsp"%></td>
  <!-- Menu -->
  <!-- Contenido -->
	  	<td align="center" valign="top"><%
	int	iTipoUsuario = session.getValue("iTipoUsuario")!=null?java.lang.Integer.parseInt((String)session.getValue("iTipoUsuario")):0;
	com.gob.Usuario	oUsuario = new com.gob.Usuario();
	
	if(iTipoUsuario == oUsuario.GetTipoAdmonRH() ){
		com.gob.MensajeRH oMensajeRH = new com.gob.MensajeRH();
		
		if(sOpcion.equals("DEL")){
			oMensajeRH.Leido(java.lang.Integer.parseInt(sCodigo));
			sCodigo = "";
			sOpcion = "";
		}
		
		%><br>&nbsp;<br>&nbsp;<br>
		<FORM action="fObservacionesRH.jsp" name="forma" method="post">
			<input type="hidden" name="sOpcion" value="">
			<input type="hidden" name="sCodigo" value="<%=sCodigo%>">
			<TABLE cellPadding="0" cellSpacing="0" BORDER="1" BORDERCOLOR="white">
			<!-- Etiqueta donde se aplican los encabezados de las tablas-->
			<tr><td colspan="3"><b>Observaciones Pendientes</b></td></tr>
			<tr>
				<td class="TituloMenu">&nbsp;</td>
				<td class="TituloMenu">Dependencia</td>
				<td class="TituloMenu">U. Administrativa</td>
				<td class="TituloMenu">ID</td>
				<td class="TituloMenu">Tipo Mov</td>
				<td class="TituloMenu">Valor Anterior</td>
			</tr><%
			int intContador = 0;
			String sBackColor = "";
			com.gob.UnidadGobierno oUnidadGobierno = new com.gob.UnidadGobierno();
			oUnidadGobierno.GetAll('1');
			com.gob.UnidadAdministrativa oUnidadAdministrativa = new com.gob.UnidadAdministrativa();
			oUnidadAdministrativa.GetAll();
			for(int i=0;i<oMensajeRH.GetAll(false).getNumRows();i++){
				intContador = intContador + 1;
				if (intContador%2 == 0)	{sBackColor = "#ffffff";}
				else					{sBackColor = "#eeeeee";}%>
			<tr align="left" bgcolor="<%=sBackColor%>" onMouseOver = "MouseDentro(this);this.style.cursor='hand';" onMouseOut="MouseFuera(this,'<%=sBackColor%>');" style="cursor:normal">
				<td onClick="del(<%=oMensajeRH.GetRenglon(i)%>);"><img src="<%=sPath%>Images/Eliminar.gif"></td>
				<td><%try{out.println(oUnidadGobierno.GetNombre(oUnidadGobierno.GetPos(oMensajeRH.GetIdUnidadGobierno(i))));}
				catch(Throwable e){out.println(oMensajeRH.GetIdUnidadGobierno(i));System.out.println(e + " " + oMensajeRH.GetIdUnidadGobierno(i));}%></td>
				<td><%
				if(!oMensajeRH.GetTipoMov(i).equals("E")){
					try{out.println(oUnidadAdministrativa.GetNombre(oUnidadAdministrativa.GetPos(oMensajeRH.GetIdUnidadAdministrativa(i))));}
					catch(Throwable e){out.println(oMensajeRH.GetIdUnidadAdministrativa(i));System.out.println(e + " " + oMensajeRH.GetIdUnidadAdministrativa(i));}
				} else out.println(oMensajeRH.GetValorAnterior(i));
				%></td>
				<td><%=oMensajeRH.GetIdUnidadAdministrativa(i)%></td>
				<td><%=oMensajeRH.GetTipoMov(i).equals("A")?"Agregada":(oMensajeRH.GetTipoMov(i).equals("N")||oMensajeRH.GetTipoMov(i).equals("G")?"Modificada":"Eliminada")%></td>
				<td><%
				if(oMensajeRH.GetTipoMov(i).equals("N")){
					out.println(oMensajeRH.GetValorAnterior(i));
				} else if(oMensajeRH.GetTipoMov(i).equals("G")){
					try{out.println(oMensajeRH.GetValorAnterior(i) + "-" + oUnidadGobierno.GetNombre(oUnidadGobierno.GetPos(java.lang.Integer.parseInt(oMensajeRH.GetValorAnterior(i)))));}
					catch(Throwable e){out.println(oMensajeRH.GetValorAnterior(i));System.out.println(e + " " + oMensajeRH.GetValorAnterior(i));}
				}%></td>
			</tr><%
			}%>
			</TABLE>
		</FORM><%
	}%></td>
	<!-- Contenido -->
	</tr>
	<tr>
		<td colspan="3" align="center"></td>
	</tr>
</table>
<%@include file="Footer.jsp"%>
</body>
</html>
