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
import ChartDirector.*;


public class Evaluacion
{
	double gd_eje=0, gd_indgenerico=0, gd_indespe=0;
	
	    public String PtsTotales (Connection conn, String eva000_clave, String axo, String owner)
	    {
	   	    Formula f = new Formula();
            ResultSet rsPtsTotales=null, rsPtsTotales1=null, rsPtsTotales2=null, rsPtsTotales3=null;
            String eva010_clave, eva010_desc, eva010_vponde;
            int z=0, li_row_ejes=0, li_row_indgen=0, numeracion=0;
            String color="", ls_eva010_clave="", ls_eva020_clave="", ls_query="", ls_vpeje="";
            double ldo_vponde=0.00, ldo_sumvp_eva030=0.00, ldo_rtem=0.00, ldo_rgen=0.00, ldo_acum_indgen=0.00, ldo_eva020_vponde=0.00;
            double valor = 0, puntos=0, vp=0, vpgen=0, vpeje=0;

            int i=0, li_eva010_rowvponde=0, li_eva020_rowvponde=0;
            double porcentaje, obtenido=0.00, ldo_eva010_acumvponde=0.00, ldo_eva020_acumvponde=0.00, ldo_eva010_sumvponde=0.00, ldo_eva020_sumvponde=0.00;
            String ls_obtenido="", ls_puntos="";


            try
            {
	            Statement stmtPtsTotales  = conn.createStatement (ResultSet.TYPE_SCROLL_INSENSITIVE ,ResultSet.CONCUR_READ_ONLY);
                Statement stmtPtsTotales1 = conn.createStatement (ResultSet.TYPE_SCROLL_INSENSITIVE ,ResultSet.CONCUR_READ_ONLY);
                Statement stmtPtsTotales2 = conn.createStatement (ResultSet.TYPE_SCROLL_INSENSITIVE ,ResultSet.CONCUR_READ_ONLY);
                Statement stmtPtsTotales3 = conn.createStatement (ResultSet.TYPE_SCROLL_INSENSITIVE ,ResultSet.CONCUR_READ_ONLY);
                //////// OBTIENE EL VALOR PONDERADO REAL DE LOS EJES TEMATICOS PARA SUMARSE ////////////////////////////////////////////////
                rsPtsTotales3=stmtPtsTotales3.executeQuery("SELECT b.eva010_clave, b.eva010_vponde FROM "+owner+".eva050 b WHERE b.eva000_clave = " + eva000_clave + " AND b.eva050_axo = "+axo+" GROUP BY b.eva010_clave, b.eva010_vponde");
                while(rsPtsTotales3.next())
	            {
	              li_eva010_rowvponde++;
                  ldo_eva010_acumvponde = ldo_eva010_acumvponde + rsPtsTotales3.getDouble(2);
	            }
	            ldo_eva010_sumvponde = (100 - ldo_eva010_acumvponde)/li_eva010_rowvponde;

                ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	            rsPtsTotales=stmtPtsTotales.executeQuery("SELECT b.eva010_clave, b.eva010_vponde FROM "+owner+".eva050 b WHERE b.eva000_clave = " + eva000_clave + " AND b.eva050_axo = "+axo+" GROUP BY b.eva010_clave, b.eva010_vponde");
	            rsPtsTotales.last(); // ir al ultimo renglon
                li_row_ejes=rsPtsTotales.getRow(); // obtener el numero del Renglon
                rsPtsTotales.beforeFirst(); // volver al primero

	            for (int li_for1 = 0; li_for1 <= li_row_ejes - 1; li_for1++)
   	            {
	              rsPtsTotales.next();
		          numeracion++;
		          ldo_acum_indgen = 0.00;
		          ls_eva010_clave = rsPtsTotales.getString(1);
		          ldo_vponde = rsPtsTotales.getDouble(2);
         		  //////// OBTIENE EL VALOR PONDERADO REAL DE LOS INDICADORES GENERICOS PARA SUMARSE ////////////////////////////////////////////////
	  	          rsPtsTotales3=stmtPtsTotales3.executeQuery("SELECT b.eva010_clave, b.eva020_clave, b.eva020_vponde FROM "+owner+".eva050 b WHERE b.eva000_clave = " + eva000_clave + " AND b.eva010_clave = "+ls_eva010_clave+" AND b.eva050_axo = "+axo+" GROUP BY b.eva010_clave, b.eva020_clave, b.eva020_vponde");
                  li_eva020_rowvponde = 0;
		          ldo_eva020_acumvponde = 0;
		          while(rsPtsTotales3.next())
	              {
	                li_eva020_rowvponde++;
                    ldo_eva020_acumvponde = ldo_eva020_acumvponde + rsPtsTotales3.getDouble(3);
	              }

		          //ldo_eva020_sumvponde = (100 - rs3.getDouble(3))/li_eva020_rowvponde;
		          ldo_eva020_sumvponde = (100 - ldo_eva020_acumvponde)/li_eva020_rowvponde;

                  //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

		          ls_query = "SELECT b.eva010_clave, b.eva020_clave, b.eva020_vponde FROM "+owner+".eva050 b WHERE b.eva000_clave = " + eva000_clave + " AND b.eva010_clave = "+ls_eva010_clave+" AND b.eva050_axo = "+axo+" GROUP BY b.eva010_clave, b.eva020_clave, b.eva020_vponde";

  	              rsPtsTotales1=stmtPtsTotales1.executeQuery(ls_query);
		          rsPtsTotales1.last(); // ir al ultimo renglon
                  li_row_indgen=rsPtsTotales1.getRow(); // obtener el numero del Renglon
                  rsPtsTotales1.beforeFirst(); // volver al primero

                  for (int li_for2 = 0; li_for2 <= li_row_indgen - 1; li_for2++)
		          {
		            rsPtsTotales1.next();
		            ls_eva020_clave = rsPtsTotales1.getString(2);
		            ldo_eva020_vponde = rsPtsTotales1.getDouble(3) + ldo_eva020_sumvponde;
		            ls_query = "SELECT sum(a.eva050_vponde) as suma FROM "+owner+".eva050 a WHERE a.eva000_clave = " + eva000_clave + " AND a.eva010_clave = "+ls_eva010_clave+" AND a.eva020_clave = "+ls_eva020_clave+" AND a.eva050_axo = "+axo;
		            rsPtsTotales2=stmtPtsTotales2.executeQuery(ls_query);
		            if (rsPtsTotales2.next())
		            {
		              ldo_sumvp_eva030 = rsPtsTotales2.getDouble(1);
		            }else{
		              ldo_sumvp_eva030 = 0.00;
		            }

		         	vpgen=f.Redondear((rsPtsTotales1.getInt(3)*100)/ldo_eva020_acumvponde); //Linea Nueva
					ldo_rgen = (ldo_sumvp_eva030 * vpgen) / 100; //Linea Nueva
		 	        ldo_acum_indgen = ldo_acum_indgen + ldo_rgen;

		          }//segundo for

		          vpeje=f.Redondear((ldo_vponde*100)/ldo_eva010_acumvponde); //Linea Nueva
	              ldo_rtem = (ldo_acum_indgen * vpeje)/100; //Linea Nueva
	              valor = ldo_rtem;
                  valor = valor*100;
                  valor = java.lang.Math.round(valor);
                  valor = valor/100;
	 			  ls_vpeje=f.RedondeoDecimal(vpeje);
	              ls_obtenido=f.RedondeoDecimal(valor);
	              //System.out.println("ls_vpeje===============================>"+ls_vpeje);
	              //System.out.println("ls_obtenido============================>"+ls_obtenido);

	              puntos=puntos+valor;
	              porcentaje=valor;
	              obtenido=obtenido+valor;
	              //System.out.println("PtsTotales - Depen =="+eva000_clave);
	              //System.out.println("PtsTotales - Clave Tematico=="+ls_eva010_clave);
	              //System.out.println("PtsTotales - Tematico=="+valor);
	              //System.out.println("-------------");

	           }
	      	   puntos=f.Redondear(puntos);
               ls_puntos=f.RedondeoDecimal(puntos);

                rsPtsTotales2.close();
		        stmtPtsTotales2.close();
                rsPtsTotales1.close();
		        stmtPtsTotales1.close();
		        rsPtsTotales3.close();
		        stmtPtsTotales3.close();
		        rsPtsTotales.close();
		        stmtPtsTotales.close();
	        }//try
            catch(SQLException Err)
            {
	           Err.printStackTrace();
            }

		   //System.out.println("Puntos Totales============================>"+ls_puntos);
		 return ls_puntos;
	    }


