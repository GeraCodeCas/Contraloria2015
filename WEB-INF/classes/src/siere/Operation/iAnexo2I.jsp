<%/*********************************************************************************************************
Elaboro:	Julio Enrique Espinosa Torres
Lugar:		Monterrey, NL
Fecha:		29.Oct.2002
Compañia:	CONSISS*/%>
<%@page import="com.consiss.util.tools.*"%>
<%@page import="com.gob.*"%>
<%@page import="java.util.*" %>
<%
//Valida la permanencia del usuario en session
if ((String)session.getValue("ok")!="Consiss")
			response.sendRedirect("Error.html");

int iIdFuncionario =  java.lang.Integer.parseInt(
			(request.getParameter("iIdFuncionario")!= null?request.getParameter("iIdFuncionario"):"0") );

String sAnexo = "II.1";
Anexo2I oAnexo2I 	= new Anexo2I();

int iIdAnexo = oAnexo2I.GetIdAnexo();
String sPath = "../";

int numpag = 0;
int numtot = 0;
AnexoEstatus	oAnexoEstatus		= new AnexoEstatus();
oAnexoEstatus.Get(iIdFuncionario, iIdAnexo);
String sEstatus = oAnexoEstatus.GetEstatus();
%>
<html>
<head>
	<title>Entrega - Recepción : Anexo II.1 (Impresión)</title>
