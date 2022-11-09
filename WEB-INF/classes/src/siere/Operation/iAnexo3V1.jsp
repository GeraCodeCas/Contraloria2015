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
String sAnexo = "III.5.1";
Anexo3V1	 oAnexo3V1	 	= new Anexo3V1();
String sPath = "../";
int numpag = 0;
int numtot = 0;
int iIdAnexo = oAnexo3V1.GetIdAnexo();
AnexoEstatus	oAnexoEstatus		= new AnexoEstatus();
oAnexoEstatus.Get(iIdFuncionario, iIdAnexo);
String sEstatus = oAnexoEstatus.GetEstatus();
%>
<html>
<head>
	<title>Entrega - Recepción : Anexo III.5.1 (Impresión)</title>
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
	<TR><TD class="TituloParrafoImpr">MOBILIARIO Y EQUIPO DE OFICINA</TD></TR>  
	</TABLE>
	<TABLE cellPadding="0" cellSpacing="0" width="100%" BORDER="1" BORDERCOLOR="white">
		<TR align="middle">
			<td class="TituloMenuImpr" width="80">No. DE<br>INVENTARIO</TD>
			<td class="TituloMenuImpr" width="100">DESCRIPCION<br>DEL ARTICULO</TD>
			<td class="TituloMenuImpr" width="80">MARCA</TD>
			<td class="TituloMenuImpr" width="80">MODELO</TD>
			<td class="TituloMenuImpr" width="80">SERIE</TD>
			<td class="TituloMenuImpr" width="120">VALOR</TD>
			<td class="TituloMenuImpr" width="100">UBICACION</TD>
			<td class="TituloMenuImpr" width="180">RESGUARDANTE Y REFERENCIA<br>DEL RESGUARDO</TD>
			<td class="TituloMenuImpr" width="100">Tipo</TD>
		</TR><%
