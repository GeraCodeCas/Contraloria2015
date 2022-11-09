import javax.servlet.http.*;
import javax.servlet.ServletOutputStream;
import java.io.IOException;
import java.sql.* ;
import javax.sql.* ;
import javax.naming.*;
import java.net.*;
import java.util.*;
import java.lang.*;



public class Formula
{

	    public double AsignarFormula(int clave_indicador, double vp, double x1, double x2, double x3, double x4)
 	    {
			double y=0;

			switch(clave_indicador)
	 	    {
				case 1:
						y=formula1(x1,x2,vp);
						break;

				case 2:
						y=formula2(x1,x2,vp);
						break;

				case 3:
						y=formula3(x1,x2,vp);
						break;

				case 4:
						y=formula4(x1,x2,vp);
						break;

				case 5:
						y=formula5(x1,x2,vp);
						break;

				case 6:
						y=formula6(x1,x2,vp);
						break;

				case 7:
						y=formula7(x1,x2,vp);
						break;

				case 8:
						y=formula8(x1,x2,vp);
						break;

				case 9:
						y=formula9(x1,x2,x3,x4,vp);
						break;

				case 10:
						y=formula10(x1,x2,vp);
						break;

				case 11:
						y=formula11(x1,x2,vp);
						break;

				case 12:
						y=formula12(x1,x2,vp);
						break;

				case 13:
						y=formula13(x1,vp);
						break;

				case 14:
						y=formula14(x1,vp);
						break;

				case 15:
						y=formula15(x1,x2,vp);
						break;

				case 16:
						y=formula16(x1,x2,vp);
						break;

				case 17:
						y=formula17(x1,x2,vp);
						break;

				case 18:
						y=formula18(x1,x2,vp);
						break;

				case 19:
						y=formula19(x1,x2,vp);
						break;

				case 20:
						y=formula20(x1,x2,vp);
						break;

				case 21:
						y=formula21(x1,x2,vp);
						break;

				case 22:
						y=formula22(x1,x2,x3,x4,vp);
						break;

				case 23:
						y=formula23(x1,x2,vp);
						break;

				case 24:
						y=formula24(x1,vp);
						break;

				case 25:
						y=formula25(x1,vp);
						break;

				case 26:
						y=formula26(x1,vp);
						break;

				case 27:
						y=formula27(x1,vp);
						break;

				case 28:
						y=formula28(x1,vp);
						break;

				case 29:
						y=formula29(x1,x2,vp);
						break;

				case 30:
						y=formula30(x1,vp);
						break;

				case 31:
						y=formula31(x1,vp);
						break;

				case 32:
						y=formula32(x1,vp);
						break;

				case 33:
						y=formula33(x1,vp);
						break;

				case 34:
						y=formula34(x1,vp);
						break;

				case 35:
						y=formula35(x1,vp);
						break;

				case 36:
						y=formula36(x1,vp);
						break;

				case 37:
						y=formula37(x1,vp);
						break;

				case 38:
						y=formula38(x1,vp);
						break;

				case 39:
						y=formula39(x1,vp);
						break;

				case 40:
						y=formula40(x1,vp);
						break;

				case 41:
						y=formula41(x1,vp);
						break;

				case 42:
						y=formula42(x1,vp);
						break;

				case 43:
						y=formula43(x1,vp);
						break;

				case 44:
						y=formula44(x1,vp);
						break;

				case 45:
						y=formula45(x1,vp);
						break;

				case 46:
						y=formula46(x1,x2,vp);
						break;

				case 47:
						y=formula47(x1,x2,vp);
						break;

				case 48:
						y=formula48(x1,x2,vp);
						break;

				case 49:
						y=formula49(x1,vp);
						break;

				case 50:
						y=formula50(x1,vp);
						break;

				case 51:
						y=formula51(x1,vp);
						break;

				case 52:
						y=formula52(x1,vp);
						break;

				case 53:
						y=formula53(x1,vp);
						break;

				case 54:
						y=formula54(x1,vp);
						break;

				case 55:
						y=formula55(x1,vp);
						break;

				case 56:
						y=formula56(x1,vp);
						break;

				case 57:
						y=formula57(x1,vp);
						break;

				case 58:
						y=formula58(x1,vp);
						break;

				case 59:
						y=formula59(x1,vp);
						break;

				case 60:
						y=formula60(x1,vp);
						break;

				case 61:
						y=formula61(x1,vp);
						break;

				case 62:
						y=formula62(x1,vp);
						break;

				case 63:
						y=formula63(x1,vp);
						break;
				case 64:
						y=formula64(x1,vp);
						break;		

			}

	   		return y;

	  	}

