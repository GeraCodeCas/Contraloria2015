<%@page import="com.consiss.util.tools.*"%>
<%@page import="com.gob.*"%>
<%@page import="java.util.*" %>
<%
/********************************************************************************************************
'Elaboro:	Jesus Limon
'Lugar:		Monterrey, NL
'Fecha:		29.Nov.2002
'Compañia:	CONSISS
'Ultima Modificacion:10-Dic-2002
'By:Sigifredo Vazquez
'Ultima Modificacion:16.Dic.2002
'By:Claudia Sandoval
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
String sAnexo = "III.11";
Anexo3XI oAnexo	= new Anexo3XI();
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
	<title>Entrega - Recepción : Anexo III.11 (Impresión)</title>
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
			<TR><TD class="TituloParrafoImpr">RELACIÓN DE OBRAS TERMINADAS POR PROGRAMA</TD></TR>  
		</TABLE>
		<%
oAnexo.GetTipoOrigenDesc(iIdFuncionario);

for(int n=0;n<oAnexo.GetTipoOrigenDesc(iIdFuncionario);n++){
			int m = oAnexo.GetTipoNvo(n);
			String 	svar		 		= oAnexo.GetTipoDesc(n);%>
			
			
	<TABLE cellPadding="0" cellSpacing="0" width="900" BORDER="1" BORDERCOLOR="WHITE">
		<TR align="middle">
					<TD colspan="11" class="TituloMenuImpr">RELACIÓN DE OBRAS EN PROCESO<BR>
					ORIGEN DE LOS RECURSOS: <b><%=svar%></b><TD>
		 </tr>
		<TR align="middle">
			<td width="60" rowspan="2" class="TituloMenuImpr">CLAVE</TD>
			<td width="100" rowspan="2" class="TituloMenuImpr">PROGRAMA<br>SUBPROGRAMA<br>OBRA LOCALIZACIÓN</TD>
			<td width="80" rowspan="2" class="TituloMenuImpr">Núm. Oficio Aprobación</TD>
			<td width="80" rowspan="2" class="TituloMenuImpr">INVERSIÓN APROBADA</TD>
			<td width="80" rowspan="2" class="TituloMenuImpr">INVERSIÓN EJERCIDA</TD>
			<td width="80" rowspan="2" class="TituloMenuImpr">SALDOS</TD>
			<td width="160" class="TituloMenuImpr" colspan="2">METAS</td>			
			<td width="160" class="TituloMenuImpr" colspan="2">% NÚM. OBRAS</td>	
			<td width="100" class="TituloMenuImpr" rowspan="2">OBSERVACIONES</TD>
		</TR>
		<tr align="middle">
			<td width="80" class="TituloMenuImpr">UNIDAD DE MEDIDA</td>
			<td width="80" class="TituloMenuImpr">CANTIDAD TOTAL</td>
			<td width="80" class="TituloMenuImpr">ENTREGADAS</td>
			<td width="80" class="TituloMenuImpr">POR ENTREGAR</td>
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
			int iMaxRowXPag = 23; //Numero de Renglones por Pagina
			// Variables para Paginacion
		
		for(int i=0;i<oAnexo.GetAll(iIdFuncionario,m);i++){
			// Variables para Paginacion
			int iRowMaxTemp = 1;
			int iRowCountTemp = 0;
			String vTempCampo1 = "";	
			String vTempCampo2 = "";
			// Variables para Paginacion		
			iRowsAnt = iRowsCount;
			
			int 	iIdRenglon			= oAnexo.GetIdRenglon(i)!=-1?			oAnexo.GetIdRenglon(i):0;
			String 	sClave				= oAnexo.GetClave(i)!=null?				oAnexo.GetClave(i)+"":"";
			String 	sPrograma			= oAnexo.GetPrograma(i)!=null?			oAnexo.GetPrograma(i)+"":"";
			//Primer Elemento que su contenido puede llevar a un salto de pagina
			iLenCol = sPrograma.length();
			iRowsXCol = 1;
			
			if(iLenCol > 13){
				if(iLenCol%13 == 0){
					iRowsXCol = iLenCol/13;
				}else{
					iRowsXCol = (iLenCol/13)+1;
				}
				
				String temp = sPrograma;
				sPrograma = "";
				iRowCountTemp = 0 ;
				for(int x=1;x<=(iRowsXCol);x++){
					int max = (13*x)<=iLenCol ? (13*x) : iLenCol;
					if( (x + iRowsAnt) <= iMaxRowXPag) {
						sPrograma = sPrograma + temp.substring((13*(x-1)), max) + "<br>";
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
			
			
			
			//String 	iNoAprobacion		= oAnexo.GetNoAprobacion(i)!=-1?		oAnexo.GetNoAprobacion(i):0;
			String 	sNoAprobacion		= oAnexo.GetNoAprobacion(i)!=null?		oAnexo.GetNoAprobacion(i)+"":"";
			int 	iObrasEntregadas 	= oAnexo.GetObrasEntregadas(i)!=-1?		oAnexo.GetObrasEntregadas(i):0;
			int 	iObrasPorEntregar 	= oAnexo.GetObrasPorEntregar(i)!=-1?	oAnexo.GetObrasPorEntregar(i):0;
			/*float	fInversionAprobada	= oAnexo.GetInversionAprobada(i)!=-1?	oAnexo.GetInversionAprobada(i):0;
			float	fInversionEjercida	= oAnexo.GetInversionEjercida(i)!=-1?	oAnexo.GetInversionEjercida(i):0;*/
			double	fInversionAprobada	= new Double(oAnexo.GetInversionAprobada(i)!=null?	oAnexo.GetInversionAprobada(i):"0").doubleValue();
			double	fInversionEjercida	= new Double(oAnexo.GetInversionEjercida(i)!=null?	oAnexo.GetInversionEjercida(i):"0").doubleValue();
			String 	sUnidadMedida		= oAnexo.GetUnidadMedida(i)!=null?		oAnexo.GetUnidadMedida(i)+"":"";
			String 	sCantidadTotal		= oAnexo.GetCantidadTotal(i)!=null && !((oAnexo.GetCantidadTotal(i)+"").trim()).equals("") ?		oAnexo.GetCantidadTotal(i)+"":"0";
			String 	sObservaciones 		= oAnexo.GetObservacion(i)!=null?		oAnexo.GetObservacion(i):"";
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
						vTempCampo2 = vTempCampo2 + temp.substring((13*(x-1)), max) + "<br>";	}
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
			<TD class="ContenidoImprL" align="center">&nbsp;<%=sClave%></TD>
			<TD class="ContenidoImpr"><%=sPrograma%></TD>
			<TD class="ContenidoImpr"><%=sNoAprobacion%></TD>
			<TD class="ContenidoImpr" align="right"><%=myFormatter.format(fInversionAprobada)%></TD>
			<TD class="ContenidoImpr" align="right"><%=myFormatter.format(fInversionEjercida)%></TD>
			<TD class="ContenidoImpr" align="right"><%=myFormatter.format(fInversionAprobada - fInversionEjercida)%></TD>
			<TD class="ContenidoImpr"><%=sUnidadMedida%></TD>
			<TD class="ContenidoImpr" align="right"><%
			try{
				out.println(myFormatter.format(java.lang.Float.parseFloat(sCantidadTotal)));
			} catch(Throwable e) {
				out.println("ERROR " + sCantidadTotal);
			}
			%></TD>
			<TD class="ContenidoImpr" align="center"><%=iObrasEntregadas%></TD>
			<TD class="ContenidoImpr" align="center"><%=iObrasPorEntregar%></TD>
			<TD class="ContenidoImprR">&nbsp;<%=sObservaciones%></TD>
		</TR><%
		//Si existe la paginacion debera repetir esto		
		if ( (!vTempCampo1.equals("") || !vTempCampo2.equals("")) || iRowsCount>=iMaxRowXPag){
		%>
		<tr><td colspan="11" class="ContenidoImprB">&nbsp;</td></tr>
	</TABLE>
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
					<TD colspan="11" class="TituloMenuImpr">RELACIÓN DE OBRAS EN PROCESO<BR>
					ORIGEN DE LOS RECURSOS: <b><%=svar%></b><TD>
		 </tr>
		<TR align="middle">
			<td width="60" rowspan="2" class="TituloMenuImpr">CLAVE</TD>
			<td width="100" rowspan="2" class="TituloMenuImpr">PROGRAMA<br>SUBPROGRAMA<br>OBRA LOCALIZACIÓN</TD>
			<td width="80" rowspan="2" class="TituloMenuImpr">Núm. Oficio Aprobación</TD>
			<td width="80" rowspan="2" class="TituloMenuImpr">INVERSIÓN APROBADA</TD>
			<td width="80" rowspan="2" class="TituloMenuImpr">INVERSIÓN EJERCIDA</TD>
			<td width="80" rowspan="2" class="TituloMenuImpr">SALDOS</TD>
			<td width="160" class="TituloMenuImpr" colspan="2">METAS</td>			
			<td width="160" class="TituloMenuImpr" colspan="2">% NÚM. OBRAS</td>	
			<td width="100" class="TituloMenuImpr" rowspan="2">OBSERVACIONES</TD>
		</TR>
		<tr align="middle">
			<td width="80" class="TituloMenuImpr">UNIDAD DE MEDIDA</td>
			<td width="80" class="TituloMenuImpr">CANTIDAD TOTAL</td>
			<td width="80" class="TituloMenuImpr">ENTREGADAS</td>
			<td width="80" class="TituloMenuImpr">POR ENTREGAR</td>
		</tr>
	<%if (!vTempCampo1.equals("") || !vTempCampo2.equals("") ){
				if (vTempCampo1.equals("")) vTempCampo1 = "&nbsp;";
				if (vTempCampo2.equals("")) vTempCampo2 = "&nbsp;";%>
	<TR valign="top" align="left" bgcolor="<%=sBackColor%>">
			<TD class="ContenidoImprL">&nbsp;</TD>
			<TD class="ContenidoImpr"><%=vTempCampo1%></TD>
			<TD class="ContenidoImpr">&nbsp;</TD>
			<TD class="ContenidoImpr">&nbsp;</TD>
			<TD class="ContenidoImpr">&nbsp;</TD>
			<TD class="ContenidoImpr">&nbsp;</TD>
			<TD class="ContenidoImpr">&nbsp;</TD>
			<TD class="ContenidoImpr">&nbsp;</TD>
			<TD class="ContenidoImpr">&nbsp;</TD>
			<TD class="ContenidoImpr">&nbsp;</TD>
			<TD class="ContenidoImprR"><%=vTempCampo2%></TD>
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

