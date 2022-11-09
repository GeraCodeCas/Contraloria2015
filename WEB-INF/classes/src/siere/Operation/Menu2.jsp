<%
try 
{
String sPath = "";
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
		//document.location.href= sDireccion;
		window.open( sDireccion, "_self" )
	}
</script>
<table border="0" cellspacing="0" cellpadding="0" width="95%" align="center">
	<tr>
		<td height="5"></td>
	</tr>
		<td class="TituloMenuGrande" align="center">GENERALES</td> 
	</tr>
	<tr>
		<td class="SubTitulomenuNegro" aling="center" bgcolor="Black" >&nbsp;Sesión</td> 
	</tr>
<%if(iTipoUsuarioMn == oUsrMn.GetTipoAdministrador() || iTipoUsuarioMn == oUsrMn.GetTipoEnlace() || iTipoUsuarioMn == oUsrMn.GetTipoRepresentante() ){%>		
	<tr onMouseOver="MouseDentro(this);window.status='Selecciona Funcionario'" onMouseOut="MouseFuera(this,'#ffffff');" onClick="irA('fSeleFuncionario.jsp');">
		<td><a class="OpcionMenu"><img border="0" src="<%=sPath%>Images/Vineta.gif">&nbsp;Selecciona Funcionario</a></td> 
	</tr>
<%}%>	
	<tr onMouseOver="MouseDentro(this);window.status='Cambio de Clave'" onMouseOut="MouseFuera(this,'#ffffff');" onClick="irA('fCambiarClave.jsp');">
		<td><a class="OpcionMenu"><img border="0" src="<%=sPath%>Images/Vineta.gif">&nbsp;Cambio de Clave</a></td> 
	</tr>
	<tr onMouseOver="MouseDentro(this);window.status='Salir'" onMouseOut="MouseFuera(this,'#ffffff');" onClick="irA('Logout.jsp');">
		<td><a class="OpcionMenu"><img border="0" src="<%=sPath%>Images/Vineta.gif">&nbsp;Salir</a></td> 
	</tr>
	<tr><td height="3"></td></tr><%
	if(iTipoUsuarioMn != oUsrMn.GetTipoLimitado() ){%>	
	<tr>
		<td class="SubTitulomenuNegro" aling="center" bgcolor="Black">&nbsp;Administración</td> 
	</tr><%
		if(iTipoUsuarioMn != oUsrMn.GetTipoFuncionario()){%>
	<tr onMouseOver="MouseDentro(this);window.status='Acta Administrativa'" onMouseOut="MouseFuera(this,'#ffffff');" onClick="irA('fActa.jsp');">
		<td><a class="OpcionMenu"><img border="0" src="<%=sPath%>Images/Vineta.gif">&nbsp;Acta Administrativa</a></td> 
	</tr><%
		}
		if((iTipoUsuarioMn == oUsrMn.GetTipoAdministrador() && iIdFuncionarioMn > 0) || 
			iTipoUsuarioMn == oUsrMn.GetTipoFuncionario() ){%>
	<tr onMouseOver="MouseDentro(this);window.status='Asigna Anexos'" onMouseOut="MouseFuera(this,'#ffffff');" onClick="irA('fAsignaAnexos.jsp');">
		<td><a class="OpcionMenu"><img border="0" src="<%=sPath%>Images/Vineta.gif">&nbsp;Asigna Anexos</a></td> 
	</tr><%
			if( sEstatusFuncionarioMn.equals(oFncMn.GetEstatusRevisandoAntFuncionario()) ) { %>
	<tr onMouseOver="MouseDentro(this);window.status='Adendum'" onMouseOut="MouseFuera(this,'#ffffff');" onClick="irA('fAdendum.jsp');">
		<td><a class="OpcionMenu"><img border="0" src="<%=sPath%>Images/Vineta.gif">&nbsp;Adendum</a></td> 
	</tr>
	<tr onMouseOver="MouseDentro(this);window.status='Cierre Entrega-Recepción Funcionario Anterior'" onMouseOut="MouseFuera(this,'#ffffff');" onClick="irA('fCierreEntrega.jsp');">
		<td><a class="OpcionMenu"><img border="0" src="<%=sPath%>Images/Vineta.gif">&nbsp;Cierre Entrega Anterior</a></td> 
	</tr><%
			} else { %>
	<tr onMouseOver="MouseDentro(this);window.status='Inicia Entrega'" onMouseOut="MouseFuera(this,'#ffffff');" onClick="irA('fIniciaEntrega.jsp');">
		<td><a class="OpcionMenu"><img border="0" src="<%=sPath%>Images/Vineta.gif">&nbsp;Inicia Entrega</a></td> 
	</tr><%
			} 
		}%>
	<tr><td height="3"></td></tr><%
	}
	if(iTipoUsuarioMn != oUsrMn.GetTipoLimitado()){%>	
	<tr>
		<td class="SubTitulomenuNegro" aling="center" bgcolor="Black">&nbsp;Consultas</td> 
	</tr><%
		if ( iIdFuncionarioMn > 0) { %>
	<tr onMouseOver="MouseDentro(this);window.status='Lista Anexos'" onMouseOut="MouseFuera(this,'#ffffff');" onClick="irA('fListaAnexos.jsp');">
		<td><a class="OpcionMenu"><img border="0" src="<%=sPath%>Images/Vineta.gif">&nbsp;Lista Anexos</a></td> 
	</tr><%
		}
		if( iTipoUsuarioMn != oUsrMn.GetTipoFuncionario() ){%>	
	<tr onMouseOver="MouseDentro(this);window.status='Lista Entregas'" onMouseOut="MouseFuera(this,'#ffffff');" onClick="irA('fListaEntregas.jsp');">
		<td><a class="OpcionMenu"><img border="0" src="<%=sPath%>Images/Vineta.gif">&nbsp;Lista Entregas</a></td> 
	</tr>
	<tr onMouseOver="MouseDentro(this);window.status='Avance Anexos'" onMouseOut="MouseFuera(this,'#ffffff');" onClick="irA('fAvanceUnidadGobierno.jsp');">
		<td><a class="OpcionMenu"><img border="0" src="<%=sPath%>Images/Vineta.gif">&nbsp;Avance Anexos</a></td> 
	</tr><%
		}%>
	<tr><td height="3"></td></tr><%
	}
	if(iTipoUsuarioMn == oUsrMn.GetTipoAdministrador() || iTipoUsuarioMn == oUsrMn.GetTipoFuncionario()){%>
	<tr>
		<td class="SubTitulomenuNegro" aling="center" bgcolor="Black">&nbsp;Usuarios</td> 
	</tr><%
		if( iTipoUsuarioMn == oUsrMn.GetTipoAdministrador() ){%>
	<tr onMouseOver="MouseDentro(this);window.status='Usuarios Funcionarios'" onMouseOut="MouseFuera(this,'#ffffff');" onClick="irA('fFuncionario.jsp');">
		<td><a class="OpcionMenu"><img border="0" src="<%=sPath%>Images/Vineta.gif">&nbsp;Funcionarios</a></td> 
	</tr>
	<tr onMouseOver="MouseDentro(this);window.status='Usuarios Enlaces'" onMouseOut="MouseFuera(this,'#ffffff');" onClick="irA('fEnlace.jsp');">
		<td><a class="OpcionMenu"><img border="0" src="<%=sPath%>Images/Vineta.gif">&nbsp;Enlaces</a></td> 
	</tr>
	<tr onMouseOver="MouseDentro(this);window.status='Usuarios Representantes'" onMouseOut="MouseFuera(this,'#ffffff');" onClick="irA('fRepresentante.jsp');">
		<td><a class="OpcionMenu"><img border="0" src="<%=sPath%>Images/Vineta.gif">&nbsp;Representantes</a></td> 
	</tr><%
		} 
		if ( iIdFuncionarioMn > 0) { %>%>
	<tr onMouseOver="MouseDentro(this);window.status='Usuarios Limitados'" onMouseOut="MouseFuera(this,'#ffffff');" onClick="irA('fUsrLimitado.jsp');">
		<td><a class="OpcionMenu"><img border="0" src="<%=sPath%>Images/Vineta.gif">&nbsp;Limitados</a></td> 
	</tr><%
		}
	}
	if(iTipoUsuarioMn == oUsrMn.GetTipoAdministrador()){%>
	<tr><td height="3"></td></tr>
	<tr>
		<td class="SubTitulomenuNegro" aling="center" bgcolor="Black">&nbsp;Catálogos</td> 
	</tr>
	<tr onMouseOver="MouseDentro(this);window.status='Municipios'" onMouseOut="MouseFuera(this,'#ffffff');" onClick="irA('fMunicipio.jsp');">
		<td><a class="OpcionMenu"><img border="0" src="<%=sPath%>Images/Vineta.gif">&nbsp;Municipios</a></td> 
	</tr>
	<tr onMouseOver="MouseDentro(this);window.status='Dependencias, Organismos o Tribunales'" onMouseOut="MouseFuera(this,'#ffffff');" onClick="irA('fUnidadGobierno.jsp');">
		<td><a class="OpcionMenu"><img border="0" src="<%=sPath%>Images/Vineta.gif">&nbsp;Dependencias, Organismos o Tribunales</a></td> 
	</tr>
	<tr onMouseOver="MouseDentro(this);window.status='Unidades Administrativas'" onMouseOut="MouseFuera(this,'#ffffff');" onClick="irA('fUnidadAdministrativa.jsp');">
		<td><a class="OpcionMenu"><img border="0" src="<%=sPath%>Images/Vineta.gif">&nbsp;Unidades Administrativas</a></td> 
	</tr>
	<tr onMouseOver="MouseDentro(this);window.status='Puestos o Cargos'" onMouseOut="MouseFuera(this,'#ffffff');" onClick="irA('fCargo.jsp');">
		<td><a class="OpcionMenu"><img border="0" src="<%=sPath%>Images/Vineta.gif">&nbsp;Puestos o Cargos</a></td> 
	</tr><%	
	}%>
	<tr><td height="3"></td></tr><%
	if( iIdFuncionarioMn > 0 ){	%>	
	<tr>
		<td class="TituloMenuGrande" align="center">ANEXOS</td> 
	</tr><%
		boolean bSeccion1 = true, bSeccion2 = true, bSeccion3 = true;
		if (iTipoUsuarioMn == oUsrMn.GetTipoLimitado() ) { 
			oAnexoMenu.GetAll( iIdUsuarioLimitadoMn );
		} else {
			oAnexoMenu.GetAll();
		}
		for(int i=0;i<oAnexoMenu.GetAll().getNumRows();i++){
			if(oAnexoMenu.GetIdAnexo(i) <= 1 && bSeccion1 ) {%>
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
	<tr onMouseOver = "MouseDentro(this);window.status = '<%=oAnexoMenu.GetNombre(i)%>'" onMouseOut  = "MouseFuera(this,'#ffffff');" onClick="irA('f<%=oAnexoMenu.GetNombreCorto(i)%>.jsp');">
		<td><a class="OpcionMenu"><img alt="<%=oAnexoMenu.GetNombre(i)%>" border="0" src="<%=sPath%>Images/Vineta.gif">&nbsp;<%=oAnexoMenu.GetClave(i)%></a></td> 
	</tr><%
		}
	}%>
</table><%
} catch(Throwable e){
	System.out.println("Error en Menu.jsp " + e );
}%>