	    public String PtsPorEjeTematico (Connection conn, String eva000_clave, String arg_eva010_clave, String axo, String owner)
	    {

		    Formula f = new Formula();
            ResultSet rs=null, rs1=null, rs2=null, rs3=null;
            String eva010_clave, eva010_desc, eva010_vponde;
            int z=0, li_row_ejes=0, li_row_indgen=0, numeracion=0;
            String color="", ls_eva010_clave="", ls_eva020_clave="", ls_query="", ls_vpeje="";
            double ldo_vponde=0.00, ldo_sumvp_eva030=0.00, ldo_rtem=0.00, ldo_rgen=0.00, ldo_acum_indgen=0.00, ldo_eva020_vponde=0.00;
            double valor = 0, puntos=0, vp=0, vpgen=0, vpeje=0;

            int i=0, li_eva010_rowvponde=0, li_eva020_rowvponde=0;

            double porcentaje, obtenido=0.00, ldo_eva010_acumvponde=0.00, ldo_eva020_acumvponde=0.00, ldo_eva010_sumvponde=0.00, ldo_eva020_sumvponde=0.00;
            String ls_obtenido="", ls_puntos="";
            //System.out.println("**************************************Entro al metodo PtsPorEjeTematico");
            try
            {
	            Statement stmt  = conn.createStatement (ResultSet.TYPE_SCROLL_INSENSITIVE ,ResultSet.CONCUR_READ_ONLY);
                Statement stmt1 = conn.createStatement (ResultSet.TYPE_SCROLL_INSENSITIVE ,ResultSet.CONCUR_READ_ONLY);
                Statement stmt2 = conn.createStatement (ResultSet.TYPE_SCROLL_INSENSITIVE ,ResultSet.CONCUR_READ_ONLY);
                Statement stmt3 = conn.createStatement (ResultSet.TYPE_SCROLL_INSENSITIVE ,ResultSet.CONCUR_READ_ONLY);
                //////// OBTIENE EL VALOR PONDERADO REAL DE LOS EJES TEMATICOS PARA SUMARSE ////////////////////////////////////////////////
                rs3=stmt3.executeQuery("SELECT b.eva010_clave, b.eva010_vponde FROM "+owner+".eva050 b WHERE b.eva000_clave = " + eva000_clave + " AND b.eva050_axo = "+axo+" GROUP BY b.eva010_clave, b.eva010_vponde");
                while(rs3.next())
	            {
	              li_eva010_rowvponde++;
                  ldo_eva010_acumvponde = ldo_eva010_acumvponde + rs3.getDouble(2);
	            }
	            ldo_eva010_sumvponde = (100 - ldo_eva010_acumvponde)/li_eva010_rowvponde;

                ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
               // System.out.println("arg_eva010_clave============================>"+arg_eva010_clave);
	            rs=stmt.executeQuery("SELECT b.eva010_clave, b.eva010_vponde FROM "+owner+".eva050 b WHERE b.eva000_clave = " + eva000_clave + " AND b.eva010_clave ="+arg_eva010_clave+" AND b.eva050_axo = "+axo+" GROUP BY b.eva010_clave, b.eva010_vponde");
	            rs.last(); // ir al ultimo renglon
                li_row_ejes=rs.getRow(); // obtener el numero del Renglon
                rs.beforeFirst(); // volver al primero
	        	//System.out.println("li_row_ejes============================>"+li_row_ejes);
	            for (int li_for1 = 0; li_for1 <= li_row_ejes - 1; li_for1++)
   	            {
	              rs.next();
		          numeracion++;
		          ldo_acum_indgen = 0.00;
		          ls_eva010_clave = rs.getString(1);
		         // System.out.println("Clave del Eje Tematicoo============================>"+ls_eva010_clave);
		          ldo_vponde = rs.getDouble(2);
         		  //////// OBTIENE EL VALOR PONDERADO REAL DE LOS INDICADORES GENERICOS PARA SUMARSE ////////////////////////////////////////////////
	  	          rs3=stmt3.executeQuery("SELECT b.eva010_clave, b.eva020_clave, b.eva020_vponde FROM "+owner+".eva050 b WHERE b.eva000_clave = " + eva000_clave + " AND b.eva010_clave = "+ls_eva010_clave+" AND b.eva050_axo = "+axo+" GROUP BY b.eva010_clave, b.eva020_clave, b.eva020_vponde");
                  li_eva020_rowvponde = 0;
		          ldo_eva020_acumvponde = 0;
		          while(rs3.next())
	              {
	                li_eva020_rowvponde++;
                    ldo_eva020_acumvponde = ldo_eva020_acumvponde + rs3.getDouble(3);
	              }

		          //ldo_eva020_sumvponde = (100 - rs3.getDouble(3))/li_eva020_rowvponde;
		          //ldo_eva020_sumvponde = (100 - ldo_eva020_acumvponde)/li_eva020_rowvponde; Activar si hay error
		          /*System.out.println("ldo_eva020_acumvponde  ====>"+ldo_eva020_acumvponde);
		          System.out.println("li_eva020_rowvponde ====>"+li_eva020_rowvponde);
		          System.out.println("ldo_eva020_sumvponde = (100 - ldo_eva020_acumvponde)/li_eva020_rowvponde; ===>"+ldo_eva020_sumvponde);*/

                  //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

		          ls_query = "SELECT b.eva010_clave, b.eva020_clave, b.eva020_vponde FROM "+owner+".eva050 b WHERE b.eva000_clave = " + eva000_clave + " AND b.eva010_clave = "+ls_eva010_clave+" AND b.eva050_axo = "+axo+" GROUP BY b.eva010_clave, b.eva020_clave, b.eva020_vponde";

  	              rs1=stmt1.executeQuery(ls_query);
		          rs1.last(); // ir al ultimo renglon
                  li_row_indgen=rs1.getRow(); // obtener el numero del Renglon
                  rs1.beforeFirst(); // volver al primero

                  for (int li_for2 = 0; li_for2 <= li_row_indgen - 1; li_for2++)
		          {
		            rs1.next();
		            ls_eva020_clave = rs1.getString(2);
		            ldo_eva020_vponde = rs1.getDouble(3); //+ ldo_eva020_sumvponde antivar si hay erro;
		            ls_query = "SELECT sum(a.eva050_vponde) as suma FROM "+owner+".eva050 a WHERE a.eva000_clave = " + eva000_clave + " AND a.eva010_clave = "+ls_eva010_clave+" AND a.eva020_clave = "+ls_eva020_clave+" AND a.eva050_axo = "+axo+"";
		            rs2=stmt2.executeQuery(ls_query);
		            if (rs2.next())
		            {
		              ldo_sumvp_eva030 = rs2.getDouble(1);
		            }else{
		              ldo_sumvp_eva030 = 0.00;
		            }

		         	vpgen=f.Redondear((rs1.getInt(3)*100)/ldo_eva020_acumvponde); //Linea Nueva
					ldo_rgen = (ldo_sumvp_eva030 * vpgen) / 100; //Linea Nueva
		 	        ldo_acum_indgen = ldo_acum_indgen + ldo_rgen;

		          }//segundo for

		          vpeje=f.Redondear((ldo_vponde*100)/ldo_eva010_acumvponde); //Linea Nueva
	              ldo_rtem = (ldo_acum_indgen * vpeje)/100; //Linea Nueva
	              valor = ldo_rtem;
                  valor = valor*100;
                  valor = java.lang.Math.round(valor);
                  valor = valor/100;
                  gd_eje = vpeje;
	 			  ls_vpeje=f.RedondeoDecimal(vpeje);
	              ls_obtenido=f.RedondeoDecimal(valor);
	              //System.out.println("ls_vpeje===============================>"+ls_vpeje);
	              //System.out.println("ls_obtenido============================>"+ls_obtenido);

	              puntos=puntos+valor;
	              porcentaje=valor;
	              obtenido=obtenido+valor;
	           }
	      	   puntos=f.Redondear(puntos);
               ls_puntos=f.RedondeoDecimal(puntos);
               //System.out.println("Depe = "+eva000_clave + "  Puntos = "+ls_puntos);

               rs3.close();
               stmt3.close();
               rs.close();
               stmt.close();

	        }//try
            catch(SQLException Err)
            {
	           Err.printStackTrace();
            }

		   // System.out.println("Puntos por Eje tematico============================>"+ls_puntos);
		   //System.out.println("**************************************Termino al metodo PtsPorEjeTematico");
		 return ls_puntos;
        }


