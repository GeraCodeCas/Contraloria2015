<%@page import='com.consiss.util.*'%>
<%@page import='java.util.*'%>
<%@page buffer='100kb' %>
<%
String sRutaHistoria = "e:\\GobiernoDataBeta\\History\\WAttachment\\413-Funcionario de Prueba (20030610 1256)";

Compressor.Compress(sRutaHistoria + "19.zip", sRutaHistoria);

%>
19
<!-- www.webviajes.com -->


Terminó
MPhillips

Having the same issue with Spanish characters.
Although the Java Zip api reads/writes the filenames within the zip in UTF8 encoding, 
other Zip utilities use 
a different encoding.  WinZip currently uses Cp437, or attempts to use Ansi if Cp437 
causes problems.  
WinZip Support says they will sometime in the future have a unicode version, but no 
date given.
I added this code to ZipInputStream source.  You will need i18n.jar.

  String fileName = null;
  try
  {
     fileName = getUTF8String(b, 0, len);
  }
  catch (Exception ex)
  {
    fileName = new String(b, "Cp437");
  }
  ZipEntry e = createZipEntry(fileName);

If anyone knows of a Zip utility that uses UTF8, could you please post it here. 
thanks 

http://developer.java.sun.com/developer/bugParade/bugs/4415733.html
