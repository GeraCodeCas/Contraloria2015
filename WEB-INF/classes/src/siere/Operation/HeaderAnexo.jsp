<%/*********************************************************************************************************
Elaboro:	Claudia Sandoval
Lugar:		Monterrey, NL
Fecha:		02.Nov.02
Compañia:	CONSISS*/%>
<%@page import="com.consiss.util.tools.*"%>
<%@page import="com.consiss.util.*"%>
<%@page import="com.gob.*"%>
<%@page import="java.util.*" %>
<%
response.setHeader("Cache-Control","no-cache");
response.setHeader("Pragma","no-cache");
response.setDateHeader ("Expires", -1);
try {
Funcionario				oHFuncionario			= new Funcionario();
Cargo					oHCargo					= new Cargo();
UnidadAdministrativa 	oHUnidadAdministrativa	= new UnidadAdministrativa();
UnidadGobierno		 	oHUnidadGobierno		= new UnidadGobierno();
Utilerias				oHUtil					= new Utilerias();
numpag = 1 + numpag;
numtot = numtot + 1;
	
String sFecha = "AL " + oHUtil.sGetDate(oHUtil.GetFecha(), "dd") + " DE " + 
				oHUtil.GetMesLargo(java.lang.Integer.parseInt(oHUtil.sGetDate(oHUtil.GetFecha(), "MM"))) +
				" DE " + oHUtil.sGetDate(oHUtil.GetFecha(), "yyyy") ;
				
oHFuncionario.Get(iIdFuncionario);
int hIdCargo = oHFuncionario.GetIdCargo();

oHCargo.Get(hIdCargo);
int hIdUnidadAdministrativa = oHCargo.GetIdUnidadAdministrativa();
oHUnidadAdministrativa.Get(hIdUnidadAdministrativa);
String hsNombreUA = oHUnidadAdministrativa.GetNombre();
String hsClave = oHUnidadAdministrativa.GetClave();
int hIdUnidadGobierno = oHUnidadAdministrativa.GetIdUnidadGobierno();
oHUnidadGobierno.Get(hIdUnidadGobierno);
String hsNombreUG = oHUnidadGobierno.GetNombre();
%>
<TABLE border="0" cellpadding="0" cellspacing="0" width="900" bordercolor="#000000">
	<TR>
		<TD width="100%" colspan="2">
			<TABLE border="0" cellpadding="0" cellspacing="0" width="100%">
				<TR>
					<TD><img name="gob" id="gob" height="123.4px" src="..\images\EscudoDelEstado.jpg"></TD>
					<TD align="center">
						<br><font class="AnexosTitulo">Gobierno del Estado de Nuevo Le&oacute;n<br>
						<%=hsNombreUG%><br>&nbsp;</font></TD>
					<TD align="right">
					<%=oHUnidadGobierno.GetImagen()!=null?("<img name='logoUnidad' id='logoUnidad' height='90px' src='"+oHUnidadGobierno.GetImagen()+"'>"):""%>
					</TD>
				</TR>
			</TABLE>
		</TD>
	</TR>
	<TR>
		<TD align="right" colspan="2">ANEXO <%=sAnexo%></TD>
	</TR>
	<TR>
		<TD>
			<TABLE border="1" cellpadding="2" cellspacing="0" width="100%" bordercolor="#000000">
				<TR>
					<TD width="178px" class="AnexosImpr">NOMBRE DE LA DEPENDENCIA, ORGANISMO PARAESTATAL O TRIBUNAL ADMINISTRATIVO</TD>
					<TD width="522px" class="AnexosImpr" valign="top">&nbsp;<%=hsNombreUG%></TD>
					<TD width="200px" rowspan="3" class="AnexosImpr" >
						&nbsp;HOJA No. <%=numpag%> de <input size="4" type="text" id="TotalPaginas" name="TotalPaginas" style="border:0" class="AnexosImpr" value=""> <br>&nbsp;<%=sFecha.toUpperCase()%>
					</td>
				</TR>
				<TR>
					<TD class="AnexosImpr">UNIDAD ADMINISTRATIVA</TD>
					<TD class="AnexosImpr">&nbsp;<%=hsNombreUA%></TD>
				</TR>
				<TR>
					<TD class="AnexosImpr">CLAVE</TD>
					<TD class="AnexosImpr">&nbsp;<%=hsClave%></TD>
				</TR>
			</TABLE>		
		</TD>
	</TR>
</TABLE>
<%
oHFuncionario			= null;
oHCargo					= null;
oHUnidadAdministrativa	= null;
oHUnidadGobierno		= null;
oHUtil					= null;

} catch(Throwable e){
	out.println("Error en HeaderAnexo.jsp " + e );
}
 %>

