<%/*********************************************************************************************************
Elaboro:	Claudia Sandoval
Lugar:		Monterrey, NL
Fecha:		02.Nov.2002
Compañia:	CONSISS*/%>
<%@page import="java.util.*" %><%

int iIdFuncionarioNvo =  java.lang.Integer.parseInt(
		(String)(session.getValue("iIdFuncionario")!= null?session.getValue("iIdFuncionario"):"0") );
		
int iIdFuncionarioAnt =  java.lang.Integer.parseInt(
		(String)(session.getValue("iIdFuncionarioAnt")!= null?session.getValue("iIdFuncionarioAnt"):"0") );

String	sOpcion = request.getParameter("sOpcion")!= null ? request.getParameter("sOpcion"): "";
String sPath = "../";

com.gob.EntregaEstatus			oEntregaEstatus = new com.gob.EntregaEstatus();
com.gob.Funcionario				oFuncionario 	= new com.gob.Funcionario();
com.gob.AnexoArchivo			oAnexoArchivo 	= new com.gob.AnexoArchivo();
com.consiss.util.Utilerias		oUtil			= new com.consiss.util.Utilerias();
com.consiss.util.Copy			CC				= new com.consiss.util.Copy();
com.consiss.util.tools.VMatrix	vArchivoA		= new com.consiss.util.tools.VMatrix();

if(sOpcion.equals("CIERRE2")){
	// CAMBIAMOS LOS ATTACHMENT DEL ANTERIOR FUNCIONARIO AL NUEVO
	String	sRutaDataWeb 		= com.consiss.db.ConnectionWEB.getDataWeb() + "/Attachment";
	String 	sRutaBaseWeb	= "../Attachment";
	//String	sRutaAccesoFunAnt	= sRutaBase + "/Funcionario" + iIdFuncionarioAnt;
	//String	sRutaAccesoFunNvo	= sRutaBase + "/Funcionario" + iIdFuncionarioNvo;
	String	sRutaDataWFunAnt	= sRutaDataWeb + "/Funcionario" + iIdFuncionarioAnt;
	String	sRutaDataWFunNvo	= sRutaDataWeb + "/Funcionario" + iIdFuncionarioNvo;
	String	sRutaBaseDFunNvo	= "/Attachment/Funcionario" + iIdFuncionarioNvo;
	
	//CC.Copy(sRutaAccesoFunAnt, sRutaAccesoFunNvo);
	CC.Copy(sRutaDataWFunAnt, sRutaDataWFunNvo);
	vArchivoA = oAnexoArchivo.GetAll(iIdFuncionarioAnt);
	for(int i=0;i<vArchivoA.getNumRows();i++){
		String 	sIdAnexo 		= (((Vector)vArchivoA.getVMatrixAll().elementAt(1)).elementAt(i)+"").trim();
		String 	sArchivo 		= (((Vector)vArchivoA.getVMatrixAll().elementAt(4)).elementAt(i)+"").trim();
		//String 	sRutaAcceso2	= sRutaAccesoFunNvo + "/Anexo" + sIdAnexo;
		String 	sRutaAcceso2	= sRutaBaseDFunNvo + "/Anexo" + sIdAnexo;
		String 	sRutaWeb		= sRutaBaseWeb + "/Funcionario" + iIdFuncionarioNvo + "/Anexo" + sIdAnexo + "/";
		
		oAnexoArchivo.Insert(java.lang.Integer.parseInt(sIdAnexo), iIdFuncionarioNvo, sRutaAcceso2, sArchivo, sRutaWeb);
	}
}