        public String PtsPorIndGenerico (Connection conn, String eva000_clave, String arg_eva010_clave, String arg_eva020_clave, String axo, String owner)
	    {
		   String ls_eva020_clave="", ls_query="", color="";
           double ldo_eva020_vponde=0.00, ldo_sumvp_eva030=0.00, ldo_rgen=0.00, vp=0;
           int z=0;
           double valor = 0;
           Formula f = new Formula();

           int i=0, li_rows=0, li_eva020_rowvponde=0;
           double porcentaje, obtenido=0.00, ldo_eva020_acumvponde=0.00, ldo_eva020_sumvponde=0.00;
           int numeracion=0;
           double puntos=0;
           Formula g = new Formula();
           String ls_puntos="", ls_obtenido="", ls_vpeje="";

           try
           {
	          ResultSet rs, rs1;
	          Statement stmt  = conn.createStatement (ResultSet.TYPE_SCROLL_INSENSITIVE ,ResultSet.CONCUR_READ_ONLY);
              Statement stmt1 = conn.createStatement (ResultSet.TYPE_SCROLL_INSENSITIVE ,ResultSet.CONCUR_READ_ONLY);

	          rs=stmt.executeQuery("SELECT b.eva010_clave, b.eva020_clave, b.eva020_vponde FROM "+owner+".eva050 b WHERE b.eva000_clave = "+eva000_clave+" AND b.eva010_clave = "+arg_eva010_clave+" AND b.eva050_axo = "+axo+" GROUP BY b.eva010_clave, b.eva020_clave, b.eva020_vponde");
	          while(rs.next())
              {
                li_eva020_rowvponde++;
                ldo_eva020_acumvponde = ldo_eva020_acumvponde + rs.getDouble(3);
              }

              ldo_eva020_sumvponde = (100 - ldo_eva020_acumvponde)/li_eva020_rowvponde;
	          rs=stmt.executeQuery("SELECT b.eva010_clave, b.eva020_clave, b.eva020_vponde FROM "+owner+".eva050 b WHERE b.eva000_clave = "+eva000_clave+" AND b.eva010_clave = "+arg_eva010_clave+" AND b.eva020_clave ="+arg_eva020_clave+" AND b.eva050_axo = "+axo+" GROUP BY b.eva010_clave, b.eva020_clave, b.eva020_vponde");
	   	      rs.last(); // ir al ultimo renglon
		      li_rows=rs.getRow(); // obtener el numero del Renglon
		      rs.beforeFirst(); // volver al primero

		      while (rs.next())
      	      {
		         numeracion++;
		         ls_eva020_clave = rs.getString(2);
		         ldo_eva020_vponde = rs.getDouble(3);// + ldo_eva020_sumvponde antivar si encaso de error;
  		         ls_query = "SELECT sum(a.eva050_vponde) as suma FROM "+owner+".eva050 a WHERE a.eva000_clave = " + eva000_clave + " AND a.eva010_clave = "+arg_eva010_clave+" AND a.eva020_clave = "+ls_eva020_clave+" AND a.eva050_axo = "+axo+"";
		  	     rs1=stmt1.executeQuery(ls_query);
		         if (rs1.next())
		         {
		            ldo_sumvp_eva030 = rs1.getDouble(1);
		         }else{
		           ldo_sumvp_eva030 = 0.00;
		         }
		         rs1.close();
                 stmt1.close();

			     vp=f.Redondear((rs.getInt(3)*100)/ldo_eva020_acumvponde); //Linea Nueva
			     ldo_rgen = (ldo_sumvp_eva030 * vp) / 100;
                 valor = ldo_rgen;
                 valor = valor*100;
                 valor = java.lang.Math.round(valor);
                 valor = valor/100;
	    	     ls_obtenido=g.RedondeoDecimal(valor);
	             ls_vpeje=f.RedondeoDecimal(vp);

                 puntos=puntos+valor;
                 porcentaje=valor;
                 obtenido=obtenido+valor;

              }//while
              gd_indgenerico = vp;
              puntos=g.Redondear(puntos);
              ls_puntos=g.RedondeoDecimal(puntos);

              rs.close();
              stmt.close();

		   }//try
           catch(SQLException Err)
     	   {
	     	 Err.printStackTrace();
     	   }


	        return ls_puntos;
	    }


