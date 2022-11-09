import javax.servlet.http.*;
import javax.servlet.ServletOutputStream;
import java.io.IOException;
import java.sql.* ;
import javax.sql.* ;
import javax.naming.*;
import java.net.*;
import java.util.*;


public class testbat 
{
	
	public int ejecutar(int li_a)
	{
		int li_return=1;
		System.out.println("ejecutando exe");
		Runtime aplicacion = Runtime.getRuntime(); 
        try{
	        aplicacion.exec("C:/i386/calc.exe"); 
            System.out.println("ejecucion si error"); 
            }
        catch(Exception e)
        {
	        System.out.println(e);
        }
        return li_return;
	}
}