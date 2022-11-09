<%/*********************************************************************************************************
Elaboro:	Claudia V. Sandoval Pardo
Lugar:		Monterrey, NL
Fecha:		25.Oct.2002
Compañia:	CONSISS*/%>
<%@page import="com.consiss.util.tools.*"%>
<%@page import="com.gob.*"%>
<%@page import="java.util.*" %>
<%
if ((String)session.getValue("ok")!="Consiss") response.sendRedirect("Error.html");

String	sOpcion = request.getParameter("sOpcion")!= null ? request.getParameter("sOpcion"): "";
String	sCodigo = request.getParameter("sCodigo")!= null ? request.getParameter("sCodigo"): "0";

int iIdFuncionarioNvo =  java.lang.Integer.parseInt(
		(String)(session.getValue("iIdFuncionario")!= null?session.getValue("iIdFuncionario"):"0") );
		
int iIdFuncionarioAnt =  java.lang.Integer.parseInt(
		(String)(session.getValue("iIdFuncionarioAnt")!= null?session.getValue("iIdFuncionarioAnt"):"0") );
		
Adendum oAdendum = new Adendum();
Anexo	oAnexo = new Anexo();

String sPath = "../";

String	sEstatusFuncionario	= session.getValue("sEstatus")!= null?(String)session.getValue("sEstatus"):"0";
com.gob.Funcionario oFuncionario = new com.gob.Funcionario();
boolean bSoloLectura = true;

if( sEstatusFuncionario.equals(oFuncionario.GetEstatusRevisandoAntFuncionario()) ) {
	bSoloLectura = false;
}
%>
<html>
<head>
	<title>Entrega - Recepción : Adendum</title>
<link rel="stylesheet" type="text/css" href="../Styles/Gobierno.css">
<script language="JavaScript" src="<%=sPath%>Scripts/Gobierno.js"></script>
<script language="JavaScript">
	<%if(!bSoloLectura){%>
	function edit(pCODE){
		document.forma.sCodigo.value = pCODE;
		document.forma.sOpcion.value = 'EDIT';
		document.forma.submit();
	}
	function save(){
		//if (valid()) {
			document.forma.sOpcion.value = 'SAVE';
			document.forma.submit();
		//}
	}
	function news() {
		document.forma.sCodigo.value = 0;
		document.forma.sOpcion.value = 'NEW';
		document.forma.submit();
	}
	
	function del(pCODE){
		if(confirm("¿Desea Eliminar la Observación?")){ 
			document.forma.sCodigo.value = pCODE;
			document.forma.sOpcion.value = 'DEL';
			document.forma.submit();
		}
	}
	<%} else {%>
	function edit(pCODE){
	}
	<%}%>
	function cancel(){
		document.forma.sCodigo.value = 0;
		document.forma.sOpcion.value = 'NORMAL';
		document.forma.submit();
	}
	
</script>
</head>

