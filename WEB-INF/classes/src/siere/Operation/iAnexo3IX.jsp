<%@page import="com.consiss.util.tools.*"%>
<%@page import="com.gob.*"%>
<%@page import="java.util.*" %>
<%
/********************************************************************************************************
'Elaboro:	Jesus Limon
'Lugar:		Monterrey, NL
'Fecha:		29.Nov.2002
'Compañia:	CONSISS
'Ultima Modificacion:06-Dic-2001
'By:Sigifredo Vazquez

'Ultima Modificacion:16.Dic.2002
'By:Claudia Sandoval

'Ultima Modificacion:07.Ene.2003
'By:Enrique Martinez
'Distintas opciones:
'
'********************************************************************************************************/
%>
<%
//Valida la permanencia del usuario en session
if ((String)session.getValue("ok")!="Consiss")
			response.sendRedirect("Error.html");

String	sCodigo = request.getParameter("sCodigo")!= null ? request.getParameter("sCodigo"): "";
int iIdFuncionario =  java.lang.Integer.parseInt(
			(request.getParameter("iIdFuncionario")!= null?request.getParameter("iIdFuncionario"):"0") );

String sAnexo = "III.9";
Anexo3IX oAnexo	= new Anexo3IX();
int iIdAnexo = oAnexo.GetIdAnexo();
String sPath = "../";
int numpag = 0;
int numtot = 0;

AnexoEstatus	oAnexoEstatus		= new AnexoEstatus();
oAnexoEstatus.Get(iIdFuncionario, iIdAnexo);
String sEstatus = oAnexoEstatus.GetEstatus();
%>
<html>
<head>
	<title>Entrega - Recepción : Anexo III.9 (Impresión)</title>
	<link rel="stylesheet" type="text/css" href="<%=sPath%>Styles/Gobierno.css">
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
		<TR><TD class="TituloParrafoImpr">RELACIÓN BIENES INMUEBLES</TD></TR>  
	</TABLE>
	<TABLE cellPadding="0" cellSpacing="0" width="100%" BORDER="1" BORDERCOLOR="white">
		<TR align="middle">
			<td class="TituloMenuImpr" width="100">No. DE EXP. CATASTRAL ASIGNADO POR CADA MUNICIPIO</TD>
			<td class="TituloMenuImpr" width="100">No.PROGRESIVO</TD>
			<td class="TituloMenuImpr" width="150">NOMBRE O IDENTIFICACIÓN DEL BIEN INMUEBLE, UBICACIÓN Y SUPERFICIE</TD>
			<td class="TituloMenuImpr" width="100">DESTINO</TD>
			<td class="TituloMenuImpr" width="100">ESTADO QUE GUARDAR EL INMUEBLE</TD>
			<td class="TituloMenuImpr" width="100">TIPO DE BIEN INMUEBLE</TD>
			<td class="TituloMenuImpr" width="100">TIPO DE ACCIÓN LEGAL</TD>
			<td class="TituloMenuImpr" width="150">OBSERVACIONES</TD>
		</TR>
