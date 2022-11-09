<%

protected void returnDownloadString(HttpServletResponse aResponse, String aFileContent){
	ServletOutputStream aStream = null ;

	// set content type and other response header fields first
	aResponse.setContentType("www/unknown");

	// then write the data of the response
	try {
		aStream = aResponse.getOutputStream();
		aStream.println(aFileContent);
		aStream.close();
		}
	catch(java.io.IOException ex)
		{// error handling. 
		}
}
%>