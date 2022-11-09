import javax.servlet.http.*;
import javax.servlet.ServletOutputStream;
import java.io.IOException;
import java.sql.* ;
import javax.sql.* ;
import javax.naming.*;
import java.net.*;
import java.util.*;
import java.lang.*;
import java.text.*;

public class SelectUser extends HttpServlet
{ Connection conn ;
   Statement stmt;
   DataSource ds=null;

	    public void init()
 	    {


 	    }
		public void doGet(HttpServletRequest req, HttpServletResponse res)
		{
			ServletOutputStream out=null;
			String clave="", usuario="", password="", apaterno="", amaterno="", nombre="", eva000_clave="", eva000_desc="";
			Integer rowcount = 0, li_admin=0;
			ResultSet rs;
			String nom_completo=null, ls_ip=null, ls_dbip=null, eva040_estatus="";
			java.util.Date  fecha = new java.util.Date();
			String dia_limite="10", owner="", motordata=null;
            Calendar cal = Calendar.getInstance(); 
			HttpSession session=null;
			session=req.getSession();
	 	    //conn=(Connection)session.getAttribute("conn");
            System.out.println("Mensaje 1");   
	 	    String usuario_aut = (String) session.getAttribute("usuario");
            System.out.println("usuario_aut="+usuario_aut); 
	 	    if(usuario_aut.compareTo("usuario")!=0)
	 	    {
		 	    System.out.println("Mensaje 2");   

				try{
					  res.sendRedirect("UsuarioAutentificacion.jsp");
				   }
				   catch(IOException Err)
				   {
					   //throws ServletException,
					  System.out.println("Error, try catch, Linea 47");    
				  	  Err.printStackTrace();
				   }
			}
			else{
 	         try{
		 	     System.out.println("Iniciando conexion con la base de datos (Login)");  
	 	         Context initContext = new InitialContext();
                 Context envContext  = (Context)initContext.lookup("java:/comp/env");
                 ds = (DataSource)envContext.lookup("jdbc/EVACON01");
             	}
             catch(NamingException Err)
             {
	              System.out.println("Error, try catch, Linea 69");    
	              Err.printStackTrace();
             }


            try{
	             conn = ds.getConnection();
                 stmt = conn.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE ,ResultSet.CONCUR_READ_ONLY );
               }
            catch(SQLException Err)
               {
	             System.out.println("Error, try catch, Linea 80");      
	             Err.printStackTrace();
               }

	        try{
	            out=res.getOutputStream();
	           }
	        catch(IOException Err)
	           {
		        System.out.println("Error, try catch, Linea 95");       
	            Err.printStackTrace();
	           }
	        try{

				owner="informix";
				motordata="1"; //motor de base de datos de informix
				session.setAttribute("owner", owner);
				session.setAttribute("motordata", motordata);
	            res.setContentType("text/html");
	            usuario =req.getParameter("usuario");
	            password=req.getParameter("password");
	            ValidaUsuario(usuario,password);

                try {
	                java.util.Date date = new java.text.SimpleDateFormat("yyyy-MM-dd").parse("2006-03-01");
                    }
                    catch (java.text.ParseException e)
                    {
                      System.out.println("Invalid Date Parser Exception");
                    }
	                System.out.println(fecha+" Iniciando Sesion el usuarioooo: "+usuario);

	                try{
		                 System.out.println("Antes de realizar el query");
		                 ls_ip=req.getRemoteAddr();
		                 rs=stmt.executeQuery("SELECT a.eva040_clave, a.eva040_apaterno, a.eva040_amaterno, a.eva040_nombre, a.eva000_clave, a.eva040_estatus, b.eva000_desc FROM "+owner+".eva040 a, "+owner+".eva000 b WHERE a.eva040_id='"+usuario+"' AND a.eva040_pass='"+password+"' AND b.eva000_clave = a.eva000_clave");
                         System.out.println("Antes barrer la tabla eva040");    
	                     while (rs.next())
  	                     {
		                  rowcount++;
		                  nom_completo=rs.getString(2)+' '+rs.getString(3)+' '+rs.getString(4);
		                  session.setAttribute("nom_completo", nom_completo);
		                  eva000_clave=rs.getString(5);
		                  eva040_estatus = rs.getString(6);
		                  eva000_desc=rs.getString(7);
		                  session.setAttribute("eva000_clave", eva000_clave);
		                  session.setAttribute("eva040_estatus", eva040_estatus);
		                  session.setAttribute("eva000_desc", eva000_desc);
		                  session.setAttribute("dia_limite", dia_limite);
		                  session.setAttribute("usuario", usuario);
   		                  System.out.println("Barrido no. "+rowcount);

	                     }
                         conn.close(); 
	                     if(rowcount==1)
	                     {

						   if(eva040_estatus.equals("1"))
		                   {
							res.sendRedirect("UsuarioAdministrador.jsp?noCache="+cal.getTimeInMillis());
						   }
						
						   if((eva040_estatus.equals("5")) || (eva040_estatus.equals("6")) || (eva040_estatus.equals("7")) || (eva040_estatus.equals("8")))
		                   {
							res.sendRedirect("evaluaciondirectores.jsp?noCache="+cal.getTimeInMillis());
						   } 
						
						   if((eva040_estatus.equals("3")) || (eva040_estatus.equals("4")))
					 	   {
							res.sendRedirect("evaluacion.jsp?noCache="+cal.getTimeInMillis());
						   }
                         }
                         else
                         {
	                      nom_completo=null;
	                      eva000_clave=null;
	                      eva000_desc=null;
	                      session.setAttribute("nom_completo", nom_completo);
	                      session.setAttribute("eva000_clave", eva000_clave);
		                  session.setAttribute("eva000_desc", eva000_desc);
		                  res.sendRedirect("UsuarioInvalido.jsp");
                         }

	                 }
                     catch(SQLException Err)
                     {
	                //////////////Para ralizar una segunda conexion, 19-06-2006 10:30 am
	                 try{
		                  System.out.println(fecha+" Iniciando Sesion el usuario (Segunda Conexion): "+usuario + ", Segundo Intento");
	                      conn.close(); 
	                      rowcount = 0;   
	                 }
                     catch(SQLException Err4){
	                     System.out.println("Error, try catch segunda conexion (conn.close()), Linea 188");  
	                     Err4.printStackTrace();
	                 }     
	                
	                 try{
		 	              System.out.println("Iniciando conexion con la base de datos (Login)");  
	 	                  Context initContext = new InitialContext();
                          Context envContext  = (Context)initContext.lookup("java:/comp/env");
                          ds = (DataSource)envContext.lookup("jdbc/EVACON01");
             	     }
                     catch(NamingException Err1)
                     {
	                    System.out.println("Error, try catch segunda conexion (Context), Linea 200");    
	                    Err1.printStackTrace();
                     }

                     try{
	                     conn = ds.getConnection();
                         stmt = conn.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE ,ResultSet.CONCUR_READ_ONLY );
                     }
                     catch(SQLException Err2)
                     {
	                   System.out.println("Error, try catch segunda conexion (conn = ds.getConnection()), Linea 210");    
	                   Err2.printStackTrace();
                     }
	                System.out.println(fecha+" Iniciando Sesion el usuario: "+usuario + ", Segundo Intento");
	                
	                try{
		                rs=stmt.executeQuery("SELECT a.eva040_clave, a.eva040_apaterno, a.eva040_amaterno, a.eva040_nombre, a.eva000_clave, a.eva040_estatus, b.eva000_desc FROM "+owner+".eva040 a, "+owner+".eva000 b WHERE a.eva040_id='"+usuario+"' AND a.eva040_pass='"+password+"' AND b.eva000_clave = a.eva000_clave");
	                    while (rs.next())
  	                    {
		                  rowcount++;
		                  nom_completo=rs.getString(2)+' '+rs.getString(3)+' '+rs.getString(4);
		                  session.setAttribute("nom_completo", nom_completo);
		                  eva000_clave=rs.getString(5);
		                  eva040_estatus = rs.getString(6);
		                  eva000_desc=rs.getString(7);
		                  session.setAttribute("eva000_clave", eva000_clave);
		                  session.setAttribute("eva040_estatus", eva040_estatus);
		                  session.setAttribute("eva000_desc", eva000_desc);
		                  session.setAttribute("dia_limite", dia_limite);


	                    }
	                    conn.close(); 
	                    if(rowcount==1)
	                    {
	   					  if(eva040_estatus.equals("1"))
		              	  {
							res.sendRedirect("UsuarioAdministrador.jsp?noCache="+cal.getTimeInMillis());
						  }
						  if((eva040_estatus.equals("5")) || (eva040_estatus.equals("6")) || (eva040_estatus.equals("7")) || (eva040_estatus.equals("8")))
		              	  {
				 			res.sendRedirect("evaluaciondirectores.jsp?noCache="+cal.getTimeInMillis());
				   		  }
						  if((eva040_estatus.equals("3")) || (eva040_estatus.equals("4")))
						  {
							res.sendRedirect("evaluacion.jsp?noCache="+cal.getTimeInMillis());
						  }
                        }
                        else
                        {
	                      nom_completo=null;
	                      eva000_clave=null;
	                      eva000_desc=null;
	                      session.setAttribute("nom_completo", nom_completo);
	                      session.setAttribute("eva000_clave", eva000_clave);
		                  session.setAttribute("eva000_desc", eva000_desc);
 	                      res.sendRedirect("UsuarioInvalido.jsp");
                        }

	                }
                    catch(SQLException Err3)
                    {
	                  System.out.println("Error, try catch segunda conexion, Linea 265");      
	                  Err3.printStackTrace();
	                  res.sendRedirect("ErrorSession.htm");
                    }
                        
	                
	                ////////////////////////////////////////////////////////////////////      
	                //Err.printStackTrace();
                   }

	            out.println("</BODY>");
	            out.println("</HTML>");
           }
       catch(IOException Err)
	     {
		  System.out.println("Error, try catch, Linea 279");       
	      Err.printStackTrace();
	     }


 	  }//else
   }
   
    public int ValidaUsuario(String usu, String pass)
    {
	  int ll_band = 0,ll_len, ll_for;
	  String ls_caracter = "'";
	  ll_len = usu.length();
      for(ll_for = 0; ll_for < ll_len; ll_for++ )	  
      {
	      System.out.println("caracter: "+usu.charAt(ll_for));
	      if ((usu.charAt(ll_for)== ',') || (usu.charAt(ll_for)== ls_caracter.charAt(0)) || (usu.charAt(ll_for)== '"'))
	      {
		      System.out.println("caracter invalido en el ID del usuario");
		      ll_band=1;
	      }
      }
      
      ll_len = pass.length();
      for(ll_for = 0; ll_for < ll_len; ll_for++ )	  
      {
	      System.out.println("caracter: "+pass.charAt(ll_for));
	      if ((pass.charAt(ll_for)== ',') || (pass.charAt(ll_for)== ls_caracter.charAt(0) ) || (pass.charAt(ll_for)== '"'))
	      {
		      System.out.println("caracter invalido en el Password");
		      ll_band=1;
	      }
      }
	  return ll_band;
   
    }
 }