<%
if(!sEstatus.equals("0")){
		int intContador = 0;
		String sBackColor = "";
		oAnexo.GetAll(iIdFuncionario);
		// Variables para Paginacion
		int iLenCol = 0;
		int iRowsMax = 0; // POR REGISTRO
		int iRowsXCol = 0;
		int iRowsCount = 0;
		int iRowsAnt = 0; //posicion anterior
		int iMaxRowXPag = 24; //Numero de Renglones por Pagina
		// Variables para Paginacion
		
		for(int i=0;i<oAnexo.GetAll(iIdFuncionario);i++){
			// Variables para Paginacion
			int iRowMaxTemp = 1;
			int iRowCountTemp = 0;
			String vTempCampo1 = "";
			String vTempCampo2 = "";
			String vTempCampo3 = "";
			String vTempCampo4 = "";
			String vTempCampo5 = "";
			// Variables para Paginacion
			iRowsAnt = iRowsCount;
			
			int 	iIdRenglon			= oAnexo.GetIdRenglon(i)!=-1?			oAnexo.GetIdRenglon(i):0;
			String 	sNoExpediente		= oAnexo.GetNoExpediente(i)!=null?		oAnexo.GetNoExpediente(i)+"":"";
			//Primer Elemento que su contenido puede llevar a un salto de pagina
			iLenCol = sNoExpediente.length();
			iRowsXCol = 1;
			if(iLenCol > 13){
				if(iLenCol%13 == 0){
					iRowsXCol = iLenCol/13;
				}else{
					iRowsXCol = (iLenCol/13)+1;
				}
				String temp = sNoExpediente;
				sNoExpediente = "";
				iRowCountTemp = 0 ;
				for(int x=1;x<=(iRowsXCol);x++){
					int max = (13*x)<=iLenCol ? (13*x) : iLenCol;
					if( (x + iRowsAnt) <= iMaxRowXPag) {
						sNoExpediente = sNoExpediente + temp.substring((13*(x-1)), max) + "<br>";
						}
					else {
						iRowCountTemp = iRowCountTemp + 1;
						vTempCampo1 = vTempCampo1 + temp.substring((13*(x-1)), max) + "<br>";
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
			
			String 	sNoProgresivo		= oAnexo.GetNoProgresivo(i)!=null?		oAnexo.GetNoProgresivo(i)+"":"";
			// Elemento que su contenido puede llevar a un salto de pagina
			iLenCol = sNoProgresivo.length();
			if(iLenCol > 13){
				if(iLenCol%13 == 0){
					iRowsXCol = iLenCol/13;
				}else{
					iRowsXCol = (iLenCol/13)+1;
				}
				if (iRowsXCol > iRowsMax){
				    iRowsCount = iRowsXCol - iRowsMax + iRowsCount;
					iRowsMax = iRowsXCol;
				}
				String temp = sNoProgresivo;
				sNoProgresivo = "";
				iRowCountTemp = 0 ;
				for(int x=1;x<=(iRowsXCol);x++){
					int max = (13*x)<=iLenCol ? (13*x) : iLenCol;
					if( (x + iRowsAnt) <= iMaxRowXPag) {
						sNoProgresivo = sNoProgresivo + temp.substring((13*(x-1)), max) + "<br>";	}
					else {
						iRowCountTemp = iRowCountTemp + 1;
						vTempCampo2 = vTempCampo2 + temp.substring((13*(x-1)), max) + "<br>";	}
				}
				iRowMaxTemp = iRowMaxTemp >= iRowCountTemp ? iRowMaxTemp : iRowCountTemp ;
			}else{
				iRowsXCol = 1;
			}
			// Elemento que su contenido puede llevar a un salto de pagina
			
			String 	sNombre				= oAnexo.GetNombre(i)!=null?			oAnexo.GetNombre(i)+"":"";
			// Elemento que su contenido puede llevar a un salto de pagina
			iLenCol = sNombre.length();
			if(iLenCol > 20){
				if(iLenCol%20 == 0){
					iRowsXCol = iLenCol/20;
				}else{
					iRowsXCol = (iLenCol/20)+1;
				}
				if (iRowsXCol > iRowsMax){
				    iRowsCount = iRowsXCol - iRowsMax + iRowsCount;
					iRowsMax = iRowsXCol;
				}
				String temp = sNombre;
				sNombre = "";
				iRowCountTemp = 0 ;
				for(int x=1;x<=(iRowsXCol);x++){
					int max = (20*x)<=iLenCol ? (20*x) : iLenCol;
					if( (x + iRowsAnt) <= iMaxRowXPag) {
						sNombre = sNombre + temp.substring((20*(x-1)), max) + "<br>";	}
					else {
						iRowCountTemp = iRowCountTemp + 1;
						vTempCampo3 = vTempCampo3 + temp.substring((20*(x-1)), max) + "<br>";	}
				}
				iRowMaxTemp = iRowMaxTemp >= iRowCountTemp ? iRowMaxTemp : iRowCountTemp ;
			}else{
				iRowsXCol = 1;
			}
			// Elemento que su contenido puede llevar a un salto de pagina
			
			String 	sDestino			= oAnexo.GetDestino(i)!=null?			oAnexo.GetDestino(i)+"":"";
			//String 	sEstadoInmueble		= oAnexo.GetEstadoInmueble(i)!=null?	oAnexo.GetEstadoInmueble(i)+"":"";
			// Elemento que su contenido puede llevar a un salto de pagina
			iLenCol = sDestino.length();
			if(iLenCol > 13){
				if(iLenCol%13 == 0){
					iRowsXCol = iLenCol/13;
				}else{
					iRowsXCol = (iLenCol/13)+1;
				}
				if (iRowsXCol > iRowsMax){
				    iRowsCount = iRowsXCol - iRowsMax + iRowsCount;
					iRowsMax = iRowsXCol;
				}
				String temp = sDestino;
				sDestino = "";
				iRowCountTemp = 0 ;
				for(int x=1;x<=(iRowsXCol);x++){
					int max = (13*x)<=iLenCol ? (13*x) : iLenCol;
					if( (x + iRowsAnt) <= iMaxRowXPag) {
						sDestino = sDestino + temp.substring((13*(x-1)), max) + "<br>";	}
					else {
						iRowCountTemp = iRowCountTemp + 1;
						vTempCampo4 = vTempCampo4 + temp.substring((13*(x-1)), max) + "<br>";	}
				}
				iRowMaxTemp = iRowMaxTemp >= iRowCountTemp ? iRowMaxTemp : iRowCountTemp ;
			}else{
				iRowsXCol = 1;
			}
			// Elemento que su contenido puede llevar a un salto de pagina
			
			int 	iEstadoInmueble 	= oAnexo.GetEstadoInmueble(i)!=-1?		oAnexo.GetTipoInmueble(i):0;
			String  sEstadoInmueble		= oAnexo.GetEstadoInmuebleDescripcion(i);
			int 	iTipoInmueble 		= oAnexo.GetTipoInmueble(i)!=-1?		oAnexo.GetTipoInmueble(i):0;
			String  sTipoInmueble		= oAnexo.GetTipoInmuebleDescripcion(i);
			int 	iTipoAccion 		= oAnexo.GetTipoAccion(i)!=-1?			oAnexo.GetTipoAccion(i):0;
			String  sTipoAccion			= oAnexo.GetTipoAccionDescripcion(i);
			String 	sObservacion 		= oAnexo.GetObservacion(i)!=null?		oAnexo.GetObservacion(i):"";
			// Elemento que su contenido puede llevar a un salto de pagina
			iLenCol = sObservacion.length();
			if(iLenCol > 20){
				if(iLenCol%20 == 0){
					iRowsXCol = iLenCol/20;
				}else{
					iRowsXCol = (iLenCol/20)+1;
				}
				if (iRowsXCol > iRowsMax){
				    iRowsCount = iRowsXCol - iRowsMax + iRowsCount;
					iRowsMax = iRowsXCol;
				}
				String temp = sObservacion;
				sObservacion = "";
				iRowCountTemp = 0 ;
				for(int x=1;x<=(iRowsXCol);x++){
					int max = (20*x)<=iLenCol ? (20*x) : iLenCol;
					if( (x + iRowsAnt) <= iMaxRowXPag) {
						sObservacion = sObservacion + temp.substring((20*(x-1)), max) + "<br>";	}
					else {
						iRowCountTemp = iRowCountTemp + 1;
						vTempCampo5 = vTempCampo5 + temp.substring((20*(x-1)), max) + "<br>";	}
				}
				iRowMaxTemp = iRowMaxTemp >= iRowCountTemp ? iRowMaxTemp : iRowCountTemp ;
			}else{
				iRowsXCol = 1;
			}
			// Elemento que su contenido puede llevar a un salto de pagina
			
			intContador = intContador + 1;
			if(intContador%2 == 0){
				sBackColor = "#ffffff";
			}else{
				sBackColor = "#dddddd";
			}
%>
		<TR valign="top" align="left" bgcolor="<%=sBackColor%>">
			<TD class="ContenidoImprL" width="100">&nbsp;<%=sNoExpediente%></TD>
			<TD class="ContenidoImpr" width="100"><%=sNoProgresivo%></TD>
			<TD class="ContenidoImpr" width="150"><%=sNombre%></TD>
			<TD class="ContenidoImpr" width="100"><%=sDestino%></TD>
			<TD class="ContenidoImpr" width="100"><%=sEstadoInmueble%></TD>
			<TD class="ContenidoImpr" width="100"><%=sTipoInmueble%></TD>
			<TD class="ContenidoImpr" width="100"><%=sTipoAccion%></TD>
			<TD class="ContenidoImprR" width="150">&nbsp;<%=sObservacion%></TD>
		</TR>
		<%
		if ((!vTempCampo1.equals("") || !vTempCampo2.equals("") || !vTempCampo3.equals("") || !vTempCampo4.equals("") || !vTempCampo5.equals("")) 
		|| iRowsCount>=iMaxRowXPag ){
		%>
		<tr><td colspan="8" class="ContenidoImprB">&nbsp;</td></tr>
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
		<TR><TD class="TituloParrafoImpr">RELACIÓN BIENES INMUEBLES</TD></TR>  
	</TABLE>
	<TABLE cellPadding="0" cellSpacing="0" width="100%" BORDER="1" BORDERCOLOR="white">
		<TR align="middle">
			<td class="TituloMenuImpr" width="100">No. DE EXP. CATASTRAL ASIGNADO POR CADA MUNICIPIO</TD>
			<td class="TituloMenuImpr" width="100">No.PROGRESIVO</TD>
			<td class="TituloMenuImpr" width="150">NOMBRE O IDENTIFICACIÓN DEL BIEN INMUEBLE, UBICACIÓN Y SUPERFICIE</TD>
			<td class="TituloMenuImpr" width="100">DESTINO</TD>
			<td class="TituloMenuImpr" width="100">ESTADO QUE GUARDAR EL INMUEBLE</TD>
			<td class="TituloMenuImpr" width="100">TIPO DE BIEN INMUEBLE</TD>
			<td class="TituloMenuImpr" width="100">TIPO DE ACCIÓN LEGAL</TD>
			<td class="TituloMenuImpr" width="150">OBSERVACIONES</TD>
		</TR>
		<%if (!vTempCampo1.equals("") || !vTempCampo2.equals("") || !vTempCampo3.equals("") || !vTempCampo4.equals("") || !vTempCampo5.equals("")){
				if (vTempCampo1.equals("")) vTempCampo1 = "&nbsp;";
				if (vTempCampo2.equals("")) vTempCampo2 = "&nbsp;";
				if (vTempCampo3.equals("")) vTempCampo3 = "&nbsp;";
				if (vTempCampo4.equals("")) vTempCampo4 = "&nbsp;";%>
		<TR valign="top" align="left" bgcolor="<%=sBackColor%>">
			<TD class="ContenidoImprL" width="100">&nbsp;<%=vTempCampo1%></TD>
			<TD class="ContenidoImpr" width="100"><%=vTempCampo2%></TD>
			<TD class="ContenidoImpr" width="150"><%=vTempCampo3%></TD>
			<TD class="ContenidoImpr" width="100"><%=vTempCampo4%></TD>
			<TD class="ContenidoImpr" width="100">&nbsp;</TD>
			<TD class="ContenidoImpr" width="100">&nbsp;</TD>
			<TD class="ContenidoImpr" width="100">&nbsp;</TD>
			<TD class="ContenidoImprR" width="150">&nbsp;<%=vTempCampo5%></TD>
		</TR>
<%
			}
		}
			iRowsCount = iRowsCount>=iMaxRowXPag?iRowMaxTemp:iRowsCount;
			
		} // FIN DEL FOR
//Si existe la paginacion debera repetir esto
		%>
	<tr><td colspan="8" class="ContenidoImprB">&nbsp;</td></tr>
	</TABLE>
</td>
</tr>
</table>
<%@include file="FooterAnexo.jsp"%>
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