<%/*********************************************************************************************************
Elaboro:	Claudia Sandoval
Lugar:		Monterrey, NL
Fecha:		29.Oct.2002
Compañia:	CONSISS*/%>
<%@page import="com.consiss.util.tools.*"%>
<%@page import="com.gob.*"%>
<%@page import="java.util.*" %>
<%

int iIdFuncionario =  java.lang.Integer.parseInt(
			(request.getParameter("iIdFuncionario")!= null?request.getParameter("iIdFuncionario"):"0") );

java.text.DecimalFormat myFormatter = new java.text.DecimalFormat("###,##0.00");
String sAnexo = "III.5.2";
Anexo3V2	 oAnexo3V2	 	= new Anexo3V2();
String sPath = "../";
int numpag = 0;
int numtot = 0;
int iIdAnexo = oAnexo3V2.GetIdAnexo();
AnexoEstatus	oAnexoEstatus		= new AnexoEstatus();
oAnexoEstatus.Get(iIdFuncionario, iIdAnexo);
String sEstatus = oAnexoEstatus.GetEstatus();
%>
<html>
<head>
	<title>Entrega - Recepción : Anexo III.5.2 (Impresión)</title>
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
<body topmargin="2" leftmargin="2" onload="Imprimir();">
<%@include file="HeaderAnexo.jsp"%>
<br>
<table border="0" cellspacing="0" cellpadding="0" width="900">
<tr>
	<td valign="top">
	<TABLE cellPadding="0" cellSpacing="0" width="100%" BORDER="1" BORDERCOLOR="white">
	<TR><TD class="TituloParrafoImpr">RELACION DE EQUIPO DE COMPUTO</TD></TR>  
	</TABLE>
	<TABLE cellPadding="0" cellSpacing="0" width="100%" BORDER="1" BORDERCOLOR="white">
		<TR align="middle">
			<td class="TituloMenuImpr" width="150">CLAVE<br>INVENTARIO</TD>
			<td class="TituloMenuImpr" width="150">NUMERO DE<br>FACTURA</TD>
			<td class="TituloMenuImpr" width="80">FECHA<BR>FACTURA</TD>
			<td class="TituloMenuImpr" width="220">CONCEPTO</TD>
			<td class="TituloMenuImpr" width="150">IMPORTE</TD>
			<td class="TituloMenuImpr" width="150">TIPO</TD>
		</TR>
		<%
