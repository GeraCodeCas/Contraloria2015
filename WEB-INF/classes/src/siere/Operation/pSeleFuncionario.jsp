<%/*********************************************************************************************************
Elaboro:	Claudia V. Sandoval Pardo
Lugar:		Monterrey, NL
Fecha:		24.Oct.2002
Compañia:	CONSISS*/%>
<html>
<head>
<%

String	sOpcion = request.getParameter("sOpcion")!= null ? request.getParameter("sOpcion"): "";
int		iIdUnidadAdministrativa = java.lang.Integer.parseInt( request.getParameter("iIdUnidadAdministrativa")!= null ? (String)request.getParameter("iIdUnidadAdministrativa") : "0" );
int		iIdUnidadGobierno		= java.lang.Integer.parseInt( request.getParameter("iIdUnidadGobierno")!= null ? (String)request.getParameter("iIdUnidadGobierno") : "0" );
//out.println( "iUA:" + iIdUnidadAdministrativa );

int		iIdFuncionario;
com.gob.Funcionario			oFuncionario = new com.gob.Funcionario();

if(sOpcion.equals("")){
	
}

if(sOpcion.equals("SELE")){
	iIdFuncionario = java.lang.Integer.parseInt(request.getParameter("sIdFuncionario")!= null ? request.getParameter("sIdFuncionario"): "0" );
	
	if(iIdFuncionario>0){
		oFuncionario.Get(iIdFuncionario);
		session.putValue("iIdFuncionario",			iIdFuncionario+"");	//Id de Funcionario
		session.putValue("iIdUnidadAdministrativa",	oFuncionario.GetIdUnidadAdministrativa()+"" );				//sUsuario
		session.putValue("sNombreFuncionario",		oFuncionario.GetNombre() + " " + oFuncionario.GetApePaterno() + " " + oFuncionario.GetApeMaterno() );				//sUsuario
		session.putValue("iIdFuncionarioAnt",		oFuncionario.GetIdFuncionarioAnt()+"");	//Id de FuncionarioAnt
		//com.gob.EntregaEstatus oEntregaEstatus = new com.gob.EntregaEstatus();
		//oEntregaEstatus.Get(iIdFuncionario);
		//session.putValue("sEstatusEntrega",			oEntregaEstatus.GetEstatus()+"");	
		session.putValue("sEstatus",			oFuncionario.GetEstatus()+"");			//sEstatus
		session.putValue("sUnidadGobierno", oFuncionario.GetUnidadGobierno()+"");	//Nombre Unidad Gobierno
	} else {
		session.putValue("iIdFuncionario",			"0");	//Id de Funcionario
		session.putValue("iIdUnidadAdministrativa",	"0" );				//sUsuario
		session.putValue("sNombreFuncionario",		"" );				//sUsuario
		session.putValue("iIdFuncionarioAnt",		"0");
		session.putValue("sEstatusEntrega",			"0");
	}
}%>
	<title>Entrega - Recepción : Selecciona Funcionario (Procesando...)</title>
</head>

<body>
<form action="fSeleFuncionario.jsp" name="forma" method="post" target="_parent">
	<input type="hidden" name="iIdUnidadGobierno" value="<%=iIdUnidadGobierno%>">
	<input type="hidden" name="iIdUnidadAdministrativa" value="<%=iIdUnidadAdministrativa%>">
	<input type="hidden" name="sOpcion" value="<%=sOpcion%>">
</form>
</body>
<script language="JavaScript">
	document.forma.submit();
</script>
</html>
