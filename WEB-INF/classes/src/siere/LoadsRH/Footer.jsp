<table border="0" cellpadding="0" cellspacing="0" width="100%">
	<tr>
		<td class="foot" align="center">Powered by Consiss</td>	
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