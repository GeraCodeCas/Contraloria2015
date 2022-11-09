<%
response.setHeader("Cache-Control","no-cache");
response.setHeader("Pragma","no-cache");
response.setDateHeader ("Expires", -1);
 %>
<%@page import="com.consiss.util.*"%>
<%@page import="java.util.*" %>
<%/*********************************************************************************************************
Elaboro:	Claudia Sandoval
Lugar:		Monterrey, NL
Fecha:		02.Nov.2002
Compañia:	CONSISS*/%>
<%
int iIdFuncionario	= java.lang.Integer.parseInt(
		(String)(session.getValue("iIdFuncionario")!= null?session.getValue("iIdFuncionario"):"0") );
int iIdUsuario		= java.lang.Integer.parseInt(
		(String)(session.getValue("iIdUsuario")!= null?session.getValue("iIdUsuario"):"0") );

String	sOpcion = request.getParameter("sOpcion")!= null ? request.getParameter("sOpcion"): "";
String	sCodigo = request.getParameter("sCodigo")!= null ? request.getParameter("sCodigo"): "";

String	sNombreCurso	= request.getParameter("sNombreCurso")!= null ? request.getParameter("sNombreCurso"): "1";
String	sEstatus		= request.getParameter("sEstatus")!= null ? request.getParameter("sEstatus"): "1";
String	sNombreEmpleado	= request.getParameter("sNombreEmpleado")!= null ? request.getParameter("sNombreEmpleado"): "";

com.gob.Anexo3IV6			oAnexo3IV6		= new com.gob.Anexo3IV6();
com.gob.AnexoEstatus		oAnexoEstatus	= new com.gob.AnexoEstatus();
com.consiss.util.Utilerias	oUtil			= new com.consiss.util.Utilerias();

int iIdAnexo = oAnexo3IV6.GetIdAnexo();

// PARA GUARDAR BITACORA, SE LEE USUARIO
Seguridad	oSeguridad;
String sUsuario	= ((session.getValue("sUsuario")!= null?(String)session.getValue("sUsuario"):""));
oSeguridad = new Seguridad();

if(sOpcion.equals("SAVE")){
	// CAMBIO DE ENTREGA DE ESTATUS
	com.gob.EntregaEstatus 	oEntregaEstatus 	= new com.gob.EntregaEstatus();
	String sEstatusEntrega	= ((session.getValue("sEstatusEntrega")!= null?(String)session.getValue("sEstatusEntrega"):""));
	if(sEstatusEntrega.equals(oEntregaEstatus.GetEstatusSinInformacion())) {
		oEntregaEstatus.Insert(iIdFuncionario, oEntregaEstatus.GetEstatusNoIniciada(), oUtil.sGetDate(oUtil.GetFecha(), "yyyyMMddHHmmss"), "Entrega No Iniciada. Inicia Captura Diaria de Información");
		session.putValue("sEstatusEntrega",	oEntregaEstatus.GetEstatusNoIniciada()+"");		}

	if(sCodigo.equals("")){
		oAnexoEstatus.Update(iIdFuncionario, iIdAnexo, sEstatus, iIdUsuario, 
		oUtil.sGetDate(oUtil.GetFecha(), "yyyyMMdd"), "" );
		
		
	} else {
		//sEstatus = sEstatus.equals(oAnexoEstatus.GetEstatusVacio())?oAnexoEstatus.GetEstatusEnProceso():sEstatus;
		if(sCodigo.equals("0")){
		  	int iIdEmpleado = oAnexo3IV6.InsertEmpleado(iIdFuncionario, sNombreEmpleado);
			for(int i=0;i<oAnexo3IV6.GetCursoAll(iIdFuncionario);i++){
				String sHoras = request.getParameter("sHoras"+oAnexo3IV6.GetIdCurso(i))!= null && !(request.getParameter("sHoras"+oAnexo3IV6.GetIdCurso(i))+"").trim().equals("") ? request.getParameter("sHoras"+oAnexo3IV6.GetIdCurso(i)): "0";
				oAnexo3IV6.Insert(oAnexo3IV6.GetIdCurso(i), iIdEmpleado, sHoras);
				// PARA GUARDAR BITACORA
				oSeguridad.Bitacora(sUsuario, "Nuevo", "Anexo III.4.6", request.getRemoteAddr(), request.getRemoteHost(), request.getHeader("User-Agent"));
			}
		} else {
		  	oAnexo3IV6.UpdateEmpleado(java.lang.Integer.parseInt(sCodigo), sNombreEmpleado);
			for(int i=0;i<oAnexo3IV6.GetCursoAll(iIdFuncionario);i++){
				String sHoras = request.getParameter("sHoras"+oAnexo3IV6.GetIdCurso(i))!= null && !(request.getParameter("sHoras"+oAnexo3IV6.GetIdCurso(i))+"").trim().equals("") ? request.getParameter("sHoras"+oAnexo3IV6.GetIdCurso(i)): "0";
				String sIns = request.getParameter("sIns"+oAnexo3IV6.GetIdCurso(i))!= null ? request.getParameter("sIns"+oAnexo3IV6.GetIdCurso(i)): "-1";
				if(sIns.equals("-1")){
					oAnexo3IV6.Insert(oAnexo3IV6.GetIdCurso(i), java.lang.Integer.parseInt(sCodigo), sHoras);
				} else {
					oAnexo3IV6.Update(oAnexo3IV6.GetIdCurso(i), java.lang.Integer.parseInt(sCodigo), sHoras);
				}
				// PARA GUARDAR BITACORA
				oSeguridad.Bitacora(sUsuario, "Grabar", "Anexo III.4.6", request.getRemoteAddr(), request.getRemoteHost(), request.getHeader("User-Agent"));
			}
		}
		oAnexoEstatus.Update(iIdFuncionario, iIdAnexo, sEstatus, iIdUsuario, oUtil.sGetDate(oUtil.GetFecha(), "yyyyMMdd"), "" );
	}
	sCodigo = "";
	sOpcion = "";
}
if(sOpcion.equals("DEL")){
	// PARA GUARDAR BITACORA
	oSeguridad.Bitacora(sUsuario, "Elimina", "Anexo III.4.6", request.getRemoteAddr(), request.getRemoteHost(), request.getHeader("User-Agent"));
	oAnexo3IV6.DeleteEmpleado(java.lang.Integer.parseInt(sCodigo));
	//if(oAnexo3IV6.GetAll(iIdFuncionario)==0) sEstatus = oAnexoEstatus.GetEstatusVacio();
	//oAnexoEstatus.Update(iIdFuncionario, iIdAnexo, sEstatus, iIdUsuario, oUtil.sGetDate(oUtil.GetFecha(), "yyyyMMdd"), "" );
	sCodigo = "";
	sOpcion = "";
}

