import javax.servlet.http.*;
import javax.servlet.ServletOutputStream;
import java.io.IOException;
import java.sql.* ;
import javax.sql.* ;
import javax.naming.*;
import java.net.*;
import java.util.*;
import java.text.*;


public class FechaPeriodo
{
	int ii_periodo = 0, ii_mes = 0, axo_actual = 0;
    Connection conn ;
    Statement stmt;
	    public int periodo (int nreg, int axo_eval)
	    { ServletOutputStream out=null;
		  int li_periodo=0;

		  java.util.Calendar fecha = java.util.Calendar.getInstance();
          ii_mes = fecha.get(java.util.Calendar.MONTH) + 1;
          axo_actual = fecha.get(java.util.Calendar.YEAR);

          switch (nreg)
			  {
				  case 1:
				  		li_periodo = 1;
				  		break;
				  case 2:
				  		li_periodo = semestral(ii_mes, axo_eval, axo_actual);
				  		break;
            	  case 4:
            	  		li_periodo = trimestral(ii_mes, axo_eval, axo_actual);
            	  		break;
            	  case 6:
            	  		li_periodo = bimestral(ii_mes, axo_eval, axo_actual);
            	  		break;
            	  case 12:
            	        if(axo_eval==axo_actual)
            	        {
            	  		  li_periodo = ii_mes - 1;
            	  		  if(li_periodo<=0)
            	  		     li_periodo = 1;
        	  		    }else{
	        	  		  li_periodo = 12;
	        	  	    }    
            	  		break;
          	  }



          //li_periodo=12;//Imprime todas las etiquetas de periodo (mes, trimestre, anual, etc) y habilita todos los campos de captura, se debera eliminar para trabajar de modo normal..

          return li_periodo;
	    }



	 public int semestral (int mes, int axo_eval, int axo_actual)
	 {
            if(axo_eval==axo_actual)
            {

             if ((mes>= 1) && (mes <= 6))
              return 1;
             else
              return 2;
		    }else{
			  return 2;
		    }


	 }

	 public int trimestral (int mes, int axo_eval, int axo_actual)
	 {
		 if(axo_eval==axo_actual)
		 {

	       if ((mes>= 1) && (mes <= 3))
	         return 1;
	       else if ((mes>= 4) && (mes <= 6))
	         return 2;
           else if ((mes>= 7) && (mes <= 9))
             return 3;
           else if((mes>= 10) && (mes <= 12))
             return 4;
           else
             return -1;
		 }
		 else
		 {
			 return 4;
		 }
     }

	 public int bimestral (int mes, int axo_eval, int axo_actual)
	 {
		 if(axo_eval==axo_actual)
		 {

           if ((mes>= 1) && (mes <= 2))
             return 1;
           else if ((mes>= 3) && (mes <= 4))
             return 2;
           else if ((mes>= 5) && (mes <= 6))
             return 3;
           else if ((mes>= 7) && (mes <= 8))
             return 4;
           else if ((mes>= 9) && (mes <= 10))
             return 5;
           else if((mes>= 11) && (mes <= 12))
             return 6;
           else
             return -1;
		 }
		 else
		 {
			 return 6;
		 }
     }

