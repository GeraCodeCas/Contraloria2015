<%@page import='com.consiss.util.tools.*'%>
<%@page import='com.consiss.util.*'%>
<%@page import='java.util.*'%>
<%@page import='com.gob.*'%>
<%@page buffer='100kb' %>
<%
String 	sIdFuncionario 	= request.getParameter("sIdFuncionario")!= null ? request.getParameter("sIdFuncionario"): "0";
String 	iProceso		= request.getParameter("iProceso")!=null ? request.getParameter("iProceso"):"1";
String sIdFuncionarioNvo =  request.getParameter("sIdFuncionarioNvo")!=null ? request.getParameter("sIdFuncionarioNvo"):"0";
String sFuncionarioSaliente	= request.getParameter("sFuncionarioSaliente")!=null ? request.getParameter("sFuncionarioSaliente"):"0";
String sFuncionarioEntrante	= request.getParameter("sFuncionarioEntrante")!=null ? request.getParameter("sFuncionarioEntrante"):"0";

int 	iIdFuncionario 	= java.lang.Integer.parseInt(sIdFuncionario);
String	sFuncionario 	= request.getParameter("sFuncionario")	!= null ? request.getParameter("sFuncionario"): "";
String	sCargo			= request.getParameter("sCargo")		!= null ? request.getParameter("sCargo"): "";
String sUnidadAdministrativa= request.getParameter("sUnidadAdministrativa")	!= null ? request.getParameter("sUnidadAdministrativa"): "";
String	sRutaBase		= request.getParameter("sRutaBase")		!= null ? request.getParameter("sRutaBase"): "";
String	sRutaImagenes 	= request.getParameter("sRutaImagenes")	!= null ? request.getParameter("sRutaImagenes"): "";
String	sRutaStyles 	= request.getParameter("sRutaStyles")	!= null ? request.getParameter("sRutaStyles"): "";
String	sRutaHistoria	= request.getParameter("sRutaHistoria")	!= null ? request.getParameter("sRutaHistoria"): "";
String	sRutaAttach		= request.getParameter("sRutaAttach")	!= null ? request.getParameter("sRutaAttach"): "";
String	sRutaWAttach	= request.getParameter("sRutaWAttach")	!= null ? request.getParameter("sRutaWAttach"): "";
String	sRutaWOAttach	= request.getParameter("sRutaWOAttach")	!= null ? request.getParameter("sRutaWOAttach"): "";
String	sDetalle		= request.getParameter("sDetalle")		!= null ? request.getParameter("sDetalle"): "";
String	hsNombreUG		= request.getParameter("hsNombreUG")	!= null ? request.getParameter("hsNombreUG"): "";
String	hsImagenUG		= request.getParameter("hsImagenUG")	!= null ? request.getParameter("hsImagenUG"): "";
String	hsNombreUA		= request.getParameter("hsNombreUA")	!= null ? request.getParameter("hsNombreUA"): "";
String	hsClave			= request.getParameter("hsClave")		!= null ? request.getParameter("hsClave"): "";
String	sFecha			= request.getParameter("sFecha")		!= null ? request.getParameter("sFecha"): "";

String  sImagenes		= sRutaHistoria + "\\Images";
String  sStyles			= sRutaHistoria + "\\Styles";
String  sImagenesAttach	= sRutaAttach + "\\Images";
String  sStylesAttach	= sRutaAttach + "\\Styles";
String  sAttachAttach	= sRutaAttach + "\\Attach";
String 	sArchivo		= "";
String  sAttach			= sRutaBase + "\\Attachment\\Funcionario" + sIdFuncionario;
String  sLinkAttach		= "Attach\\Anexo";
String 	sAnexo			= "";
//De uso general
String sEstatus			= "";
String sAux				= "";
int iIdAnexo			= 0;
AnexoEstatus	oAnexoEstatus	= new AnexoEstatus();
VMatrix vArchivoA;
AnexoArchivo oArchivoA 	= new AnexoArchivo();
java.text.DecimalFormat FormatoDecimal = new java.text.DecimalFormat("###,##0.00");

ArchivoHistorico oArchivo 	=  new ArchivoHistorico();
ArchivoHistorico oArchivowa =  new ArchivoHistorico();

String sPath 			= "";
char c = '"';
char e;
char cEnter = (char)(13);
char cRetorno = (char)(10);
String sSalto = cEnter +""+ cRetorno;
if(true){
%>
				<%@include file="hAnexo2VI.jsp"%>
				<%@include file="hAnexo2VII.jsp"%>
				<%@include file="hAnexo3I.jsp"%>
				<%@include file="hAnexo3II.jsp"%>
				<%@include file="hAnexo3III.jsp"%>
<%
}
%>
<html>
	<head>
	</head>
	<body>
		<form method="post" action="pHistoricoReparte.jsp" name="forma">
			<input type="hidden" name="sIdFuncionario" 	value="<%=iIdFuncionario%>">
			<input type="hidden" name="sFuncionario" 	value="<%=sFuncionario%>">
			<input type="hidden" name="sCargo"			value="<%=sCargo%>">
			<input type="hidden" name="sUnidadAdministrativa"	value="<%=sUnidadAdministrativa%>">
			<input type="hidden" name="sRutaBase"		value="<%=sRutaBase%>">
			<input type="hidden" name="sRutaImagenes" 	value="<%=sRutaImagenes%>">
			<input type="hidden" name="sRutaStyles" 	value="<%=sRutaStyles%>">
			<input type="hidden" name="sRutaHistoria"	value="<%=sRutaHistoria%>">
			<input type="hidden" name="sRutaAttach"		value="<%=sRutaAttach%>">
			<input type="hidden" name="sRutaWAttach"	value="<%=sRutaWAttach%>">
			<input type="hidden" name="sRutaWOAttach"	value="<%=sRutaWOAttach%>">
			<input type="hidden" name="sDetalle"		value="<%=sDetalle%>">
			<input type="hidden" name="iProceso"		value="<%=iProceso%>">
			<input type="hidden" name="hsNombreUG"		value="<%=hsNombreUG%>">
			<input type="hidden" name="hsImagenUG"		value="<%=hsImagenUG%>">
			<input type="hidden" name="hsNombreUA"		value="<%=hsNombreUA%>">
			<input type="hidden" name="hsClave"			value="<%=hsClave%>">
			<input type="hidden" name="sFecha"			value="<%=sFecha%>">
			<input type="hidden" name="sIdFuncionarioNvo" value="<%=sIdFuncionarioNvo%>">
			<input type="hidden" name="sFuncionarioSaliente"	value="<%=sFuncionarioSaliente%>">
			<input type="hidden" name="sFuncionarioEntrante"	value="<%=sFuncionarioEntrante%>">
		</form>
		<script>
			document.forma.submit();
		</script>
	</body>
</html>
	
