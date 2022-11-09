<%@page import="com.consiss.util.tools.*"%>
<%@page import="com.gob.*"%>
<%@page import="java.util.*" %>
<%

/********************************************************************************************************
'Elaboro:	Jesus Limon
'Lugar:		Monterrey, NL
'Fecha:		29.Nov.2002
'Compañia:	CONSISS
'Ultima Modificacion:10.Dic.2002
'By:Sigifredo Vazquez
'Ultima Modificacion:16.Dic.2002
'By:Claudia Sandoval
'Ultima Modificacion:9.Ene.2003
'By:Julio Espinosa
'
'Distintas opciones:
'
'********************************************************************************************************/
%>
<%
//Valida la permanencia del usuario en session
if ((String)session.getValue("ok")!="Consiss")
			response.sendRedirect("Error.html");

//String	sCodigo = request.getParameter("sCodigo")!= null ? request.getParameter("sCodigo"): "";
String	vsIdTipoOrigen = request.getParameter("sIdTipoOrigen")!= null ? request.getParameter("sIdTipoOrigen"): "0";
int sIdTipoOrigen = java.lang.Integer.parseInt(vsIdTipoOrigen);
int iIdFuncionario =  java.lang.Integer.parseInt(
			(request.getParameter("iIdFuncionario")!= null?request.getParameter("iIdFuncionario"):"0") );

java.text.DecimalFormat myFormatter = new java.text.DecimalFormat("###,##0.00");
String sAnexo = "III.10";
Anexo3X oAnexo	= new Anexo3X();
int iIdAnexo = oAnexo.GetIdAnexo();
String sPath = "../";

AnexoEstatus	oAnexoEstatus		= new AnexoEstatus();
oAnexoEstatus.Get(iIdFuncionario, iIdAnexo);
String sEstatus 		= oAnexoEstatus.GetEstatus();
String sOrigen			= oAnexoEstatus.GetObservacion();
int numpag =0;
int numtot = 0;
%>
<html>
<head>
	<title>Entrega - Recepción : Anexo III.10 (Impresión)</title>
	<link rel="stylesheet" type="text/css" href="<%=sPath%>Styles/Gobierno.css">
</head>
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
<div align="center">
<!-- Datos que se agregaran a la tabla  -->
<%@include file="HeaderAnexo.jsp"%>
<br>
<table border="0" cellspacing="0" cellpadding="0">
<tr>
	<!-- contenido -->
	<td valign="top">
		<TABLE cellPadding="0" cellSpacing="0" width="900" BORDER="1" BORDERCOLOR="white">
		<TR><TD class="TituloParrafoImpr">RELACIÓN DE OBRAS EN PROCESO</TD></TR>  
		</TABLE>
<%
oAnexo.GetTipoOrigenDesc(iIdFuncionario);