     public int limiteCaptura(int periodo, int tipo_periodo, int dia_limite, int mes, int dia, int axo_actual, int axo_dato)
     {
		int p=0, res=0, axo=0;
		String ls_p="";
        String str_periodo=String.valueOf(periodo);
        String str_dia_limite=String.valueOf(dia_limite);
        String str_dia=String.valueOf(dia);
        String str_mes=String.valueOf(mes);

		String vec_bimestre[]={"0","01","03","05","07","09","11"};
		String vec_trimestre[]={"0","01","04","07","10"};
		String vec_semestre[]={"0","01","07"};
		int num=0;

        if(str_periodo.length()==1)
        {str_periodo="0"+str_periodo;}
        if(str_dia_limite.length()==1)
        {str_dia_limite="0"+str_dia_limite;}
        if(str_mes.length()==1)
        {str_mes="0"+str_mes;}
        if(str_dia.length()==1)
        {str_dia="0"+str_dia;}

		switch(tipo_periodo)
		{
			case 12:

				if(periodo==mes)
				{
					res= 1;
				}
				else
				{
					String f1=String.valueOf(axo_actual)+"-"+str_mes+"-"+str_dia;

				try{
					java.util.Date ld_f1 = new java.text.SimpleDateFormat("yyyy-MM-dd").parse(f1);

					 }
				     catch (java.text.ParseException e)
				    {
				       System.out.println("Invalid Date Parser Exception");
                    }

					p=periodo+1;

					if(p==13)
					{
						p=1;
						axo=axo_dato+1;
					}else
					{
						axo = axo_dato;
					}
					ls_p = String.valueOf(p);
                    if(ls_p.length()==1)
                      {ls_p="0"+ls_p;}
					String f2=String.valueOf(axo)+"-"+ls_p+"-"+str_dia_limite;
					try
					{
					     java.util.Date ld_f1 = new java.text.SimpleDateFormat("yyyy-MM-dd").parse(f1);
					     java.util.Date ld_f2 = new java.text.SimpleDateFormat("yyyy-MM-dd").parse(f2);

					     if(ld_f1.compareTo(ld_f2)<0)
					     {
						   res=1;
					     }else
					     {
						   res=0;
					     }

					}
				    catch (java.text.ParseException e)
				    {
				       System.out.println("Invalid Date Parser Exception");
                    }

				}//else


		 		break;

		 	case 6:


				num=periodo(tipo_periodo, axo_dato);

				if(num==periodo)
				{
					res= 1;
				}
				else
				{
					String f1=String.valueOf(axo_actual)+"-"+str_mes+"-"+str_dia;

				try{
					java.util.Date ld_f1 = new java.text.SimpleDateFormat("yyyy-MM-dd").parse(f1);
					 }
				     catch (java.text.ParseException e)
				    {
				       System.out.println("Invalid Date Parser Exception");
                    }

					p=periodo+1;

					if(p==6)
					{
						p=1;
						axo=axo_dato+1;
					}else
					{
						axo = axo_dato;
					}
					ls_p = String.valueOf(p);
                    if(ls_p.length()==1)
                      {ls_p="0"+ls_p;}
					String f2=String.valueOf(axo)+"-"+vec_bimestre[p]+"-"+str_dia_limite;
					try
					{
					     java.util.Date ld_f1 = new java.text.SimpleDateFormat("yyyy-MM-dd").parse(f1);
					     java.util.Date ld_f2 = new java.text.SimpleDateFormat("yyyy-MM-dd").parse(f2);
					     if(ld_f1.compareTo(ld_f2)<0)
					     {
						   res=1;
					     }else
					     {
						   res=0;
					     }

					}
				    catch (java.text.ParseException e)
				    {
				       System.out.println("Invalid Date Parser Exception");
                    }

				}//else
		 		break;

			case 4:

				num=periodo(tipo_periodo, axo_dato);

				if(num==periodo)
				{
					res= 1;
				}
				else
				{
					String f1=String.valueOf(axo_actual)+"-"+str_mes+"-"+str_dia;

							try{
								java.util.Date ld_f1 = new java.text.SimpleDateFormat("yyyy-MM-dd").parse(f1);
								 }
							catch (java.text.ParseException e)
							    {
							       System.out.println("Invalid Date Parser Exception");
			                    }

							p=periodo+1;

							if(p==4)
							{
								p=1;
								axo=axo_dato+1;
							}else
							{
								axo = axo_dato;
							}

							ls_p = String.valueOf(p);

			                if(ls_p.length()==1)
			                    {ls_p="0"+ls_p;}

							String f2=String.valueOf(axo)+"-"+vec_trimestre[p]+"-"+str_dia_limite;

							try{
								  java.util.Date ld_f1 = new java.text.SimpleDateFormat("yyyy-MM-dd").parse(f1);
								  java.util.Date ld_f2 = new java.text.SimpleDateFormat("yyyy-MM-dd").parse(f2);

								  if(ld_f1.compareTo(ld_f2)<0)
								  {
									   res=1;
								  }else
								  {
									   res=0;
								   }

								}
							 catch (java.text.ParseException e)
							 {
							       System.out.println("Invalid Date Parser Exception");
			                 }

				}//else

		 		break;

			case 2:

				num=periodo(tipo_periodo, axo_dato);

				if(num==periodo)
				{
					res= 1;
				}
				else
				{
					String f1=String.valueOf(axo_actual)+"-"+str_mes+"-"+str_dia;

					try{
						  java.util.Date ld_f1 = new java.text.SimpleDateFormat("yyyy-MM-dd").parse(f1);
						}

					catch (java.text.ParseException e)
					{
						System.out.println("Invalid Date Parser Exception");

					}


					p=periodo+1;

					if(p==2)
					{
						p=1;
						axo=axo_dato+1;
					}else
					{
						axo = axo_dato;
					}

					ls_p = String.valueOf(p);

					if(ls_p.length()==1)
						{ls_p="0"+ls_p;}

					String f2=String.valueOf(axo)+"-"+vec_semestre[p]+"-"+str_dia_limite;

					try{
						  java.util.Date ld_f1 = new java.text.SimpleDateFormat("yyyy-MM-dd").parse(f1);
						  java.util.Date ld_f2 = new java.text.SimpleDateFormat("yyyy-MM-dd").parse(f2);

						  if(ld_f1.compareTo(ld_f2)<0)
						  {
							 res=1;
						  }else
						  {
							 res=0;
						  }

						}

					catch (java.text.ParseException e)
					{
						System.out.println("Invalid Date Parser Exception");
                    }

				}//else

		 		break;

			case 1:

				num=periodo(tipo_periodo, axo_dato);

				if(num==periodo)
				{
					res= 1;
				}
				else
				{
					String f1=String.valueOf(axo_actual)+"-"+str_mes+"-"+str_dia;

					try{
						java.util.Date ld_f1 = new java.text.SimpleDateFormat("yyyy-MM-dd").parse(f1);
				   	   }
					catch (java.text.ParseException e)
					{
						System.out.println("Invalid Date Parser Exception");
					}

					p=periodo+1;

					if(p==2)
					{
						p=1;
						axo=axo_dato+1;
					}
					else
					{
						axo = axo_dato;
					}

					ls_p = String.valueOf(p);

					if(ls_p.length()==1)
					{
						ls_p="0"+ls_p;
					}

					String f2=String.valueOf(axo)+"-"+ls_p+"-"+str_dia_limite;

					try{
					  	  java.util.Date ld_f1 = new java.text.SimpleDateFormat("yyyy-MM-dd").parse(f1);
						  java.util.Date ld_f2 = new java.text.SimpleDateFormat("yyyy-MM-dd").parse(f2);

						  if(ld_f1.compareTo(ld_f2)<0)
						  {
						 	res=1;
						  }
						  else
						  {
						 	res=0;
						  }

					   }

					catch (java.text.ParseException e)
					{
						System.out.println("Invalid Date Parser Exception");
					}

				}//else

		 		break;
	 	 }
         res=1; //Habilita todos los campos para que sean modificados, se debera eliminar para trabajar de modo normal..
		 return res;
	 }



