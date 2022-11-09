<%
Acta oActa 	= new Acta();
Funcionario oFuncionario = new Funcionario();
oActa.Get(iIdFuncionario);
oFuncionario.Get(iIdFuncionario);
%>
<table border="0" cellpadding="0" cellspacing="0" width="900">
	<tr valign="top">
		<td align="left"><br>
			<b>ENTREGA:&nbsp;<%=oFuncionario.GetNombre() + " " + oFuncionario.GetApePaterno() + " " + oFuncionario.GetApeMaterno() %></b></td>
		<td align="right"><br>
			<b>RECIBE:&nbsp;<%=oActa.GetNombreRecibe()%></b></td>
	</tr>
</table>
<script language="Javascript">
	if (<%=numpag%> > 1 ){
	var i;
		for(i = 0; i < <%=numtot%> ; i++) 
		    TotalPaginas[i].value = <%=numtot%>;
	}else{
		TotalPaginas.value = 1;
	}
</script>