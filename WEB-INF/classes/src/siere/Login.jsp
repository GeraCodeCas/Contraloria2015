<%
response.setHeader("Cache-Control","no-cache");
response.setHeader("Pragma","no-cache");
response.setDateHeader ("Expires", -1);

/********************************************************************************************************
'Elaboro:	Julio Espinosa
'Lugar:		Monterrey, NL
'Fecha:		22.Oct.2002
'Compañia:	CONSISS
'Ultima Modificacion:	24.Oct.2002
'By:		Jesus Limon
'
'Distintas opciones:
'
'********************************************************************************************************/
%>
<%@page import="com.consiss.*"%>
<%@page import="com.consiss.util.*"%>
<%@page import="com.gob.*"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.*"%>
<%@page import="java.text.*"%>
<%@page buffer="100kb" %>
<%
//Declaración de variables a usar
Usuario 	oUsuario;
Enlace		oEnlace;
Seguridad	oSeguridad;

if(session.getValue("ok")!=null) {
	if ( ((String)session.getValue("ok")).equals("Consiss") ) {
			response.sendRedirect("Operation/Principal.jsp");
	} else 	
		if ( ((String)session.getValue("ok")).equals("ConsissRH") ) {
			response.sendRedirect("Operation/PrincipalRH.jsp");
		}
}

String 	sOportunidades	= (String)request.getParameter("sOportunidades") != null ? (String)request.getParameter("sOportunidades"): "1";
String	sUsuario		= request.getParameter("sUsuario") != null ? ((String)request.getParameter("sUsuario")) : "";
String	sClave			= request.getParameter("sClave") != null ? ((String)request.getParameter("sClave")) : "";
String  sError			= "";
boolean	bFlag			= true;
boolean	bInicia			= false;

