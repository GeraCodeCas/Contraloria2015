<%/*********************************************************************************************************
Elaboro:	Claudia V. Sandoval Pardo
Lugar:		Monterrey, NL
Fecha:		28.May.2003
Compañia:	CONSISS*/%><%
try 
{
	int		iTipoUsuarioMn			= session.getValue("iTipoUsuario")!=null?java.lang.Integer.parseInt((String)session.getValue("iTipoUsuario")):0;
	com.gob.Usuario		oUsrMn = new com.gob.Usuario();
%>
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
	<tr class="OpcionMenuTd" onMouseOver="MouseDentro(this);window.status='Manual de Usuario'" onMouseOut="MouseFuera(this,'#ffffff');" onClick="ayuda('../Help/aCargaMasivaRH.htm');">
		<td><a class="OpcionMenu"><img border="0" src="<%=sPath%>Images/Vineta.gif">&nbsp;Cargas Masivas</a></td> 
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
	</tr>
	<tr><td height="3"></td></tr>	
	<tr>
		<td class="SubTitulomenuNegro" aling="center" bgcolor="Black">&nbsp;Administración</td>
	</tr>
	<tr class="OpcionMenuTd" onMouseOver="MouseDentro(this);window.status='Unidades Administrativas'" onMouseOut="MouseFuera(this,'#ffffff');" onClick="irA('../LoadsRH/fUnidadAdministrativaRH.jsp');">
		<td><a class="OpcionMenu"><img border="0" src="<%=sPath%>Images/Vineta.gif">&nbsp;Lista de U. Administrativas</a></td> 
	</tr><%
	if(iTipoUsuarioMn == oUsrMn.GetTipoAdmonRH() ){%>

	<tr class="OpcionMenuTd" onMouseOver="MouseDentro(this);window.status='Usuarios'" onMouseOut="MouseFuera(this,'#ffffff');" onClick="irA('../LoadsRH/fUsuarioRH.jsp');">
		<td><a class="OpcionMenu"><img border="0" src="<%=sPath%>Images/Vineta.gif">&nbsp;Usuarios</a></td>
	</tr>
	<tr class="OpcionMenuTd" onMouseOver="MouseDentro(this);window.status='Tipo de Nómina'" onMouseOut="MouseFuera(this,'#ffffff');" onClick="irA('../LoadsRH/fTipoNomina.jsp');">
		<td><a class="OpcionMenu"><img border="0" src="<%=sPath%>Images/Vineta.gif">&nbsp;Tipo Nómina</a></td>
	</tr>
	<tr class="OpcionMenuTd" onMouseOver="MouseDentro(this);window.status='Observaciones'" onMouseOut="MouseFuera(this,'#ffffff');" onClick="irA('../LoadsRH/fObservacionesRH.jsp');">
		<td><a class="OpcionMenu"><img border="0" src="<%=sPath%>Images/Vineta.gif">&nbsp;Observaciones</a></td> 
	</tr>
	<tr><td height="3"></td></tr><%
	}
	if(iTipoUsuarioMn == oUsrMn.GetTipoRH()){%>
	<tr>
		<td class="SubTitulomenuNegro" aling="center" bgcolor="Black">&nbsp;Anexos</td>
	</tr>
	<tr class="OpcionMenuTd" onMouseOver="MouseDentro(this);window.status='Usuarios Enlaces'" onMouseOut="MouseFuera(this,'#ffffff');" onClick="irA('../LoadsRH/fLimpiar.jsp');">
		<td><a class="OpcionMenu"><img border="0" src="<%=sPath%>Images/Vineta.gif">&nbsp;Limpiar</a></td> 
	</tr>
	<tr class="OpcionMenuTd" onMouseOver="MouseDentro(this);window.status='Usuarios Representantes'" onMouseOut="MouseFuera(this,'#ffffff');" onClick="irA('../LoadsRH/fCarga.jsp');">
		<td><a class="OpcionMenu"><img border="0" src="<%=sPath%>Images/Vineta.gif">&nbsp;Cargar</a></td> 
	</tr>
	<tr>
		<td class="SubTitulomenuNegro" aling="center" bgcolor="Black">&nbsp;Consulta</td>
	</tr>
	<tr class="OpcionMenuTd" onMouseOver="MouseDentro(this);window.status='Anexo III.4.1'" onMouseOut="MouseFuera(this,'#ffffff');" onClick="irA('../LoadsRH/fAnexo3IV1RH.jsp');">
		<td><a class="OpcionMenu"><img border="0" src="<%=sPath%>Images/Vineta.gif">&nbsp;Anexo III.4.1</a></td>
	</tr>
	<tr class="OpcionMenuTd" onMouseOver="MouseDentro(this);window.status='Anexo III.4.2'" onMouseOut="MouseFuera(this,'#ffffff');" onClick="irA('../LoadsRH/fAnexo3IV2RH.jsp');">
		<td><a class="OpcionMenu"><img border="0" src="<%=sPath%>Images/Vineta.gif">&nbsp;Anexo III.4.2</a></td>
	</tr>
	<tr class="OpcionMenuTd" onMouseOver="MouseDentro(this);window.status='Anexo III.4.5'" onMouseOut="MouseFuera(this,'#ffffff');" onClick="irA('../LoadsRH/fAnexo3IV5RH.jsp');">
		<td><a class="OpcionMenu"><img border="0" src="<%=sPath%>Images/Vineta.gif">&nbsp;Anexo III.4.5</a></td>
	</tr>	
	<tr>
		<td class="SubTitulomenuNegro" aling="center" bgcolor="Black">&nbsp;Ultimos Errores</td>
	</tr>
	<tr class="OpcionMenuTd" onMouseOver="MouseDentro(this);window.status='Errores de Anexo III.4.1'" onMouseOut="MouseFuera(this,'#ffffff');" onClick="irA('../LoadsRH/fErrAnexo3IV1RH.jsp');">
		<td><a class="OpcionMenu"><img border="0" src="<%=sPath%>Images/Vineta.gif">&nbsp;Anexo III.4.1</a></td>
	</tr>
	<tr class="OpcionMenuTd" onMouseOver="MouseDentro(this);window.status='Errores de Anexo III.4.2'" onMouseOut="MouseFuera(this,'#ffffff');" onClick="irA('../LoadsRH/fErrAnexo3IV2RH.jsp');">
		<td><a class="OpcionMenu"><img border="0" src="<%=sPath%>Images/Vineta.gif">&nbsp;Anexo III.4.2</a></td>
	</tr>
	<tr class="OpcionMenuTd" onMouseOver="MouseDentro(this);window.status='Errores de Anexo III.4.5'" onMouseOut="MouseFuera(this,'#ffffff');" onClick="irA('../LoadsRH/fErrAnexo3IV5RH.jsp');">
		<td><a class="OpcionMenu"><img border="0" src="<%=sPath%>Images/Vineta.gif">&nbsp;Anexo III.4.5</a></td>
	</tr><%
	}
%>	<tr>
		<td class="TextoOculto" align="left">...........................................</td> 
	</tr>
</table><%
} catch(Throwable e){
	System.out.println("Error en Menu.jsp " + e );
}%>