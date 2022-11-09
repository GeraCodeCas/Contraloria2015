<%@page import="com.consiss.util.tools.*"%>
<%@page import="com.consiss.db.*"%>
<%@page import="com.gob.*"%>
<%@page import="java.util.*" %>
<%
/********************************************************************************************************
'Elaboro:	Jesus Limon
'Lugar:		Monterrey, NL
'Fecha:		31.Dic.2002
'Compañia:	CONSISS
'Ultima Modificacion:
'By:		Jesus Limon
'
'Distintas opciones:
'
'********************************************************************************************************/
%>
<%
//Valida la permanencia del usuario en session
if ((String)session.getValue("ok")!="Consiss")
			response.sendRedirect("Error.html");
int tempIdUnidadGobierno =  java.lang.Integer.parseInt(
		(String)(session.getValue("iIdUnidadGobierno")!= null?session.getValue("iIdUnidadGobierno"):"0") );
int iIdUnidadGobierno = java.lang.Integer.parseInt(request.getParameter("iIdUnidadGobierno")!= null ? request.getParameter("iIdUnidadGobierno"): "-1");
int iIdFuncionario =  java.lang.Integer.parseInt((String)(session.getValue("iIdFuncionario")!= null?session.getValue("iIdFuncionario"):"0") );
UnidadGobierno oUnidadGobierno = new UnidadGobierno();
Historico	oHist	= new Historico();
String sPath = "../";

%>
<html>
<head>
	<title>Entrega - Recepción : Históricos</title>
<link rel="stylesheet" type="text/css" href="<%=sPath%>Styles/Gobierno.css">
<script language="JavaScript" src="<%=sPath%>Scripts/Gobierno.js"></script>
<script language="JavaScript" src="<%=sPath%>Scripts/Libreria.js"></script>
<script language="JavaScript">
	function imprimir(iIdFuncionario){
		var strUrl  = "iAnexo3VII.jsp?iIdFuncionario=" + iIdFuncionario;
		popBox('Imprimir', 550, 500, strUrl);		
	}
	function ayuda(){
		var strUrl  = "<%=sPath%>Help/aAnexo3VII.htm";
		popBox('Ayuda', 600, 500, strUrl);		
	}
	function selecciona(){
		document.forma.submit();
	}
</script>
</head>
<body topmargin="0" leftmargin="0">
<table border="0" cellspacing="0" cellpadding="0" width="100%">
<!-- Encabezado -->
<tr>
<td colspan="3"><%@include file="Header.jsp"%></td>
<tr>
<!-- Encabezado -->
<tr>
	<!-- Menu -->
	<td width="135" valign="top"><%@include file="Menu.jsp"%></td>
	<!-- Menu -->
	<td width="2px" valign="top" class="TextoOculto">.</td>
	<!-- Contenido -->
	<td valign="top" width="100%">
	<form action="fHistorico.jsp" name="forma" method="post">
	<TABLE align=center border=0 cellPadding=0 cellSpacing=0 width="100%">
		<tr>
			<td class="TituloParrafo" width="70%">&nbsp;&nbsp;INFORMACIÓN HISTORICA&nbsp;&nbsp;</td>
		</tr>
		<%if(tempIdUnidadGobierno == 0){%>
		<tr>
			<td width="25%"><b>Dependencia, Organismo o Tribunal</b>&nbsp;
				<select class="cmbBox" name="iIdUnidadGobierno" onchange="selecciona();">
					<option value="-1"> [ SELECCIONE ] </option>
					<option <%=iIdUnidadGobierno==0?"selected":""%> value="0"> [ TODAS ] </option><%
					for(int j=0;j<oUnidadGobierno.GetAll();j++){
					int oIdUnidadGobierno	= oUnidadGobierno.GetIdUnidadGobierno(j);
					String oNombre 			= oUnidadGobierno.GetNombre(j);		%>
					<option <%=iIdUnidadGobierno==oIdUnidadGobierno?"selected":""%> value="<%=oIdUnidadGobierno%>"><%=oNombre%></option><%
					}%>
				</select>
			</td>
		</tr>
		<%}else{%>
			<input type="hidden" name="iIdUnidadGobierno" id="iIdUnidadGobierno" value="<%=tempIdUnidadGobierno%>">
		<%}%>
		<tr><td>&nbsp;</td></tr>
	</TABLE>		
	<!-- Datos que se agregaran a la tabla  -->
	<TABLE cellPadding="0" cellSpacing="0" width="100%" BORDER="1" BORDERCOLOR="white">
	<!-- Etiqueta donde se aplican los encabezados de las tablas-->
		<TR align="middle">
			<td class="TituloMenu">No. Funcionario</TD>
			<td class="TituloMenu">Funcionario</TD>
			<td class="TituloMenu">Cargo</TD>
			<td class="TituloMenu">Fecha</TD>
			<td class="TituloMenu">Tipo</TD>
			<td class="TituloMenu">&nbsp;</TD>
			<td class="TituloMenu">&nbsp;</TD>
			<td class="TituloMenu">&nbsp;</TD>
			<td class="TituloMenu">&nbsp;</TD>
		</TR>
