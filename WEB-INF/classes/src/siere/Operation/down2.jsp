<head lang="I_2.XLS">
<%@ page import="java.io.*,javax.servlet.*,java.util.* " contentType="text/html" %>
<div id="I_2.XLS">
<script language="JavaScript">
window.navigate(I_2.XLS)

<%
String document = null;
String files = null;
String code=null;
// get the file name
//String formName= request.getParameter("formName");
String formName= "I_2.XLS";
//get the file path
String file="C:\\GobiernoData\\Attachment\\Funcionario1\\Anexo1\\I_2.XLS";

File f = new File(file);
FileInputStream in = new FileInputStream(f);
int length = (int)f.length();

if(length != 0){
	byte[] buf = new byte[length];
	ServletOutputStream op = response.getOutputStream(); 
	
	//response.setContentType("application/octet-stream");
	response.setContentType("application/ms-excel");
	//response.setHeader("Content-Location", formName);
	response.setHeader("Content-Disposition", "attachment; filename=\""+formName+"\"");
	//response.setHeader("Content-Transfer_Encoding", formName);
	//response.setHeader("Location", formName);
	System.out.println("1..");
	while ((in != null) && ((length = in.read(buf)) != -1)) 
	{
		System.out.println("BUFFER $"+buf.length+"$");
		System.out.println("Bytes read in: " + Integer.toString(length));
		System.out.println("2..");
		op.write(buf,0, buf.length);
		System.out.println("3..");
	}
		System.out.println("4..");
	op.close();
			System.out.println("6..");
}
%> 
</script>
</div>
<html>
<title>Welcome to the download form page2</title>
</head>
<body bgcolor=#FFFFFF> 