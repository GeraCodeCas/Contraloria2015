<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<html>
<head>
<%//@include file="../../jspsmartupload/jsp/sample6.jsp"%>
<%//response.setHeader("Content-Disposition","attachment;filename=I_2.XLS"); 
%><title>Untitled</title>
</head>

<body>
<%
java.io.PrintWriter outU = response.getWriter();
outU.println("C:\\GobiernoData\\Attachment\\Funcionario1\\Anexo1\\I_2.XLS");
%>


</body>
</html>