for(int n=0;n<oAnexo.GetTipoOrigenDesc(iIdFuncionario);n++){
			int m = oAnexo.GetTipoNvo(n);
			String 	svar		 		= oAnexo.GetTipoDesc(n);%>
			
			
	<TABLE cellPadding="0" cellSpacing="0" width="900" BORDER="1" BORDERCOLOR="WHITE">
		<TR align="middle">
					<TD colspan="11" class="TituloMenuImpr">RELACION DE OBRAS EN PROCESO<BR>
					ORIGEN DE LOS RECURSOS: <b><%=svar%></b><TD>
		 </tr>
		<TR align="middle">
			<td rowspan="2" width="60" class="TituloMenuImpr">CLAVE</TD>
			<td rowspan="2" width="100" class="TituloMenuImpr">PROGRAMA<br>SUBPROGRAMA<br>OBRA LOCALIZACIÓN</TD>
			<td rowspan="2" width="110" class="TituloMenuImpr">CONTRATO ó ADMÓN</TD>
			<td rowspan="2" width="85" class="TituloMenuImpr">MONTO TOTAL APROBADO</TD>
			<td rowspan="2" width="85" class="TituloMenuImpr">MONTO TOTAL EJERCIDO</TD>
			<td rowspan="2" width="100"  class="TituloMenuImpr">DIFERENCIA</TD>
			<td class="TituloMenuImpr"  width="160" colspan="2">FECHA</td>
			<td class="TituloMenuImpr"  width="100" colspan="2">% AVANCE</td>
			<td rowspan="2" width="100"  class="TituloMenuImpr">OBSERVACIONES</TD>
		</TR>
		<tr align="center">
			<td width="80" class="TituloMenuImpr">INICIO</td>
			<td width="80" class="TituloMenuImpr">TERMINO</td>
			<td width="50" class="TituloMenuImpr">FÍSICO</td>
			<td width="50" class="TituloMenuImpr">FINANC.</td>
		</tr>
<%
if(!sEstatus.equals("0")){
		int vAntTipoOrigen=0;
		int intContador = 0;
		String sBackColor = "";
		
		oAnexo.GetAll(iIdFuncionario,m);
			
			
			// Variables para Paginacion
			int iLenCol = 0;
			int iRowsMax = 0; // POR REGISTRO
			int iRowsXCol = 0;
			int iRowsCount = 0;
			int iRowsAnt = 0; //posicion anterior
			int iMaxRowXPag = 10; //Numero de Renglones por Pagina
			// Variables para Paginacion
		
		
		for(int i=0;i<oAnexo.GetAll(iIdFuncionario,m);i++){
			// Variables para Paginacion
			int iRowMaxTemp = 1;
			int iRowCountTemp = 0;
			String vTempCampo1 = "";	
			// Variables para Paginacion		
			iRowsAnt = iRowsCount;
			
			int 	iIdRenglon			= oAnexo.GetIdRenglon(i)!=-1?			oAnexo.GetIdRenglon(i):0;
			String 	sClave				= oAnexo.GetClave(i)!=null?				oAnexo.GetClave(i)+"":"";
			String 	sPrograma			= oAnexo.GetPrograma(i)!=null?			oAnexo.GetPrograma(i)+"":"";
			int 	iTipo		 		= oAnexo.GetTipo(i)!=-1?				oAnexo.GetTipo(i):0;
			String 	sTipo		 		= oAnexo.GetTipoDescripcion(i);
			String 	iFechaInicial 		= oAnexo.GetFechaInicial(i)!=null?		oAnexo.GetFechaInicial(i):"";
			String 	iFechaFinal 		= oAnexo.GetFechaFinal(i)!=null?		oAnexo.GetFechaFinal(i):"";
			/*float	fMontoAprobado		= oAnexo.GetMontoAprobado(i)!=-1?		oAnexo.GetMontoAprobado(i):0;
			float	fMontoEjercido		= oAnexo.GetMontoEjercido(i)!=-1?		oAnexo.GetMontoEjercido(i):0;*/
			double	nMontoAprobado		= new Double(oAnexo.GetMontoAprobado(i)!=null?		oAnexo.GetMontoAprobado(i):"0").doubleValue();
			double	nMontoEjercido		= new Double(oAnexo.GetMontoEjercido(i)!=null?		oAnexo.GetMontoEjercido(i):"0").doubleValue();
			String 	sAvanceFisico		= oAnexo.GetAvanceFisico(i)!=null?		oAnexo.GetAvanceFisico(i)+"":"";
			String 	sAvanceFinanciado	= oAnexo.GetAvanceFinanciado(i)!=null?	oAnexo.GetAvanceFinanciado(i)+"":"";
			String 	sObservaciones 		= oAnexo.GetObservacion(i)!=null?		oAnexo.GetObservacion(i):"";
			//Primer Elemento que su contenido puede llevar a un salto de pagina
			iLenCol = sObservaciones.length();
			iRowsXCol = 1;
			
			if(iLenCol > 13){
				if(iLenCol%13 == 0){
					iRowsXCol = iLenCol/13;
				}else{
					iRowsXCol = (iLenCol/13)+1;
				}
				
				String temp = sObservaciones;
				sObservaciones = "";
				iRowCountTemp = 0 ;
				for(int x=1;x<=(iRowsXCol);x++){
					int max = (13*x)<=iLenCol ? (13*x) : iLenCol;
					if( (x + iRowsAnt) <= iMaxRowXPag) {
						sObservaciones = sObservaciones + temp.substring((13*(x-1)), max) + "<br>";
						}
					else {
						iRowCountTemp = iRowCountTemp + 1;
						vTempCampo1 = vTempCampo1 + temp.substring((13*(x-1)), max) + "<br>";
						}
					//System.out.println("(x + iRowsAnt):" + (x + iRowsAnt) + " iMaxRowXPag:" + iMaxRowXPag + " vTempCampo1:" + vTempCampo1);
				}
				iRowMaxTemp = iRowMaxTemp >= iRowCountTemp ? iRowMaxTemp : iRowCountTemp ;
			}else{
				iRowsMax = 1;
			}	
			
			iRowsMax = iRowsXCol;
			iRowsCount = iRowsMax + iRowsCount;
			
			iRowsMax = iRowsXCol;
			
			// Primer Elemento que su contenido puede llevar a un salto de pagina
			
			int 	iTipoOrigen		 		= oAnexo.GetTipoOrigen(i)!=-1?				oAnexo.GetTipoOrigen(i):0;
			String 	sTipoOrigen		 		= oAnexo.GetTipoOrigenDescripcion(i);
			
			intContador = intContador + 1;
			if(intContador%2 == 0){
				sBackColor = "#ffffff";
			}else{
				sBackColor = "#dddddd";
			}
%>
		<TR valign="top" align="left" bgcolor="<%=sBackColor%>">
			<TD class="ContenidoImprL" align="center"><%=sClave%></TD>
			<TD class="ContenidoImpr"><%=sPrograma%></TD>
			<TD class="ContenidoImpr"><%=sTipo%></TD>
			<TD class="ContenidoImpr" align="right"><%=myFormatter.format(nMontoAprobado)%></TD>
			<TD class="ContenidoImpr" align="right"><%=myFormatter.format(nMontoEjercido)%></TD>
			<TD class="ContenidoImpr" align="right"><%=myFormatter.format(nMontoAprobado - nMontoEjercido)%></TD>
			<TD class="ContenidoImpr" align="center"><%=iFechaInicial%></TD>
			<TD class="ContenidoImpr" align="center"><%=iFechaFinal%></TD>
			<TD class="ContenidoImpr" align="center"><%=sAvanceFisico%></TD>
			<TD class="ContenidoImpr" align="center"><%=sAvanceFinanciado%></TD>
			<TD class="ContenidoImprR"><%=sObservaciones%></TD>
		</TR>
		
<%
		//Si existe la paginacion debera repetir esto		
		if ( !vTempCampo1.equals("") || iRowsCount>=iMaxRowXPag){
		%>
	<TR>
<TD colspan="11" class="ContenidoImprB">&nbsp;</TD>
		</TR>
	</TABLE>
</td>
	<!-- contenido -->
</tr>
</table>
<!-- Paginacion -->
<p style="page-break-after:always"></p>
<%@include file="HeaderAnexo.jsp"%>
<br>
<table border="0" cellspacing="0" cellpadding="0">
<tr>
	<!-- contenido -->
	<td valign="top">
	<TABLE cellPadding="0" cellSpacing="0" width="900" BORDER="1" BORDERCOLOR="white">
		<TR><TD class="TituloParrafoImpr">RELACIÓN DE OBRAS EN PROCESO</TD></TR>  
		</TABLE>
	<TABLE cellPadding="0" cellSpacing="0" width="900" BORDER="1" BORDERCOLOR="WHITE">
	
		<TR align="middle">
			<TD colspan="11" class="TituloMenuImpr">RELACION DE OBRAS EN PROCESO<BR>
					ORIGEN DE LOS RECURSOS: <b><%=svar%></b><TD>
		</tr>
		<TR align="middle">
			<td rowspan="2" width="60" class="TituloMenuImpr">CLAVE</TD>
			<td rowspan="2" width="100" class="TituloMenuImpr">PROGRAMA<br>SUBPROGRAMA<br>OBRA LOCALIZACIÓN</TD>
			<td rowspan="2" width="110" class="TituloMenuImpr">CONTRATO ó ADMÓN</TD>
			<td rowspan="2" width="85" class="TituloMenuImpr">MONTO TOTAL APROBADO</TD>
			<td rowspan="2" width="85" class="TituloMenuImpr">MONTO TOTAL EJERCIDO</TD>
			<td rowspan="2" width="100"  class="TituloMenuImpr">DIFERENCIA</TD>
			<td class="TituloMenuImpr"  width="160" colspan="2">FECHA</td>
			<td class="TituloMenuImpr"  width="100" colspan="2">% AVANCE</td>
			<td rowspan="2" width="100"  class="TituloMenuImpr">OBSERVACIONES</TD>
		</TR>
		<tr align="center">
			<td width="80" class="TituloMenuImpr">INICIO</td>
			<td width="80" class="TituloMenuImpr">TERMINO</td>
			<td width="50" class="TituloMenuImpr">FÍSICO</td>
			<td width="50" class="TituloMenuImpr">FINANC.</td>
		</tr>
		<%if (!vTempCampo1.equals("")){%>
<TR valign="top" align="left" bgcolor="<%=sBackColor%>">
			<TD class="ContenidoImprL">&nbsp;</TD>
			<TD class="ContenidoImpr">&nbsp;</TD>
			<TD class="ContenidoImpr">&nbsp;</TD>
			<TD class="ContenidoImpr">&nbsp;</TD>
			<TD class="ContenidoImpr">&nbsp;</TD>
			<TD class="ContenidoImpr">&nbsp;</TD>
			<TD class="ContenidoImpr">&nbsp;</TD>
			<TD class="ContenidoImpr">&nbsp;</TD>
			<TD class="ContenidoImpr">&nbsp;</TD>
			<TD class="ContenidoImpr">&nbsp;</TD>
			<TD class="ContenidoImprR"><%=vTempCampo1%></TD>
		</TR>
<%
			}
		}
			iRowsCount = iRowsCount>=iMaxRowXPag?iRowMaxTemp:iRowsCount;
			
		} // FIN DEL FOR
//Si existe la paginacion debera repetir esto		
		%>
<TR>
<TD colspan="11" class="ContenidoImprB">&nbsp;</TD>
		</TR>
	</TABLE>

</td>
<!-- contenido -->
</tr>
</table>
<%@include file="FooterAnexo.jsp"%>
</div> 
</body>
</html>
<%
} else {
%>
</TABLE>
	<TABLE width="900">
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
<%
}

if( oAnexo.GetTipoOrigenDesc(iIdFuncionario)  > n + 1 ){%>
<p style="page-break-after:always"></p>
<%@include file="HeaderAnexo.jsp"%>
<br>
<%
}
	} // FIN DEL FOR%>	