if(!sEstatus.equals("0")){
		int intContador = 0;
		String sBackColor = "";
		oAnexo3V2.GetAll(iIdFuncionario);
		// Variables para Paginacion
		int iLenCol = 0;
		int iRowsMax = 0; // POR REGISTRO
		int iRowsXCol = 0;
		int iRowsCount = 0;
		int iRowsAnt = 0; //posicion anterior
		int iMaxRowXPag = 25; //Numero de Renglones por Pagina
		// Variables para Paginacion
		
		for(int i=0;i<oAnexo3V2.GetAll(iIdFuncionario);i++){
			// Variables para Paginacion
			int iRowMaxTemp = 1;
			int iRowCountTemp = 0;
			String vTempCampo1 = "";
			String vTempCampo2 = "";
			// Variables para Paginacion
			iRowsAnt = iRowsCount;
			
			String vClave =oAnexo3V2.GetClave(i)!=null?oAnexo3V2.GetClave(i):"";
			String vNumFactura = oAnexo3V2.GetNumFactura(i)!=null?oAnexo3V2.GetNumFactura(i):"";
			String vFecha = oAnexo3V2.GetFecha(i)!=null?oAnexo3V2.GetFecha(i):"";
			String vConcepto = oAnexo3V2.GetConcepto(i)!=null?oAnexo3V2.GetConcepto(i):"";
			//Primer Elemento que su contenido puede llevar a un salto de pagina
			iLenCol = vConcepto.length();
			iRowsXCol = 1;
			if(iLenCol > 27){
				if(iLenCol%27 == 0){
					iRowsXCol = iLenCol/27;
				}else{
					iRowsXCol = (iLenCol/27)+1;
				}
				String temp = vConcepto;
				vConcepto = "";
				iRowCountTemp = 0 ;
				for(int x=1;x<=(iRowsXCol);x++){
					int max = (27*x)<=iLenCol ? (27*x) : iLenCol;
					if( (x + iRowsAnt) <= iMaxRowXPag) {
						vConcepto = vConcepto + temp.substring((27*(x-1)), max) + "<br>";
						}
					else {
						iRowCountTemp = iRowCountTemp + 1;
						vTempCampo1 = vTempCampo1 + temp.substring((27*(x-1)), max) + "<br>";
						}
				}
				iRowMaxTemp = iRowMaxTemp >= iRowCountTemp ? iRowMaxTemp : iRowCountTemp ;
			}else{
				iRowsMax = 1;
			}	
			iRowsMax = iRowsXCol;
			iRowsCount = iRowsMax + iRowsCount;
			iRowsMax = iRowsXCol;
			// Primer Elemento que su contenido puede llevar a un salto de pagina
		
			String vImporte  = oAnexo3V2.GetImporte(i)!=null?oAnexo3V2.GetImporte(i):"";
			vImporte = myFormatter.format(new Double(!vImporte.trim().equals("")?vImporte:"0"));
			iLenCol = vImporte.length();
			if(iLenCol > 16){
				if(iLenCol%16 == 0){
					iRowsXCol = iLenCol/16;
				}else{
					iRowsXCol = (iLenCol/16)+1;
				}
				
				if (iRowsXCol > iRowsMax){
				    iRowsCount = iRowsXCol - iRowsMax + iRowsCount;
					iRowsMax = iRowsXCol;
				}
				
				String temp = vImporte;
				vImporte = "";
				iRowCountTemp = 0 ;
				for(int x=1;x<=(iRowsXCol);x++){
					int max = (16*x)<=iLenCol ? (16*x) : iLenCol;
					if( (x + iRowsAnt) <= iMaxRowXPag) {
						vImporte = vImporte + temp.substring((16*(x-1)), max) + "<br>";	}
					else {
						iRowCountTemp = iRowCountTemp + 1;
						vTempCampo2 = vTempCampo2 + temp.substring((16*(x-1)), max) + "<br>";	}
				}
				iRowMaxTemp = iRowMaxTemp >= iRowCountTemp ? iRowMaxTemp : iRowCountTemp ;
			}
			
			
			String vDesTipo = oAnexo3V2.GetDesTipo(oAnexo3V2.GetTipoPos(oAnexo3V2.GetTipo(i)));
			
			intContador = intContador + 1;
			if (intContador%2 == 0){	sBackColor = "#ffffff";	}
			else{						sBackColor = "#dddddd"; }
		 %>
		<TR align="left" bgcolor="<%=sBackColor%>");">
			<TD width="150" class="ContenidoImprL"><%=vClave%></TD>
			<TD width="150" class="ContenidoImpr"><%=vNumFactura%></TD>
			<TD width="80" class="ContenidoImpr"><%=vFecha%></TD>
			<TD width="220" class="ContenidoImpr"><%=vConcepto%></TD>
			<TD width="150" class="ContenidoImpr" align="right"><%=vImporte%>&nbsp;</TD>
			<TD width="150" class="ContenidoImprR" align="center"><%=vDesTipo%></TD>
		</TR>
		<%
		//Si existe la paginacion debera repetir esto		
		if (!vTempCampo1.equals("") || !vTempCampo2.equals("") || iRowsCount>=iMaxRowXPag ){
		%>
		<tr>
			<td colspan="6" class="ContenidoImprB">&nbsp;</td>
		</tr>
	</TABLE>
</td>
</tr>
</table>
<p style="page-break-after:always"></p>
<%@include file="HeaderAnexo.jsp"%>
<br>
<table border="0" cellspacing="0" cellpadding="0" width="900">
<tr>
	<td valign="top">
	<TABLE cellPadding="0" cellSpacing="0" width="100%" BORDER="1" BORDERCOLOR="white">
	<TR><TD class="TituloParrafoImpr">RELACION DE EQUIPO DE COMPUTO</TD></TR>  
	</TABLE>
	<TABLE cellPadding="0" cellSpacing="0" width="100%" BORDER="1" BORDERCOLOR="white">
		<TR align="middle">
			<td class="TituloMenuImpr" width="150">CLAVE<br>INVENTARIO</TD>
			<td class="TituloMenuImpr" width="150">NUMERO DE<br>FACTURA</TD>
			<td class="TituloMenuImpr" width="80">FECHA<BR>FACTURA</TD>
			<td class="TituloMenuImpr" width="220">CONCEPTO</TD>
			<td class="TituloMenuImpr" width="150">IMPORTE</TD>
			<td class="TituloMenuImpr" width="150">TIPO</TD>
		</TR>
		<%if (!vTempCampo1.equals("") || !vTempCampo2.equals("")){%>
		<TR align="left" bgcolor="<%=sBackColor%>");">
			<TD width="150" class="ContenidoImprL">&nbsp;</TD>
			<TD width="150" class="ContenidoImpr">&nbsp;</TD>
			<TD width="80" class="ContenidoImpr">&nbsp;</TD>
			<TD width="220" class="ContenidoImpr"><%=vTempCampo1%></TD>
			<TD width="150" class="ContenidoImpr" align="right"><%=vTempCampo2%></TD>
			<TD width="150" class="ContenidoImprR" align="center">&nbsp;</TD>
		</TR>
	<%
			}
		}
			iRowsCount = iRowsCount>=iMaxRowXPag?iRowMaxTemp:iRowsCount;
			
		} // FIN DEL FOR
//Si existe la paginacion debera repetir esto		
	%>
	<tr><td colspan="6" class="ContenidoImprB">&nbsp;</td></tr>
	</TABLE>
</td>
</tr>
</table>
<TABLE cellPadding="0" cellSpacing="0" width="100%" BORDER="1" BORDERCOLOR="white">
</TABLE>
<%@include file="FooterAnexo.jsp"%>
</div> 
</body>
</html>
<%
} else {
%>
</table>
	<TABLE width="100%">
		<TR>
			<TD align="center"><H1 style="size=+2"><br>ESTE ANEXO NO APLICA</H1></TD>
		</TR>
	</TABLE>
</td>
</tr>
</table>
<br>
<%@include file="FooterAnexo.jsp"%>
</body>
</html>
<%}%>