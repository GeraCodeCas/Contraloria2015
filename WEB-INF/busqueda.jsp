<%@ page import="javax.servlet.http.*"
import= "java.sql.*"
import="java.io.*"
import= "java.util.*"
import= "com.consiss.db.*"
import= "com.consiss.util.*"
import= "com.consiss.util.tools.*"%>

<%
String sNombre = (String) session.getAttribute("sNombre");
if (sNombre == null)
 {
 response.sendRedirect("index.jsp");
 }
Utilerias oUtil = new Utilerias();
ConnectionJDBC oCnn;
oCnn = new ConnectionJDBC();
oCnn.Open();
ResultSet oRs = null;
String ls_estatus=null;
String sDireccion = request.getParameter("sDireccion");
String sEstatus = request.getParameter("sEstatus");

String sClaveDir = (String) session.getAttribute("sClaveDir");
String sClaveUser = (String) session.getAttribute("sClaveUser");

String Par1 =request.getParameter("Param1");
String Par2 =request.getParameter("Param2");
String Par3 =request.getParameter("Param3");
String Par4 =request.getParameter("Param4");
String Par5 =request.getParameter("Param5");
String Par6 =request.getParameter("Param6");
String Par7 =request.getParameter("Param7");
String Par8 =request.getParameter("Param8");
String Boton =request.getParameter("radio_button");
%>


<html>
<head>
<title>Actividades Personales</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">

<link href="main" rel="stylesheet" type="text/css">
<link href="fonta" rel="stylesheet" type="text/css">
<link href="fontacuerdosnegro" rel="stylesheet" type="text/css">
</head>

<body topmargin="0" marginheight="0" leftmargin="0" marginwidth="0">
<%String ls_name = "Luis antonio padilla martinez ";
  String sSql=null, ls_fol=null, ls_nomdir=null;
  
  try {
        sSql = "SELECT act000_desc FROM act000 where act000_clave = "+sDireccion;
        oRs=oCnn.Execute(sSql);
        while (oRs.next())
        { 
		  ls_nomdir = oRs.getString(1);
	    } 
        oRs.close();
        oRs = null;
 }catch (Throwable e) {
         System.out.println("Error en ListPersonales nombre de la dirección.jsp New " + e + " SQL:" + sSql);
 }
  
  System.out.println("Paso el select");
  
  
