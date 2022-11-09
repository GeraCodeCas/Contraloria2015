<%
try 
{
	//	String	sIdUsuarioMn			= session.getValue("iIdUsuario")!=null?(String)session.getValue("iIdUsuario"):"";
	int		iIdFuncionarioMn		= session.getValue("iIdFuncionario")!=null?java.lang.Integer.parseInt((String)session.getValue("iIdFuncionario")):0;
	int		iIdUsuarioLimitadoMn	= session.getValue("iIdUsuarioLimitado")!=null?java.lang.Integer.parseInt((String)session.getValue("iIdUsuarioLimitado")):0;
	int		iTipoUsuarioMn			= session.getValue("iTipoUsuario")!=null?java.lang.Integer.parseInt((String)session.getValue("iTipoUsuario")):0;
	String	sEstatusFuncionarioMn	= session.getValue("sEstatus")!= null?(String)session.getValue("sEstatus"):"0";
	
	com.gob.Funcionario oFncMn = new com.gob.Funcionario();
	com.gob.Usuario		oUsrMn = new com.gob.Usuario();
%>
<jsp:useBean id="oAnexoMenu" scope="session" class="com.gob.Anexo"></jsp:useBean>
<script language="JavaScript">
	function irA(sDireccion){
		window.open( sDireccion, "_self" )
	}
	function abrirA(sDireccion){
		window.open( sDireccion )
	}
	function MDentro(oTr, sStatus){
		MouseDentro(oTr);
		window.status=sStatus ;
//		oTr.class = 'OpcionMenuTdOver';
	}
</script>
<table border="0" cellspacing="0" cellpadding="0" width="95%" align="center"><%//=sEstatusFuncionarioMn %>
	<tr>
		<td height="5"></td>
	</tr>
		<td class="TituloMenuGrande" align="center">GENERALES</td> 
	</tr>
	<tr>
		<td class="SubTitulomenuNegro" aling="center" bgcolor="Black" >&nbsp;Ayuda</td> 
	</tr>
	<tr class="OpcionMenuTd" onMouseOver="MouseDentro(this);window.status='Manual de Usuario'" onMouseOut="MouseFuera(this,'#ffffff');" onClick="abrirA('../Help/ManualEntregaRecepcionSistematizado.zip');">
		<td><a class="OpcionMenu"><img border="0" src="<%=sPath%>Images/Vineta.gif">&nbsp;Manual de Usuario</a></td> 
	</tr>
	<tr class="OpcionMenuTd" onMouseOver="MouseDentro(this);window.status='Cargas Masivas'" onMouseOut="MouseFuera(this,'#ffffff');" onClick="ayuda('../Help/aCargaMasiva.htm');">
		<td><a class="OpcionMenu"><img border="0" src="<%=sPath%>Images/Vineta.gif">&nbsp;Cargas Masivas</a></td> 
	</tr>
	<tr class="OpcionMenuTd" onMouseOver="MouseDentro(this);window.status='Procedimiento Entrega Individual'" onMouseOut="MouseFuera(this,'#ffffff');" onClick="abrirA('../Help/EntregaIndividual.doc');">
		<td><a class="OpcionMenu"><img border="0" src="<%=sPath%>Images/Vineta.gif">&nbsp;Procedimiento Entrega Individual</a></td> 
	</tr>
	<tr class="OpcionMenuTd" onMouseOver="MouseDentro(this);window.status='Procedimiento Entrega General'" onMouseOut="MouseFuera(this,'#ffffff');" onClick="abrirA('../Help/EntregaGeneral.doc');">
		<td><a class="OpcionMenu"><img border="0" src="<%=sPath%>Images/Vineta.gif">&nbsp;Procedimiento Entrega General</a></td> 
	</tr>
	<tr><td height="3"></td></tr>
	<tr>
		<td class="SubTitulomenuNegro" aling="center" bgcolor="Black" >&nbsp;Sesión</td> 
	</tr>
	<tr class="OpcionMenuTd" onMouseOver="MDentro(this, 'Cambio de Clave');" onMouseOut="MouseFuera(this,'#ffffff');" onClick="irA('../Operation/fCambiarClave.jsp');">
		<td><a class="OpcionMenu"><img border="0" src="<%=sPath%>Images/Vineta.gif">&nbsp;Cambio de Clave</a></td> 
	</tr>
	<tr class="OpcionMenuTd" onMouseOver="MouseDentro(this);window.status='Salir'" onMouseOut="MouseFuera(this,'#ffffff');" onClick="irA('../Operation/Logout.jsp');">
		<td><a class="OpcionMenu"><img border="0" src="<%=sPath%>Images/Vineta.gif">&nbsp;Salir</a></td> 
	</tr><%if( iTipoUsuarioMn == oUsrMn.GetTipoAdministrador()){%>
	<tr class="OpcionMenuTd" class="OpcionMenuTd" onMouseOver="MouseDentro(this);window.status='Alertas'" onMouseOut="MouseFuera(this,'#ffffff');" onClick="irA('../Operation/fAlerta.jsp');">
		<td><a class="OpcionMenu"><img border="0" src="<%=sPath%>Images/Vineta.gif">&nbsp;Alerta</a></td> 
	</tr><%
		}%>
	<tr><td height="3"></td></tr><%
	if(iTipoUsuarioMn != oUsrMn.GetTipoLimitado() ){%>	
	<tr>
		<td class="SubTitulomenuNegro" aling="center" bgcolor="Black">&nbsp;Administración</td> 
	</tr><%if(iTipoUsuarioMn == oUsrMn.GetTipoAdministrador() || iTipoUsuarioMn == oUsrMn.GetTipoEnlace() || iTipoUsuarioMn == oUsrMn.GetTipoRepresentante() ){%>		
	<tr class="OpcionMenuTd" onMouseOver="MDentro(this,'Selecciona Funcionario');" onMouseOut="MouseFuera(this,'#ffffff');" onClick="irA('../Operation/fSeleFuncionario.jsp');">
		<td><a class="OpcionMenu"><img border="0" src="<%=sPath%>Images/Vineta.gif">&nbsp;Selecciona Funcionario</a></td> 
	</tr><%
		}%><%
		if(iTipoUsuarioMn != oUsrMn.GetTipoFuncionario()){%>
	<tr class="OpcionMenuTd" onMouseOver="MouseDentro(this);window.status='Acta Administrativa'" onMouseOut="MouseFuera(this,'#ffffff');" onClick="irA('../Operation/fActa.jsp');">
		<td><a class="OpcionMenu"><img border="0" src="<%=sPath%>Images/Vineta.gif">&nbsp;Acta Administrativa</a></td> 
	</tr><%
		}
		if((iTipoUsuarioMn == oUsrMn.GetTipoAdministrador() && iIdFuncionarioMn > 0) || 
			iTipoUsuarioMn == oUsrMn.GetTipoFuncionario() ){%>
	<tr class="OpcionMenuTd" onMouseOver="MouseDentro(this);window.status='Asigna Anexos'" onMouseOut="MouseFuera(this,'#ffffff');" onClick="irA('../Operation/fAsignaAnexos.jsp');">
		<td><a class="OpcionMenu"><img border="0" src="<%=sPath%>Images/Vineta.gif">&nbsp;Asigna Anexos</a></td>
	</tr><%
		}	
		if ( (iTipoUsuarioMn == oUsrMn.GetTipoAdministrador() && iIdFuncionarioMn > 0) || 
			(iTipoUsuarioMn == oUsrMn.GetTipoEnlace() && iIdFuncionarioMn > 0) || 
			(iTipoUsuarioMn == oUsrMn.GetTipoRepresentante() && iIdFuncionarioMn > 0) || 
			iTipoUsuarioMn == oUsrMn.GetTipoFuncionario()) { %>
	<tr class="OpcionMenuTd" onMouseOver="MouseDentro(this);window.status='Lista Anexos'" onMouseOut="MouseFuera(this,'#ffffff');" onClick="irA('../Operation/fListaAnexos.jsp');">
		<td><a class="OpcionMenu"><img border="0" src="<%=sPath%>Images/Vineta.gif">&nbsp;Lista Anexos</a></td> 
	</tr><%
		}
	//	if(iTipoUsuarioMn == oUsrMn.GetTipoFuncionario())
	if ( (iTipoUsuarioMn == oUsrMn.GetTipoAdministrador() && iIdFuncionarioMn > 0) || 
			(iTipoUsuarioMn == oUsrMn.GetTipoEnlace() && iIdFuncionarioMn > 0) || 
			(iTipoUsuarioMn == oUsrMn.GetTipoRepresentante() && iIdFuncionarioMn > 0) || 
			iTipoUsuarioMn == oUsrMn.GetTipoFuncionario()) 
	{%>
	<tr class="OpcionMenuTd" onMouseOver="MouseDentro(this);window.status='Adendum'" onMouseOut="MouseFuera(this,'#ffffff');" onClick="irA('../Operation/fAdendum.jsp');">
		<td><a class="OpcionMenu"><img border="0" src="<%=sPath%>Images/Vineta.gif">&nbsp;Adendum</a></td> 
	</tr>
		<%if(iTipoUsuarioMn != oUsrMn.GetTipoRepresentante()){ %>

	<%	if( sEstatusFuncionarioMn.equals(oFncMn.GetEstatusRevisandoAntFuncionario()) ) { %>
	<tr class="OpcionMenuTd" onMouseOver="MouseDentro(this);window.status='Cierre Entrega-Recepción Funcionario Anterior'" onMouseOut="MouseFuera(this,'#ffffff');" onClick="irA('../Operation/fCierreEntrega.jsp');">
		<td><a class="OpcionMenu"><img border="0" src="<%=sPath%>Images/Vineta.gif">&nbsp;Cierre Entrega Anterior</a></td> 
	</tr><%
			} else { %>
	<tr class="OpcionMenuTd" onMouseOver="MouseDentro(this);window.status='Inicia Entrega'" onMouseOut="MouseFuera(this,'#ffffff');" onClick="irA('../Operation/fIniciaEntrega.jsp');">
		<td><a class="OpcionMenu"><img border="0" src="<%=sPath%>Images/Vineta.gif">&nbsp;Inicia Entrega</a></td> 
	</tr><%
			} 
		}

		}%>
	<tr><td height="3"></td></tr><%
	}
	if(iTipoUsuarioMn != oUsrMn.GetTipoLimitado() && iTipoUsuarioMn != oUsrMn.GetTipoFuncionario()){%>	
	<tr>
		<td class="SubTitulomenuNegro" aling="center" bgcolor="Black">&nbsp;Consultas</td> 
	</tr><%
		if( iTipoUsuarioMn != oUsrMn.GetTipoFuncionario() ){%>	
	<tr class="OpcionMenuTd" onMouseOver="MouseDentro(this);window.status='Lista Entregas'" onMouseOut="MouseFuera(this,'#ffffff');" onClick="irA('../Operation/fListaEntregas.jsp');">
		<td><a class="OpcionMenu"><img border="0" src="<%=sPath%>Images/Vineta.gif">&nbsp;Lista Entregas</a></td> 
	</tr>
	<tr class="OpcionMenuTd" onMouseOver="MouseDentro(this);window.status='Avance Anexos(%)'" onMouseOut="MouseFuera(this,'#ffffff');" onClick="irA('../Operation/fAvanceUnidadGobierno.jsp');">
		<td><a class="OpcionMenu"><img border="0" src="<%=sPath%>Images/Vineta.gif">&nbsp;Avance Anexos (%)</a></td> 
	</tr>
	<tr class="OpcionMenuTd" onMouseOver="MouseDentro(this);window.status='Avance Anexos(#)'" onMouseOut="MouseFuera(this,'#ffffff');" onClick="irA('../Operation/fAvanceUnidadGobierno2.jsp');">
		<td><a class="OpcionMenu"><img border="0" src="<%=sPath%>Images/Vineta.gif">&nbsp;Avance Anexos (#)</a></td> 
	</tr>
	<%
		}
		if( iTipoUsuarioMn == oUsrMn.GetTipoAdministrador() || iTipoUsuarioMn == oUsrMn.GetTipoEnlace() || iTipoUsuarioMn == oUsrMn.GetTipoRepresentante() ){%>
	<tr class="OpcionMenuTd" class="OpcionMenuTd" onMouseOver="MouseDentro(this);window.status='Histórico de Entregas'" onMouseOut="MouseFuera(this,'#ffffff');" onClick="irA('../Operation/fHistorico.jsp');">
		<td><a class="OpcionMenu"><img border="0" src="<%=sPath%>Images/Vineta.gif">&nbsp;Hist&oacutericos</a></td> 
	</tr>
		<%}
		if( iTipoUsuarioMn == oUsrMn.GetTipoAdministrador()){%>
	<tr class="OpcionMenuTd" class="OpcionMenuTd" onMouseOver="MouseDentro(this);window.status='Bitácora de Movimientos'" onMouseOut="MouseFuera(this,'#ffffff');" onClick="irA('../Operation/fBitacora.jsp');">
		<td><a class="OpcionMenu"><img border="0" src="<%=sPath%>Images/Vineta.gif">&nbsp;Bit&aacute;cora</a></td> 
	</tr><%
		}%>
	<tr><td height="3"></td></tr><%
	}
	if(iTipoUsuarioMn == oUsrMn.GetTipoAdministrador() || iTipoUsuarioMn == oUsrMn.GetTipoFuncionario()){%>
	<tr>
		<td class="SubTitulomenuNegro" aling="center" bgcolor="Black">&nbsp;Usuarios</td> 
	</tr><%
		if( iTipoUsuarioMn == oUsrMn.GetTipoAdministrador() ){%>
	<tr class="OpcionMenuTd" onMouseOver="MouseDentro(this);window.status='Usuarios Enlaces'" onMouseOut="MouseFuera(this,'#ffffff');" onClick="irA('../Operation/fEnlace.jsp');">
		<td><a class="OpcionMenu"><img border="0" src="<%=sPath%>Images/Vineta.gif">&nbsp;Enlaces</a></td> 
	</tr>
	<tr class="OpcionMenuTd" onMouseOver="MouseDentro(this);window.status='Usuarios Representantes'" onMouseOut="MouseFuera(this,'#ffffff');" onClick="irA('../Operation/fRepresentante.jsp');">
		<td><a class="OpcionMenu"><img border="0" src="<%=sPath%>Images/Vineta.gif">&nbsp;Representantes</a></td> 
	</tr>		
	<tr class="OpcionMenuTd" onMouseOver="MouseDentro(this);window.status='Usuarios Funcionarios'" onMouseOut="MouseFuera(this,'#ffffff');" onClick="irA('../Operation/fFuncionario.jsp');">
		<td><a class="OpcionMenu"><img border="0" src="<%=sPath%>Images/Vineta.gif">&nbsp;Funcionarios</a></td> 
	</tr><%
		} 
		if ( iIdFuncionarioMn > 0) { %>
	<tr class="OpcionMenuTd" onMouseOver="MouseDentro(this);window.status='Usuarios Limitados'" onMouseOut="MouseFuera(this,'#ffffff');" onClick="irA('../Operation/fUsrLimitado.jsp');">
		<td><a class="OpcionMenu"><img border="0" src="<%=sPath%>Images/Vineta.gif">&nbsp;Limitados</a></td> 
	</tr><%
		}
	}
	if(iTipoUsuarioMn == oUsrMn.GetTipoAdministrador()){%>
	<tr><td height="3"></td></tr>
	<tr>
		<td class="SubTitulomenuNegro" aling="center" bgcolor="Black">&nbsp;Catálogos</td> 
	</tr>
	<tr class="OpcionMenuTd" onMouseOver="MouseDentro(this);window.status='Municipios'" onMouseOut="MouseFuera(this,'#ffffff');" onClick="irA('../Operation/fMunicipio.jsp');">
		<td><a class="OpcionMenu"><img border="0" src="<%=sPath%>Images/Vineta.gif">&nbsp;Municipios</a></td> 
	</tr>
	<tr class="OpcionMenuTd" onMouseOver="MouseDentro(this);window.status='Dependencias, Organismos o Tribunales'" onMouseOut="MouseFuera(this,'#ffffff');" onClick="irA('../Operation/fUnidadGobierno.jsp');">
		<td><a class="OpcionMenu"><img border="0" src="<%=sPath%>Images/Vineta.gif">&nbsp;Dependencias, Organismos o Tribunales</a></td> 
	</tr>
	<tr class="OpcionMenuTd" onMouseOver="MouseDentro(this);window.status='Unidades Administrativas'" onMouseOut="MouseFuera(this,'#ffffff');" onClick="irA('../Operation/fUnidadAdministrativa.jsp');">
		<td><a class="OpcionMenu"><img border="0" src="<%=sPath%>Images/Vineta.gif">&nbsp;Unidades Administrativas</a></td> 
	</tr>
	<tr class="OpcionMenuTd" onMouseOver="MouseDentro(this);window.status='Puestos o Cargos'" onMouseOut="MouseFuera(this,'#ffffff');" onClick="irA('../Operation/fCargo.jsp');">
		<td><a class="OpcionMenu"><img border="0" src="<%=sPath%>Images/Vineta.gif">&nbsp;Puestos o Cargos</a></td> 
	</tr><%	
	}%>
	<tr><td height="3"></td></tr><%
	if( iIdFuncionarioMn > 0 ){	%>	
	<tr>
		<td class="TituloMenuGrande" align="center">ANEXOS</td> 
	</tr><%
		int iOpciones = 0;
		boolean bSeccion1 = true, bSeccion2 = true, bSeccion3 = true;
		if (iTipoUsuarioMn == oUsrMn.GetTipoLimitado() ) { 
			iOpciones = oAnexoMenu.GetAll( iIdUsuarioLimitadoMn ).getNumRows();
		} else {
			iOpciones = oAnexoMenu.GetAll().getNumRows();
		}
		for(int i=0;i<iOpciones;i++){
			if(oAnexoMenu.GetIdAnexo(i) <= 2 && bSeccion1 ) {%>
	<tr>
		<td class="SubTitulomenuNegro" align="left" bgcolor="Black">&nbsp;Jur&iacute;dicos</td> 
	</tr><%		bSeccion1 = false;
			}
			if(oAnexoMenu.GetIdAnexo(i) >= 3 && oAnexoMenu.GetIdAnexo(i) <= 12 && bSeccion2 ) {%>
	<tr>
		<td class="SubTitulomenuNegro" align="left" bgcolor="Black">&nbsp;Presupuestales<br>&nbsp;Y Financieros</td> 
	</tr><%		bSeccion2 = false;
			}
			if(oAnexoMenu.GetIdAnexo(i) >= 13 && bSeccion3 ) {%>
	<tr>
		<td class="SubTitulomenuNegro" align="left" bgcolor="Black">&nbsp;Operativos</td> 
	</tr><%		bSeccion3 = false;
			}%>
	<tr class="OpcionMenuTd" onMouseOver = "MouseDentro(this);window.status = '<%=oAnexoMenu.GetNombre(i)%>'" onMouseOut  = "MouseFuera(this,'#ffffff');" onClick="irA('../Operation/f<%=oAnexoMenu.GetNombreCorto(i)%>.jsp');">
		<td><a class="OpcionMenu"><img alt="<%=oAnexoMenu.GetNombre(i)%>" border="0" src="<%=sPath%>Images/Vineta.gif">&nbsp;<%=oAnexoMenu.GetClave(i)%></a></td> 
	</tr><%
		}
	}%>
	<tr>
		<td class="TextoOculto" align="left">...........................................</td> 
	</tr>
</table><%
} catch(Throwable e){
	System.out.println("Error en Menu.jsp " + e );
}%>