	  	public double Redondear(double valor)
		{

		valor=valor*100;
		valor=java.lang.Math.round(valor);
		valor=valor/100;

		return valor;
		}

		public String RedondeoDecimal(double valor)
		{
			//System.out.println("valor = "+valor);
			ServletOutputStream out=null;
			char c,d;
			String str1="";
			String punto =".";
			String str=String.valueOf(valor);
			String nulo=null;
			int pos=0, res=0;

			for(int i=0;i<=str.length() - 1;i++)
			{

				c = str.charAt(i);
                if(punto.indexOf(c)==0)
			   	{

				   	pos = i;
					/*d = str.charAt(i+2);

					if(nulo.indexOf(d)==0)
					str1=str1+"0";*/
		   		}
			}
			res = str.length() - pos;
			if(res>=3)
			{
				//System.out.println("STR = "+str);
				return str;

	        }else
	        {
				//System.out.println("STR = "+str);
		        return str+"0";

            }



	  	}

	  	public double formula1(double x1, double x2, double vp)
	  	{
			//SI X2=0 --> Z=0
			double z=0;
			if((x1==0) && (x2==0))
			{
				z=vp;  
		    }else{	
			   if(x2==0) 
			   {
				  z=0;
		       }else{
			   	  z=(1-(x1/x2))*vp;
			      //z=Redondear(z);
			      z=Double.valueOf(RedondeoDecimal(z)).doubleValue();  
		       }   
		    }


			if (z>vp)	
			    z=vp;	

			return z;
		}

		public double formula2(double x1, double x2, double vp)
		{
			double z=0;

			if((x1==0) && (x2==0))
			{
				z=vp;  
		    }else{	
			    if(x2==0) 
			   {
				  z=0;
		       }else{
			      z=(x1/x2)*vp;
			      //z=Redondear(z);
			      z=Double.valueOf(RedondeoDecimal(z)).doubleValue();  
		       }   
	    	}

			if (z>vp)	
			   z=vp;

			return z;
		}

		public double formula3(double x1, double x2, double vp)
		{
			//SI X2=0 --> Z=0
			double z=0;

			if((x1==0) && (x2==0))
			{
				z=vp;  
		    }else{
				if(x2==0) 
			     {
				     z=0;
		         }else{
			         z=(1-(x1/x2))*vp;
			         //z=Redondear(z);
			         z=Double.valueOf(RedondeoDecimal(z)).doubleValue();  
		         }
	        }       

			if (z>vp)	
			    z=vp;
			/*if(x2==0)
				z=0;*/

			return z;
		}

		public double formula4(double x1, double x2, double vp)
		{
			//SI X2=0 --> Z=0
			double z=0;

			z=(1-(x1/x2))*vp;

			//z=Redondear(z);
			z=Double.valueOf(RedondeoDecimal(z)).doubleValue();  

			if(x2==0)
				z=0;
            if (z>vp)	
			    z=vp;
			return z;
		}

		public double formula5(double x1, double x2, double vp)
		{
			//SI X2=0 --> Z=0
			double z=0;

			z=(1-(x1/x2))*vp;

			//z=Redondear(z);
			z=Double.valueOf(RedondeoDecimal(z)).doubleValue();  

			if(x2==0)
				z=0;
			if (z>vp)	
			    z=vp;

			return z;
		}

		public double formula6(double x1, double x2, double vp)
		{
			//SI X2=0 --> Z=0
			double z=0;

			z=(1-(x1/x2))*vp;

			//z=Redondear(z);
			z=Double.valueOf(RedondeoDecimal(z)).doubleValue();  

			if(x2==0)
				z=0;
			if (z>vp)	
			    z=vp;	

			return z;
		}

		public double formula7(double x1, double x2, double vp)
		{
			double z=0;

			z=(x1/x2)*vp;

			//z=Redondear(z);
			z=Double.valueOf(RedondeoDecimal(z)).doubleValue();  

			if(x2==0)
				z=0;
			if (z>vp)	
			    z=vp;	

			return z;
		}

		public double formula8(double x1, double x2, double vp)
		{
			double z=0;

			z=(x1/x2)*vp;

			//z=Redondear(z);
			z=Double.valueOf(RedondeoDecimal(z)).doubleValue();  

			if(x2==0)
				z=0;
			if (z>vp)	
			    z=vp;	

			return z;
		}