	     public String PtsPorIndEspecificos (Connection conn, String eva000_clave, String arg_axo_eval, String arg_eva010_clave, String arg_eva020_clave, String arg_eva030_clave, String owner)
	    {
		    ResultSet rs;
		    String ls_puntos="0.00", ls_query="";

		   // System.out.println("**************************************Entro al metodo PtsPorIndEspecificos");
		    try
           {
	          Statement stmt  = conn.createStatement (ResultSet.TYPE_SCROLL_INSENSITIVE ,ResultSet.CONCUR_READ_ONLY);
	          ls_query = "SELECT a.eva050_vponde FROM "+owner+".eva050 a WHERE a.eva000_clave = " + eva000_clave + " AND a.eva050_axo = "+arg_axo_eval+" AND a.eva010_clave = "+arg_eva010_clave+" AND a.eva020_clave = "+arg_eva020_clave+" AND a.eva030_clave = "+arg_eva030_clave;
		  	  rs=stmt.executeQuery(ls_query);
		      if (rs.next())
		      {
		         ls_puntos = rs.getString(1);
		      }else{
		         ls_puntos = "N/A";
		      }
	          rs.close();
	          stmt.close();
		   }//try
           catch(SQLException Err)
     	   {
	     	 Err.printStackTrace();
     	   }
     	   //System.out.println("**************************************Termino al metodo PtsPorIndEspecificos");
     	   return ls_puntos;
	    }




	     public String IndicadorAsignado(Connection conn, String eva000_clave, String eva030_clave, String owner, String axo)
			    {
				    ResultSet rs;
				    String ls_puntos="0.00", ls_query="";
				    String res="";

				    try
		           {
			          Statement stmt  = conn.createStatement (ResultSet.TYPE_SCROLL_INSENSITIVE ,ResultSet.CONCUR_READ_ONLY);
			          ls_query = "SELECT eva050_clave FROM "+owner+".eva050 a WHERE a.eva000_clave = " + eva000_clave + " AND a.eva030_clave = "+eva030_clave+" AND a.eva050_axo = "+axo;
				  	  rs=stmt.executeQuery(ls_query);
				      if (rs.next())
				      {
				         res ="1";
				      }else{
				         res ="0";
				      }

			          rs.close();
			          stmt.close();
				   }//try
		           catch(SQLException Err)
		     	   {
			     	 Err.printStackTrace();
		     	   }

		     	   return res;
	    }