<link rel="stylesheet" type="text/css" href="<%=sPath%>Styles/Gobierno.css">
<script language="JavaScript">
function closewin(){
				 window.close();
}
</script>
<SCRIPT LANGUAGE="javascript">
	var da = (document.all) ? 1 : 0;
	var pr = (window.print) ? 1 : 0;
	var mac = (navigator.userAgent.indexOf("Mac") != -1); 

	function Imprimir() {
	  if (pr){
		/* NS4, IE5 */
		window.print();
	  }else if (da && !mac){ 
		/* IE4 (Windows) */
	   print();
	  }else /* other browsers */
	    alert("Lo siento, su browser no permite esta accion.");
	}
	
	function print() {
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
</HEAD>
<body topmargin="2" leftmargin="2" onLoad="javascript:Imprimir();">
<!-- Datos que se agregaran a la tabla  -->
<%@include file="HeaderAnexo.jsp"%>
<br>
	<TABLE cellPadding="0" cellSpacing="0" width="900" BORDER="1" BORDERCOLOR="white">
		<tr>
		<TD colspan="2" class="TituloParrafoImpr" width="70%">PRESUPUESTO GLOBAL DEL EJERCICIO</TD>
		</TR>
	</table>
	<%if(!sEstatus.equals("0")){%>
	<TABLE cellPadding="0" cellSpacing="0" width="900" BORDER="1" BORDERCOLOR="Black">
	<!-- Etiqueta donde se aplican los encabezados de las tablas-->
	<TR>
		<TD class="TituloMenuImpr" width="70%" align="center">CONCEPTO</TD>
		<TD class="TituloMenuImpr" align="center">IMPORTE</TD>
	</TR>
	<TR>
		<TD valign="top">
			<TABLE cellPadding="0" cellSpacing="0" width="100%" BORDER="0" BORDERCOLOR="White">
									 <TR height="25">
									 <TD class="TituloMenuImpr">1. Presupuesto Aprobado</TD>
									 </TR>
									 <TR height="25">
									 <TD class="TituloMenuImpr">2. Incrementos</TD>
									 </TR>
									 <TR height="25">
									 <TD class="TituloMenuImpr">3. Reducciones</TD>
									 </TR>
									 <TR height="25">
									 <TD class="TituloMenuImpr">4. Programas Especiales Aprobados</TD>
									 </TR>
									 <TR height="25">
									 <TD class="TituloMenuImpr">5. Total Aprobado</TD>
									 </TR>
									 <TR height="25">
									 <TD class="TituloMenuImpr">6. Total Ejercido</TD>
									 </TR>
									 <TR height="25">
									 <TD class="TituloMenuImpr">7. Total por Ejercer: Presupuesto Disponible</TD>
							 		 </TR>
				</TABLE></TD>
			<TD valign="top" align="right">
			<TABLE cellPadding="0" cellSpacing="0"  BORDER="1" BORDERCOLOR="white">
			<%		
			oAnexo2I.Get(iIdFuncionario);
			String vPresupuestoAprobado 	= oAnexo2I.GetPresupuestoAprobado()!=null?oAnexo2I.GetPresupuestoAprobado():"0";
			String vIncrementos		        = oAnexo2I.GetIncrementos()!=null?oAnexo2I.GetIncrementos():"0";
			String vReducciones 				  = oAnexo2I.GetReducciones()!=null?oAnexo2I.GetReducciones():"0";
			String vProgramasEspeciales 	= oAnexo2I.GetProgramasEspeciales()!=null?oAnexo2I.GetProgramasEspeciales():"0";
			String vTotalAprobado 				= oAnexo2I.GetTotalAprobado()!=null?oAnexo2I.GetTotalAprobado():"0";
			String vTotalEjercido		      = oAnexo2I.GetTotalEjercido()!=null?oAnexo2I.GetTotalEjercido():"0";
			String vTotalPorEjercer 			= oAnexo2I.GetTotalPorEjercer()!=null?oAnexo2I.GetTotalPorEjercer():"0";
			String vObservaciones 			= oAnexo2I.GetObservaciones()!=null?oAnexo2I.GetObservaciones():"0";
			java.text.DecimalFormat myFormatter = new java.text.DecimalFormat("###,##0.00");
			%>		
		<TR height="25">
  		<TD align="right">&nbsp;<%=myFormatter.format(new Double(!vPresupuestoAprobado.equals("")?vPresupuestoAprobado:"0"))%>&nbsp;&nbsp;</TD>
		</TR>
		<TR height="25">
			<TD align="right">&nbsp;<%=myFormatter.format(new Double(!vIncrementos.equals("")?vIncrementos:"0"))%>&nbsp;&nbsp;</TD>
		</TR>
		<TR height="25">
			<TD align="right">&nbsp;<%=myFormatter.format(new Double(!vReducciones.equals("")?vReducciones:"0"))%>&nbsp;&nbsp;</TD>
		</TR>
		<TR height="25">
			<TD align="right">&nbsp;<%=myFormatter.format(new Double(!vProgramasEspeciales.equals("")?vProgramasEspeciales:"0"))%>&nbsp;&nbsp;</TD>
		</TR>
		<TR height="25">
			<TD align="right">&nbsp;<%=myFormatter.format(new Double(!vTotalAprobado.equals("")?vTotalAprobado:"0"))%>&nbsp;&nbsp;</TD>
		</TR>
		<TR height="25">
			<TD align="right">&nbsp;<%=myFormatter.format(new Double(!vTotalEjercido.equals("")?vTotalEjercido:"0"))%>&nbsp;&nbsp;</TD>
		</TR>
		<TR height="25">
			<TD align="right">&nbsp;<%=myFormatter.format(new Double(!vTotalPorEjercer.equals("")?vTotalPorEjercer:"0"))%>&nbsp;&nbsp;</TD>
		</TR>
				</TABLE></TD>			
		</TR>
 	</TABLE>
	<br>
	<TABLE cellPadding="0" cellSpacing="0" width="900" BORDER="1" BORDERCOLOR="black">
		<TR>
				<TD class="TituloMenuImpr" align="center">OBSERVACIONES</TD>
		</TR>
		<TR>
  			<TD class="ContenidoImpr">&nbsp;<%=vObservaciones%></TD>
		</TR>
  </TABLE>	
<br>
<TABLE border=0 cellPadding=0 cellSpacing=0 width="900">
	<TR>
		<TD class="TituloMenuImpr">&nbsp;ADJUNTAR PRESUPUESTOS AUTORIZADOS</TD>
	</TR>
</TABLE>
<%
} else {
%>
	<TABLE width="900">
		<TR>
			<TD align="center"><H1 style="size=+2"><br>ESTE ANEXO NO APLICA</H1></TD>
		</TR>
	</TABLE>
<%
}
%>	
</FORM>
</td>	<!-- Contenido -->
</tr>
</table><br>
<%@include file="FooterAnexo.jsp"%>
</body>
</html>