		public double formula9(double x1, double x2, double x3, double x4, double vp)
		{
			//SI X2,X4,X4 =0 SE ASUME QUE Z=0
			double z=0.0;
            System.out.println("Formula 9 X1 = "+x1);    
            System.out.println("Formula 9 X2 = "+x2);  
            System.out.println("Formula 9 X3 = "+x3);      
            System.out.println("Formula 9 X4 = "+x4);    
			z=((x1/x2)/(x3/x4));
			System.out.println("Formula 9 Z = "+z);    

			
			if(z>=1.01)
				{z=0*vp;
				  System.out.println("Formula 9, Entro al primer if z>1.0");
				}else			//if(z<=1.00)
				{z=1*vp;
				 System.out.println("Formula 9, Entro al segundo if z<=1.0");
				}

			if((x2==0) || (x3==0) || (x4==0))
				{z=0;}

			//z=Redondear(z);
			z=Double.valueOf(RedondeoDecimal(z)).doubleValue();  

			return z;
		}

		public double formula10(double x1, double x2, double vp)
		{
			double z=0;

			z=(x1/x2)*vp;

			//z=Redondear(z);
			z=Double.valueOf(RedondeoDecimal(z)).doubleValue();  

			if(x2==0)
				z=0;
			if (z>vp)	
			    z=vp;	

			return z;
		}

		public double formula11(double x1, double x2, double vp)
		{
			double z=0;

			z=(x1/x2)*vp;

			//z=Redondear(z);
			z=Double.valueOf(RedondeoDecimal(z)).doubleValue();  

			if(x2==0)
				z=0;
			if (z>vp)	
			    z=vp;	

			return z;
		}

		public double formula12(double x1, double x2, double vp)
		{
			//SI X2=0 SE ASUME QUE EL INDICADOR =0
			double z=0;
            
			if(x1==0){
				z=vp;
			}else if(x1>=x2){
				z=0;
			}else{
				z=(1-(x1/x2))*vp;}

			//z=Redondear(z);
			z=Double.valueOf(RedondeoDecimal(z)).doubleValue();  

			/*if(x2==0)
				z=0;*/

			return z;
		}

		public double formula13(double x1, double vp)
		{
			double z=0;

			if(x1==1)
			{
				z=vp;
			}
			else
			{
				z=0;
			}

			return z;
		}

		public double formula14(double x1, double vp)
		{
			double z=0;

			if(x1==1)
			{
				z=vp;
			}
			else
			{
				z=0;
			}

			return z;
		}

		public double formula15(double x1, double x2, double vp)
		{
			double z=0;

			if(x1>=x2){
				z=vp;
			}else{
			    z=(x1/x2)*vp;}

			//z=Redondear(z);
			z=Double.valueOf(RedondeoDecimal(z)).doubleValue();  

			if(x2==0)
				z=0;

			return z;
		}

		public double formula16(double x1, double x2, double vp)
		{
			double z=0;

			if (x1>=x2){
				z=vp;
			}else{
			    z=(x1/x2)*vp;}

			//z=Redondear(z);
			z=Double.valueOf(RedondeoDecimal(z)).doubleValue();  

			if(x2==0)
				z=0;
			if (z>vp)	
			    z=vp;	

			return z;
		}

		public double formula17(double x1, double x2, double vp)
		{
			//SI X2=0 SE ASUME QUE EL INDICADOR =0
			double z=0;

			if(x2==0){
				z=vp;
			}else{
			    z=(1-(x1/x2))*vp; }

			//z=Redondear(z);
			z=Double.valueOf(RedondeoDecimal(z)).doubleValue();  

			if (z>vp)	
			    z=vp;
			/*if(x2==0)
				z=0;*/

			return z;
		}

		public double formula18(double x1, double x2, double vp)
		{
			//SI X2=0 SE ASUME QUE EL INDICADOR =0
			double z=0;

			if(x2==0){
				z=vp;
            }else{
			    z=(1-(x1/x2))*vp; }

			//z=Redondear(z);
			z=Double.valueOf(RedondeoDecimal(z)).doubleValue();  

			if (z>vp)	
			    z=vp;
			/*if(x2==0)
				z=0;*/

			return z;
		}

		public double formula19(double x1, double x2, double vp)
		{
			//SI X2=0 SE ASUME QUE EL INDICADOR =0
			double z=0;

			if (x2==0){
				z=vp;
			}else{
			    z=(1-(x1/x2))*vp;}

			//z=Redondear(z);
			z=Double.valueOf(RedondeoDecimal(z)).doubleValue();  

			if (z>vp)	
			    z=vp;
			/*if(x2==0)
				z=0;*/

			return z;
		}