if (sOportunidades != "1") {
	if (java.lang.Integer.parseInt(sOportunidades) <= 5){
		oUsuario = new Usuario();
		if (!oUsuario.Get(sUsuario)) {
			sError = "El usuario o la clave son incorrectos.";
			bFlag = false;
		}
		
		if (!oUsuario.GetClave().equals(sClave) && bFlag) {
			sError = "El usuario o la clave son incorrectos.";
			bFlag = false;
		}
		
		if(oUsuario.GetEstatus()==0 && bFlag){
			sError = "El usuario ha sido dado de baja, consulte al Administrador.";
			bFlag = false;
		}
		
		if( oUsuario.GetTipoUsuario() == oUsuario.GetTipoLimitado() && bFlag){
			UsrLimitado oUsrLimitado = new UsrLimitado();
			oUsrLimitado.Get(oUsuario.GetIdUsuarioLimitado());
			
			long nFecIni = java.lang.Long.parseLong(oUsrLimitado.GetFecIni()!=null && !oUsrLimitado.GetFecIni().equals("")?oUsrLimitado.GetFecIni():"0") ;
			long nFecFin = java.lang.Long.parseLong(oUsrLimitado.GetFecFin()!=null && !oUsrLimitado.GetFecFin().equals("")?oUsrLimitado.GetFecFin():"99999999") ;
			long nFecHoy = java.lang.Long.parseLong((new SimpleDateFormat("yyyyMMdd")).format(new java.util.Date()));
			if(nFecIni>nFecHoy || nFecFin<nFecHoy){
				sError = "El Acceso al Usuario ha caducado, consulte a su Funcionario.";
				bFlag = false;
			}
		}
		
		if( (oUsuario.GetTipoUsuario() == oUsuario.GetTipoFuncionario() ||
			 oUsuario.GetTipoUsuario() == oUsuario.GetTipoLimitado() )&& bFlag){
			Funcionario oFuncionario = new Funcionario();
			oFuncionario.Get(oUsuario.GetIdFuncionario());
			session.putValue("iIdFuncionarioAnt",	oFuncionario.GetIdFuncionarioAnt()+"");	//Id de FuncionarioAnt
			EntregaEstatus oEntregaEstatus = new EntregaEstatus();
			oEntregaEstatus.Get(oUsuario.GetIdFuncionario());
			session.putValue("sEstatusEntrega",		oEntregaEstatus.GetEstatus()+"");		//sEstatusEntrega
		}
		
		if(bFlag){
			if( oUsuario.GetTipoUsuario() == oUsuario.GetTipoAdmonRH() ||
				oUsuario.GetTipoUsuario() == oUsuario.GetTipoRH() )
				session.putValue("ok",					"ConsissRH");
			else
				session.putValue("ok",					"Consiss");
				
			session.putValue("iIdUsuario",			oUsuario.GetIdUsuario()+"" );		//Id de Usuario
			session.putValue("iIdFuncionario",		oUsuario.GetIdFuncionario()+"");	//Id de Funcionario
			session.putValue("iIdUsuarioLimitado",	oUsuario.GetIdUsuarioLimitado()+"");//Id de U. Limitado
			session.putValue("iTipoUsuario",		oUsuario.GetTipoUsuario()+"");		//Tipo de Usuario
			session.putValue("sNombre",				oUsuario.GetNombre());				//Nombre
			session.putValue("sUsuario",			sUsuario);							//sUsuario
			session.putValue("sEstatus",			oUsuario.GetEstatus()+"");			//sEstatus
			
			if(oUsuario.GetIdFuncionario()>0 ){
				Funcionario oFuncionario = new Funcionario();
				oFuncionario.Get(oUsuario.GetIdFuncionario());
				session.putValue("iIdUnidadAdministrativa", oFuncionario.GetIdUnidadAdministrativa()+"" );	//sUsuario
				session.putValue("iIdUnidadGobierno", oFuncionario.GetIdUnidadGobierno()+"");  //Unidad de Gobierno
				session.putValue("sUnidadGobierno", oFuncionario.GetUnidadGobierno()+"");	//Nombre Unidad Gobierno
				if(oUsuario.GetTipoUsuario() > 2) {
					session.putValue("sNombreFuncionario", oFuncionario.GetNombre() + " " + oFuncionario.GetApePaterno() + " " + oFuncionario.GetApeMaterno() );				//sUsuario
				}
			}
			
			if (oUsuario.GetTipoUsuario() == 4 || oUsuario.GetTipoUsuario() == 5){
				oEnlace = new Enlace();
				oEnlace.GetUsuario(oUsuario.GetIdUsuario());
				session.putValue("iIdUnidadGobierno",		oEnlace.GetIdUnidadGobierno()+"");		// Unidad de Gobierno
				session.putValue("sUnidadGobierno", oEnlace.GetNombreUnidadGobierno()+"");	//Nombre Unidad Gobierno
			}
			
			System.out.println("Entrada exitosa Beta(" + sUsuario + ") [" + (new SimpleDateFormat("dd-MM-yyyy hh:mm:ss SSS")).format(new java.util.Date()) + "]" );
			
			oSeguridad = new Seguridad();
			oSeguridad.Bitacora(sUsuario, "Entrada", "Acceso al modulo de Entrega-Recepción", request.getRemoteAddr(), request.getRemoteHost(), request.getHeader("User-Agent"));
			oSeguridad = null;
			
			bInicia = true;
			//response.sendRedirect("Operation/Principal.jsp");
			
			if( oUsuario.GetTipoUsuario() == oUsuario.GetTipoAdmonRH() ||
				oUsuario.GetTipoUsuario() == oUsuario.GetTipoRH() )	{%>
			<form name="fprincipal" action="LoadsRH/PrincipalRH.jsp" method="post">
			</form><%
			} else {%>
			<form name="fprincipal" action="Operation/Principal.jsp" method="post">
			</form><%
			} %>
			<script language="JavaScript">
				document.fprincipal.submit();
			</script><%
			
		}
	} else {
		sError = "Se ha exedido en los intentos por entrar al sistema.";
	}
}
%>
<html>
<head>
<meta name="AUTHOR" content="Julio Enrique Espinosa Torres">
<title>Sistema de Entrega - Recepción</title>
<link rel="stylesheet" type="text/css" href="Styles/Gobierno.css">
</head>
<script language="JavaScript">
	function valida(){
		if (document.fLogin.sUsuario.value == "") 	return false;
		if (document.fLogin.sClave.value == "") 	return false;
		return true;
	}
	function Envia(){
		if (valida()){
			document.fLogin.sOportunidades.value = eval(document.fLogin.sOportunidades.value) + 1;
			document.fLogin.action = "Login.jsp";
			document.fLogin.submit();
			return false;
		}else {
			alert("Error en la introducción de datos !!!");
			return false;
		}
	}
