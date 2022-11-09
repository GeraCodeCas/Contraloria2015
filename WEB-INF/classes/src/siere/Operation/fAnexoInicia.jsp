<%
String sPath = "../";

// SI ES DE UN FUNCIONARIO ANTERIOR (1)
int iIdFuncionario =  java.lang.Integer.parseInt((String)(session.getValue("iIdFuncionario")!= null?session.getValue("iIdFuncionario"):"0") );
String	sEstatusFuncionario	= (String)(session.getValue("sEstatus")!= null?session.getValue("sEstatus"):"0");
Funcionario oFuncionario = new Funcionario();
if(sEstatusFuncionario.equals(oFuncionario.GetEstatusRevisandoAntFuncionario())){
	int iIdFuncionarioAnt =  java.lang.Integer.parseInt((String)(session.getValue("iIdFuncionarioAnt")!= null?session.getValue("iIdFuncionarioAnt"):"0") );
	iIdFuncionario = iIdFuncionarioAnt;
}

// LECTURA DE LOS ESTATUS (2)
AnexoEstatus	oAnexoEstatus		= new AnexoEstatus();
oAnexoEstatus.Get(iIdFuncionario, iIdAnexo);
String	sEstatus			= oAnexoEstatus.GetEstatus();

// MAS SOLO LECTURA
int		iIdUsuarioLimitadoAnx	= oAnexoEstatus.GetIdUsuarioLimitado();
int		iIdUsuarioLimitadoSes =  java.lang.Integer.parseInt(
		(String)(session.getValue("iIdUsuarioLimitado")!= null?session.getValue("iIdUsuarioLimitado"):"0") );
int		iTipoUsuario		= session.getValue("iTipoUsuario")!=null?java.lang.Integer.parseInt((String)session.getValue("iTipoUsuario")):0;
Usuario oUsuario = new Usuario();

// VERIFICA QUE SEA SOLO LECTURA (3)
boolean bSoloLectura = ( sEstatus.equals(oAnexoEstatus.GetEstatusNoAplica()) || 
						sEstatus.equals(oAnexoEstatus.GetEstatusAutorizado()) ||
/* MAS SOLO LECTURA*/	sEstatusFuncionario.equals(oFuncionario.GetEstatusRevisandoAntFuncionario()) || 
/* MAS SOLO LECTURA*/	(iTipoUsuario == oUsuario.GetTipoRepresentante() || iTipoUsuario == oUsuario.GetTipoEnlace()) ) || 
/* MAS SOLO LECTURA*/	(iTipoUsuario == oUsuario.GetTipoLimitado() && iIdUsuarioLimitadoAnx != iIdUsuarioLimitadoSes);

// MENSAJE POR MAS SOLO LECTURA
String sMensageEstatus = "";
if(iTipoUsuario == oUsuario.GetTipoLimitado() && iIdUsuarioLimitadoAnx != iIdUsuarioLimitadoSes){
	sMensageEstatus = "Este Anexo pertenece al Usuario " + oAnexoEstatus.GetNombre().trim() + "." ;
}
/*if(iTipoUsuario != oUsuario.GetTipoLimitado() && iIdUsuarioLimitadoAnx != iIdUsuarioLimitadoSes){
	sMensageEstatus = "<br>Este Anexo pertenece al Usuario " + oAnexoEstatus.GetNombre().trim() + "." ;
}*/
if( sEstatus.equals(oAnexoEstatus.GetEstatusAutorizado()) ) {
	sMensageEstatus = "Este Anexo ha sido " + oAnexoEstatus.GetEstatusDesc(oAnexoEstatus.GetEstatusAutorizado());
	sMensageEstatus = sMensageEstatus.toUpperCase();
}
if( sEstatusFuncionario.equals(oFuncionario.GetEstatusRevisandoAntFuncionario()) ) {
	sMensageEstatus = "Este Anexo pertenece al Funcionario Anterior, Usted está en Revisión de la Entrega Anterior. " +
						" Si ha terminado la revisión, Por favor Cierre la Entrega-Recepción para que usted comienze su proceso Normal ";
}
if(iTipoUsuario == oUsuario.GetTipoRepresentante() || iTipoUsuario == oUsuario.GetTipoEnlace() ) {
	sMensageEstatus = "Solo puede Consultar la Información de los Anexos.";
}
%>