		public double formula20(double x1, double x2, double vp)
		{
			double z=0;

			z=(x1/x2)*vp;

			//z=Redondear(z);
			z=Double.valueOf(RedondeoDecimal(z)).doubleValue();  

			if(x2==0)
				z=0;
			if (z>vp)	
			    z=vp;	

			return z;
		}

		public double formula21(double x1, double x2, double vp)
		{
			double z=0;

			z=(x1/x2)*vp;

			//z=Redondear(z);
			z=Double.valueOf(RedondeoDecimal(z)).doubleValue();  

			if(x2==0)
				z=0;
			if (z>vp)	
			    z=vp;	

			return z;
		}

		public double formula22(double x1, double x2, double x3, double x4, double vp)
		{
			//SE ASUME QUE Z=1 == 100%
			//SI X2, X3 O X4 = 0... el indicador valdrá 0
			double z=0.0;
            System.out.println("Formula 9 X1 = "+x1);    
            System.out.println("Formula 9 X2 = "+x1);  
            System.out.println("Formula 9 X3 = "+x3);      
            System.out.println("Formula 9 X4 = "+x4);    
			
			z=((x1/x2)/(x3/x4));
            System.out.println("Formula 9 Z = "+z);    
			if(z>=1.01)
			{
				 z=0*vp;
			}else //if(z<=1)
			{
				z=1*vp;
			}

			if((x2==0) || (x3==0) || (x4==0))
				{z=0;}

			//z=Redondear(z);
			z=Double.valueOf(RedondeoDecimal(z)).doubleValue();  

			return z;
		}

		public double formula23(double x1, double x2, double vp)
		{
			//SI X2 = 0, EL VALOR DEL INDICADOR = 0
			double z=0;

			z=(1-(x1/x2))*vp;

			//z=Redondear(z);
			z=Double.valueOf(RedondeoDecimal(z)).doubleValue();  

			if(x2==0)
				z=0;
			if (z<=0)	
			    z=0;		
			if (z>vp)	
			    z=vp;	

			return z;
		}

		public double formula24(double x1, double vp)
		{
			double z=0;

			if(x1==12)
			{
				z=vp;
			}
			else
			{
				z=0;
			}

			return z;
		}

		public double formula25(double x1, double vp)
		{
			double z=0;

			if(x1==1)
			{
				z=vp;
			}
			else
			{
				z=0;
			}

			return z;
		}

		public double formula26(double x1, double vp)
		{
			//QUE PERIOCIDAD TIENE ?
			double z=0;

			if(x1==1)
			{
				z=vp;
			}
			else
			{
				z=0;
			}

			return z;
		}

		public double formula27(double x1, double vp)
		{
			//QUE PERIOCIDAD TIENE ?
			double z=0;

			if(x1==1)
			{
				z=vp;
			}
			else
			{
				z=0;
			}

			return z;
		}

		public double formula28(double x1, double vp)
		{
			//QUE PERIOCIDAD TIENE ?
			double z=0;

			if(x1==1)
			{
				z=vp;
			}
			else
			{
				z=0;
			}

			return z;
		}

		public double formula29(double x1, double x2, double vp)
		{
			double z=0;

			z=(x1/x2)*vp;

			//z=Redondear(z);
			z=Double.valueOf(RedondeoDecimal(z)).doubleValue();  

			if(x2==0)
				z=0;
			if (z>vp)	
			    z=vp;	

			return z;
		}

		public double formula30(double x1, double vp)
		{
			double z=0;

			if(x1==1)
			{
				z=vp;
			}
			else
			{
				z=0;
			}

			return z;
		}

		public double formula31(double x1, double vp)
		{
			double z=0;

			if(x1==1)
			{
				z=vp;
			}
			else
			{
				z=0;
			}

			return z;
		}

		public double formula32(double x1, double vp)
		{
			double z=0;

			if(x1==1)
			{
				z=vp;
			}
			else
			{
				z=0;
			}

			return z;
		}

		public double formula33(double x1, double vp)
		{
			double z=0;

			if(x1==1)
			{
				z=vp;
			}
			else
			{
				z=0;
			}

			return z;
		}

		public double formula34(double x1, double vp)
		{
			double z=0;

			if(x1==1)
			{
				z=vp;
			}
			else
			{
				z=0;
			}

			return z;
		}