        public String PromedioPorEjeTematico(Connection conn, String eva010_clave, String axo, String eva080_clave, String owner)
		{
				    ResultSet rs, rs2, restotal;
				    String ls_query="", ls_query2="", res="";
				    double acum=0.0, total=0.0, ld_valtematico=0.0, acum_vpeje=0, total_vpeje=0;
				    int contador=0;
				    String ls_valtematico="";
				    Formula g = new Formula();


				    try
		           {
			          Statement stmt  = conn.createStatement (ResultSet.TYPE_SCROLL_INSENSITIVE ,ResultSet.CONCUR_READ_ONLY);
			          Statement stmt2  = conn.createStatement (ResultSet.TYPE_SCROLL_INSENSITIVE ,ResultSet.CONCUR_READ_ONLY);
			          Statement stmttotal  = conn.createStatement (ResultSet.TYPE_SCROLL_INSENSITIVE ,ResultSet.CONCUR_READ_ONLY);

			          if(eva080_clave.compareTo("0")==0)
			          {
						  ls_query = "SELECT a.eva000_clave, b.eva010_vponde FROM "+owner+".eva090 a, "+owner+".eva050 b WHERE ((a.eva090_axo = "+axo+" and a.eva090_estatus = 2) and (b.eva000_clave = a.eva000_clave and b.eva050_axo = "+axo+" and b.eva010_clave = "+eva010_clave+")) GROUP BY a.eva000_clave, b.eva010_vponde";

						  //rs2=stmt2.executeQuery("SELECT COUNT(b.eva090_clave) FROM "+owner+".eva000 a, "+owner+".eva090 b WHERE b.eva090_estatus = 2 AND b.eva090_axo="+axo+" AND a.eva000_clave = b.eva000_clave");
						  rs2=stmt2.executeQuery("SELECT Count(DISTINCT a.eva000_clave) FROM eva090 a, eva050 b WHERE ((a.eva090_axo = "+axo+" AND a.eva090_estatus = 2) AND (b.eva000_clave = a.eva000_clave AND b.eva050_axo = "+axo+" AND b.eva010_clave = "+eva010_clave+"))");
						  while(rs2.next())
						  {
							  contador=rs2.getInt(1);
						  }
				  	  }else{
					  	  ls_query = "SELECT a.eva000_clave, b.eva010_vponde FROM "+owner+".eva090 a, "+owner+".eva050 b, "+owner+".eva000 c WHERE ((a.eva090_axo = "+axo+" and a.eva090_estatus = 2) and (c.eva000_clave = a.eva000_clave and c.eva080_clave ="+eva080_clave+") and (b.eva000_clave = c.eva000_clave and b.eva050_axo = "+axo+" and b.eva010_clave = "+eva010_clave+")) GROUP BY a.eva000_clave, b.eva010_vponde";

					  	  rs2=stmt2.executeQuery("SELECT COUNT(b.eva090_clave) FROM "+owner+".eva000 a, "+owner+".eva090 b WHERE a.eva080_clave = "+eva080_clave+" AND b.eva000_clave = a.eva000_clave AND b.eva090_estatus = 2 AND b.eva090_axo="+axo);
					  	  while(rs2.next())
					  	  {
							  contador=rs2.getInt(1);
						  }
				  	  }

				  	  rs=stmt.executeQuery(ls_query);
				      while(rs.next())
				      {
					     gd_eje = 0;  
				         ls_valtematico=PtsPorEjeTematico(conn, rs.getString(1), eva010_clave, axo, owner);
				         ld_valtematico=Double.valueOf(ls_valtematico).doubleValue();
				         acum=acum+ld_valtematico;
				         acum_vpeje = acum_vpeje + gd_eje;
				         //contador++;
				      }
                      total_vpeje = acum_vpeje / contador;
                      System.out.println("Eje = "+eva010_clave + "  Vp Pormedio = "+total_vpeje);
				      total=acum/contador;
				      total=g.Redondear(total);

				      res=g.RedondeoDecimal(total);

                      rs.close();
			          stmt.close();

                      //conn.close();

				   }//try
		           catch(SQLException Err)
		     	   {
			     	 Err.printStackTrace();
		     	   }

		     	   return res;
	    }


