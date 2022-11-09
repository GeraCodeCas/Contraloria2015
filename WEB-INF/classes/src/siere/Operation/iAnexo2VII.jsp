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

String sAnexo = "II.7";
Anexo2VII oAnexo2VII 	= new Anexo2VII();

int iIdAnexo = oAnexo2VII.GetIdAnexo();
String sPath = "../";
AnexoEstatus	oAnexoEstatus		= new AnexoEstatus();
oAnexoEstatus.Get(iIdFuncionario, iIdAnexo);
String sEstatus = oAnexoEstatus.GetEstatus();
int numpag =0;
int numtot = 0;
%>
<html>
<head>
	<title>Entrega - Recepción : Anexo II.7 (Impresión)</title>
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
	
	function print()
	{
	
	var WebBrowser = '<OBJECT ID="WebBrowser1"  WIDTH=0 HEIGHT=0 CLASSID="CLSID:8856F961-340A-11D0-A96B-00C04FD705A2"></OBJECT>';
	// insert object
	this.document.body.insertAdjacentHTML('afterBegin', WebBrowser); 
	this.focus();
	//if (confirm("Seguro que desea imprimir?"))
	//{
		printVB();
//	}
	WebBrowser1.outerHTML = '';
	//window.location.reload();
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
<TABLE border=0 cellPadding=0 cellSpacing=0 width="900">
	<TR>
		<TD  colspan="3" class="TituloParrafoImpr" width="70%">ESTADOS FINANCIEROS DICTAMINADOS</TD>
	</TR>
</TABLE>			
<%	if(!sEstatus.equals("0")){%>
<table cellspacing="0" cellpadding="0" border="1" width="900" bordercolor="black">
<tr>
    <td width="450" align="left" class="TituloMenuImpr">SE ENTREGA (*)</td>
    <td  align="center" class="TituloMenuImpr">SI</td>
    <td  align="center" class="TituloMenuImpr">NO</td>
    <td  align="center" class="TituloMenuImpr">FECHA DE CIERRE DE LA INFORMACIÓN</td>
</tr>
<tr>
<TD valign="top" width="450">
     <TABLE cellPadding="0" cellSpacing="0" width="452" BORDER="0">
		 <TR height="25">
			 <TD class="TituloMenuImpr">BALANCE GENERAL</a></TD>
		 </TR>
		 <TR height="25">
		 	 <TD class="TituloMenuImpr">ESTADO DE RESULTADOS</a></TD>
		 </TR>
		 <TR height="25">
			 <TD class="TituloMenuImpr">ESTADO DE ORIGEN Y APLICACION</a></TD>
		 </TR>
		 <TR height="25">
			 <TD class="TituloMenuImpr">LIBROS Y REGISTROS DE CONTABILIDAD AL CORRIENTE</a></TD>
		 </TR>
		  <TR height="1"><td height="2" bgcolor="Black"></td></tr>
		 <TR height="50">
			 <TD class="TituloMenuImpr">LOS ESTADOS FINANCIEROS FUERON AUDITADOS EXTERNAMENTE</a></TD>
		 </TR>
		
	  </TABLE></TD>
<TD valign="top">
	  <TABLE cellPadding="0" cellSpacing="0" width="100%" BORDER="0">
	  <%		
			oAnexo2VII.Get(iIdFuncionario);
			String vBalanceGeneral 		= oAnexo2VII.GetBalanceGeneral()!=null?oAnexo2VII.GetBalanceGeneral():"";
			String vEstadoResultados	= oAnexo2VII.GetEstadoResultados()!=null?oAnexo2VII.GetEstadoResultados():"";
			String vEstadoOrigen 		= oAnexo2VII.GetEstadoOrigen()!=null?oAnexo2VII.GetEstadoOrigen():"";
			String vLibrosRegistros 	= oAnexo2VII.GetLibrosRegistros()!=null?oAnexo2VII.GetLibrosRegistros():"";
			String vEstadosFinancieros 	= oAnexo2VII.GetEstadosFinancieros()!=null?oAnexo2VII.GetEstadosFinancieros():"";
			String vQuienAudito		    = oAnexo2VII.GetQuienAudito()!=null?oAnexo2VII.GetQuienAudito():"";
			String vFechaCierre 		= oAnexo2VII.GetFechaCierre()!=null?oAnexo2VII.GetFechaCierre():"";
			String vFechaAuditoria 		= oAnexo2VII.GetFechaAuditoria()!=null?oAnexo2VII.GetFechaAuditoria():"";
		%>	<TR height="25" align="center"><td><%if(vBalanceGeneral.equals("1")){%><img src="<%=sPath%>/Images/VinetaGde.gif"><%}%></td></tr>
			<TR height="25" align="center"><td><%if(vEstadoResultados.equals("1")){%><img src="<%=sPath%>/Images/VinetaGde.gif"><%}%></td></tr>
			<TR height="25" align="center"><td><%if(vEstadoOrigen.equals("1")){%><img src="<%=sPath%>/Images/VinetaGde.gif"><%}%></td></tr>
			<TR height="25" align="center"><td><%if(vLibrosRegistros.equals("1")){%><img src="<%=sPath%>/Images/VinetaGde.gif"><%}%></td></tr>
			<TR height="2"><td height="2"></td></tr>
			<TR height="50" align="center"><td><%if(vEstadosFinancieros.equals("1")){%><img src="<%=sPath%>/Images/VinetaGde.gif"><%}%></td></tr>
       </TABLE></td>
<TD valign="top">
      <TABLE cellPadding="0" cellSpacing="0" width="100%" BORDER="0" bgcolor="eeeeee">
        	<TR height="25" align="center"><td><%if(vBalanceGeneral.equals("2")){%><img src="<%=sPath%>/Images/VinetaGde.gif"><%}%></td></tr>
			<TR height="25" align="center"><td><%if(vEstadoResultados.equals("2")){%><img src="<%=sPath%>/Images/VinetaGde.gif"><%}%></td></tr>
			<TR height="25" align="center"><td><%if(vEstadoOrigen.equals("2")){%><img src="<%=sPath%>/Images/VinetaGde.gif"><%}%></td></tr>
			<TR height="25" align="center"><td><%if(vLibrosRegistros.equals("2")){%><img src="<%=sPath%>/Images/VinetaGde.gif"><%}%></td></tr>
			<TR height="2"><td height="2"></td></tr>
			<TR height="50" align="center"><td><%if(vEstadosFinancieros.equals("2")){%><img src="<%=sPath%>/Images/VinetaGde.gif"><%}%></td></tr>
      </TABLE></td>
<TD valign="top">
      <TABLE cellPadding="0" cellSpacing="0" width="100%" BORDER="0">
        	<TR height="25"><td align="center" class="ContenidoImpr"><%=vFechaCierre%></td></tr>
			<TR height="25"><td></td></tr>
			<TR height="25"><td></td></tr>
			<TR height="25"><td></td></tr>
			<TR height="2"><td height="2" bgcolor="black"></td></tr>
			<TR height="50" valign="top"><td valign="top">
			 <TABLE cellPadding="0" cellSpacing="0" width="100%" BORDER="0">
        	    <TR height="25"><td align="center" width="100%" class="TituloMenuImpr">FECHA DE LA AUDITORIA</td></tr>
				<TR height="25"><td  width="100%" align="center" class="ContenidoImpr"><%=vFechaAuditoria%></td></tr>
			 </TABLE></td></tr>
      </TABLE></td>
</tr>
<TR>
	<TD height="25" class="TituloMenuImpr">¿QUIEN AUDITO?</TD>
	<td colspan="3">&nbsp;&nbsp;<%=vQuienAudito%></td>
</TR>
<TR>
	<TD height="25" colspan="4" class="SubTituloMenu">* Adjuntar Últimos Estados Financieros Auditados y Relación de los Estados Financieros Anteriores, Auditados</td>
</TR>
</table>
<%
} else {
%>
	<TABLE width="100%">
		<TR>
			<TD align="center"><H1 style="size=+2"><br>ESTE ANEXO NO APLICA</H1></TD>
		</TR>
	</TABLE>
<%
}
%>	</FORM>
</td>	<!-- Contenido -->
</tr>
</table>
<br><br>
<%@include file="FooterAnexo.jsp"%>
</body>
</html>
