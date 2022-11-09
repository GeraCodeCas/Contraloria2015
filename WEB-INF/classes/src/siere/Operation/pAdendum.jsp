<%/*********************************************************************************************************
Elaboro:	Claudia V. Sandoval Pardo
Lugar:		Monterrey, NL
Fecha:		25.Oct.2002
Compañia:	CONSISS*/%><%

String	sOpcion = request.getParameter("sOpcion")!= null ? request.getParameter("sOpcion"): "";
String	sCodigo = request.getParameter("sCodigo")!= null ? request.getParameter("sCodigo"): "0";

int iIdFuncionarioNvo =  java.lang.Integer.parseInt(
		(String)(session.getValue("iIdFuncionario")!= null?session.getValue("iIdFuncionario"):"0") );
		
int iIdFuncionarioAnt =  java.lang.Integer.parseInt(
		(String)(session.getValue("iIdFuncionarioAnt")!= null?session.getValue("iIdFuncionarioAnt"):"0") );
		
com.gob.Adendum oAdendum = new com.gob.Adendum();

String	sObservacion	= request.getParameter("sObservacion")!= null ? request.getParameter("sObservacion"): "";
int		iIdAnexo		= java.lang.Integer.parseInt(request.getParameter("iIdAnexo")!= null ? request.getParameter("iIdAnexo"): "0");
	
if(sOpcion.equals("SAVE")){
	if(sCodigo.equals("0")){
		//Insert(int pIdFuncionarioAnt, int pIdFuncionarioNvo, int pIdAnexo, String pObservacion)
		oAdendum.Insert(iIdFuncionarioAnt, iIdFuncionarioNvo, iIdAnexo, sObservacion );
	} else {
		//Update(int pIdRenglon, int pIdAnexo, String 
		oAdendum.Update(java.lang.Integer.parseInt(sCodigo), iIdAnexo, sObservacion);
	}
}

if(sOpcion.equals("DEL")){
	if(! oAdendum.Delete(java.lang.Integer.parseInt(sCodigo)) ){
	}
sCodigo = "";
sOpcion = "";
}
 %>

<html>
<head>
	<title>Entrega - Recepción : Adendum (Procesando...)</title>
</head>

<body>
<form action="fAdendum.jsp" name="forma" method="post" target="_parent">
	<input type="hidden" name="sOpcion" value="<%=sOpcion%>">
	<input type="hidden" name="sCodigo" value="<%=sCodigo%>">
</form>
</body>
<script>
	document.forma.submit();
</script>
</html>