    public int indpendientes(Connection conn, String eva000_clave, String owner, int axo_eval)
    {

	   ResultSet rs5, rs6, rs7;
	   HttpSession session=null;
	   //session=req.getSession();
	   //conn=(Connection)session.getAttribute("conn");
	   //Statement stmt;

	   int li_band = 0, li_band_indicadores_asignados = 0, contador = 0, contador_total = 0, num=0;
	   java.util.Calendar fecha = java.util.Calendar.getInstance();
	   axo_actual = fecha.get(java.util.Calendar.YEAR);
	   System.out.println("axo_actual = "+axo_actual);
       if (conn==null)
	   {
		   System.out.println("Error en la conexion a la base de datos");
       }else
       {
	     try
	     {
		   Statement stmt5  = conn.createStatement (ResultSet.TYPE_SCROLL_INSENSITIVE ,ResultSet.CONCUR_READ_ONLY);
           Statement stmt6  = conn.createStatement (ResultSet.TYPE_SCROLL_INSENSITIVE ,ResultSet.CONCUR_READ_ONLY);
           Statement stmt7  = conn.createStatement (ResultSet.TYPE_SCROLL_INSENSITIVE ,ResultSet.CONCUR_READ_ONLY);
	       rs5=stmt5.executeQuery("SELECT a.eva050_clave, a.eva030_clave FROM "+owner+".eva050 a WHERE a.eva000_clave ="+eva000_clave + "AND a.eva050_axo="+axo_eval);
           while(rs5.next())
           {
	        li_band = 0;
	        li_band_indicadores_asignados = 0;
	        rs6=stmt6.executeQuery("SELECT a.eva070_clave, a.eva070_nreg FROM "+owner+".eva070 a WHERE a.eva030_clave = "+rs5.getString(2) + " AND a.eva070_captu = 0");
            while(rs6.next())
	        {
	          if (li_band_indicadores_asignados == 0)
	          {
	            li_band_indicadores_asignados = 1;
		        contador_total ++;
	          }
	          System.out.println("rs6.getInt(2) = "+rs6.getInt(2));
	          System.out.println("axo_eval = "+axo_eval);
	          System.out.println("axo_actual = "+axo_actual);
	          
              if ((rs6.getInt(2) == 1) && (axo_eval==axo_actual))
              {
	              num=1000;
	              System.out.println("Num = "+num);
              }else
              {
	           num=periodo(rs6.getInt(2), axo_eval);
              }
	          rs7=stmt7.executeQuery("SELECT a.eva060_clave, a.eva060_periodo FROM "+owner+".eva060 a WHERE a.eva050_clave = "+rs5.getString(1)+" AND a.eva070_clave = "+rs6.getString(1) + " AND a.eva060_periodo = "+ String.valueOf(num)+" AND a.eva060_check = 0");
              if(rs7.next())
	          {
                li_band = 1;
                //System.out.println("Entro a li_band = 1 ");
                break;

	          }else
	          {
	            li_band = 0;
	            //System.out.println("Entro a li_band = 0 ");
	          }
	        }//RS6
            if(li_band==1)
   	        {
	          contador = contador + 1;
	        }else{}
	        //System.out.println("contador total = "+contador_total);
          }//WHILE RS5
          //ls_ind_pendientes = String.valueOf(contador) + " de " + String.valueOf(contador_total);
        }//try
        catch(SQLException Err)
	    {
		  Err.printStackTrace();
	    }

       }
       //System.out.println("Variables===============>Contador=====>"+contador+"  Contdor Total====>"+contador_total);
      if(contador==0)
      {
       return 1;
      }else{
	   return 0;
      }
    }
    
