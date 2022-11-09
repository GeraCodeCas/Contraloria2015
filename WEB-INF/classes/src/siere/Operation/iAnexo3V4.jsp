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

String sAnexo = "III.5.4";
Anexo3V4	 oAnexo3V4	 	= new Anexo3V4();
String sPath = "../";
int numpag = 0;
int numtot = 0;
int iIdAnexo = oAnexo3V4.GetIdAnexo();
AnexoEstatus	oAnexoEstatus		= new AnexoEstatus();
oAnexoEstatus.Get(iIdFuncionario, iIdAnexo);
String sEstatus = oAnexoEstatus.GetEstatus();
%>
<html>
<head>
	<title>Entrega - Recepción : Anexo III.5.4 (Impresión)</title>
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
	<TR><TD class="TituloParrafoImpr">RELACIÓN DE EQUIPO DE TRANSPORTE Y MAQUINARIA</TD></TR>  
	</TABLE>
	<TABLE cellPadding="0" cellSpacing="0" width="100%" BORDER="1" BORDERCOLOR="white">
		<TR align="middle">
			<td class="TituloMenuImpr" colspan="2">CÓDIGO<br>PROGRAMATICO</TD>
			<td class="TituloMenuImpr" rowspan="2" width="80">MARCA</TD>
			<td class="TituloMenuImpr" rowspan="2" width="80">MODELO</TD>
			<td class="TituloMenuImpr" rowspan="2" width="80">COLOR</TD>
			<td class="TituloMenuImpr" rowspan="2" width="80">PLACAS</TD>
			<td class="TituloMenuImpr" rowspan="2" width="100">TIPO</TD>
			<td class="TituloMenuImpr" rowspan="2" width="80">SERIE<BR>MOTOR</TD>
			<td class="TituloMenuImpr" rowspan="2" width="100">NOMBRE Y CARGO DEL<BR>RESGUARDANTE</TD>
			<td class="TituloMenuImpr" rowspan="2" width="140">OBSERVACIONES</TD>
		</TR>
		<TR align="middle">
			<td class="TituloMenuImpr" width="80">No.Inv.</td>
			<td class="TituloMenuImpr" width="80">No.Eco.</td>
		</TR><%
