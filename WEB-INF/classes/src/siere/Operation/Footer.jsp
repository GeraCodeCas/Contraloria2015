<table border="0" cellpadding="0" cellspacing="0" width="100%">
	<tr>
		<td class="foot" align="center"><a onclick="AbrirVentana();" style="cursor:hand;"><i>Powered by</i> Consiss</a><br><br></td>	
	</tr>
</table><%
for(int idxAlertas=0;idxAlertas<oVMAlertas.getNumRows();idxAlertas++){
	String sHoyAlerta = (new java.text.SimpleDateFormat("yyyyMMddHHmm")).format(new java.util.Date());
	long iHoyAlerta = java.lang.Long.parseLong(sHoyAlerta);
	long iFechaIniAlerta, iFechaFinAlerta;
	String sFechaIniAlerta = ((java.util.Vector)oVMAlertas.getVMatrixAll().elementAt(1)).elementAt(idxAlertas)+"";
	String sFechaFinAlerta =((java.util.Vector)oVMAlertas.getVMatrixAll().elementAt(2)).elementAt(idxAlertas)+"";
	iFechaIniAlerta = java.lang.Long.parseLong(sFechaIniAlerta);
	iFechaFinAlerta = java.lang.Long.parseLong(sFechaFinAlerta);
	if(iFechaIniAlerta <= iHoyAlerta && iHoyAlerta <= iFechaFinAlerta){
		String sMensajeFoot = ((java.util.Vector)oVMAlertas.getVMatrixAll().elementAt(3)).elementAt(idxAlertas)+"";%>
<script language="JavaScript">alert("<%=sMensajeFoot%>");</script><%
	} else {
		if(iFechaIniAlerta < iHoyAlerta && iFechaFinAlerta < iHoyAlerta ){
			String sRenglonAlerta = ((java.util.Vector)oVMAlertas.getVMatrixAll().elementAt(0)).elementAt(idxAlertas)+"";
			oVMAlertas.setRemoveKeyRow(sRenglonAlerta);
			idxAlertas --;
		}
	}
}%><%//=oVMAlertas.getVMatrixHTML() %>
<script language="JavaScript">
function AbrirVentana(){
var ancho = 250;
	var alto = 200 ;
	var x = (screen.width - ancho) / 2;
	var y = (screen.height - alto) / 2;
	var url = "Consiss.html"
	window.open(url, "Consiss", "width=" + ancho + ",height=" + alto + ",top=" + y + ",left=" + x + ",toolbar=0,location=0,directories=0,status=0,menubar=0,scrollbars=0,resizable=1");

}
</script>