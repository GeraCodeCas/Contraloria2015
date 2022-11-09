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
%><jsp:useBean id="oVMAlertas" class="com.consiss.util.tools.VMatrix" scope="application"/><%
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
<TABLE border="0" cellpadding="0" cellspacing="0" width="100%" bordercolor="#000000">
	<TR>
		<TD width="100%" colspan="2">
			<TABLE border="0" cellpadding="0" cellspacing="0" width="100%">
				<TR>
					<TD><img name="gob" id="gob" height="123.4px" src="..\images\EscudoDelEstado.jpg""></TD>
					<TD align="center" class="AnexosTitulo">
						<br><font style="font-family:Arial;font-size:14px;font-weight:Bold;">Gobierno del Estado de Nuevo León<br>
						<%=hsNombreUG%><br>&nbsp;</font></TD>
					<TD>
					<%=oHUnidadGobierno.GetImagen()!=null?("<img name='logoUnidad' id='logoUnidad' height='55px' src='"+oHUnidadGobierno.GetImagen()+"'>"):""%>
					</TD>
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