		public double formula35(double x1, double vp)
		{
			double z=0;

			if(x1==1)
			{
				z=vp;
			}
			else
			{
				z=0;
			}

			return z;
		}

		public double formula36(double x1, double vp)
		{
			double z=0;

			if(x1==1)
			{
				z=vp;
			}
			else
			{
				z=0;
			}

			return z;
		}

		public double formula37(double x1, double vp)
		{
			double z=0;

			if(x1==1)
			{
				z=vp;
			}
			else
			{
				z=0;
			}

			return z;
		}

		public double formula38(double x1, double vp)
		{
			double z=0;

			if(x1==1)
			{
				z=vp;
			}
			else
			{
				z=0;
			}

			return z;
		}

		public double formula39(double x1, double vp)
		{
			double z=0;

			if(x1==1)
			{
				z=vp;
			}
			else
			{
				z=0;
			}

			return z;
		}

		public double formula40(double x1, double vp)
		{
			double z=0;

			if(x1==1)
			{
				z=vp;
			}
			else
			{
				z=0;
			}

			return z;
		}

		public double formula41(double x1, double vp)
		{
			double z=0;

			if(x1==1)
			{
				z=vp;
			}
			else
			{
				z=0;
			}

			return z;
		}

		public double formula42(double x1, double vp)
		{
			double z=0;

			if(x1==1)
			{
				z=vp;
			}
			else
			{
				z=0;
			}

			return z;
		}

		public double formula43(double x1, double vp)
		{
			double z=0;

			if(x1==1)
			{
				z=vp;
			}
			else
			{
				z=0;
			}

			return z;
		}

		public double formula44(double x1, double vp)
		{
			double z=0;

			if(x1==1)
			{
				z=vp;
			}
			else
			{
				z=0;
			}

			return z;
		}

		public double formula45(double x1, double vp)
		{
			double z=0;

			if(x1==1)
			{
				z=vp;
			}
			else
			{
				z=0;
			}

			return z;
		}

		public double formula46(double x1, double x2, double vp)
		{
			double z=0;

			z=(x1/x2)*vp;

			//z=Redondear(z);
			z=Double.valueOf(RedondeoDecimal(z)).doubleValue();  

			if(x2==0)
				z=0;
			if (z>vp)	
			    z=vp;	

			return z;
		}

		public double formula47(double x1, double x2, double vp)
		{
			double z=0;

			z=(x1/x2)*vp;

			//z=Redondear(z);
			z=Double.valueOf(RedondeoDecimal(z)).doubleValue();  

			if(x2==0)
				z=0;
			if (z>vp)	
			    z=vp;	

			return z;
		}

		public double formula48(double x1, double x2, double vp)
		{
			double z=0;

			z=(x1/x2)*vp;

			//z=Redondear(z);
			z=Double.valueOf(RedondeoDecimal(z)).doubleValue();  

			if(x2==0)
				z=0;
			if (z>vp)	
			    z=vp;	

			return z;
		}

		public double formula49(double x1, double vp)
		{
			double z=0;

			x1=x1/4;

			if((x1>=0) && (x1<=59.99))
				z=(0*vp);

			if((x1>=60) && (x1<=79.99))
				z=(0.60*vp);

			if((x1>=80) && (x1<=100))
				z=(1*vp);

			//z=Redondear(z);
			z=Double.valueOf(RedondeoDecimal(z)).doubleValue();  
			if (z>vp)	
			    z=vp;

			return z;
		}

		public double formula50(double x1, double vp)
		{
			double z=0;
            x1=x1/4;
            if((x1>=0) && (x1<=59.99))
				z=(0*vp);

			if((x1>=60) && (x1<=79.99))
				z=(0.60*vp);

			if((x1>=80) && (x1<=100))
				z=(1*vp);

			//z=Redondear(z);
			z=Double.valueOf(RedondeoDecimal(z)).doubleValue();  
			if (z>vp)	
			    z=vp;

			return z;
		}

		public double formula51(double x1, double vp)
		{
			double z=0;

			x1=x1/4;

			if((x1>=0) && (x1<=59.99))
				z=(0*vp);

			if((x1>=60) && (x1<=79.99))
				z=(0.60*vp);

			if((x1>=80) && (x1<=100))
				z=(1*vp);

			//z=Redondear(z);
			z=Double.valueOf(RedondeoDecimal(z)).doubleValue();  
			if (z>vp)	
			    z=vp;

			return z;
		}

