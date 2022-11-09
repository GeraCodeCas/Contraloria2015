import javax.servlet.http.*;
import javax.servlet.ServletOutputStream;
import java.io.*;
import java.io.IOException;
import java.sql.* ;
import javax.sql.* ;
import javax.naming.*;
import java.net.*;
import java.util.*;
import java.text.*;
import java.lang.*;



//import ChartDirector.*;


public class Dbconexion
{
  Connection conn ;
  DataSource ds=null;
  ServletOutputStream out=null;
  
	    public String EstablecerConexion (HttpServletRequest req, HttpServletResponse res)
	    {
		  //System.out.println("Iniciando Establecer conexion");  
	      String ls_return="1", nom_completo=null;
	      HttpSession session=null;
		  session=req.getSession();
		  nom_completo = (String) session.getAttribute("nom_completo");
		  //System.out.println("Iniciando Establecer conexion");
		  try{
			  System.out.println("Iniciando conexion con la base de datos (DbConexion) "+nom_completo);  
	 	       Context initContext = new InitialContext();
               Context envContext  = (Context)initContext.lookup("java:/comp/env");
               ds = (DataSource)envContext.lookup("jdbc/EVACON01");
             }
             catch(NamingException Err)
             {
	              Err.printStackTrace();
             }
             
             try{
	             conn = ds.getConnection();
               }
            catch(SQLException Err)
               {
	             Err.printStackTrace();
               }
            session.setAttribute("conn", conn);   
            return ls_return;

	    }
}