if(sOpcion.equals("SAVEDETAIL")){
	// CAMBIO DE ENTREGA DE ESTATUS
	com.gob.EntregaEstatus 	oEntregaEstatus 	= new com.gob.EntregaEstatus();
	String sEstatusEntrega	= ((session.getValue("sEstatusEntrega")!= null?(String)session.getValue("sEstatusEntrega"):""));
	if(sEstatusEntrega.equals(oEntregaEstatus.GetEstatusSinInformacion())) {
		oEntregaEstatus.Insert(iIdFuncionario, oEntregaEstatus.GetEstatusNoIniciada(), oUtil.sGetDate(oUtil.GetFecha(), "yyyyMMddHHmmss"), "Entrega No Iniciada. Inicia Captura Diaria de Información");
		session.putValue("sEstatusEntrega",	oEntregaEstatus.GetEstatusNoIniciada()+"");		}

	if(sCodigo.equals("0")){
		int iIdCurso = oAnexo3IV6.InsertCurso(iIdFuncionario, sNombreCurso);
		for(int i=0;i<oAnexo3IV6.GetEmpleadoAll(iIdFuncionario);i++){
		oAnexo3IV6.Insert(iIdCurso, oAnexo3IV6.GetIdEmpleado(i), "0");
		// PARA GUARDAR BITACORA
			oSeguridad.Bitacora(sUsuario, "Nuevo", "Anexo III.4.6", request.getRemoteAddr(), request.getRemoteHost(), request.getHeader("User-Agent"));
		}
	}else{
	  	oAnexo3IV6.UpdateCurso(java.lang.Integer.parseInt(sCodigo), sNombreCurso);
		// PARA GUARDAR BITACORA
		oSeguridad.Bitacora(sUsuario, "Grabar", "Anexo III.4.6", request.getRemoteAddr(), request.getRemoteHost(), request.getHeader("User-Agent"));
	}
	sCodigo = "";
	sOpcion = "";
}

if(sOpcion.equals("DELDETAIL")){
	// PARA GUARDAR BITACORA
	oSeguridad.Bitacora(sUsuario, "Elimina", "Anexo III.4.6 Detalle", request.getRemoteAddr(), request.getRemoteHost(), request.getHeader("User-Agent"));
	oAnexo3IV6.DeleteCurso(java.lang.Integer.parseInt(sCodigo));
	sCodigo = "";
	sOpcion = "";
}

if(sOpcion.equals("NORMAL")){sCodigo = "";}
%>

<html>
<head>
	<title>Entrega - Recepción : Anexo III.4.6 (Procesando...)</title>
</head>

<body>
<form action="fAnexo3IV6.jsp" name="forma" method="post" target="_parent">
	<input type="hidden" name="sOpcion" value="<%=sOpcion%>">
	<input type="hidden" name="sCodigo" value="<%=sCodigo%>"> 
</form>
</body>
<script>
	document.forma.submit();
</script>
</html>