</script>
<body topmargin="0" leftmargin="0"  scroll=no>
<table border="0" cellspacing="0" cellpadding="0" width="100%" height="100%" style="position:absolute;">
	<tr>
		<td height="20%" colspan="3" align="center"><BR><img src="images/inicio/LetrasGENL.gif" border="0"></td>
	</tr>
	<tr>
		<td height="20%" colspan="3" align="center"><BR><img src="images/inicio/LetrasSCGE.gif" border="0"></td>
	</tr>
	<tr>
		<td height="20%" colspan="3" align="center"><BR><img src="images/inicio/LetrasSE-R.gif" border="0"></td>
	</tr>
	<tr>
		<td height="15%" width="45%" align="right"><BR><img src="images/inicio/LogoGENL.gif" border="0"></td>
		<td width="50px">&nbsp;</td>
		<td width="45%"><BR><img src="images/inicio/LogoContraloria.gif" border="0"></td>
	</tr>
	<tr>
		<td height="20%" colspan="2">&nbsp;</td>
		<td align="center">
			<form name="fLogin" method="post">
				<input type="hidden" name="sOportunidades" id="sOportunidades" value="<%=sOportunidades%>">
				<table border="0" align="center"  cellspacing="0" cellpadding="0">
    			<tr>
					<td height="23"><b><font size="1" face="Verdana">Usuario:</font></b>&nbsp;&nbsp;&nbsp;
					<input type="text" name="sUsuario" id="sUsuario" value="" size="10" maxlength="10" <%if (java.lang.Integer.parseInt(sOportunidades) > 5){%>disabled<%}%>></td>
    			</tr>
    			<tr>
					<td height="27"><b><font face="Verdana" size="1">Clave:</font></b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<input type="password" name="sClave" id="sClave" value="" size="10" maxlength="10" <%if (java.lang.Integer.parseInt(sOportunidades) > 5){%>disabled<%}%>>
					</td>
    			</tr>
    	    	<tr>
	    			<td ><p align="center">
					<input type="submit" name="Entrar"  value=" Entrar " class="boton" onclick="event.returnValue = Envia();" <%if (java.lang.Integer.parseInt(sOportunidades) > 5){%>disabled<%}%>>
					</td>
    			</tr>
    			</table><br>
				<b><font face="Verdana" size="1" color="red">&nbsp;<%=sError%></font></b>
			</form>
			</td>
	</tr>
</table>
<table border="0" cellspacing="0" cellpadding="0" width="100%" height="100%">
  <tr>
    <td valign=bottom>
    <table border="0" cellspacing="0" cellpadding="0" width="100%" height="100%">
		<tr  valign=bottom>
			<td><img src="images/inicio/EsquinaInferior.jpg" border="0" width="378" height="392" ></td>
		</tr>
	</table></td>
    <td valign=top>
    <table border="0" cellspacing="0" cellpadding="0" width="100%">
		<tr>
			<td><img src="images/inicio/EsquinaSuperior.jpg" border="0" width="402" height="316" align="right"></td>
		</tr>
	</table></td>
  </tr>
</table>
</body>
</html>
<%if (java.lang.Integer.parseInt(sOportunidades) <= 5){%><script language="JavaScript">document.fLogin.sUsuario.focus();</script><%}%>