<% iIdUnidadGobierno = tempIdUnidadGobierno != 0 ? tempIdUnidadGobierno : iIdUnidadGobierno ;
		int intContador = 0;
		String sBackColor = "";
		//oHist.GetAll(iIdUnidadGobierno);
		for(int i=0;i<oHist.GetAll(iIdUnidadGobierno);i++){
			int 	iIdRenglon		= oHist.GetIdFuncionario(i)!=-1?		oHist.GetIdFuncionario(i):0;
			String 	sNombre			= oHist.GetNombre(i)!=null?				oHist.GetNombre(i)+"":"";
			String 	sCargo			= oHist.GetCargo(i)!=null?				oHist.GetCargo(i)+"":"";
			String 	sRuta1			= oHist.GetRuta1(i)!=null?				oHist.GetRuta1(i)+"":"";
			String 	sRuta2			= oHist.GetRuta2(i)!=null?				oHist.GetRuta2(i)+"":"";
			String 	sFecha			= oHist.GetFecha(i)!=null?				oHist.GetFecha(i)+"":"";
			String 	sArchivoZip		= oHist.GetArchivoZip(i)!=null?			oHist.GetArchivoZip(i)+"":"";
			String 	sArchivoZipWAttach		= ConnectionJDBC.replaceAll(sArchivoZip, "WOAt", "WAt") /* reemplazar WOAtach por WOAtach*/;
			String 	sTipo			= oHist.GetProceso(i)!=null?			oHist.GetProceso(i)+"":"";
			intContador = intContador + 1;
			if(intContador%2 == 0){
				sBackColor = "#ffffff";
			}else{
				sBackColor = "#eeeeee";
			}
%>
		<TR align="left" bgcolor="<%=sBackColor%>" 
			onMouseOver = "MouseDentro(this);"
			onMouseOut  = "MouseFuera(this,'<%=sBackColor%>');">
			<TD align="center">
				<%=iIdRenglon%>
			</TD>
			<TD align="left">
				&nbsp;<%=sNombre%>
			</TD>
			<TD><%=sCargo%></TD>
			<TD><%=sFecha%></TD>
			<TD><%=sTipo.equals("1")?"Validada y Cerrada por Enlace":(sTipo.equals("2")?"Cierre de Entrega por Funcionario Entrante":"Fotografía")%></TD>
			<TD align="center">
				<a target="otro" onmouseover="this.style.cursor='hand'" style="cursor:normal" href="..<%=sRuta1%>\index.html">
					Con Attachment &nbsp;
				</a>
			</TD>
			<TD align="center">
				<a target="otro" onmouseover="this.style.cursor='hand'" style="cursor:normal" href="..<%=sRuta2%>\index.html">
					Sin Attachment&nbsp;
				</a>
			</TD>
			<TD align="center">
				<a target="otro" onmouseover="this.style.cursor='hand'" style="cursor:normal" href="..<%=sArchivoZip%>">
					Respaldo ZIP&nbsp;
				</a>
			</TD>
			<TD align="center">
				<a target="otro" onmouseover="this.style.cursor='hand'" style="cursor:normal" href="..<%=sArchivoZipWAttach%>">
					Respaldo ZIP (con Attachment)&nbsp;
				</a>
			</TD>
		</TR><%
		}
%>
	</TABLE>
	</form>
</td>
</tr>
</table>
<%@include file="Footer.jsp"%>
</body>
</html>