     public int[] indpendientescontra(Connection conn, String eva000_clave, String owner, int axo_eval, String direccion, int captura)
    {

	   ResultSet rs5, rs6, rs7;
	   HttpSession session=null;
	   java.util.Date  fecha = new java.util.Date();
	   //session=req.getSession();
	   //conn=(Connection)session.getAttribute("conn");
	   //Statement stmt;

	   int [] li_vec = new int[2];
	   int li_band = 0, li_band_indicadores_asignados = 0, contador = 0, contador_total = 0, num=0;
       if (conn==null)
	   {
		   System.out.println("Error en la conexion a la base de datos");
       }else
       {
	     try
	     {
		   Statement stmt5  = conn.createStatement (ResultSet.TYPE_SCROLL_INSENSITIVE ,ResultSet.CONCUR_READ_ONLY);
           Statement stmt6  = conn.createStatement (ResultSet.TYPE_SCROLL_INSENSITIVE ,ResultSet.CONCUR_READ_ONLY);
           Statement stmt7  = conn.createStatement (ResultSet.TYPE_SCROLL_INSENSITIVE ,ResultSet.CONCUR_READ_ONLY);
           System.out.println(fecha + " Antes del query rs5");
           
            if(captura==0) //0 captura la dependencia,  1 captura la contraloria
	        {
	         rs5=stmt5.executeQuery("SELECT a.eva050_clave, a.eva030_clave FROM "+owner+".eva050 a, "+owner+".eva070 b WHERE ((a.eva000_clave ="+eva000_clave + "AND a.eva050_axo="+axo_eval +") AND (b.eva030_clave = a.eva030_clave AND b.eva070_captu = 0)) GROUP BY a.eva050_clave, a.eva030_clave");
            }else{ 
	         rs5=stmt5.executeQuery("SELECT a.eva050_clave, a.eva030_clave FROM "+owner+".eva050 a, "+owner+".eva070 b WHERE ((a.eva000_clave ="+eva000_clave + "AND a.eva050_axo="+axo_eval +") AND (b.eva030_clave = a.eva030_clave AND b.eva070_captu = 1 AND b.eva070_dircontra = "+direccion+")) GROUP BY a.eva050_clave, a.eva030_clave");
	         
            }
           
           
	       //rs5=stmt5.executeQuery("SELECT a.eva050_clave, a.eva030_clave FROM "+owner+".eva050 a WHERE a.eva000_clave ="+eva000_clave + "AND a.eva050_axo="+axo_eval);
	       fecha=new java.util.Date();
	       System.out.println(fecha+" Iniciando while de rs5");   
           while(rs5.next())
           {
	        li_band = 0;
	        li_band_indicadores_asignados = 0;
	        //System.out.println(fecha+" Antes del query rs6"); 
	        if(captura==0) //0 captura la dependencia,  1 captura la contraloria
	        {
	         rs6=stmt6.executeQuery("SELECT a.eva070_clave, a.eva070_nreg FROM "+owner+".eva070 a WHERE a.eva030_clave = "+rs5.getString(2) + " AND a.eva070_captu = 0");
            }else{ 
	        
	         rs6=stmt6.executeQuery("SELECT a.eva070_clave, a.eva070_nreg FROM "+owner+".eva070 a WHERE a.eva030_clave = "+rs5.getString(2) + " AND a.eva070_captu = 1 AND a.eva070_dircontra="+direccion);
            }
            fecha=new java.util.Date();
            System.out.println(fecha+" Iniciado while rs6");  
            while(rs6.next())
	        {
		      
	          if (li_band_indicadores_asignados == 0)
	          {
	            li_band_indicadores_asignados = 1;
		        contador_total ++;
	          }
              num=periodo(rs6.getInt(2), axo_eval);
              //System.out.println(fecha+" Antes del query rs7");
	          rs7=stmt7.executeQuery("SELECT a.eva060_clave, a.eva060_periodo FROM "+owner+".eva060 a WHERE a.eva050_clave = "+rs5.getString(1)+" AND a.eva070_clave = "+rs6.getString(1) + " AND a.eva060_periodo = "+ String.valueOf(num)+" AND a.eva060_check = 0");
              if(rs7.next())
	          {
                li_band = 1;
                //System.out.println("Entro a li_band = 1 ");
                break;

	          }else
	          {
	            li_band = 0;
	            //System.out.println("Entro a li_band = 0 ");
	          }
	          //System.out.println(fecha+" Terminacion de rs7");
	        }//RS6
	        fecha=new java.util.Date();
	        System.out.println(fecha+" Terminacion de rs6");
            if(li_band==1)
   	        {
	          contador = contador + 1;
	        }else{}
	        //System.out.println("contador total = "+contador_total);
          }//WHILE RS5
          fecha=new java.util.Date();
          System.out.println(fecha+" Terminacion de rs5");
          //ls_ind_pendientes = String.valueOf(contador) + " de " + String.valueOf(contador_total);
          
          
        }//try
        catch(SQLException Err)
	    {
		  Err.printStackTrace();
	    }

       }
       //System.out.println("Variables===============>Contador=====>"+contador+"  Contdor Total====>"+contador_total);
       System.out.println(fecha+" Total de indicadores asignados: "+ contador_total);  
      //if(contador==0)
      //{
	   li_vec[0] = contador;
	   li_vec[1] = contador_total;   
	   System.out.println(fecha+" vector [0]: "+ li_vec[0]);  
	   System.out.println(fecha+" vector [1]: "+ li_vec[1]);  
       return li_vec;
      /*}else{
	   return li_vec;
      }*/
    }
    
    
    
    