if(!sEstatus.equals("0")){
		int intContador = 0;
		String sBackColor = "";
		oAnexo3V1.GetAll(iIdFuncionario);
		// Variables para Paginacion
		int iLenCol = 0;
		int iRowsMax = 0; // POR REGISTRO
		int iRowsXCol = 0;
		int iRowsCount = 0;
		int iRowsAnt = 0; //posicion anterior
		int iMaxRowXPag = 25; //Numero de Renglones por Pagina
		// Variables para Paginacion
		
		for(int i=0;i<oAnexo3V1.GetAll(iIdFuncionario);i++){
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
		String vTempCampo8 = "";
		// Variables para Paginacion
		iRowsAnt = iRowsCount;
		
		String vNoInventario = oAnexo3V1.GetNoInventario(i)!=null?oAnexo3V1.GetNoInventario(i):"";
		//Primer Elemento que su contenido puede llevar a un salto de pagina
		iLenCol = vNoInventario.length();
		iRowsXCol = 1;
		if(iLenCol > 10){
			if(iLenCol%10 == 0){
				iRowsXCol = iLenCol/10;
			}else{
				iRowsXCol = (iLenCol/10)+1;
			}
			String temp = vNoInventario;
			vNoInventario = "";
			iRowCountTemp = 0 ;
			for(int x=1;x<=(iRowsXCol);x++){
				int max = (10*x)<=iLenCol ? (10*x) : iLenCol;
				if( (x + iRowsAnt) <= iMaxRowXPag) {
					vNoInventario = vNoInventario + temp.substring((10*(x-1)), max) + "<br>";
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
		
		String vDescripcion = oAnexo3V1.GetDescripcion(i)!=null?oAnexo3V1.GetDescripcion(i):"";
		// Elemento que su contenido puede llevar a un salto de pagina
		iLenCol = vDescripcion.length();
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
			String temp = vDescripcion;
			vDescripcion = "";
			iRowCountTemp = 0 ;
			for(int x=1;x<=(iRowsXCol);x++){
				int max = (13*x)<=iLenCol ? (13*x) : iLenCol;
				if( (x + iRowsAnt) <= iMaxRowXPag) {
					vDescripcion = vDescripcion + temp.substring((13*(x-1)), max) + "<br>";	}
				else {
					iRowCountTemp = iRowCountTemp + 1;
					vTempCampo2 = vTempCampo2 + temp.substring((13*(x-1)), max) + "<br>";	}
			}
			iRowMaxTemp = iRowMaxTemp >= iRowCountTemp ? iRowMaxTemp : iRowCountTemp ;
		}else{
			iRowsXCol = 1;
		}
		// Elemento que su contenido puede llevar a un salto de pagina
		
		String vMarca = oAnexo3V1.GetMarca(i)!=null?oAnexo3V1.GetMarca(i):"";
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
					vTempCampo3 = vTempCampo3 + temp.substring((10*(x-1)), max) + "<br>";	}
			}
			iRowMaxTemp = iRowMaxTemp >= iRowCountTemp ? iRowMaxTemp : iRowCountTemp ;
		}else{
			iRowsXCol = 1;
		}
		// Elemento que su contenido puede llevar a un salto de pagina
		
		String vModelo = oAnexo3V1.GetModelo(i)!=null?oAnexo3V1.GetModelo(i):"";
		// Elemento que su contenido puede llevar a un salto de pagina
		iLenCol = vModelo.length();
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
			String temp = vModelo;
			vModelo = "";
			iRowCountTemp = 0 ;
			for(int x=1;x<=(iRowsXCol);x++){
				int max = (10*x)<=iLenCol ? (10*x) : iLenCol;
				if( (x + iRowsAnt) <= iMaxRowXPag) {
					vModelo = vModelo + temp.substring((10*(x-1)), max) + "<br>";	}
				else {
					iRowCountTemp = iRowCountTemp + 1;
					vTempCampo4 = vTempCampo4 + temp.substring((10*(x-1)), max) + "<br>";	}
			}
			iRowMaxTemp = iRowMaxTemp >= iRowCountTemp ? iRowMaxTemp : iRowCountTemp ;
		}else{
			iRowsXCol = 1;
		}
		// Elemento que su contenido puede llevar a un salto de pagina
		
		String vSerie = oAnexo3V1.GetSerie(i)!=null?oAnexo3V1.GetSerie(i):"";
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
		
		String vValor = oAnexo3V1.GetValor(i)!=null?oAnexo3V1.GetValor(i):"";
		vValor = myFormatter.format(new Double(!vValor.trim().equals("")?vValor:"0"));
			iLenCol = vValor.length();
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
				
				String temp = vValor;
				vValor = "";
				iRowCountTemp = 0 ;
				for(int x=1;x<=(iRowsXCol);x++){
					int max = (16*x)<=iLenCol ? (16*x) : iLenCol;
					if( (x + iRowsAnt) <= iMaxRowXPag) {
						vValor = vValor + temp.substring((16*(x-1)), max) + "<br>";	}
					else {
						iRowCountTemp = iRowCountTemp + 1;
						vTempCampo6 = vTempCampo6 + temp.substring((16*(x-1)), max) + "<br>";	}
				}
				iRowMaxTemp = iRowMaxTemp >= iRowCountTemp ? iRowMaxTemp : iRowCountTemp ;
			}
		
		String vUbicacion = oAnexo3V1.GetUbicacion(i)!=null?oAnexo3V1.GetUbicacion(i):"";
		// Elemento que su contenido puede llevar a un salto de pagina
		iLenCol = vUbicacion.length();
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
			String temp = vUbicacion;
			vUbicacion = "";
			iRowCountTemp = 0 ;
			for(int x=1;x<=(iRowsXCol);x++){
				int max = (13*x)<=iLenCol ? (13*x) : iLenCol;
				if( (x + iRowsAnt) <= iMaxRowXPag) {
					vUbicacion = vUbicacion + temp.substring((13*(x-1)), max) + "<br>";	}
				else {
					iRowCountTemp = iRowCountTemp + 1;
					vTempCampo7 = vTempCampo7 + temp.substring((13*(x-1)), max) + "<br>";	}
			}
			iRowMaxTemp = iRowMaxTemp >= iRowCountTemp ? iRowMaxTemp : iRowCountTemp ;
		}else{
			iRowsXCol = 1;
		}
		// Elemento que su contenido puede llevar a un salto de pagina
		
		String vResguardante = oAnexo3V1.GetResguardante(i)!=null?oAnexo3V1.GetResguardante(i):"";
		// Elemento que su contenido puede llevar a un salto de pagina
		iLenCol = vResguardante.length();
		if(iLenCol > 24){
			if(iLenCol%24 == 0){
				iRowsXCol = iLenCol/24;
			}else{
				iRowsXCol = (iLenCol/24)+1;
			}
			if (iRowsXCol > iRowsMax){
			    iRowsCount = iRowsXCol - iRowsMax + iRowsCount;
				iRowsMax = iRowsXCol;
			}
			String temp = vResguardante;
			vResguardante = "";
			iRowCountTemp = 0 ;
			for(int x=1;x<=(iRowsXCol);x++){
				int max = (24*x)<=iLenCol ? (24*x) : iLenCol;
				if( (x + iRowsAnt) <= iMaxRowXPag) {
					vResguardante = vResguardante + temp.substring((24*(x-1)), max) + "<br>";	}
				else {
					iRowCountTemp = iRowCountTemp + 1;
					vTempCampo8 = vTempCampo8 + temp.substring((24*(x-1)), max) + "<br>";	}
			}
			iRowMaxTemp = iRowMaxTemp >= iRowCountTemp ? iRowMaxTemp : iRowCountTemp ;
		}else{
			iRowsXCol = 1;
		}
		// Elemento que su contenido puede llevar a un salto de pagina
		
		//String vDesTipo = oAnexo3V1.GetDesTipo(oAnexo3V1.GetTipoPos(oAnexo3V1.GetTipo(i)));
		String vDesTipo = "";
		try{
			vDesTipo = oAnexo3V1.GetDesTipo(oAnexo3V1.GetTipoPos(oAnexo3V1.GetTipo(i)));
		}catch(Throwable e){
			System.out.println("iAnexo3v1.Tipo: " + e + " " + oAnexo3V1.GetTipo(i)); 
			vDesTipo = oAnexo3V1.GetTipo(i);
		} 
		
			intContador = intContador + 1;
			if (intContador%2 == 0){	sBackColor = "#ffffff";	}
			else{						sBackColor = "#dddddd"; }
		 %>
		<TR valign="top" align="left" bgcolor="<%=sBackColor%>");">
			<TD class="ContenidoImprL"><%=vNoInventario%></TD>
			<TD class="ContenidoImpr"><%=vDescripcion%></TD>
			<TD class="ContenidoImpr"><%=vMarca%></TD>
			<TD class="ContenidoImpr"><%=vModelo%></TD>
			<TD class="ContenidoImpr"><%=vSerie%></TD>
			<TD align="right" class="ContenidoImpr"><%=vValor%></TD>
			<TD class="ContenidoImpr"><%=vUbicacion%></TD>
			<TD class="ContenidoImpr"><%=vResguardante%></TD>
			<TD class="ContenidoImprR"><%=vDesTipo%></TD>
		</TR>
		<%
		//Si existe la paginacion debera repetir esto		
		if ( (!vTempCampo1.equals("") || !vTempCampo2.equals("") || !vTempCampo3.equals("") || !vTempCampo4.equals("") || !vTempCampo5.equals("") || !vTempCampo6.equals("") || !vTempCampo7.equals("") || !vTempCampo8.equals(""))
			|| iRowsCount>=iMaxRowXPag ){
		%>
		<tr><td colspan="9" class="ContenidoImprB">&nbsp;</td></tr>
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
	<TR><TD class="TituloParrafoImpr">MOBILIARIO Y EQUIPO DE OFICINA</TD></TR>  
	</TABLE>
	<TABLE cellPadding="0" cellSpacing="0" width="100%" BORDER="1" BORDERCOLOR="white">
		<TR align="middle">
			<td class="TituloMenuImpr" width="80">No. DE<br>INVENTARIO</TD>
			<td class="TituloMenuImpr" width="100">DESCRIPCION<br>DEL ARTICULO</TD>
			<td class="TituloMenuImpr" width="80">MARCA</TD>
			<td class="TituloMenuImpr" width="80">MODELO</TD>
			<td class="TituloMenuImpr" width="80">SERIE</TD>
			<td class="TituloMenuImpr" width="120">VALOR</TD>
			<td class="TituloMenuImpr" width="100">UBICACION</TD>
			<td class="TituloMenuImpr" width="180">RESGUARDANTE Y REFERENCIA<br>DEL RESGUARDO</TD>
			<td class="TituloMenuImpr" width="100">Tipo</TD>
		</TR>
		<%if (!vTempCampo1.equals("") || !vTempCampo2.equals("") || !vTempCampo3.equals("") || !vTempCampo4.equals("") || !vTempCampo5.equals("") || !vTempCampo6.equals("") || !vTempCampo7.equals("") || !vTempCampo8.equals("")){
				if (vTempCampo1.equals("")) vTempCampo1 = "&nbsp;";
				if (vTempCampo2.equals("")) vTempCampo2 = "&nbsp;";
				if (vTempCampo3.equals("")) vTempCampo3 = "&nbsp;";
				if (vTempCampo4.equals("")) vTempCampo4 = "&nbsp;";
				if (vTempCampo5.equals("")) vTempCampo5 = "&nbsp;";
				if (vTempCampo6.equals("")) vTempCampo6 = "&nbsp;";
				if (vTempCampo7.equals("")) vTempCampo7 = "&nbsp;";
				if (vTempCampo8.equals("")) vTempCampo8 = "&nbsp;";%>
		<TR valign="top" align="left" bgcolor="<%=sBackColor%>");">
			<TD class="ContenidoImprL"><%=vTempCampo1%></TD>
			<TD class="ContenidoImpr"><%=vTempCampo2%></TD>
			<TD class="ContenidoImpr"><%=vTempCampo3%></TD>
			<TD class="ContenidoImpr"><%=vTempCampo4%></TD>
			<TD class="ContenidoImpr"><%=vTempCampo5%></TD>
			<TD class="ContenidoImpr" align="right"><%=vTempCampo6%></TD>
			<TD class="ContenidoImpr"><%=vTempCampo7%></TD>
			<TD class="ContenidoImpr"><%=vTempCampo8%></TD>
			<TD class="ContenidoImprR">&nbsp;</TD>
		</TR>
		<%
			}
		}
			iRowsCount = iRowsCount>=iMaxRowXPag?iRowMaxTemp:iRowsCount;
			
		} // FIN DEL FOR
//Si existe la paginacion debera repetir esto		
		%>
		<tr><td colspan="9" class="ContenidoImprB">&nbsp;</td></tr>
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