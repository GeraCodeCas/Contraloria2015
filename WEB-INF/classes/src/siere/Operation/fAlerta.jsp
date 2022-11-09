<%/*********************************************************************************************************
Elaboro:	Claudia V. Sandoval Pardo
Lugar:		Monterrey, NL
Fecha:		25.Oct.2002
Compañia:	CONSISS*/%>
<%@page import="com.consiss.util.tools.*"%>
<%@page import="com.gob.*"%>
<%@page import="java.util.*" %>
<%
String	sOpcion = request.getParameter("sOpcion")!= null ? request.getParameter("sOpcion"): "";
String	sCodigo = request.getParameter("sCodigo")!= null ? request.getParameter("sCodigo"): "0";

java.text.DecimalFormat myFormatter = new java.text.DecimalFormat("00");

Alerta oAlerta = new Alerta();

String sPath = "../";
%>
<html>
<head>
	<title>Entrega - Recepción : Alerta</title>
<link rel="stylesheet" type="text/css" href="../Styles/Gobierno.css">
<script language="JavaScript" src="<%=sPath%>Scripts/Gobierno.js"></script>
<script language='JavaScript' src="<%=sPath%>Scripts/Calendario.js"></script>
<script language="JavaScript">
	function save(){
		if (document.forma.sFechaIni.value==""){
			alert("Capture la Fecha del Inicio");
			document.forma.sFechaIni.focus();
			return false;
		}
		if (document.forma.sFechaFin.value==""){
			alert("Capture la Fecha Final");
			document.forma.sFechaFin.focus();
			return false;
		}
		
		var FechaIni = EnviaDate(document.forma.sFechaIni.value) + "" + 
						document.forma.sHoraIni[document.forma.sHoraIni.selectedIndex].value;
		
		var FechaFin = EnviaDate(document.forma.sFechaFin.value) + "" + 
						document.forma.sHoraFin[document.forma.sHoraFin.selectedIndex].value;

		//alert(FechaIni + " " + FechaFin);
		if(FechaIni>=FechaFin){
			//alert(FechaIni + " " + FechaFin);
			alert("La Fecha Final debe ser Mayor a la Inicial!");
			document.forma.sFechaFin.focus();
			return false;
		}
		document.forma.sOpcion.value = 'SAVE';
		document.forma.submit();
	}
	function EnviaDate(fecha){
		//Recibe una fecha en formato string dd/mm/aa
		if(fecha=="") { return ""; }
		var arrfecha = fecha.split("/");
		var dia = arrfecha[0];
		var mes = arrfecha[1];
		var anio = arrfecha[2];
		var fecha = anio+mes+dia;
		return (fecha);
	}
	
	function cancel(){
		document.forma.sCodigo.value = 0;
		document.forma.sOpcion.value = 'NORMAL';
		document.forma.submit();
	}
	function news() {
		document.forma.sCodigo.value = 0;
		document.forma.sOpcion.value = 'NEW';
		document.forma.submit();
	}
	function edit(sCodigo) {
		document.forma.sCodigo.value = sCodigo;
		document.forma.sOpcion.value = 'EDIT';
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
	<FORM action="pAlerta.jsp" name="forma" method="post" >
		<input type="hidden" name="sOpcion" value="">
		<input type="hidden" name="sCodigo" value="<%=sCodigo%>"> 
		<TABLE align=center border=0 cellPadding=0 cellSpacing=0 width="100%">
			<TR>
				<TD class=TituloParrafo>&nbsp;&nbsp;Mensaje Actual&nbsp;&nbsp;</TD>
				<TD align=right>
		<%if(sOpcion.equals("SAVE") || sOpcion.equals("NORMAL") || sOpcion.equals("") ) {%>						    
					<INPUT onclick="news();" 	name="NEW" 		type="button" value="Nuevo" class="boton">&nbsp;
		<%} else {%>	
					<INPUT onclick="cancel();" 	name="CANCEL" 	type="button" value="Cancelar" class="boton">&nbsp;
					<INPUT onclick="save();" 	name="SAVE" 	type="button" value="Grabar"   class="boton">&nbsp;
		<%}%>	
				</TD>
			</TR>
		</TABLE>		
		<!-- Datos que se agregaran a la tabla  -->
		<TABLE cellPadding="2" cellSpacing="2" width="100%" BORDERCOLOR="white">
		<!-- Etiqueta donde se aplican los encabezados de las tablas-->
			<TR align="middle">
				<td class="TituloMenu">Mensaje</td>
				<td class="TituloMenu">Fecha y Hora Inicial</td>
				<td class="TituloMenu">Fecha y Hora Final</td>
			</TR>
			<%if(sOpcion.equals("NEW")){%>
			<TR align="middle">
	        	<TD>
					<INPUT class="txtBox" name="sMensaje" id="sMensaje" type="Text" size="80" maxlength="150" value="">
				</TD>
	        	<TD>
					<INPUT readonly class="cmbBox" name="sFechaIni" id="sFechaIni" type="Text" size="10" maxlength="10" value="">&nbsp;<img src="<%=sPath%>Images/Fecha.gif" align="top" border=0 
					onclick="fPopCalendar(sFechaIni,sFechaIni)">&nbsp;<select class="cmbBox" name="sHoraIni" style="width=57px" id=name="sHoraIni"><%
						for(int i=0;i<24;i++){%>
						<option value="<%=myFormatter.format(new Integer(i))%>00" <%=
							(i==8)?"Selected":""%>><%=myFormatter.format(new Integer(i))%>:00</option>
						<option value="<%=myFormatter.format(new Integer(i))%>15"><%=
							myFormatter.format(new Integer(i))%>:15</option>
						<option value="<%=myFormatter.format(new Integer(i))%>30"><%=
							myFormatter.format(new Integer(i))%>:30</option>
						<option value="<%=myFormatter.format(new Integer(i))%>45"><%=
							myFormatter.format(new Integer(i))%>:45</option><%
						}%>
					</select>
				</TD>
	        	<TD>
					<INPUT readonly class="cmbBox" name="sFechaFin" id="sFechaFin" type="Text" size="10" maxlength="10" value="">&nbsp;<img src="<%=sPath%>Images/Fecha.gif" align="top" border=0 
					onclick="fPopCalendar(sFechaFin,sFechaFin)">&nbsp;<select class="cmbBox" name="sHoraFin" id=name="sHoraFin"><%
						for(int i=0;i<24;i++){%>
						<option value="<%=myFormatter.format(new Integer(i))%>00" <%=
							(i==8)?"Selected":""%>><%=myFormatter.format(new Integer(i))%>:00</option>
						<option value="<%=myFormatter.format(new Integer(i))%>15"><%=
							myFormatter.format(new Integer(i))%>:15</option>
						<option value="<%=myFormatter.format(new Integer(i))%>30"><%=
							myFormatter.format(new Integer(i))%>:30</option>
						<option value="<%=myFormatter.format(new Integer(i))%>45"><%=
							myFormatter.format(new Integer(i))%>:45</option><%
						}%>
					</select>
				</TD>
	        	<TD>
			</TR><%
			} 
			int intContador = 0;
			String sBackColor = "";
			String sHoy = (new java.text.SimpleDateFormat("yyyyMMddHHmm")).format(new java.util.Date());
			long iHoy = java.lang.Long.parseLong(sHoy);
			long iFechaIni, iFechaFin;
			oVMAlertas.RemoveAll();
			oVMAlertas.setVMatrixNumCols(4);
			for(int i=0;i<oAlerta.GetAll().getNumRows();i++){
				iFechaIni = java.lang.Long.parseLong(oAlerta.GetFechaIni(i));
				iFechaFin = java.lang.Long.parseLong(oAlerta.GetFechaFin(i));
				if((iFechaIni <= iHoy && iHoy <= iFechaFin) || (iFechaIni >= iHoy && iFechaFin >= iHoy)){
					String sTemp [] = {oAlerta.GetRenglon(i)+"", oAlerta.GetFechaIni(i), oAlerta.GetFechaFin(i), oAlerta.GetMensaje(i)};
					oVMAlertas.setVMatrixRow(sTemp);
				}
				if(sOpcion.equals("EDIT") && sCodigo.equals(oAlerta.GetRenglon(i)+"")){%>
			<TR align="left">
				<TD><INPUT class="txtBox" name="sMensaje" id="sMensaje" type="Text" size="80" maxlength="150" value="<%=oAlerta.GetMensaje(i)%>">
				</TD>
				<TD><INPUT readonly class="cmbBox" name="sFechaIni" id="sFechaIni" type="Text" 
					size="10" maxlength="10" value="<%=oAlerta.GetFechaIni(i).substring(6, 8)%>/<%=
					        oAlerta.GetFechaIni(i).substring(4, 6)%>/<%=
							oAlerta.GetFechaIni(i).substring(0, 4)%>">&nbsp;<img 
							src="<%=sPath%>Images/Fecha.gif" align="top" border=0 
					onclick="fPopCalendar(sFechaIni,sFechaIni)">&nbsp;<select 
						class="cmbBox" name="sHoraIni" style="width=57px" id=name="sHoraIni"><%
					String sHora = oAlerta.GetFechaIni(i).substring(8, 10) + ":" + 
									oAlerta.GetFechaIni(i).substring(10, 12);
					for(int j=0;j<24;j++){%>
						<option value="<%=myFormatter.format(new Integer(j))%>00" 
								<%=sHora.equals(myFormatter.format(new Integer(j))+":00")?"Selected":""
								%>><%=myFormatter.format(new Integer(j))%>:00</option>
						<option value="<%=myFormatter.format(new Integer(j))%>15" 
								<%=sHora.equals(myFormatter.format(new Integer(j))+":15")?"Selected":""
								%>><%=myFormatter.format(new Integer(j))%>:15</option>
						<option value="<%=myFormatter.format(new Integer(j))%>30" 
								<%=sHora.equals(myFormatter.format(new Integer(j))+":30")?"Selected":""
								%>><%=myFormatter.format(new Integer(j))%>:30</option>
						<option value="<%=myFormatter.format(new Integer(j))%>45" 
								<%=sHora.equals(myFormatter.format(new Integer(j))+":45")?"Selected":""
								%>><%=myFormatter.format(new Integer(j))%>:45</option><%
					}%>
					</select>
				</TD>
				<TD><INPUT readonly class="cmbBox" name="sFechaFin" id="sFechaFin" type="Text" size="10" maxlength="10" value="<%=oAlerta.GetFechaFin(i).substring(6, 8)%>/<%=oAlerta.GetFechaFin(i).substring(4, 6)%>/<%=oAlerta.GetFechaFin(i).substring(0, 4)%>">&nbsp;<img src="<%=sPath%>Images/Fecha.gif" align="top" border=0 
					onclick="fPopCalendar(sFechaFin,sFechaFin)">&nbsp;<select class="cmbBox" name="sHoraFin" id=name="sHoraFin"><%
					sHora = oAlerta.GetFechaFin(i).substring(8, 10) + ":" + oAlerta.GetFechaFin(i).substring(10, 12);
					for(int j=0;j<24;j++){%>
						<option value="<%=myFormatter.format(new Integer(j))%>00" 
								<%=sHora.equals(myFormatter.format(new Integer(j))+":00")?"Selected":""
								%>><%=myFormatter.format(new Integer(j))%>:00</option>
						<option value="<%=myFormatter.format(new Integer(j))%>15" 
								<%=sHora.equals(myFormatter.format(new Integer(j))+":15")?"Selected":""
								%>><%=myFormatter.format(new Integer(j))%>:15</option>
						<option value="<%=myFormatter.format(new Integer(j))%>30" 
								<%=sHora.equals(myFormatter.format(new Integer(j))+":30")?"Selected":""
								%>><%=myFormatter.format(new Integer(j))%>:30</option>
						<option value="<%=myFormatter.format(new Integer(j))%>45" 
								<%=sHora.equals(myFormatter.format(new Integer(j))+":45")?"Selected":""
								%>><%=myFormatter.format(new Integer(j))%>:45</option><%
					}%>
					</select>
				</TD>
			</TR><%
				} else {%>
			<TR align="left">
				<TD>
					<a onmouseover="this.style.cursor='hand'" style="cursor:normal" onclick="edit(<%=oAlerta.GetRenglon(i)%>);"><%=oAlerta.GetMensaje(i)%></a>
				</TD>
				<TD>	
					<a onmouseover="this.style.cursor='hand'" style="cursor:normal" onclick="edit(<%=oAlerta.GetRenglon(i)%>);"><%=oAlerta.GetFechaIni(i).substring(6, 8)%>/<%=oAlerta.GetFechaIni(i).substring(4, 6)%>/<%=oAlerta.GetFechaIni(i).substring(0, 4)%>&nbsp;<%=oAlerta.GetFechaIni(i).substring(8, 10)%>:<%=oAlerta.GetFechaIni(i).substring(10, 12)%></a>
				</TD>
				<TD>	
					<a onmouseover="this.style.cursor='hand'" style="cursor:normal" onclick="edit(<%=oAlerta.GetRenglon(i)%>);"><%=oAlerta.GetFechaFin(i).substring(6, 8)%>/<%=oAlerta.GetFechaFin(i).substring(4, 6)%>/<%=oAlerta.GetFechaIni(i).substring(0, 4)%>&nbsp;<%=oAlerta.GetFechaFin(i).substring(8, 10)%>:<%=oAlerta.GetFechaFin(i).substring(10, 12)%></a>
				</TD>
			</TR><%	
				}
			}%>
		</TABLE>
	</FORM>
	</td>
	<!-- Contenido -->
</tr>
</table>
<%@include file="Footer.jsp"%>
</body>
</html>
