import javax.servlet.http.*;
import javax.servlet.ServletOutputStream;
import java.io.IOException;
import java.sql.* ;
import javax.sql.* ;
import javax.naming.*;
import java.net.*;

public class Convertir
{

	    public String conver(String str)
 	    {
	 	    ServletOutputStream out=null;
			char c;
	   		String str1="";
	   		String coma =",";

	   	  for(int i=0;i<=str.length() - 1;i++)
	   		{
	   			c = str.charAt(i);
	   			if(coma.indexOf(c)!= 0)
	   			{
	   				str1=str1+str.charAt(i);
   			    }
	   		}

	   		return str1;

	  	}

	  public static String formatnum (String source)
	  {
	    char c;
	   	String str1="";
	   	String punto=".",numero ="0", coma=",";
		int z=0;


	   	for(int w=source.length()-1;w>=0;w--)
	   	{
	   	  c = source.charAt(w);
          if(punto.indexOf(c)== 0)
	   	   {
		     z=0;
			 str1=str1+source.charAt(w);
	   	   }
		  if ((c=='0') || (c=='1') || (c=='2') || (c=='3') || (c=='4') || (c=='5') || (c=='6')|| (c=='7') || (c=='8') || (c=='9'))
		   {
		     str1=str1+source.charAt(w);
			 z++;
			 if((z==3 ) && (w!=0))
			  {
			    str1=str1+coma;
				z=0;
			  }
		   }
		}
		str1 = reverseIt(str1);
		return str1;
	  }


  	  public static String reverseIt(String source)
  	  {
        int i, len = source.length();
        StringBuffer dest = new StringBuffer(len);

        for (i = (len - 1); i >= 0; i--) {
            dest.append(source.charAt(i));
        }
        return dest.toString();
      }


}