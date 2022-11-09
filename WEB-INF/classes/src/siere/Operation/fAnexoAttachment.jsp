<%
	VMatrix vArchivoA;
	AnexoArchivo oArchivoA 	= new AnexoArchivo();
	vArchivoA = oArchivoA.GetAll(iIdAnexo, iIdFuncionario);
	String sSep = "";
	if(vArchivoA.getNumRows()>0){%>
	<TR>
		<TD colspan="3"><b>Archivos Adjuntos (Attachment):</b><% 
		for(int i=0;i<vArchivoA.getNumRows();i++){
			String	sAnexoArchivo = (((Vector)vArchivoA.getVMatrixAll().elementAt(0)).elementAt(i)+"").trim();
			String  sRuta 		= (((Vector)vArchivoA.getVMatrixAll().elementAt(3)).elementAt(i)+"").trim();
			String 	sArchivo 	= (((Vector)vArchivoA.getVMatrixAll().elementAt(4)).elementAt(i)+"").trim();
			String	sLink		= (((Vector)vArchivoA.getVMatrixAll().elementAt(5)).elementAt(i)+"").trim() + (((Vector)vArchivoA.getVMatrixAll().elementAt(4)).elementAt(i)+"").trim();
			%><%=sSep%><a target="new" onmouseover="this.style.cursor='hand'" style="cursor:normal" href="<%=sLink%>"><font color="Blue"><%=sArchivo%></font></a><%
			sSep = ", ";
		}%>
		</TD>
	</TR><% 
	}
 %>