		public double formula52(double x1, double vp)
		{
			//X1 DEBE SER 4 PORQUE ES TRIMESTRAL (SI SE CUENTA Y ESTA ACTUALIZADO???)
			double z=0;

			if(x1==1)
			{
				z=vp;
			}
			else
			{
				z=0;
			}

			return z;
		}

		public double formula53(double x1, double vp)
		{
			double z=0;

			x1=x1/4;

			if((x1>=0) && (x1<=59.99))
				z=(0*vp);

			if((x1>=60) && (x1<=79.99))
				z=(0.60*vp);

			if((x1>=80) && (x1<=100))
				z=(1*vp);

			//z=Redondear(z);
			z=Double.valueOf(RedondeoDecimal(z)).doubleValue();  
			if (z>vp)	
			    z=vp;

			return z;
		}

		public double formula54(double x1, double vp)
		{
			//SI SE CUENTA Y ESTA ACTUALIZADO ?
			double z=0;

			if(x1==1)
			{
				z=vp;
			}
			else
			{
				z=0;
			}

			return z;
		}

		public double formula55(double x1, double vp)
		{
			//SI SE CUENTA Y ESTA ACTUALIZADO ?
			double z=0;

			if(x1==1)
			{
				z=vp;
			}
			else
			{
				z=0;
			}

			return z;
		}

		public double formula56(double x1, double vp)
		{
			//SI SE CUENTA Y ESTA ACTUALIZADO ?
			double z=0;

			if(x1==1)
			{
				z=vp;
			}
			else
			{
				z=0;
			}

			return z;
		}

		public double formula57(double x1, double vp)
		{
			//SI SE CUENTA Y ESTA ACTUALIZADO ?
			double z=0;

			if(x1==1)
			{
				z=vp;
			}
			else
			{
				z=0;
			}

			return z;
		}

		public double formula58(double x1, double vp)
		{
			//SI SE CUENTA Y ESTA ACTUALIZADO ?
			double z=0;

			if(x1==1)
			{
				z=vp;
			}
			else
			{
				z=0;
			}

			return z;
		}

		public double formula59(double x1, double vp)
		{
			double z=0;

			if(x1==0)
				z=(1*vp);

			if(x1==1)
				z=(0.50*vp);

			if(x1>=2)
				z=(0*vp);

			//z=Redondear(z);
              z=Double.valueOf(RedondeoDecimal(z)).doubleValue();  
              if (z>vp)	
			    z=vp;
			return z;
		}

		public double formula60(double x1, double vp)
		{
			double z=0;

			if(x1==0)
				z=(1*vp);

			if(x1==1)
				z=(0.50*vp);

			if(x1>=2)
				z=(0*vp);

			//z=Redondear(z);
			z=Double.valueOf(RedondeoDecimal(z)).doubleValue();  

			return z;
		}

		public double formula61(double x1, double vp)
		{
			double z=0;

			if(x1==0)
				z=(1*vp);

			if(x1==1)
				z=(0.50*vp);

			if(x1>=2)
				z=(0*vp);

			//z=Redondear(z);
			z=Double.valueOf(RedondeoDecimal(z)).doubleValue();  

			return z;
		}

		public double formula62(double x1, double vp)
		{
			double z=0;

			if(x1==0)
				z=(1*vp);

			if((x1>=1) && (x1<=5))
				z=(0.50*vp);

			if(x1>=6)
				z=(0*vp);

			//z=Redondear(z);
			z=Double.valueOf(RedondeoDecimal(z)).doubleValue();  

			return z;
		}

		public double formula63(double x1, double vp)
		{
			System.out.println("Formula 63, valor de x1 = "+x1);
			double z=0;

			if(x1==0)
				z=(1*vp);

			if((x1>=1) && (x1<=5))
				z=(0.50*vp);

			if(x1>=6)
				z=(0*vp);

			//z=Redondear(z);
			z=Double.valueOf(RedondeoDecimal(z)).doubleValue();  

			return z;
		}
		public double formula64(double x1, double vp)
		{
			
			System.out.println("Formula 64, valor de x1 = "+x1);
			double z=0;

			if(x1==0)
				z=(1*vp);

			if((x1>=1) && (x1<=5))
				z=(0.50*vp);

			if(x1>=6)
				z=(0*vp);

			//z=Redondear(z);
			z=Double.valueOf(RedondeoDecimal(z)).doubleValue();  
            System.out.println("valor de z = "+z); 
			return z;
		}
		
}