   /* public String formatoFecha(String fecha, int motorbd)
    {
		String res="";
		String ls_axo = fecha.substring(0,4);
		String ls_mes = fecha.substring(5,7);
		String ls_dia = fecha.substring(8,10);

		switch(motorbd)
		{
			case 1:
				//informix
				res=ls_axo+"-"+ls_mes+"-"+ls_dia;
				break;

			case 2:
				//db2
				res=ls_axo+"-"+ls_mes+"-"+ls_dia;
				break;

			case 3:
				//SQL Server
				res=ls_axo+"-"+ls_dia+"-"+ls_mes;
				break;

		}

		return res;

	}*/

	public String formatoFecha(String fecha, int motorbd)
	    {
			String res="";
			String ls_axo = fecha.substring(0,4);
			String ls_dia = fecha.substring(5,7);
			String ls_mes = fecha.substring(8,10);

			switch(motorbd)
			{
				case 1:
					//informix
					res=fecha;
					break;

				case 2:
					//db2
					res=fecha;
					break;

				case 3:
					//SQL Server
					res=ls_axo+"-"+ls_mes+"-"+ls_dia;
					break;

			}

			return res;

		}


	public String fechaSistema(int arg_motordb)
	{

	  int ll_dia=0, ll_mes=0, ll_axo=0;
	  String ls_fecha=null;
	  java.util.Calendar fecha = java.util.Calendar.getInstance();
      ll_dia = fecha.get(java.util.Calendar.DATE);
	  ll_mes = fecha.get(java.util.Calendar.MONTH) + 1;
	  ll_axo = fecha.get(java.util.Calendar.YEAR);

	  if(arg_motordb==1)//Fecha para Informix
	  {
		  ls_fecha = ll_axo+"-"+ll_mes+"-"+ll_dia;
      }

      if(arg_motordb==1)//Fecha para DB2
      {
		  ls_fecha = ll_axo+"-"+ll_mes+"-"+ll_dia;
      }

      if(arg_motordb==3)//Fecha para SQL Server
	  {
		  ls_fecha = ll_axo+"-"+ll_dia+"-"+ll_mes;
      }



	  return ls_fecha;
    }


}