if(!sEstatus.equals("0")){
		int intContador = 0;
		String sBackColor = "";
		oAnexo3V4.GetAll(iIdFuncionario);
		// Variables para Paginacion
		int iLenCol = 0;
		int iRowsMax = 0; // POR REGISTRO
		int iRowsXCol = 0;
		int iRowsCount = 0;
		int iRowsAnt = 0; //posicion anterior
		int iMaxRowXPag = 25; //Numero de Renglones por Pagina
		// Variables para Paginacion
		
		for(int i=0;i<oAnexo3V4.GetAll(iIdFuncionario);i++){
		// Variables para Paginacion
		int iRowMaxTemp = 1;
		int iRowCountTemp = 0;
		String vTempCampo1 = "";
		String vTempCampo2 = "";
		String vTempCampo3 = "";
		String vTempCampo4 = "";
		String vTempCampo5 = "";
		String vTempCampo6 = "";
		String vTempCampo7 = "";
		// Variables para Paginacion
		iRowsAnt = iRowsCount;
		
		String vNoInventario = oAnexo3V4.GetNoInventario(i);
		String vNoEconomico = oAnexo3V4.GetNoEconomico(i);
		String vMarca = oAnexo3V4.GetMarca(i);
		//Primer Elemento que su contenido puede llevar a un salto de pagina
		iLenCol = vMarca.length();
		iRowsXCol = 1;
		if(iLenCol > 10){
			if(iLenCol%10 == 0){
				iRowsXCol = iLenCol/10;
			}else{
				iRowsXCol = (iLenCol/10)+1;
			}
			String temp = vMarca;
			vMarca = "";
			iRowCountTemp = 0 ;
			for(int x=1;x<=(iRowsXCol);x++){
				int max = (10*x)<=iLenCol ? (10*x) : iLenCol;
				if( (x + iRowsAnt) <= iMaxRowXPag) {
					vMarca = vMarca + temp.substring((10*(x-1)), max) + "<br>";
					}
				else {
					iRowCountTemp = iRowCountTemp + 1;
					vTempCampo1 = vTempCampo1 + temp.substring((10*(x-1)), max) + "<br>";
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
		
		String vModelo = oAnexo3V4.GetModelo(i);
		// Elemento que su contenido puede llevar a un salto de pagina
		iLenCol = vMarca.length();
		if(iLenCol > 10){
			if(iLenCol%10 == 0){
				iRowsXCol = iLenCol/10;
			}else{
				iRowsXCol = (iLenCol/10)+1;
			}
			if (iRowsXCol > iRowsMax){
			    iRowsCount = iRowsXCol - iRowsMax + iRowsCount;
				iRowsMax = iRowsXCol;
			}
			String temp = vMarca;
			vMarca = "";
			iRowCountTemp = 0 ;
			for(int x=1;x<=(iRowsXCol);x++){
				int max = (10*x)<=iLenCol ? (10*x) : iLenCol;
				if( (x + iRowsAnt) <= iMaxRowXPag) {
					vMarca = vMarca + temp.substring((10*(x-1)), max) + "<br>";	}
				else {
					iRowCountTemp = iRowCountTemp + 1;
					vTempCampo2 = vTempCampo2 + temp.substring((10*(x-1)), max) + "<br>";	}
			}
			iRowMaxTemp = iRowMaxTemp >= iRowCountTemp ? iRowMaxTemp : iRowCountTemp ;
		}else{
			iRowsXCol = 1;
		}
		// Elemento que su contenido puede llevar a un salto de pagina
		
		String vColor = oAnexo3V4.GetColor(i);
		// Elemento que su contenido puede llevar a un salto de pagina
		iLenCol = vColor.length();
		if(iLenCol > 10){
			if(iLenCol%10 == 0){
				iRowsXCol = iLenCol/10;
			}else{
				iRowsXCol = (iLenCol/10)+1;
			}
			if (iRowsXCol > iRowsMax){
			    iRowsCount = iRowsXCol - iRowsMax + iRowsCount;
				iRowsMax = iRowsXCol;
			}
			String temp = vColor;
			vColor = "";
			iRowCountTemp = 0 ;
			for(int x=1;x<=(iRowsXCol);x++){
				int max = (10*x)<=iLenCol ? (10*x) : iLenCol;
				if( (x + iRowsAnt) <= iMaxRowXPag) {
					vColor = vColor + temp.substring((10*(x-1)), max) + "<br>";	}
				else {
					iRowCountTemp = iRowCountTemp + 1;
					vTempCampo3 = vTempCampo3 + temp.substring((10*(x-1)), max) + "<br>";	}
			}
			iRowMaxTemp = iRowMaxTemp >= iRowCountTemp ? iRowMaxTemp : iRowCountTemp ;
		}else{
			iRowsXCol = 1;
		}
		// Elemento que su contenido puede llevar a un salto de pagina
		
		String vPlacas = oAnexo3V4.GetPlacas(i);
		// Elemento que su contenido puede llevar a un salto de pagina
		iLenCol = vPlacas.length();
		if(iLenCol > 10){
			if(iLenCol%10 == 0){
				iRowsXCol = iLenCol/10;
			}else{
				iRowsXCol = (iLenCol/10)+1;
			}
			if (iRowsXCol > iRowsMax){
			    iRowsCount = iRowsXCol - iRowsMax + iRowsCount;
				iRowsMax = iRowsXCol;
			}
			String temp = vPlacas;
			vPlacas = "";
			iRowCountTemp = 0 ;
			for(int x=1;x<=(iRowsXCol);x++){
				int max = (10*x)<=iLenCol ? (10*x) : iLenCol;
				if( (x + iRowsAnt) <= iMaxRowXPag) {
					vPlacas = vPlacas + temp.substring((10*(x-1)), max) + "<br>";	}
				else {
					iRowCountTemp = iRowCountTemp + 1;
					vTempCampo4 = vTempCampo4 + temp.substring((10*(x-1)), max) + "<br>";	}
			}
			iRowMaxTemp = iRowMaxTemp >= iRowCountTemp ? iRowMaxTemp : iRowCountTemp ;
		}else{
			iRowsXCol = 1;
		}
		// Elemento que su contenido puede llevar a un salto de pagina
		
		//String vDesTipo = oAnexo3V4.GetDesTipo(oAnexo3V4.GetTipoPos(oAnexo3V4.GetTipo(i)));
		String vDesTipo = "";
		try{vDesTipo = oAnexo3V4.GetDesTipo(oAnexo3V4.GetTipoPos(oAnexo3V4.GetTipo(i)));} 
		catch(Throwable e){
			System.out.println("iAnexo3v4.GetTipo: " + e + " " + oAnexo3V4.GetTipo(i)); 
			vDesTipo = oAnexo3V4.GetDesTipo(0);}
		
		String vSerie = oAnexo3V4.GetSerie(i);
		// Elemento que su contenido puede llevar a un salto de pagina
		iLenCol = vSerie.length();
		if(iLenCol > 10){
			if(iLenCol%10 == 0){
				iRowsXCol = iLenCol/10;
			}else{
				iRowsXCol = (iLenCol/10)+1;
			}
			if (iRowsXCol > iRowsMax){
			    iRowsCount = iRowsXCol - iRowsMax + iRowsCount;
				iRowsMax = iRowsXCol;
			}
			String temp = vSerie;
			vSerie = "";
			iRowCountTemp = 0 ;
			for(int x=1;x<=(iRowsXCol);x++){
				int max = (10*x)<=iLenCol ? (10*x) : iLenCol;
				if( (x + iRowsAnt) <= iMaxRowXPag) {
					vSerie = vSerie + temp.substring((10*(x-1)), max) + "<br>";	}
				else {
					iRowCountTemp = iRowCountTemp + 1;
					vTempCampo5 = vTempCampo5 + temp.substring((10*(x-1)), max) + "<br>";	}
			}
			iRowMaxTemp = iRowMaxTemp >= iRowCountTemp ? iRowMaxTemp : iRowCountTemp ;
		}else{
			iRowsXCol = 1;
		}
		// Elemento que su contenido puede llevar a un salto de pagina
		
		String vResguardante = oAnexo3V4.GetResguardante(i);
		// Elemento que su contenido puede llevar a un salto de pagina
		iLenCol = vResguardante.length();
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
			String temp = vResguardante;
			vResguardante = "";
			iRowCountTemp = 0 ;
			for(int x=1;x<=(iRowsXCol);x++){
				int max = (13*x)<=iLenCol ? (13*x) : iLenCol;
				if( (x + iRowsAnt) <= iMaxRowXPag) {
					vResguardante = vResguardante + temp.substring((13*(x-1)), max) + "<br>";	}
				else {
					iRowCountTemp = iRowCountTemp + 1;
					vTempCampo6 = vTempCampo6 + temp.substring((13*(x-1)), max) + "<br>";	}
			}
			iRowMaxTemp = iRowMaxTemp >= iRowCountTemp ? iRowMaxTemp : iRowCountTemp ;
		}else{
			iRowsXCol = 1;
		}
		// Elemento que su contenido puede llevar a un salto de pagina
		
		String vObservaciones = oAnexo3V4.GetObservaciones(i);
		// Elemento que su contenido puede llevar a un salto de pagina
		iLenCol = vObservaciones.length();
		if(iLenCol > 18){
			if(iLenCol%18 == 0){
				iRowsXCol = iLenCol/18;
			}else{
				iRowsXCol = (iLenCol/18)+1;
			}
			if (iRowsXCol > iRowsMax){
			    iRowsCount = iRowsXCol - iRowsMax + iRowsCount;
				iRowsMax = iRowsXCol;
			}
			String temp = vObservaciones;
			vObservaciones = "";
			iRowCountTemp = 0 ;
			for(int x=1;x<=(iRowsXCol);x++){
				int max = (18*x)<=iLenCol ? (18*x) : iLenCol;
				if( (x + iRowsAnt) <= iMaxRowXPag) {
					vObservaciones = vObservaciones + temp.substring((18*(x-1)), max) + "<br>";	}
				else {
					iRowCountTemp = iRowCountTemp + 1;
					vTempCampo7 = vTempCampo7 + temp.substring((18*(x-1)), max) + "<br>";	}
			}
			iRowMaxTemp = iRowMaxTemp >= iRowCountTemp ? iRowMaxTemp : iRowCountTemp ;
		}else{
			iRowsXCol = 1;
		}
		// Elemento que su contenido puede llevar a un salto de pagina
		
		
			intContador = intContador + 1;
			if (intContador%2 == 0){	sBackColor = "#ffffff";	}
			else{						sBackColor = "#dddddd"; }
		 %>
		<TR valign="top" align="left" bgcolor="<%=sBackColor%>");">
			<TD class="ContenidoImprL" width="80"><%=vNoInventario%></TD>
			<TD class="ContenidoImpr" width="80"><%=vNoEconomico%></TD>
			<TD class="ContenidoImpr" width="80"><%=vMarca%></TD>
			<TD class="ContenidoImpr" width="80"><%=vModelo%></TD>
			<TD class="ContenidoImpr" width="80"><%=vColor%></TD>
        	<TD class="ContenidoImpr" width="80"><%=vPlacas%></TD>
			<TD class="ContenidoImpr" width="100"><%=vDesTipo%></TD>
			<TD class="ContenidoImpr" width="80"><%=vSerie%></TD>
			<TD class="ContenidoImpr" width="100"><%=vResguardante%></TD>
			<TD class="ContenidoImprr" width="140"><%=vObservaciones%></TD>
		</TR>
		<%
		if ( (!vTempCampo1.equals("") || !vTempCampo2.equals("") || !vTempCampo3.equals("") || !vTempCampo4.equals("") || !vTempCampo5.equals("") || !vTempCampo6.equals("") || !vTempCampo7.equals("")) 
		|| iRowsCount>=iMaxRowXPag ){
		%>
		<tr><td colspan="10" class="ContenidoImprB">&nbsp;</td></tr>
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
	<TR><TD class="TituloParrafoImpr">RELACIÓN DE EQUIPO DE TRANSPORTE Y MAQUINARIA</TD></TR>  
	</TABLE>
	<TABLE cellPadding="0" cellSpacing="0" width="100%" BORDER="1" BORDERCOLOR="white">
		<TR align="middle">
			<td class="TituloMenuImpr" colspan="2">CÓDIGO<br>PROGRAMATICO</TD>
			<td class="TituloMenuImpr" rowspan="2" width="80">MARCA</TD>
			<td class="TituloMenuImpr" rowspan="2" width="80">MODELO</TD>
			<td class="TituloMenuImpr" rowspan="2" width="80">COLOR</TD>
			<td class="TituloMenuImpr" rowspan="2" width="80">PLACAS</TD>
			<td class="TituloMenuImpr" rowspan="2" width="100">TIPO</TD>
			<td class="TituloMenuImpr" rowspan="2" width="80">SERIE<BR>MOTOR</TD>
			<td class="TituloMenuImpr" rowspan="2" width="100">NOMBRE Y CARGO DEL<BR>RESGUARDANTE</TD>
			<td class="TituloMenuImpr" rowspan="2" width="140">OBSERVACIONES</TD>
		</TR>
		<TR align="middle">
			<td class="TituloMenuImpr" width="80">No.Inv.</td>
			<td class="TituloMenuImpr" width="80">No.Eco.</td>
		</TR>
		<%if (!vTempCampo1.equals("") || !vTempCampo2.equals("") || !vTempCampo3.equals("") || !vTempCampo4.equals("") || !vTempCampo5.equals("") || !vTempCampo6.equals("") || !vTempCampo7.equals("")){
				if (vTempCampo1.equals("")) vTempCampo1 = "&nbsp;";
				if (vTempCampo2.equals("")) vTempCampo2 = "&nbsp;";
				if (vTempCampo3.equals("")) vTempCampo3 = "&nbsp;";
				if (vTempCampo4.equals("")) vTempCampo4 = "&nbsp;";
				if (vTempCampo5.equals("")) vTempCampo5 = "&nbsp;";
				if (vTempCampo6.equals("")) vTempCampo6 = "&nbsp;";
				if (vTempCampo7.equals("")) vTempCampo7 = "&nbsp;";%>
		<TR valign="top" align="left" bgcolor="<%=sBackColor%>");">
			<TD class="ContenidoImprL" width="80">&nbsp;</TD>
			<TD class="ContenidoImpr" width="80">&nbsp;</TD>
			<TD class="ContenidoImpr" width="80"><%=vTempCampo1%></TD>
			<TD class="ContenidoImpr" width="80"><%=vTempCampo2%></TD>
			<TD class="ContenidoImpr" width="80"><%=vTempCampo3%></TD>
        	<TD class="ContenidoImpr" width="80"><%=vTempCampo4%></TD>
			<TD class="ContenidoImpr" width="100">&nbsp;</TD>
			<TD class="ContenidoImpr" width="80"><%=vTempCampo5%></TD>
			<TD class="ContenidoImpr" width="100"><%=vTempCampo6%></TD>
			<TD class="ContenidoImprr" width="140"><%=vTempCampo7%></TD>
		</TR>
	<%
			}
		}
			iRowsCount = iRowsCount>=iMaxRowXPag?iRowMaxTemp:iRowsCount;
			
		} // FIN DEL FOR
//Si existe la paginacion debera repetir esto
		%>
		<tr><td colspan="10" class="ContenidoImprB">&nbsp;</td></tr>
	</TABLE>
</td>
</tr>ANEXAR RESGUARDOS CORRESPONDIENTES SEGUN RELACIÓN
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