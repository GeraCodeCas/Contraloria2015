<%/*********************************************************************************************************
Elaboro:	Claudia Sandoval
Lugar:		Monterrey, NL
Fecha:		02.Nov.2002
Compañia:	CONSISS*/%><%
int iIdFuncionario	= java.lang.Integer.parseInt(
		(String)(session.getValue("iIdFuncionario")!= null?session.getValue("iIdFuncionario"):"0") );
int iIdUsuario		= java.lang.Integer.parseInt(
		(String)(session.getValue("iIdUsuario")!= null?session.getValue("iIdUsuario"):"0") );
String	sOpcion = request.getParameter("sOpcion")!= null ? request.getParameter("sOpcion"): "";

com.gob.EntregaEstatus		oEntregaEstatus = new com.gob.EntregaEstatus();
com.gob.AnexoEstatus		oAnexoEstatus 	= new com.gob.AnexoEstatus();
com.consiss.util.Utilerias	oUtil			= new com.consiss.util.Utilerias();

if(sOpcion.equals("INICIA")){
	oEntregaEstatus.Insert(iIdFuncionario, oEntregaEstatus.GetEstatusIniciada(), oUtil.sGetDate(oUtil.GetFecha(), "yyyyMMddHHmmss"), "Inicia Entrega de Recepción por Funcionario");
	session.putValue("sEstatusEntrega",	oEntregaEstatus.GetEstatusIniciada()+"");		//sEstatusEntrega
}
%>

<html>
<head>
	<title>Entrega - Recepción : Inicia Entrega (Procesando...)</title>
</head>

<body>
<form action="fIniciaEntrega.jsp" name="forma" method="post" target="_parent">
</form>
</body>
<script>
	document.forma.submit();
</script>
</html>