%>
<form name="editor" action="update.jsp"  method="post">
<center>
<TABLE width="800" border="0" cellpadding="0" cellspacing="0" >
   <TR>
        <TD colspan="2"><img src="Imagenes/act02.jpg" width="800"></TD>
      </TR>
   
   <!--TR><TD bgcolor="#DEDEC0" bordrcolor="#CCCC9D" align="center" colspan="2" >Actividades Personales</TD></TR-->
   <TR><TD height="40" valign="middle">
                     <table width="799">
            <tr>
					   <td><a href="index01.jsp"><font size="2" color="#666666" >Inicio</font></a>&nbsp;
                       <a href="lGeneradas.jsp"><font size="2" color="#666666" >Regresar</font></a>&nbsp;
                      <a href="fActividad.jsp?op=1&sDireccion=<%=sDireccion%>&sEstatus=<%=sEstatus%>"><font size="2" color="#666666" >Nuevo Acuerdo</font></a></td>
					  </tr>
					  <tr>
					   <td height="38" valign="middle"><img src="Imagenes/send02.JPG">&nbsp;&nbsp;<strong><font size="2" face="Georgia, Times New Roman, Times, serif">Generadas \ <%=ls_nomdir%></font></strong></td>
					  </tr>
					  <tr>
					   <td><a href="ListPersonalestmp.jsp?sDireccion=<%=sDireccion%>&sEstatus=1"><font size="2" color="#500008" >En 
                           Proceso</font></a> &nbsp;<a href="ListPersonalestmp.jsp?sDireccion=<%=sDireccion%>&sEstatus=2"><font size="2" color="#500008" >Terminadas</font></a> 
                           &nbsp;<a href="ListPersonalestmp.jsp?sDireccion=<%=sDireccion%>&sEstatus=3"><font size="2" color="#500008" >Canceladas</font></a>
						   &nbsp;<a href="Buscar.jsp?sDireccion=<%=sDireccion%>&sEstatus=<%=sEstatus%>"><font size="2" color="#500008" >Buscar Asunto</font></a></td>
					  </tr>
					 </table>  
          </TD>
      </TR>
   <TR><TD valign="top">
   <TABLE width="800" border="0" bordercolor="#000000" cellspacing="1" cellpadding="2" >
        <!--TR><TD  colspan="7" bordercolor="#FFFFFF" ><a href="ListAsignadas.jsp?sDireccion=<%//=sDireccion%>&sEstatus=1"><font size="2" color="#666666" >En Proceso</font></a>
		             &nbsp;<a href="ListAsignadas.jsp?sDireccion=<%//=sDireccion%>&sEstatus=2"><font size="2" color="#666666" >Terminadas</font></a>
					 &nbsp;<a href="ListAsignadas.jsp?sDireccion=<%//=sDireccion%>&sEstatus=3"><font size="2" color="#666666" >Canceladas</font></a></TD></TR-->
        <TR>
            <!--TD bordercolor="#000000" bgcolor="#F2F2DE" width="71" align="center" background="Imagenes/titleact01.JPG"><font size="-1" color="#CCFF00" >No. Control </font></TD>
		    <TD bgcolor="#F2F2DE" width="82" align="center" background="Imagenes/titleact01.JPG"><font size="-1" color="#CCFF00">Fecha</font></TD-->
		    <%
			System.out.println("Case de Estatis");
			switch (Integer.parseInt(sEstatus.trim())) {
            case 1:  ls_estatus = "En Proceso"; break;
            case 2:  ls_estatus ="Terminados"; break;
            case 3:  ls_estatus ="Cancelados"; break;
            default: ls_estatus ="Error";break;
         }
			%>
			  <TD bgcolor="#F2F2DE" width="60%" align="center" background="Imagenes/titleact01.JPG"><font size="3" color="#FFFFFF">Resultado 
                de la Busqueda</font></TD>
		    <!--TD bgcolor="#F2F2DE" width="112" align="center" background="Imagenes/titleact01.JPG"><font size="-1" color="#CCFF00">Estatus</font></TD-->
			  <TD bgcolor="#F2F2DE" width="10%" align="center" background="Imagenes/titleact01.JPG"><font size="3" color="#FFFFFF">(%) 
                Avance </font></TD>
			<TD bgcolor="#F2F2DE" width="10%" align="center" background="Imagenes/titleact01.JPG"><font size="3" color="#FFFFFF">Mensajes</font></TD>
			  <TD bgcolor="#F2F2DE" width="20%" align="center" background="Imagenes/titleact01.JPG"><font size="3" color="#FFFFFF">Ultimo Mensaje</font></TD>
			<!--TD bgcolor="#F2F2DE" colspan="3" align="center" background="Imagenes/titleact01.JPG"><font size="-1" color="#CCFF00">Opciones</font></TD-->
		</TR>
	<%
	int z=0;
	String color=null, fontlink=null, fontdesc=null;
   try { 
         java.util.Date ldFechaUltimo;
		 if (Boton.equals("1"))
		  {	
          if(sDireccion.equals("0"))
		   {
		   System.out.println("Select para todos"); 
		   sSql = "SELECT b.act030_clave, b.act030_fecha_elaboracion, b.act030_titulo, b.act030_estatus, a.act050_avance, (select count(*) from act040 f where f.act030_clave=b.act030_clave) as nmensajes, (select max(act040_fecha_elabora) from act040 g where g.act030_clave =b.act030_clave) as ultimo_men, c.act000_desc, b.act030_fecha_psolucion FROM act050 a, act030 b, act000 c WHERE b.act030_clave = a.act030_clave AND a.act000_clave ="+sDireccion+" AND b.act000_clave = c.act000_clave AND b.act030_clave = "+Par1+" ORDER BY a.act030_clave DESC";
		   }
		  else
		   {
		   sSql = "SELECT b.act030_clave, b.act030_fecha_elaboracion, b.act030_titulo, b.act030_estatus, a.act050_avance, (select count(*) from act040 f where f.act030_clave=b.act030_clave) as nmensajes, (select max(act040_fecha_elabora) from act040 g where g.act030_clave =b.act030_clave) as ultimo_men, c.act000_desc, b.act030_fecha_psolucion FROM act050 a, act030 b, act000 c WHERE b.act030_clave = a.act030_clave AND a.act000_clave ="+sDireccion+" AND b.act000_clave = c.act000_clave AND b.act030_clave = "+Par1+" ORDER BY a.act030_clave DESC";
		   }
          }
		 if (Boton.equals("2"))
		  {	
          if(sDireccion.equals("0"))
		   {
		   System.out.println("Select para todos"); 
		   sSql = "SELECT b.act030_clave, b.act030_fecha_elaboracion, b.act030_titulo, b.act030_estatus, a.act050_avance, (select count(*) from act040 f where f.act030_clave=b.act030_clave) as nmensajes, (select max(act040_fecha_elabora) from act040 g where g.act030_clave =b.act030_clave) as ultimo_men, c.act000_desc, b.act030_fecha_psolucion FROM act050 a, act030 b, act000 c WHERE b.act030_clave = a.act030_clave AND a.act000_clave ="+sDireccion+" AND b.act000_clave = c.act000_clave AND (b.act030_fecha_elaboracion <= '"+oUtil.dGetDateFormat(Par2)+"' AND b.act030_fecha_elaboracion >= '"+oUtil.dGetDateFormat(Par3)+"') ORDER BY a.act030_clave DESC";
		   }
		  else
		   {
		   sSql = "SELECT b.act030_clave, b.act030_fecha_elaboracion, b.act030_titulo, b.act030_estatus, a.act050_avance, (select count(*) from act040 f where f.act030_clave=b.act030_clave) as nmensajes, (select max(act040_fecha_elabora) from act040 g where g.act030_clave =b.act030_clave) as ultimo_men, c.act000_desc, b.act030_fecha_psolucion FROM act050 a, act030 b, act000 c WHERE b.act030_clave = a.act030_clave AND a.act000_clave ="+sDireccion+" AND b.act000_clave = c.act000_clave AND (b.act030_fecha_elaboracion >= '"+oUtil.dGetDateFormat(Par2)+"' AND b.act030_fecha_elaboracion <= '"+oUtil.dGetDateFormat(Par3)+"') ORDER BY a.act030_clave DESC";
		   }
          } 		  
		  
		  if (Boton.equals("3"))
		  {	
          if(sDireccion.equals("0"))
		   {
		   System.out.println("Select para todos"); 
		   sSql = "SELECT b.act030_clave, b.act030_fecha_elaboracion, b.act030_titulo, b.act030_estatus, a.act050_avance, (select count(*) from act040 f where f.act030_clave=b.act030_clave) as nmensajes, (select max(act040_fecha_elabora) from act040 g where g.act030_clave =b.act030_clave) as ultimo_men, c.act000_desc, b.act030_fecha_psolucion FROM act050 a, act030 b, act000 c WHERE b.act030_clave = a.act030_clave AND a.act000_clave ="+sDireccion+" AND b.act000_clave = c.act000_clave AND (b.act030_fecha_psolucion <= '"+oUtil.dGetDateFormat(Par4)+"' AND b.act030_fecha_psolucion >= '"+oUtil.dGetDateFormat(Par5)+"') ORDER BY a.act030_clave DESC";
		   }
		  else
		   {
		   sSql = "SELECT b.act030_clave, b.act030_fecha_elaboracion, b.act030_titulo, b.act030_estatus, a.act050_avance, (select count(*) from act040 f where f.act030_clave=b.act030_clave) as nmensajes, (select max(act040_fecha_elabora) from act040 g where g.act030_clave =b.act030_clave) as ultimo_men, c.act000_desc, b.act030_fecha_psolucion FROM act050 a, act030 b, act000 c WHERE b.act030_clave = a.act030_clave AND a.act000_clave ="+sDireccion+" AND b.act000_clave = c.act000_clave AND (b.act030_fecha_psolucion <= '"+oUtil.dGetDateFormat(Par4)+"' AND b.act030_fecha_psolucion >= '"+oUtil.dGetDateFormat(Par5)+"') ORDER BY a.act030_clave DESC";
		   }
          } 
		  
		  if (Boton.equals("4"))
		  {	
          if(sDireccion.equals("0"))
		   {
		   System.out.println("Select para todos"); 
		   sSql = "SELECT b.act030_clave, b.act030_fecha_elaboracion, b.act030_titulo, b.act030_estatus, a.act050_avance, (select count(*) from act040 f where f.act030_clave=b.act030_clave) as nmensajes, (select max(act040_fecha_elabora) from act040 g where g.act030_clave =b.act030_clave) as ultimo_men, c.act000_desc, b.act030_fecha_psolucion FROM act050 a, act030 b, act000 c WHERE b.act030_clave = a.act030_clave AND a.act000_clave ="+sDireccion+" AND b.act000_clave = c.act000_clave AND (b.act030_fecha_solucion <= '"+oUtil.dGetDateFormat(Par6)+"' AND b.act030_fecha_solucion >= '"+oUtil.dGetDateFormat(Par7)+"') ORDER BY a.act030_clave DESC";
		   }
		  else
		   {
		   sSql = "SELECT b.act030_clave, b.act030_fecha_elaboracion, b.act030_titulo, b.act030_estatus, a.act050_avance, (select count(*) from act040 f where f.act030_clave=b.act030_clave) as nmensajes, (select max(act040_fecha_elabora) from act040 g where g.act030_clave =b.act030_clave) as ultimo_men, c.act000_desc, b.act030_fecha_psolucion FROM act050 a, act030 b, act000 c WHERE b.act030_clave = a.act030_clave AND a.act000_clave ="+sDireccion+" AND b.act000_clave = c.act000_clave AND (b.act030_fecha_solucion <= '"+oUtil.dGetDateFormat(Par6)+"' AND b.act030_fecha_solucion >= '"+oUtil.dGetDateFormat(Par7)+"') ORDER BY a.act030_clave DESC";
		   }
          } 		  		  
		  
		  
		  
		  
		 if (Boton.equals("5"))
		  {	
          if(sDireccion.equals("0"))
		   {
		   System.out.println("Select para todos"); 
		   sSql = "SELECT b.act030_clave, b.act030_fecha_elaboracion, b.act030_titulo, b.act030_estatus, a.act050_avance, (select count(*) from act040 f where f.act030_clave=b.act030_clave) as nmensajes, (select max(act040_fecha_elabora) from act040 g where g.act030_clave =b.act030_clave) as ultimo_men, c.act000_desc, b.act030_fecha_psolucion FROM act050 a, act030 b, act000 c WHERE b.act030_clave = a.act030_clave AND a.act000_clave ="+sDireccion+" AND b.act000_clave = c.act000_clave AND b.act030_titulo LIKE '%"+Par8+"%' ORDER BY a.act030_clave DESC";
		   }
		  else
		   {
		   sSql = "SELECT b.act030_clave, b.act030_fecha_elaboracion, b.act030_titulo, b.act030_estatus, a.act050_avance, (select count(*) from act040 f where f.act030_clave=b.act030_clave) as nmensajes, (select max(act040_fecha_elabora) from act040 g where g.act030_clave =b.act030_clave) as ultimo_men, c.act000_desc, b.act030_fecha_psolucion FROM act050 a, act030 b, act000 c WHERE b.act030_clave = a.act030_clave AND a.act000_clave ="+sDireccion+" AND b.act000_clave = c.act000_clave AND b.act030_titulo LIKE '%"+Par8+"%' ORDER BY a.act030_clave DESC";
		   }
          }
		  
        oRs=oCnn.Execute(sSql);
   	    while (oRs.next())
	   {
	     ls_fol = oRs.getString(1);
	     switch (oRs.getInt(4)) {
            case 1:  ls_estatus = "En Proceso"; break;
            case 2:  ls_estatus ="Terminada"; break;
            case 3:  ls_estatus ="Cancelada"; break;
            default: ls_estatus ="Error";break;
         }
         if(z==0)
				{//color="#636563";
				color="#DEDFC6";
				fontlink="fontacuerdosnegro";
				fontdesc = "#333333";
				z=1;}
			else{
				 color="#FFFFFF";
				 fontlink="fontacuerdosnegro";
				 fontdesc = "#333333";
				z=0;}
				System.out.println("color="+color);
	     %>
		 <TR><TD align="left" bgcolor="<%=color%>"><a href="lSeguimiento.jsp?fol=<%=ls_fol%>&tipo_acceso=Personales&sDireccion=<%=sDireccion%>&sEstatus=<%=sEstatus%>" class="<%=fontlink%>">#<%=oRs.getString(1)%>&nbsp;&nbsp;<%=oUtil.sGetDate(oRs.getDate(2), "dd/MM/yyyy")%></a><font class="fontacuerdosnegroCopia"  color="<%=fontdesc%>">,&nbsp;&nbsp;Fecha Limite:&nbsp;&nbsp;<%=oUtil.sGetDate(oRs.getDate(9), "dd/MM/yyyy")%></font><br><b><%=oRs.getString(8)%></b><br><a href="fActividad.jsp?op=2&fol=<%=ls_fol%>&sDireccion=<%=sDireccion%>&sEstatus=<%=sEstatus%>"><font class="fontacuerdosnegroCopia"  color="<%=fontdesc%>"><%=oRs.getString(3)%></font></a></TD>
		     <!--TD align="center" bgcolor="<%//=color%>"><font size="-1" color="#FFFFFF"><%//=oUtil.sGetDate(oRs.getDate(2), "dd/MM/yyyy")%></font></TD>
			 <TD bgcolor="<%=color%>"><font size="-1" color="#FFFFFF" face="Times New Roman, Times, serif"><%//=oRs.getString(3)%></font></TD-->
			 <!--TD bgcolor="<//%=color%>"><font size="-1" color="#FFFFFF"><%//=ls_estatus%></font></TD-->
			 <TD bgcolor="<%=color%>" align="center"><font size="-1" color="<%=fontdesc%>"><%=oRs.getString(5)%></font></TD>
			 <TD bgcolor="<%=color%>" align="center"><font size="-1" color="<%=fontdesc%>"><%=oRs.getString(6)%></font></TD>
			 <% ldFechaUltimo = oRs.getDate(7);
			 
			 %>
			 <TD bgcolor="<%=color%>" align="center"><font size="-1" color="<%=fontdesc%>"><%=ldFechaUltimo!=null ? oUtil.sGetDate(ldFechaUltimo, "dd/MM/yyyy")  : "-"%></font></TD>
		     <!--TD width="69" align="center" bgcolor="<%=color%>"><A href="lSeguimiento.jsp?fol=<%//=ls_fol%>&tipo_acceso=Asignadas&sDireccion=<%//=sDireccion%>&sEstatus=<%//=sEstatus%>"><font size="-1" color="#FFFFFF">Seguimiento</font></A></TD-->
		 </TR>
		 <%
       } 
	   
	   oRs.close();
       oRs = null;
	}
    catch (Throwable e) {
      System.out.println("Error en ListPersonales.jsp " + e + " SQL:" + sSql);
    }
  
   %>
		
   </TABLE>
   </TD></TR>

   <%
   /*try {
        sSql = "SELECT a.act000_clave, a.act000_desc FROM act000 a ORDER BY a.act000_desc";
        oRs=oCnn.Execute(sSql);
   	    while (oRs.next())
	   {
	     %>
		 <TR><TD><%=oRs.getString(1)%></TD><TD><%=oRs.getString(2)%></TD></TR>
		 <%
       } 
	   
	   oRs.close();
       oRs = null;
	}
    catch (Throwable e) {
      System.out.println("Error en oAnexo3VII.init: " + e + " SQL:" + sSql);
    }*/
  
   %>
           <!--script type="text/javascript"> 
              var sBasePath = document.location.pathname.substring(0,document.location.pathname.lastIndexOf('_samples')) ;
              var oFCKeditor = new FCKeditor( 'FCKeditor1' ) ;
              oFCKeditor.BasePath	= sBasePath ;
              oFCKeditor.Height	= 300 ;
              oFCKeditor.Value	= 'This is some <strong>sample text<\/strong>. You are using <a href="http://www.fckeditor.net/">FCKeditor<\/a>.' ;
              oFCKeditor.Create() ;
           </script--> 

			<!--script type="text/javascript" src="fckeditor.js"></script>
		    <div>
		    	<textarea name="Comentario" cols="100" rows="12"><%//=ls_name%></textarea>
		    </div>
	        <script type="text/javascript">

  	          var sBasePath = '' ;
 	          var oFCKeditor = new FCKeditor( 'Comentario' ) ;
         	  oFCKeditor.BasePath	= sBasePath ;
	          oFCKeditor.ReplaceTextarea() ;
	        </script></td></tr></table-->
		   

       <!--/TD></TR-->
  <!--TR><TD align="center"><input type="submit" name="Submit" value="Aceptar" class="boton"></TD></TR-->	   
</TABLE>
</center>
</form>
</body>
</html>