if(sOpcion.equals("CIERRE")){
	// PASO AL pHistoricoDetalle9.jsp
	/*
	// INSERTAMOS ESTATUS DE CIERRE A LA ENTREGA ANTERIOR
	oEntregaEstatus.Insert(iIdFuncionarioAnt, oEntregaEstatus.GetEstatusValidadaPorNuevoFuncionario(), oUtil.sGetDate(oUtil.GetFecha(), "yyyyMMddHHmmss"), "Entrega Validada Por Nuevo Funcionario");
	// CAMBIAMOS LOS ANEXOS DE FUNCIONARIO ANTERIOR A NUEVO
	oFuncionario.CambiaFuncionarioAntANvo(iIdFuncionarioAnt, iIdFuncionarioNvo);
	// CAMBIAMOS LOS ATTACHMENT DEL ANTERIOR FUNCIONARIO AL NUEVO
	//String	sRutaBase 		= com.consiss.db.ConnectionWEB.getSourceWeb() + "/Attachment";
	String	sRutaDataWeb 		= com.consiss.db.ConnectionWEB.getDataWeb() + "/Attachment";
	String 	sRutaBaseWeb	= "../Attachment";
	//String	sRutaAccesoFunAnt	= sRutaBase + "/Funcionario" + iIdFuncionarioAnt;
	//String	sRutaAccesoFunNvo	= sRutaBase + "/Funcionario" + iIdFuncionarioNvo;
	String	sRutaDataWFunAnt	= sRutaDataWeb + "/Funcionario" + iIdFuncionarioAnt;
	String	sRutaDataWFunNvo	= sRutaDataWeb + "/Funcionario" + iIdFuncionarioNvo;
	String	sRutaBaseDFunNvo	= "/Attachment/Funcionario" + iIdFuncionarioNvo;
	
	//CC.Copy(sRutaAccesoFunAnt, sRutaAccesoFunNvo);
	CC.Copy(sRutaDataWFunAnt, sRutaDataWFunNvo);
	vArchivoA = oAnexoArchivo.GetAll(iIdFuncionarioAnt);
	for(int i=0;i<vArchivoA.getNumRows();i++){
		String 	sIdAnexo 		= (((Vector)vArchivoA.getVMatrixAll().elementAt(1)).elementAt(i)+"").trim();
		String 	sArchivo 		= (((Vector)vArchivoA.getVMatrixAll().elementAt(4)).elementAt(i)+"").trim();
		//String 	sRutaAcceso2	= sRutaAccesoFunNvo + "/Anexo" + sIdAnexo;
		String 	sRutaAcceso2	= sRutaBaseDFunNvo + "/Anexo" + sIdAnexo;
		String 	sRutaWeb		= sRutaBaseWeb + "/Funcionario" + iIdFuncionarioNvo + "/Anexo" + sIdAnexo + "/";
		
		oAnexoArchivo.Insert(java.lang.Integer.parseInt(sIdAnexo), iIdFuncionarioNvo, sRutaAcceso2, sArchivo, sRutaWeb);
	}
	// CAMBIAMOS ESTATUS DEL FUNCIONARIO
	oFuncionario.Get(iIdFuncionarioNvo);
	oFuncionario.UpdateEstatus(iIdFuncionarioNvo, oFuncionario.GetEstatusActivo(), oFuncionario.GetIdUsuario() );
	// INSERTAMOS ESTATUS DE INICIADA A LA ENTREGA NUEVA
	oEntregaEstatus.Insert(iIdFuncionarioNvo, oEntregaEstatus.GetEstatusNoIniciada(), oUtil.sGetDate(oUtil.GetFecha(), "yyyyMMddHHmmss"), "Reinicia Entrega con Datos Anteriores");
	// ULTIMA FOTO PARA EL FUNCIONARIO NUEVO, PUES ESTE AHORA TIENE LOS ANEXOS Y EL ADENDUM
	
	// CAMBIA EL ESTATUS DE LA SESION DEL ACTUAL FUNCIONARIO
	session.putValue("sEstatusEntrega", oEntregaEstatus.GetEstatusNoIniciada()+"");
     */ %>
	<!--<script>
		document.forma.submit();
	</script>-->
	
	<script language="JavaScript" src="<%=sPath%>Scripts/Libreria.js"></script>
	<script language="JavaScript">
		popBox("Histórico", 550, 280, "pHistorico.jsp?sIdFuncionario=" + <%=iIdFuncionarioAnt%> + "&iProceso=2&sIdFuncionarioNvo=" + <%=iIdFuncionarioNvo%>);
	</script><%
	%>
	<form action="fCierreFinalizado.jsp" name="forma" method="post">
	</form><%
}
%>

<html>
<head>
	<title>Entrega - Recepción : Cierre de Entrega (Procesando...)</title>
</head>

<body>
	<form action="fEsperar.jsp" name="forma2" method="post" target="_parent">
	</form>
	<script>
		document.forma2.submit();
	</script>
</body>
</html>