	    public String PromedioPorIndGenerico(Connection conn, String eva010_clave, String eva020_clave, String axo, String eva080_clave, String owner)
					    {
						    ResultSet rs, rs2;
						    String ls_query="", ls_query2="", res="";
						    double acum=0.0, total=0.0, ld_valgenerico=0.0, acum_vpindgen=0, total_vpindgen=0;
						    int contador=0;
						    String ls_valgenerico="";
						    Formula g = new Formula();


						    try
				           {
					          Statement stmt  = conn.createStatement (ResultSet.TYPE_SCROLL_INSENSITIVE ,ResultSet.CONCUR_READ_ONLY);
					          Statement stmt2  = conn.createStatement (ResultSet.TYPE_SCROLL_INSENSITIVE ,ResultSet.CONCUR_READ_ONLY);

					          if(eva080_clave.compareTo("0")==0)
					          {
								  ls_query = "SELECT a.eva000_clave FROM "+owner+".eva090 a, "+owner+".eva050 b WHERE ((a.eva090_axo = "+axo+" AND a.eva090_estatus = 2) AND (b.eva000_clave = a.eva000_clave AND b.eva050_axo = "+axo+" AND b.eva020_clave = "+eva020_clave+")) GROUP BY a.eva000_clave";
								   //rs2=stmt2.executeQuery("SELECT COUNT(b.eva090_clave) FROM "+owner+".eva000 a, "+owner+".eva090 b WHERE b.eva090_estatus = 2 AND b.eva090_axo="+axo+" AND a.eva000_clave = b.eva000_clave");
								   rs2=stmt2.executeQuery("SELECT Count(DISTINCT a.eva000_clave) FROM eva090 a, eva050 b WHERE ((a.eva090_axo = "+axo+" AND a.eva090_estatus = 2) AND (b.eva000_clave = a.eva000_clave AND b.eva050_axo = "+axo+" AND b.eva020_clave ="+eva020_clave+" ))");
								   while(rs2.next())
								   {
									   contador=rs2.getInt(1);
								  }
						  	  }
						  	  else
						  	  {
								  ls_query = "SELECT a.eva000_clave FROM "+owner+".eva090 a, "+owner+".eva050 b, "+owner+".eva000 c WHERE ((a.eva090_axo = "+axo+" AND a.eva090_estatus = 2) AND (c.eva000_clave = a.eva000_clave and c.eva080_clave ="+eva080_clave+") AND (b.eva000_clave = c.eva000_clave AND b.eva050_axo = "+axo+" AND b.eva020_clave = "+eva020_clave+")) GROUP BY a.eva000_clave";
								  rs2=stmt2.executeQuery("SELECT COUNT(b.eva090_clave) FROM "+owner+".eva000 a, "+owner+".eva090 b WHERE a.eva080_clave = "+eva080_clave+" AND b.eva000_clave = a.eva000_clave AND b.eva090_estatus = 2 AND b.eva090_axo="+axo);
								  while(rs2.next())
								  {
									  contador=rs2.getInt(1);
								  }
							  }
						  	  rs=stmt.executeQuery(ls_query);
						      while(rs.next())
						      {
                                 gd_indgenerico = 0;  
						         ls_valgenerico=PtsPorIndGenerico(conn, rs.getString(1), eva010_clave, eva020_clave, axo, owner);
                                 acum_vpindgen = acum_vpindgen + gd_indgenerico;     

						         ld_valgenerico=Double.valueOf(ls_valgenerico).doubleValue();
						         acum=acum+ld_valgenerico;
						         //contador++;

						      }

						      total_vpindgen = acum_vpindgen / contador;
						      System.out.println("Eje = "+eva010_clave + "  Ind Generico ="+eva020_clave+ "  Vp Pormedio = "+total_vpindgen);
                 	          total=acum/contador;
						      total=g.Redondear(total);
						      res=g.RedondeoDecimal(total);

					          rs.close();
					          stmt.close();
                              //conn.close();

						   }//try
				           catch(SQLException Err)
				     	   {
					     	 Err.printStackTrace();
				     	   }

				     	   return res;
	    }



 public String PromedioPorIndEspecifico(Connection conn, String eva030_clave, String axo, String eva080_clave, String owner)
			    {
				    ResultSet rs, rs2;
				    String ls_query="", ls_query2="", res="", ls_vpindespe="";
				    double acum=0.0, total=0.0, acum_vpindespe=0.0, total_vpindespe;
				    int contador=0;
				    Formula g = new Formula();


				    try
		           {
			          Statement stmt  = conn.createStatement (ResultSet.TYPE_SCROLL_INSENSITIVE ,ResultSet.CONCUR_READ_ONLY);

			          if(eva080_clave.compareTo("0")==0)
			          {
			          ls_query = "SELECT SUM(b.eva050_vponde) FROM "+owner+".eva090 a, "+owner+".eva050 b WHERE ((a.eva090_axo = "+axo+" AND a.eva090_estatus = 2) AND (b.eva000_clave = a.eva000_clave AND b.eva050_axo = "+axo+" AND b.eva030_clave = "+eva030_clave+"))";
				  	  }
				  	  else
				  	  {
						  ls_query = "SELECT SUM(b.eva050_vponde) FROM "+owner+".eva090 a, "+owner+".eva050 b, "+owner+".eva000 c WHERE ((a.eva090_axo = "+axo+" AND a.eva090_estatus = 2) AND (c.eva000_clave = a.eva000_clave AND c.eva080_clave = "+eva080_clave+") AND (b.eva000_clave = c.eva000_clave AND b.eva050_axo = "+axo+" AND b.eva030_clave = "+eva030_clave+"))";

					  }

				  	  rs=stmt.executeQuery(ls_query);
				      if (rs.next())
				      {
				         acum =rs.getDouble(1);
				      }

				      /////////////////////////////////////////////////////////////////
                     ls_query = "SELECT b.eva000_clave, b.eva020_clave FROM "+owner+".eva090 a, "+owner+".eva050 b WHERE ((a.eva090_axo = "+axo+" AND a.eva090_estatus = 2) AND (b.eva000_clave = a.eva000_clave AND b.eva050_axo = "+axo+" AND b.eva030_clave = "+eva030_clave+"))"; 				      
				     rs=stmt.executeQuery(ls_query); 
                     while (rs.next())
					 {
						gd_indespe = 0; 
					    ls_vpindespe = VPIndEspecifico(conn, rs.getString(1), rs.getString(2), eva030_clave, axo, owner);
					    System.out.println("ls_vpindespe = "+ls_vpindespe);
					    if(ls_vpindespe.length()>0)
					    {
					       gd_indespe = Double.valueOf(ls_vpindespe).doubleValue();
					       acum_vpindespe = acum_vpindespe + gd_indespe;
				        }
				     }    
                     
                     //////////////////////////////////////////////////////////////////////
				      Statement stmt2  = conn.createStatement (ResultSet.TYPE_SCROLL_INSENSITIVE ,ResultSet.CONCUR_READ_ONLY);

					  if(eva080_clave.compareTo("0")==0)
					  {
						  //ls_query2 = "SELECT COUNT(b.eva000_clave) FROM "+owner+".eva090 a, "+owner+".eva050 b WHERE ((a.eva090_axo = "+axo+" AND a.eva090_estatus = 2) AND (b.eva000_clave = a.eva000_clave AND b.eva050_axo = "+axo+" AND b.eva030_clave = "+eva030_clave+")) GROUP BY b.eva000_clave";
						  //ls_query2 = "SELECT COUNT(b.eva090_clave) FROM "+owner+".eva000 a, "+owner+".eva090 b WHERE b.eva090_estatus = 2 AND b.eva090_axo="+axo+" AND a.eva000_clave = b.eva000_clave";
						    ls_query2 = " SELECT count(a.eva000_clave) FROM eva090 a, eva050 b WHERE ((a.eva090_axo ="+axo+" AND a.eva090_estatus = 2) AND (b.eva000_clave = a.eva000_clave AND b.eva050_axo ="+axo+" AND b.eva030_clave ="+eva030_clave+"))";   
				      }
				      else
				      {
						  //ls_query2 = "SELECT COUNT(b.eva000_clave) FROM "+owner+".eva090 a, "+owner+".eva050 b, "+owner+".eva000 c WHERE ((a.eva090_axo = "+axo+" AND a.eva090_estatus = 2) AND (c.eva000_clave = a.eva000_clave AND c.eva080_clave = "+eva080_clave+") AND (b.eva000_clave = c.eva000_clave AND b.eva050_axo = "+axo+" AND b.eva030_clave = "+eva030_clave+")) GROUP BY b.eva000_clave";
						  ls_query2 = "SELECT COUNT(b.eva090_clave) FROM "+owner+".eva000 a, "+owner+".eva090 b WHERE a.eva080_clave = "+eva080_clave+" AND b.eva000_clave = a.eva000_clave AND b.eva090_estatus = 2 AND b.eva090_axo="+axo;
					  }

					  rs2=stmt2.executeQuery(ls_query2);
					  while (rs2.next())
					  {
					     //contador++;
					     contador=rs2.getInt(1);
				      }

                      total_vpindespe = acum_vpindespe / contador;
                      System.out.println("Ind Especifico = "+ eva030_clave + "  Vp Pormedio = "+total_vpindespe);
				      total=acum/contador;

				      total=g.Redondear(total);

				      res=g.RedondeoDecimal(total);

			          rs.close();
			          stmt.close();
			          rs2.close();

                      //conn.close();
				   }//try
		           catch(SQLException Err)
		     	   {
			     	 Err.printStackTrace();
		     	   }
                    
		     	   return res;
	    }


//////////////