<body topmargin="0" leftmargin="0">
<!-- Encabezado -->
<%@include file="Header.jsp"%>
<!-- Encabezado -->
<table border="0" cellspacing="0" cellpadding="0" width="100%">
<tr>
	<!-- Menu -->
	<td width="135" valign="top"><%@include file="Menu.jsp"%></td>
	<!-- Menu -->
	<!-- Contenido -->
	<td valign="top">
	<FORM action="pAdendum.jsp" name="forma" method="post" >
		<input type="hidden" name="sOpcion" value="">
		<input type="hidden" name="sCodigo" value="<%=sCodigo%>"> 
		<TABLE align=center border=0 cellPadding=0 cellSpacing=0 width="100%">
			<TR>
				<TD class=TituloParrafo>&nbsp;&nbsp;Adendum&nbsp;&nbsp;</TD>
				<TD align=right>
	<%if(!bSoloLectura){%>
		<%if(sOpcion.equals("SAVE") || sOpcion.equals("NORMAL") || sOpcion.equals("") ) {%>						    
					<INPUT onclick="news();" 	name="NEW" 		type="button" value="Nuevo" class="boton">&nbsp;
		<%} else {%>	
					<INPUT onclick="cancel();" 	name="CANCEL" 	type="button" value="Cancelar" class="boton">&nbsp;
					<INPUT onclick="save();" 	name="SAVE" 	type="button" value="Grabar"   class="boton">&nbsp;
		<%}
	}%>
				</TD>
			</TR>
		</TABLE>		
		<!-- Datos que se agregaran a la tabla  -->
		<TABLE cellPadding="2" cellSpacing="2" width="100%" BORDERCOLOR="white">
		<!-- Etiqueta donde se aplican los encabezados de las tablas-->
			<TR align="middle">
				<td class="TituloMenu" width="10px">&nbsp;</td>
				<TD class="TituloMenu" style="display:none;">Renglon </TD>
				<TD class="TituloMenu">Anexo</TD>
				<TD class="TituloMenu">Observación</TD>
			</TR>
			<%if(sOpcion.equals("NEW")){%>
			<TR align="middle">
	        	<TD valign="top">Automático</TD>
	        	<TD align="center" valign="top">
					<select name="iIdAnexo" id="iIdAnexo"><% 
					for(int i=0;i<oAnexo.GetAll().getNumRows();i++){%>
						<option value="<%=oAnexo.GetIdAnexo(i)%>"><%=oAnexo.GetClave(i)%></option>
					<%}%>
					</select>
				</TD>
				<TD>
					<textarea class="txtBox" name="sObservacion" id="sObservacion" rows="5" cols="60"></textarea></TD>
				</TD>
			</TR>

<%
			}
			int intContador = 0;
			String sBackColor = "";
			for(int i=0;i<oAdendum.GetAllNvo(iIdFuncionarioNvo).getNumRows();i++){
				int iIdRenglon		= oAdendum.GetIdRenglon(i);
				int iIdAnexo		= oAdendum.GetIdAnexo(i);
				String sObservacion	= oAdendum.GetObservacion(i);
				intContador = intContador + 1;
				if (intContador%2 == 0){
					sBackColor = "#ffffff";
				}else{
					sBackColor = "#eeeeee";
				}
				if(sOpcion.equals("EDIT") && sCodigo.equals(iIdRenglon + "")){%>
			<TR align="left" bgcolor="<%=sBackColor%>">
				<TD>&nbsp;</TD>
				<TD align="center" valign="top"  style="display:none;"><%=iIdRenglon%></TD>
				<TD align="center" valign="top">
					<select name="iIdAnexo" id="iIdAnexo"><% 
					for(int j=0;j<oAnexo.GetAll().getNumRows();j++){%>
						<option value="<%=oAnexo.GetIdAnexo(j)%>" <%=oAnexo.GetIdAnexo(j)==iIdAnexo?"Selected":""%>><%=oAnexo.GetClave(j)%></option>
					<%}%>
					</select>
				</TD>
				<TD align="center" valign="top">
				
					<textarea class="txtBox" name="sObservacion" id="sObservacion" rows="5" cols="40"><%=sObservacion%></textarea></TD>
				</TD>

			</TR><%
				} else {%>
			<TR align="left" bgcolor="<%=sBackColor%>" 
			onMouseOver = "MouseDentro(this);"
			onMouseOut  = "MouseFuera(this,'<%=sBackColor%>');">
				<TD width="10px"><%if(!bSoloLectura){%><a onmouseover="this.style.cursor='hand'" style="cursor:normal" onclick="del(<%=iIdRenglon%>);">
				<img src="<%=sPath%>Images/Eliminar.gif"></a><%}%></TD>
				<TD align="center"  style="display:none;">	
					<a onmouseover="this.style.cursor='hand'" style="cursor:normal" onclick="edit(<%=iIdRenglon%>);">
						<%=iIdRenglon%>
					</a>
				</TD>
				<TD align="center">	
					<a onmouseover="this.style.cursor='hand'" style="cursor:normal" onclick="edit(<%=iIdRenglon%>);">
						<%=oAnexo.GetClave(oAnexo.GetPos(iIdAnexo))%>
					</a>
				</TD>
				<TD align="left">	
					<a onmouseover="this.style.cursor='hand'" style="cursor:normal" onclick="edit(<%=iIdRenglon%>);">
						<%=sObservacion%>
					</a>
				</TD>
			</TR><%
				}
			}
	%>
		</TABLE>
	</FORM>
	</td>
	<!-- Contenido -->
</tr>
</table>
<%@include file="Footer.jsp"%>
</body>
</html>
