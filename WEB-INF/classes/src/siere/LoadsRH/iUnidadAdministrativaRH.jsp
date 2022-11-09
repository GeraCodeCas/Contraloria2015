<%/*********************************************************************************************************
Elaboro:	Claudia V. Sandoval Pardo
Lugar:		Monterrey, NL
Fecha:		28.Oct.2002
Compañia:	CONSISS*/%>
<%@page import="com.consiss.util.tools.*"%>
<%@page import="com.gob.*"%>
<%@page import="java.util.*" %>
<%
//Valida la permanencia del usuario en session
if ((String)session.getValue("ok")!="ConsissRH")	response.sendRedirect("../Operation/Error.html");
			
String	sOpcion = request.getParameter("sOpcion")!= null ? request.getParameter("sOpcion"): "";
String	sCodigo = request.getParameter("sCodigo")!= null ? request.getParameter("sCodigo"): "0";
int 	iIdUnidadGobierno = java.lang.Integer.parseInt(request.getParameter("iIdUnidadGobierno")!= null ? request.getParameter("iIdUnidadGobierno"): "-1");
String	sMensage = request.getParameter("sMensage")!= null ? request.getParameter("sMensage"): "";

String	sNombre = request.getParameter("sNombre")!= null ? request.getParameter("sNombre"): "0";
String	sTipoUnidad = request.getParameter("sTipoUnidad")!= null ? request.getParameter("sTipoUnidad"): "";

UnidadAdministrativa oUnidadAdministrativa 	= new UnidadAdministrativa();
UnidadGobierno 		 oUnidadGobierno 		= new UnidadGobierno();
Municipio 		 	 oMunicipio		 		= new Municipio();

String sPath = "../";%>
<html>
<head>
	<title>Entrega - Recepción : Unidades Administrativas (Impresión)</title>
<link rel="stylesheet" type="text/css" href="../Styles/Gobierno.css">
<script language="JavaScript" src="<%=sPath%>Scripts/Gobierno.js"></script>
<SCRIPT LANGUAGE="javascript">
var da = (document.all) ? 1 : 0;
var pr = (window.print) ? 1 : 0;
var mac = (navigator.userAgent.indexOf("Mac") != -1); 

function Imprimir() {
	if (pr){/* NS4, IE5 */
		window.print();
	}else if (da && !mac){ /* IE4 (Windows) */
		print();
	}else /* other browsers */
		alert("Lo siento, su browser no permite esta accion.");
}

function print(){
	var WebBrowser = '<OBJECT ID="WebBrowser1"  WIDTH=0 HEIGHT=0 CLASSID="CLSID:8856F961-340A-11D0-A96B-00C04FD705A2"></OBJECT>';
	this.document.body.insertAdjacentHTML('afterBegin', WebBrowser); 
	this.focus();
	printVB();
	WebBrowser1.outerHTML = '';
}
DelAll = 0;
</script>
<script language="VBScript">
sub printVB()
    const OLECMDID_PRINT = 7
	const OLECMDEXECOPT_DODEFAULT      =  0 
    const OLECMDEXECOPT_PROMPTUSER     =  1 
    const OLECMDEXECOPT_DONTPROMPTUSER =  2 
    const OLECMDEXECOPT_SHOWHELP       =  3  
	on error resume next
	WebBrowser1.ExecWB OLECMDID_PRINT, OLECMDEXECOPT_DONTPROMPTUSER,9,""
end sub
</script>
</head>

<body topmargin="2" leftmargin="2" onLoad="javascript:Imprimir();">
<!-- Encabezado -->
<%@include file="..\Operation\HeaderAvance.jsp"%>
<!-- Encabezado -->
		<!-- Datos que se agregaran a la tabla  -->
		<TABLE cellPadding="0" cellSpacing="0" width="100%" BORDER="1" BORDERCOLOR="white">
		<TR>
			<TD colspan="6" class="TituloParrafo">UNIDADES ADMINISTRATIVAS</TD>
		</TR>
		<!-- Etiqueta donde se aplican los encabezados de las tablas-->
			<TR align="middle">
				<TD class="TituloMenu">ID</TD>
				<TD class="TituloMenu">Dependencia</TD>
				<TD class="TituloMenu">Nombre de Unidad</TD>
				<TD class="TituloMenu">Dirección</TD>
				<TD class="TituloMenu">Municipio</TD>
				<TD class="TituloMenu">Clave</TD>
			</TR><%
			oUnidadGobierno.GetAll();
			oMunicipio.GetAll();
			int intContador = 0;
			String sBackColor = "";
			for(int i=0;i<oUnidadAdministrativa.GetAll(iIdUnidadGobierno, '1');i++){
				int vIdUnidadAdministrativa = oUnidadAdministrativa.GetIdUnidadAdministrativa(i);
				int vIdUnidadGobierno 		= oUnidadAdministrativa.GetIdUnidadGobierno(i);
				String vNombre 				= oUnidadAdministrativa.GetNombre(i)!=null?oUnidadAdministrativa.GetNombre(i):"";
				String vDireccion 			= oUnidadAdministrativa.GetDireccion(i);
				int vIdMunicipio 			= oUnidadAdministrativa.GetIdMunicipio(i);
				String vClave				= oUnidadAdministrativa.GetClave(i);
				intContador = intContador + 1;
				if (intContador%2 == 0){
					sBackColor = "#ffffff";
				}else{
					sBackColor = "#eeeeee";
			 	}%>
			<TR align="center" bgcolor="<%=sBackColor%>" onMouseOver = "MouseDentro(this);this.style.cursor='hand';"
			onMouseOut  = "MouseFuera(this,'<%=sBackColor%>');" style="cursor:normal" >
				<TD><%=vIdUnidadAdministrativa%></TD>
				<TD><%=oUnidadGobierno.GetPos(vIdUnidadGobierno)>=0?oUnidadGobierno.GetNombre(oUnidadGobierno.GetPos(vIdUnidadGobierno)):""%></TD>				
				<TD><%=vNombre%></TD>
				<TD><%=vDireccion%></TD>
				<TD><%=oMunicipio.GetPos(vIdMunicipio)>=0?oMunicipio.GetNombre(oMunicipio.GetPos(vIdMunicipio)):""%></TD>
				<TD><%=!vClave.equals("null")?vClave:""%></TD>
			</TR><%
			}%>
		</TABLE>
</body>
</html>