 public String PromedioGeneral(Connection conn, String axo, String eva080_clave, String owner)
 {
				    ResultSet rs, rs2;
				    String ls_query="", ls_puntuacion="", res="";
				    double acum=0.0, total=0.0, ld_puntuacion;
				    int contador=0;
				    Formula g = new Formula();
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////
                   /*   try{
	                  File temp = File.createTempFile( "java", null);

                      System.out.println( System.getProperty( "java.io.tmpdir"));
                      //System.out.println( File.createTempFile( "java", null));

                      Properties props = System.getProperties( );
                      //props.put( "java.io.tmpdir", "C:\\TEMP\\");

                      //System.out.println( System.getProperty( "java.io.tmpdir"));
                      //System.out.println( File.createTempFile( "mocha", null));
                      temp.deleteOnExit();
                  }catch(IOException Err)
                  {
	                Err.printStackTrace();
	              }*/
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////

				    try
		           {
			          Statement stmt  = conn.createStatement (ResultSet.TYPE_SCROLL_INSENSITIVE ,ResultSet.CONCUR_READ_ONLY);

			          if(eva080_clave.compareTo("0")==0)
					  {
						  ls_query = "SELECT b.eva000_clave FROM "+owner+".eva090 a, "+owner+".eva000 b WHERE a.eva090_estatus = 2 AND a.eva000_clave = b.eva000_clave AND a.eva090_axo="+axo;
				      }
				      else
				      {
						  ls_query = "SELECT b.eva000_clave FROM "+owner+".eva090 a, "+owner+".eva000 b WHERE a.eva090_estatus = 2 AND a.eva000_clave = b.eva000_clave AND a.eva090_axo="+axo+" AND b.eva080_clave ="+eva080_clave;
					  }
				  	  rs=stmt.executeQuery(ls_query);
				      while(rs.next())
				      {
				         ls_puntuacion =PtsTotales(conn, rs.getString(1), axo, owner);
				         ld_puntuacion=Double.valueOf(ls_puntuacion).doubleValue();
                         //System.out.println("Depe = "+rs.getString(1) +"  puntuacion = "+ld_puntuacion);  
				         acum=acum+ld_puntuacion;
				         contador++;

				      }

                      /*System.out.println("acum == "+acum);
                      System.out.println("contador == "+contador);*/
				      total=acum/contador;
				      //System.out.println("total == "+total);

				      total=g.Redondear(total);

				      res=g.RedondeoDecimal(total);



			          rs.close();
			          stmt.close();
			          //conn.close();

				   }//try
		           catch(SQLException Err)
		     	   {
			     	 Err.printStackTrace();
		     	   }

		     	   return res;
	    }
//////////////
    public String VPIndEspecifico(Connection conn, String eva000_clave, String eva020_clave,String eva030_clave, String axo, String owner)
    {

	  ResultSet rs;
      double vp=0;
      Formula f = new Formula();
      double ldo_eva030_acumvponde=0.00;
      Formula g = new Formula();
      String ls_vpeje="";

      try{
	       Statement stmt  = conn.createStatement (ResultSet.TYPE_SCROLL_INSENSITIVE ,ResultSet.CONCUR_READ_ONLY);
           rs=stmt.executeQuery("SELECT b.eva020_clave, b.eva030_clave, b.eva030_vponde FROM "+owner+".eva050 b WHERE b.eva000_clave = "+eva000_clave+" AND b.eva020_clave = "+eva020_clave+" AND b.eva050_axo = "+axo+" GROUP BY b.eva020_clave, b.eva030_clave, b.eva030_vponde");
	       while(rs.next())
           {
             ldo_eva030_acumvponde = ldo_eva030_acumvponde + rs.getDouble(3);
           }
           //ldo_eva020_sumvponde = (100 - ldo_eva020_acumvponde)/li_eva020_rowvponde;

	       rs=stmt.executeQuery("SELECT b.eva020_clave, b.eva030_clave, b.eva030_vponde FROM "+owner+".eva050 b WHERE b.eva000_clave = "+eva000_clave+" AND b.eva020_clave = "+eva020_clave+" AND b.eva030_clave ="+eva030_clave+" AND b.eva050_axo = "+axo+" GROUP BY b.eva020_clave, b.eva030_clave, b.eva030_vponde");
		   while (rs.next())
       	   {
  		   	 vp=f.Redondear((rs.getInt(3)*100)/ldo_eva030_acumvponde);//Linea Nueva
		     ls_vpeje=f.RedondeoDecimal(vp);
           }
       
       
        rs.close();
		stmt.close();        
       }//try
       catch(SQLException Err)
     	{
	      Err.printStackTrace();
	    }

	   return ls_vpeje;

    }

//////////////
    public String VPIndGenerico(Connection conn, String eva000_clave, String eva010_clave,String eva020_clave, String axo, String owner)
    {

	  ResultSet rs;
      double vp=0;
      Formula f = new Formula();
      double ldo_eva020_acumvponde=0.00;
      Formula g = new Formula();
      String ls_vpeje="";

      try{
	       Statement stmt  = conn.createStatement (ResultSet.TYPE_SCROLL_INSENSITIVE ,ResultSet.CONCUR_READ_ONLY);
           rs=stmt.executeQuery("SELECT b.eva010_clave, b.eva020_clave, b.eva020_vponde FROM "+owner+".eva050 b WHERE b.eva000_clave = "+eva000_clave+" AND b.eva010_clave = "+eva010_clave+" AND b.eva050_axo = "+axo+" GROUP BY b.eva010_clave, b.eva020_clave, b.eva020_vponde");
	       while(rs.next())
           {
             ldo_eva020_acumvponde = ldo_eva020_acumvponde + rs.getDouble(3);
           }
           //ldo_eva020_sumvponde = (100 - ldo_eva020_acumvponde)/li_eva020_rowvponde;

	       rs=stmt.executeQuery("SELECT b.eva010_clave, b.eva020_clave, b.eva020_vponde FROM "+owner+".eva050 b WHERE b.eva000_clave = "+eva000_clave+" AND b.eva010_clave = "+eva010_clave+" AND b.eva020_clave ="+eva020_clave+" AND b.eva050_axo = "+axo+" GROUP BY b.eva010_clave, b.eva020_clave, b.eva020_vponde");
		   while (rs.next())
       	   {
  		   	 vp=f.Redondear((rs.getInt(3)*100)/ldo_eva020_acumvponde);//Linea Nueva
		     ls_vpeje=f.RedondeoDecimal(vp);
           }

       }//try
       catch(SQLException Err)
     	{
	      Err.printStackTrace();
	    }

	   return ls_vpeje;

    }


//////////////
     public String VPEjeTematico(Connection conn, String eva000_clave, String eva010_clave,String axo, String owner)
     {

	     ResultSet rs, rs3;
         String eva010_vponde;
         String ls_eva010_clave="", ls_query="", ls_vpeje="";
         double ldo_vponde=0.00 ;
         double vp=0, vpgen=0, vpeje=0;
         Formula f = new Formula();
         int i=0, li_eva010_rowvponde=0;
         double ldo_eva010_acumvponde=0.00, ldo_eva010_sumvponde=0.00;
         int numeracion=0;

         try{

              Statement stmt  = conn.createStatement (ResultSet.TYPE_SCROLL_INSENSITIVE ,ResultSet.CONCUR_READ_ONLY);
              Statement stmt1 = conn.createStatement (ResultSet.TYPE_SCROLL_INSENSITIVE ,ResultSet.CONCUR_READ_ONLY);
              Statement stmt2 = conn.createStatement (ResultSet.TYPE_SCROLL_INSENSITIVE ,ResultSet.CONCUR_READ_ONLY);
              Statement stmt3 = conn.createStatement (ResultSet.TYPE_SCROLL_INSENSITIVE ,ResultSet.CONCUR_READ_ONLY);

            //////// OBTIENE EL VALOR PONDERADO REAL DE LOS EJES TEMATICOS PARA SUMARSE ////////////////////////////////////////////////
            rs3=stmt3.executeQuery("SELECT b.eva010_clave, b.eva010_vponde FROM "+owner+".eva050 b WHERE b.eva000_clave = " + eva000_clave + " AND b.eva050_axo = "+axo+" GROUP BY b.eva010_clave, b.eva010_vponde");
            while(rs3.next())
	        {
	           li_eva010_rowvponde++;
               ldo_eva010_acumvponde = ldo_eva010_acumvponde + rs3.getDouble(2);
	        }
	        //ldo_eva010_sumvponde = (100 - ldo_eva010_acumvponde)/li_eva010_rowvponde;

            ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	        rs=stmt.executeQuery("SELECT b.eva010_clave, b.eva010_vponde FROM "+owner+".eva050 b WHERE b.eva000_clave = " + eva000_clave + " AND b.eva050_axo = "+axo+" AND b.eva010_clave ="+eva010_clave+" GROUP BY b.eva010_clave, b.eva010_vponde");
	        while(rs.next())
	        {
		      numeracion++;
		      ls_eva010_clave = rs.getString(1);
		      ldo_vponde = rs.getDouble(2);
              vpeje=f.Redondear((ldo_vponde*100)/ldo_eva010_acumvponde); //Linea Nueva
		      ls_vpeje=f.RedondeoDecimal(vpeje);
            }
	       }//try
           catch(SQLException Err)
           {Err.printStackTrace();}

           return ls_vpeje;

     }
}