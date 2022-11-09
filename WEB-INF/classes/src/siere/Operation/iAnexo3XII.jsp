<%@page import="com.consiss.util.tools.*"%>
<%@page import="com.gob.*"%>
<%@page import="java.util.*" %>
<%
/********************************************************************************************************
'Elaboro:	Jesus Limon
'Lugar:		Monterrey, NL
'Fecha:		29.Nov.2002
'Compañia:	CONSISS
'Ultima Modificacion: 10.Dic.2002
'By: Sigifredo Vazquez
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
String sAnexo = "III.12";
Anexo3XII oAnexo	= new Anexo3XII();
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
	<title>Entrega - Recepción : Anexo III.12 (Impresión)</title>
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
<div align="center">
<!-- Datos que se agregaran a la tabla  -->
<%@include file="HeaderAnexo.jsp"%>
<br>
<table border="0" cellspacing="0" cellpadding="0">
<tr>
	<!-- contenido -->
	<td valign="top">
	<TABLE cellPadding="0" cellSpacing="0" width="100%" BORDER="1" BORDERCOLOR="white">
		<TR><TD class="TituloParrafoImpr">RELACIÓN DE ANTICIPOS DE OBRAS POR AMORTIZAR</TD></TR>  
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
			<td width="100" rowspan="2" class="TituloMenuImpr">CLAVE</TD>
			<td width="100" rowspan="2" class="TituloMenuImpr">OBRA</TD>
			<td width="100" rowspan="2" class="TituloMenuImpr">No ONTRATO</TD>
			<td width="100" rowspan="2" class="TituloMenuImpr">NOMBRE DEL CONTRATISTA</TD>
			<td width="100" rowspan="2" class="TituloMenuImpr">COSTO TOTAL</TD>
			<td width="200" class="TituloMenuImpr" colspan="2">IMPORTE</td>
			<td width="100" rowspan="2" class="TituloMenuImpr">SALDO ANTICIPO POR AMORTIZAR</TD>
			<td width="100" rowspan="2" class="TituloMenuImpr">OBSERVACIONES</TD>
		</TR>
		<tr align="middle">
			<td width="100" class="TituloMenuImpr">ANTICIPOS OTORGADOS</td>
			<td width="100" class="TituloMenuImpr">ANTICIPOS AMORTIZADOS</td>
		</tr>
<%
if(!sEstatus.equals("0")){
		int vAntTipoOrigen=0;
		int intContador = 0;
		String sBackColor = "";
		
		oAnexo.GetAll(iIdFuncionario, m);
		
				
			// Variables para Paginacion
			int iLenCol = 0;
			int iRowsMax = 0; // POR REGISTRO
			int iRowsXCol = 0;
			int iRowsCount = 0;
			int iRowsAnt = 0; //posicion anterior
			int iMaxRowXPag = 24; //Numero de Renglones por Pagina
			// Variables para Paginacion
		
		
		
		for(int i=0;i<oAnexo.GetAll(iIdFuncionario, m);i++){
			// Variables para Paginacion
			int iRowMaxTemp = 1;
			int iRowCountTemp = 0;
			String vTempCampo1 = "";
			String vTempCampo2 = "";
			String vTempCampo3 = "";
			String vTempCampo4 = "";	
			// Variables para Paginacion		
			iRowsAnt = iRowsCount;
			
			int 	iIdRenglon				= oAnexo.GetIdRenglon(i)!=-1?			oAnexo.GetIdRenglon(i):0;
			String 	sClave					= oAnexo.GetClave(i)!=null?				oAnexo.GetClave(i)+"":"";
			String 	sObra					= oAnexo.GetObra(i)!=null?				oAnexo.GetObra(i)+"":"";
			//Primer Elemento que su contenido puede llevar a un salto de pagina
			iLenCol = sObra.length();
			iRowsXCol = 1;
			
			if(iLenCol > 13){
				if(iLenCol%13 == 0){
					iRowsXCol = iLenCol/13;
				}else{
					iRowsXCol = (iLenCol/13)+1;
				}
				
				String temp = sObra;
				sObra = "";
				iRowCountTemp = 0 ;
				for(int x=1;x<=(iRowsXCol);x++){
					int max = (13*x)<=iLenCol ? (13*x) : iLenCol;
					if( (x + iRowsAnt) <= iMaxRowXPag) {
						sObra = sObra + temp.substring((13*(x-1)), max) + "<br>";
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
			
			String 	iNoContrato				= oAnexo.GetNoContrato(i)!=null?			oAnexo.GetNoContrato(i):"";
			// Elemento que su contenido puede llevar a un salto de pagina
			iLenCol = iNoContrato.length();
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
				
				String temp = iNoContrato;
				iNoContrato = "";
				iRowCountTemp = 0 ;
				for(int x=1;x<=(iRowsXCol);x++){
					int max = (13*x)<=iLenCol ? (13*x) : iLenCol;
					if( (x + iRowsAnt) <= iMaxRowXPag) {
						iNoContrato = iNoContrato + temp.substring((13*(x-1)), max) + "<br>";	}
					else {
						iRowCountTemp = iRowCountTemp + 1;
						vTempCampo2 = vTempCampo2 + temp.substring((13*(x-1)), max) + "<br>";	}
				}
				iRowMaxTemp = iRowMaxTemp >= iRowCountTemp ? iRowMaxTemp : iRowCountTemp ;
			}else{
				iRowsXCol = 1;
			}	
			// Elemento que su contenido puede llevar a un salto de pagina
			String 	sNombreContratista		= oAnexo.GetNombreContratista(i)!=null?	oAnexo.GetNombreContratista(i)+"":"";
			// Elemento que su contenido puede llevar a un salto de pagina
			iLenCol = sNombreContratista.length();
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
				
				String temp = sNombreContratista;
				sNombreContratista = "";
				iRowCountTemp = 0 ;
				for(int x=1;x<=(iRowsXCol);x++){
					int max = (13*x)<=iLenCol ? (13*x) : iLenCol;
					if( (x + iRowsAnt) <= iMaxRowXPag) {
						sNombreContratista = sNombreContratista + temp.substring((13*(x-1)), max) + "<br>";	}
					else {
						iRowCountTemp = iRowCountTemp + 1;
						vTempCampo3 = vTempCampo3 + temp.substring((13*(x-1)), max) + "<br>";	}
				}
				iRowMaxTemp = iRowMaxTemp >= iRowCountTemp ? iRowMaxTemp : iRowCountTemp ;
			}else{
				iRowsXCol = 1;
			}	
			// Elemento que su contenido puede llevar a un salto de pagina
			/*float	fCostoTotal				= oAnexo.GetCostoTotal(i)!=-1?			oAnexo.GetCostoTotal(i):0;
			float	fAnticipoOtorgado		= oAnexo.GetAnticipoOtorgado(i)!=-1?	oAnexo.GetAnticipoOtorgado(i):0;
			float 	fAnticipoAmortizado 	= oAnexo.GetAnticipoAmortizado(i)!=-1?	oAnexo.GetAnticipoAmortizado(i):0;*/
			double	fCostoTotal				= new Double(oAnexo.GetCostoTotal(i)!=null?		oAnexo.GetCostoTotal(i):"0").doubleValue();
			double	fAnticipoOtorgado		= new Double(oAnexo.GetAnticipoOtorgado(i)!=null?	oAnexo.GetAnticipoOtorgado(i):"0").doubleValue();
			double 	fAnticipoAmortizado 	= new Double(oAnexo.GetAnticipoAmortizado(i)!=null?oAnexo.GetAnticipoAmortizado(i):"0").doubleValue();
			double 	fSaldoAnticipoAmortizar = new Double(oAnexo.GetSaldoAnticipoAmortizar(i)!=null?oAnexo.GetSaldoAnticipoAmortizar(i):"0").doubleValue();
			String 	sObservaciones 			= oAnexo.GetObservacion(i)!=null?		oAnexo.GetObservacion(i):"";
			// Elemento que su contenido puede llevar a un salto de pagina
			iLenCol = sObservaciones.length();
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
				
				String temp = sObservaciones;
				sObservaciones = "";
				iRowCountTemp = 0 ;
				for(int x=1;x<=(iRowsXCol);x++){
					int max = (13*x)<=iLenCol ? (13*x) : iLenCol;
					if( (x + iRowsAnt) <= iMaxRowXPag) {
						sObservaciones = sObservaciones + temp.substring((13*(x-1)), max) + "<br>";	}
					else {
						iRowCountTemp = iRowCountTemp + 1;
						vTempCampo4 = vTempCampo4 + temp.substring((13*(x-1)), max) + "<br>";	}
				}
				iRowMaxTemp = iRowMaxTemp >= iRowCountTemp ? iRowMaxTemp : iRowCountTemp ;
			}else{
				iRowsXCol = 1;
			}	
			// Elemento que su contenido puede llevar a un salto de pagina
			
			
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
			<TD class="ContenidoImpr"><%=sObra%></TD>
			<TD class="ContenidoImpr" align="right"><%=iNoContrato%></TD>
			<TD class="ContenidoImpr"><%=sNombreContratista%></TD>
			<TD class="ContenidoImpr" align="right"><%=myFormatter.format(fCostoTotal)%></TD>
			<TD class="ContenidoImpr" align="right"><%=myFormatter.format(fAnticipoOtorgado)%></TD>
			<TD class="ContenidoImpr" align="right"><%=myFormatter.format(fAnticipoAmortizado)%></TD>
			<TD class="ContenidoImpr" align="right"><%=myFormatter.format(fSaldoAnticipoAmortizar)%></TD>
			<TD class="ContenidoImprR"><%=sObservaciones%></TD>
		</TR>
	<%
		//Si existe la paginacion debera repetir esto		
		if ( (!vTempCampo1.equals("") || !vTempCampo2.equals("") || !vTempCampo3.equals("") || !vTempCampo4.equals("")) || iRowsCount>=iMaxRowXPag){
		%>
		
		<TR>
<TD colspan="9" class="ContenidoImprB">&nbsp;</TD>
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
		<TABLE cellPadding="0" cellSpacing="0" width="900" BORDER="1" BORDERCOLOR="WHITE">
		<TR align="middle">
					<TD colspan="11" class="TituloMenuImpr">RELACION DE OBRAS EN PROCESO<BR>
					ORIGEN DE LOS RECURSOS: <b><%=svar%></b><TD>
		 </tr>
		<TR align="middle">
			<td width="100" rowspan="2" class="TituloMenuImpr">CLAVE</TD>
			<td width="100" rowspan="2" class="TituloMenuImpr">OBRA</TD>
			<td width="100" rowspan="2" class="TituloMenuImpr">No ONTRATO</TD>
			<td width="100" rowspan="2" class="TituloMenuImpr">NOMBRE DEL CONTRATISTA</TD>
			<td width="100" rowspan="2" class="TituloMenuImpr">COSTO TOTAL</TD>
			<td width="200" class="TituloMenuImpr" colspan="2">IMPORTE</td>
			<td width="100" rowspan="2" class="TituloMenuImpr">SALDO ANTICIPO POR AMORTIZAR</TD>
			<td width="100" rowspan="2" class="TituloMenuImpr">OBSERVACIONES</TD>
		</TR>
		<tr align="middle">
			<td width="100" class="TituloMenuImpr">ANTICIPOS OTORGADOS</td>
			<td width="100" class="TituloMenuImpr">ANTICIPOS AMORTIZADOS</td>
		</tr>
		<%if (!vTempCampo1.equals("") || !vTempCampo2.equals("") || !vTempCampo3.equals("") || !vTempCampo4.equals("")){
				if (vTempCampo1.equals("")) vTempCampo1 = "&nbsp;";
				if (vTempCampo2.equals("")) vTempCampo2 = "&nbsp;";
				if (vTempCampo3.equals("")) vTempCampo3 = "&nbsp;";
				if (vTempCampo4.equals("")) vTempCampo4 = "&nbsp;";%>
		<TR valign="top" align="left" bgcolor="<%=sBackColor%>">
			<TD class="ContenidoImprL">&nbsp;</TD>
			<TD class="ContenidoImpr"><%=vTempCampo1%></TD>
			<TD class="ContenidoImpr" align="right"><%=vTempCampo2%></TD>
			<TD class="ContenidoImpr"><%=vTempCampo3%></TD>
			<TD class="ContenidoImpr" align="right">&nbsp;</TD>
			<TD class="ContenidoImpr" align="right">&nbsp;</TD>
			<TD class="ContenidoImpr" align="right">&nbsp;</TD>
			<TD class="ContenidoImpr" align="right">&nbsp;</TD>
			<TD class="ContenidoImprR"><%=vTempCampo4%></TD>
		</TR>
<%
			}
		}
			iRowsCount = iRowsCount>=iMaxRowXPag?iRowMaxTemp:iRowsCount;
			
		} // FIN DEL FOR
//Si existe la paginacion debera repetir esto		
		%>
<TR>
<TD colspan="9" class="ContenidoImprB">&nbsp;</TD>
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
