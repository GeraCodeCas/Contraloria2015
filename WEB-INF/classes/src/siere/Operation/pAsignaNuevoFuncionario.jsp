<%/*********************************************************************************************************
Elaboro:	Claudia V. Sandoval Pardo
Lugar:		Monterrey, NL
Fecha:		01.Nov.2002
Compañia:	CONSISS*/%>
<html>
<head>
	<title>Entrega - Recepción : Asigna Nuevo Funcionario (Procesando...)</title>
</head>

<body>
<%
String sOpcion = request.getParameter("sOpcion")!= null ? request.getParameter("sOpcion"): "";
int iIdUnidadGobierno = java.lang.Integer.parseInt(
					(String)(request.getParameter("iIdUnidadGobierno")!= null?request.getParameter("iIdUnidadGobierno"):"-1") );
					
int iIdFuncionarioAnt = java.lang.Integer.parseInt(
					(String)(request.getParameter("iIdFuncionarioAnt")!= null?request.getParameter("iIdFuncionarioAnt"):"-1") );
int iIdFuncionario = java.lang.Integer.parseInt(
					(String)(request.getParameter("iIdFuncionario")!= null?request.getParameter("iIdFuncionario"):"-1") );


com.gob.EntregaEstatus		oEntregaEstatus = new com.gob.EntregaEstatus();
com.gob.Funcionario			oFuncionario 	= new com.gob.Funcionario();
com.consiss.util.Utilerias	oUtil			= new com.consiss.util.Utilerias();

if(sOpcion.equals("SELECCIONA")){
	//TOMA LA ENTREGA DEL FUNCIONARIO ANTERIOR Y CAMBIA EL ESTATUS A ASIGNADA
	oEntregaEstatus.Insert(iIdFuncionarioAnt, oEntregaEstatus.GetEstatusAsignadaANuevoFuncionario(), oUtil.sGetDate(oUtil.GetFecha(), "yyyyMMddHHmmss"), "Asignada A Nuevo Funcionario");
	
	// INDICA QUE LA ENTREGA DEL NUEVO FUNCIONARIO SERA INICIALICIADA CON LA ENTREGA ANTERIOR 
	// DESPUES DE LA REVISION QUE EL NUEVO FUNCIONARIO HAGA
	oEntregaEstatus.Insert(iIdFuncionario, oEntregaEstatus.GetEstatusValidandoEntregaAnterior(), oUtil.sGetDate(oUtil.GetFecha(), "yyyyMMddHHmmss"), "Validando Entrega de Funcionario Anterior");
	// CAMBIA EL ESTATUS DEL NUEVO FUNCIONARIO A SOLO REVISION
	oFuncionario.UpdateFuncionarioAnt(iIdFuncionario, iIdFuncionarioAnt);
}
%>

<form action="fListaEntregas.jsp" name="forma" method="post">
	<input type="hidden" name="iIdUnidadGobierno" value="<%=iIdUnidadGobierno%>">
</form>
</body>
<script>
	document.forma.submit();
</script>
</html>
