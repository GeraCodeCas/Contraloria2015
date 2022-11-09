<%
/*********************************************************************************************************
Elaboro:	Jesus Manuel Limon Mireles
Lugar:		Monterrey, NL
Fecha:		23.Nov.2002
Compa�ia:	CONSISS
Modificado: 24.Ene.2003
Descripcion:La direcci�n de las imagenes
*********************************************************************************************************/
%>
<%

Funcionario				oHFuncionario			= new Funcionario();
Cargo					oHCargo					= new Cargo();
UnidadAdministrativa 	oHUnidadAdministrativa	= new UnidadAdministrativa();
UnidadGobierno		 	oHUnidadGobierno		= new UnidadGobierno();
Utilerias				oHUtil					= new Utilerias();

String sFecha = "AL " + oHUtil.sGetDate(oHUtil.GetFecha(), "dd") + " DE " + 
				oHUtil.GetMesLargo(java.lang.Integer.parseInt(oHUtil.sGetDate(oHUtil.GetFecha(), "MM"))) +
				" DE " + oHUtil.sGetDate(oHUtil.GetFecha(), "yyyy") ;
				
oHFuncionario.Get(iIdFuncionario);
int hIdCargo = oHFuncionario.GetIdCargo();
oHCargo.Get(hIdCargo);
int hIdUnidadAdministrativa = oHCargo.GetIdUnidadAdministrativa();
String hsClave = oHCargo.GetClave();
oHUnidadAdministrativa.Get(hIdUnidadAdministrativa);
String hsNombreUA = oHUnidadAdministrativa.GetNombre();
int hIdUnidadGobierno = oHUnidadAdministrativa.GetIdUnidadGobierno();
oHUnidadGobierno.Get(hIdUnidadGobierno);
String hsNombreUG = oHUnidadGobierno.GetNombre();


	sArchivo  = "\n<html>";
	sArchivo += "\n<head>";
if(!sAnexo.equals("")){
	sArchivo += "\n	<title>Entrega - Recepci�n : Anexo " + sAnexo + "</title>"; //CVSP
} else {
	sArchivo += "\n	<title>Entrega - Recepci�n : Adendum</title>"; //CVSP
}
	sArchivo += "\n	<link rel='stylesheet' type='text/css' href='" + sPath + "Styles/Gobierno.css'>";
	sArchivo += "\n	<script language='JavaScript'>";
	sArchivo += "\n			function MouseDentro(texto){";
	sArchivo += "\n			texto.style.background = '#bebebe';";
	sArchivo += "\n		}";
	sArchivo += "\n		function MouseFuera(texto,color){";
	sArchivo += "\n			texto.style.background = color;";
	sArchivo += "\n		}";
	sArchivo += "\n		function irA(sDireccion){";
	sArchivo += "\n			window.open( sDireccion, '_self' )";
	sArchivo += "\n		}";
	sArchivo += "\n	</script>";
	sArchivo += "\n</head>";
	sArchivo += "\n<body topmargin='0' leftmargin='0'>";
	sArchivo += "\n<table border='0' cellspacing='0' cellpadding='0' width='100%'>";
	sArchivo += "\n	<tr><td colspan='2'>";
	oArchivo.Escribe(sArchivo);
	oArchivowa.Escribe(sArchivo);



sArchivo = "\n<TABLE border='0' cellpadding='0' cellspacing='0' width='100%'>";
sArchivo += "\n	<TR>";
sArchivo += "\n		<TD width='100%' colspan='2'>";
sArchivo += "\n			<TABLE border='0' cellpadding='0' cellspacing='0' width='100%'>";
sArchivo += "\n				<TR>";
sArchivo += "\n					<TD><img name='gob' id='gob' height='123.4px' src='" + sPath + "images/EscudoDelEstado.jpg'></TD>";
sArchivo += "\n					<TD align='center' class='AnexosTitulo'>";
sArchivo += "\n						<br>Gobierno del Estado de Nuevo Le�n<br>";
sArchivo += "\n						" + hsNombreUG + "<br>&nbsp;</TD>";
sArchivo += "\n					<TD>";
if (oHUnidadGobierno.GetImagen()!=null)
	sArchivo += "\n<img name='logoUnidad' id='logoUnidad' height='55px' src='" + sPath + (oHUnidadGobierno.GetImagen()).substring(3) + "'>";
sArchivo += "\n					</TD>";
sArchivo += "\n				</TR>";
sArchivo += "\n			</TABLE>";
sArchivo += "\n		</TD>";
sArchivo += "\n	</TR>";
if(!sAnexo.equals("")){
	sArchivo += "\n	<TR>";
	sArchivo += "\n		<TD align='right' colspan='2'>ANEXO " + sAnexo + "</TD>";
	sArchivo += "\n	</TR>";
}
sArchivo += "\n	<TR>";
sArchivo += "\n		<TD>";
sArchivo += "\n			<TABLE border='0' cellpadding='2' cellspacing='0' width='100%'>";
sArchivo += "\n				<TR>";
sArchivo += "\n					<TD width='160px' class='Anexos'>NOMBRE DE LA DEPENDENCIA, ORGANISMO PARAESTATAL O TRIBUNAL ADMINISTRATIVO</TD>";
sArchivo += "\n					<TD width='350px' class='Anexos' valign='top'>&nbsp;" + hsNombreUG + "</TD>";
sArchivo += "\n				</TR>";
sArchivo += "\n				<TR>";
sArchivo += "\n					<TD class='Anexos'>UNIDAD ADMINISTRATIVA</TD>";
sArchivo += "\n					<TD class='Anexos'>&nbsp;" + hsNombreUA + "</TD>";
sArchivo += "\n				</TR>";
sArchivo += "\n				<TR>";
sArchivo += "\n					<TD class='Anexos'>CLAVE</TD>";
sArchivo += "\n					<TD class='Anexos'>&nbsp;" + hsClave + "</TD>";
sArchivo += "\n				</TR>";
sArchivo += "\n			</TABLE>";	
sArchivo += "\n		</TD>";
sArchivo += "\n		<TD width='170px' class='Anexos'>&nbsp;" + sFecha.toUpperCase() + "</TD>";
sArchivo += "\n	</TR>";
sArchivo += "\n</TABLE>";
oHFuncionario			= null;
oHCargo					= null;
oHUnidadAdministrativa	= null;
oHUnidadGobierno		= null;
oHUtil					= null;


	oArchivo.Escribe(sArchivo);
	oArchivowa.Escribe(sArchivo);
	sArchivo = "\n		</td><tr>";
	sArchivo += "\n	<tr><td width='135' valign='top'>";
	sArchivo +="\n<br>";
	oArchivo.Escribe(sArchivo);
	oArchivowa.Escribe(sArchivo);


sArchivo = "\n<TABLE cellSpacing=0 cellPadding=0 width='135' align=center border=0>			";
sArchivo += "\n	<TBODY>";
sArchivo += "\n      <TR><TD class='TituloMenu' align=middle>ANEXOS</TD></TR>";
if(iProceso.equals("2")){
	sArchivo += "\n      <TR onmouseover=" + c + "MouseDentro(this);window.status = 'Adendeum'" + c + " onclick=" + c + "irA('fAdendum.html');" + c + " onmouseout=" + c + "MouseFuera(this,'#ffffff');" + c + ">";
	sArchivo += "\n         	<TD><A class='OpcionMenu'><IMG alt='Adendeum'" + c + " src='" + sPath + "Images/Vineta.gif' border=0>&nbsp;Adendum</A></TD></TR>";
}
sArchivo += "\n		<TR onmouseover=" + c + "MouseDentro(this);window.status='Documentos de Creaci�n, Integraci�n del Organo de Gobierno y Actas de Sesiones'" + c + " onclick=" + c + "irA('fAnexo1i.html');" + c + " onmouseout=" + c + "MouseFuera(this,'#ffffff');" + c + "><TD><A class='OpcionMenu'><IMG alt='Documentos de Creaci�n, Integraci�n del Organo de Gobierno y Actas de Sesiones'" + c + " src='" + sPath + "Images/Vineta.gif' border=0>&nbsp;Anexo I.1</A></TD></TR>";
sArchivo += "\n      <TR onmouseover=" + c + "MouseDentro(this);window.status='Relaci�n de Acuerdos, Convenios, Contratos y Documentos Legales'" + c + " onclick=" + c + "irA('fAnexo1ii.html');" + c + " onmouseout=" + c + "MouseFuera(this,'#ffffff');" + c + ">";
sArchivo += "\n        	<TD><A class='OpcionMenu'><IMG alt='Relaci�n de Acuerdos, Convenios, Contratos y Documentos Legales'" + c + " src='" + sPath + "Images/Vineta.gif' border=0>&nbsp;Anexo I.2</A></TD></TR>";
sArchivo += "\n		<TR onmouseover=" + c + "MouseDentro(this);window.status = 'Presupuesto Global del Ejercicio'" + c + " onclick=" + c + "irA('fAnexo2i.html');" + c + " onmouseout=" + c + "MouseFuera(this,'#ffffff');" + c + ">";
sArchivo += "\n			<TD><A class='OpcionMenu'><IMG alt='Presupuesto Global del Ejercicio'" + c + " src='" + sPath + "Images/Vineta.gif' border=0>&nbsp;Anexo II.1</A></TD></TR>";
sArchivo += "\n      <TR onmouseover=" + c + "MouseDentro(this);window.status = 'Situaci�n de Fondos Revolventes'" + c + " onclick=" + c + "irA('fAnexo2ii.html');" + c + " onmouseout=" + c + "MouseFuera(this,'#ffffff');" + c + ">";
sArchivo += "\n          	<TD><A class='OpcionMenu'><IMG alt='Situaci�n de Fondos Revolventes'" + c + " src='" + sPath + "Images/Vineta.gif' border=0>&nbsp;Anexo II.2</A></TD></TR>";
sArchivo += "\n      <TR onmouseover=" + c + "MouseDentro(this);window.status = 'Relaci�n de Gastos Pendientes de Comprobar'" + c + " onclick=" + c + "irA('fAnexo2iii.html');" + c + " onmouseout=" + c + "MouseFuera(this,'#ffffff');" + c + ">";
sArchivo += "\n          	<TD><A class='OpcionMenu'><IMG alt='Relaci�n de Gastos Pendientes de Comprobar'" + c + " src='" + sPath + "Images/Vineta.gif' border=0>&nbsp;Anexo II.3</A></TD></TR>";
sArchivo += "\n      <TR onmouseover=" + c + "MouseDentro(this);window.status = 'Relaci�n de Cuentas Bancarias, Inversiones, Dep�sitos, T�tulos o  cualquier otro Contrato con Instituciones de Cr�dito, Casas de Bolsa u otra Instituci�n Similar'" + c + " onclick=" + c + "irA('fAnexo2iv.html');" + c + " onmouseout=" + c + "MouseFuera(this,'#ffffff');" + c + ">";
sArchivo += "\n          	<TD><A class='OpcionMenu'><IMG alt='Relaci�n de Cuentas Bancarias, Inversiones, Dep�sitos, T�tulos o  cualquier otro Contrato con Instituciones de Cr�dito, Casas de Bolsa u otra Instituci�n Similar'" + c + " src='" + sPath + "Images/Vineta.gif' border=0>&nbsp;Anexo II.4</A></TD></TR>";
sArchivo += "\n	   	<TR onmouseover=" + c + "MouseDentro(this);window.status = 'Detalle de la Situaci�n de Bancos '" + c + " onclick=" + c + "irA('fAnexo2iv1.html');" + c + " onmouseout=" + c + "MouseFuera(this,'#ffffff');" + c + ">";
sArchivo += "\n          	<TD><A class='OpcionMenu'><IMG alt='Detalle de la Situaci�n de Bancos '" + c + " src='" + sPath + "Images/Vineta.gif' border=0>&nbsp;Anexo II.4.1</A></TD></TR>";
sArchivo += "\n      <TR onmouseover=" + c + "MouseDentro(this);window.status = 'Relaci�n de Cheques Expedidos sin Entregar '" + c + " onclick=" + c + "irA('fAnexo2iv2.html');" + c + " onmouseout=" + c + "MouseFuera(this,'#ffffff');" + c + ">";
sArchivo += "\n          	<TD><A class='OpcionMenu'><IMG alt='Relaci�n de Cheques Expedidos sin Entregar'" + c + " src='" + sPath + "Images/Vineta.gif' border=0>&nbsp;Anexo II.4.2</A></TD></TR>";
sArchivo += "\n      <TR onmouseover=" + c + "MouseDentro(this);window.status = 'Detalle de Cuentas de Inversiones '" + c + " onclick=" + c + "irA('fAnexo2iv3.html');" + c + " onmouseout=" + c + "MouseFuera(this,'#ffffff');" + c + ">";
sArchivo += "\n          	<TD><A class='OpcionMenu'><IMG alt='Detalle de Cuentas de Inversiones '" + c + " src='" + sPath + "Images/Vineta.gif' border=0>&nbsp;Anexo II.4.3</A></TD></TR>";
sArchivo += "\n		<TR onmouseover=" + c + "MouseDentro(this);window.status = 'Relaci�n de Documentos y Cuentas por Cobrar'" + c + " onclick=" + c + "irA('fAnexo2v.html');" + c + " onmouseout=" + c + "MouseFuera(this,'#ffffff');" + c + ">";
sArchivo += "\n			<TD><A class='OpcionMenu'><IMG alt='Relaci�n de Documentos y Cuentas por Cobrar'" + c + " src='" + sPath + "Images/Vineta.gif' border=0>&nbsp;Anexo II.5</A></TD></TR>";
sArchivo += "\n      <TR onmouseover=" + c + "MouseDentro(this);window.status = 'Relaci�n de Documentos y Cuentas por Pagar '" + c + " onclick=" + c + "irA('fAnexo2vi.html');" + c + " onmouseout=" + c + "MouseFuera(this,'#ffffff');" + c + ">";
sArchivo += "\n        	<TD><A class='OpcionMenu'><IMG alt='Relaci�n de Documentos y Cuentas por Pagar '" + c + " src='" + sPath + "Images/Vineta.gif' border=0>&nbsp;Anexo II.6</A></TD></TR>";
sArchivo += "\n      <TR onmouseover=" + c + "MouseDentro(this);window.status = 'Estados Financieros Dictaminados '" + c + " onclick=" + c + "irA('fAnexo2vii.html');" + c + " onmouseout=" + c + "MouseFuera(this,'#ffffff');" + c + ">";
sArchivo += "\n          	<TD><A class='OpcionMenu'><IMG alt='Estados Financieros Dictaminados'" + c + " src='" + sPath + "Images/Vineta.gif' border=0>&nbsp;Anexo II.7</A></TD></TR>";
sArchivo += "\n      <TR onmouseover=" + c + "MouseDentro(this);window.status = 'Estructura Organizacional '" + c + " onclick=" + c + "irA('fAnexo3i.html');" + c + " onmouseout=" + c + "MouseFuera(this,'#ffffff');" + c + ">";
sArchivo += "\n			<TD><A class='OpcionMenu'><IMG alt='Estructura Organizacional'" + c + " src='" + sPath + "Images/Vineta.gif' border=0>&nbsp;Anexo III.1</A></TD></TR>";
sArchivo += "\n      <TR onmouseover=" + c + "MouseDentro(this);window.status = 'Marco Jur�dico de Actuaci�n '" + c + " onclick=" + c + "irA('fAnexo3ii.html');" + c + " onmouseout=" + c + "MouseFuera(this,'#ffffff');" + c + ">";
sArchivo += "\n          	<TD><A class='OpcionMenu'><IMG alt='Marco Jur�dico de Actuaci�n'" + c + " src='" + sPath + "Images/Vineta.gif' border=0>&nbsp;Anexo III.2</A></TD></TR>";
sArchivo += "\n      <TR onmouseover=" + c + "MouseDentro(this);window.status = 'Relaci�n de Manuales de Organizaci�n, Pol�ticas y Normas de Administraci�n Interna'" + c + " onclick=" + c + "irA('fAnexo3iii.html');" + c + " onmouseout=" + c + "MouseFuera(this,'#ffffff');" + c + ">";
sArchivo += "\n          	<TD><A class='OpcionMenu'><IMG alt='Relaci�n de Manuales de Organizaci�n, Pol�ticas y Normas de Administraci�n Interna'" + c + " src='" + sPath + "Images/Vineta.gif' border=0>&nbsp;Anexo III.3</A></TD></TR>";
sArchivo += "\n      <TR onmouseover=" + c + "MouseDentro(this);window.status = 'Resumen de Plazas Autorizadas '" + c + " onclick=" + c + "irA('fAnexo3iv.html');" + c + " onmouseout=" + c + "MouseFuera(this,'#ffffff');" + c + ">";
sArchivo += "\n          	<TD><A class='OpcionMenu'><IMG alt='Resumen de Plazas Autorizadas '" + c + " src='" + sPath + "Images/Vineta.gif' border=0>&nbsp;Anexo III.4</A></TD></TR>";
sArchivo += "\n    	<TR onmouseover=" + c + "MouseDentro(this);window.status = 'Plantilla de Personal '" + c + " onclick=" + c + "irA('fAnexo3iv1.html');" + c + " onmouseout=" + c + "MouseFuera(this,'#ffffff');" + c + ">";
sArchivo += "\n         	<TD><A class='OpcionMenu'><IMG alt='Plantilla de Personal'" + c + " src='" + sPath + "Images/Vineta.gif' border=0>&nbsp;Anexo III.4.1</A></TD></TR>";
sArchivo += "\n      <TR onmouseover=" + c + "MouseDentro(this);window.status = 'Personal con Licencia, Permiso o Comisi�n '" + c + " onclick=" + c + "irA('fAnexo3iv2.html');" + c + " onmouseout=" + c + "MouseFuera(this,'#ffffff');" + c + ">";
sArchivo += "\n         	<TD><A class='OpcionMenu'><IMG alt='Personal con Licencia, Permiso o Comisi�n'" + c + " src='" + sPath + "Images/Vineta.gif' border=0>&nbsp;Anexo III.4.2</A></TD></TR>";
sArchivo += "\n      <TR onmouseover=" + c + "MouseDentro(this);window.status = 'Relaci�n de Sueldos No Entregados'" + c + " onclick=" + c + "irA('fAnexo3iv3.html');" + c + " onmouseout=" + c + "MouseFuera(this,'#ffffff');" + c + ">";
sArchivo += "\n         	<TD><A class='OpcionMenu'><IMG alt='Relaci�n de Sueldos No Entregados '" + c + " src='" + sPath + "Images/Vineta.gif' border=0>&nbsp;Anexo III.4.3</A></TD></TR>";
sArchivo += "\n      <TR onmouseover=" + c + "MouseDentro(this);window.status = 'Vacaciones del Personal Pendientes de Disfrutar'" + c + " onclick=" + c + "irA('fAnexo3iv4.html');" + c + " onmouseout=" + c + "MouseFuera(this,'#ffffff');" + c + ">";
sArchivo += "\n         	<TD><A class='OpcionMenu'><IMG alt='Vacaciones del Personal Pendientes de Disfrutar'" + c + " src='" + sPath + "Images/Vineta.gif' border=0>&nbsp;Anexo III.4.4	</A></TD></TR>";
sArchivo += "\n      <TR onmouseover=" + c + "MouseDentro(this);window.status = 'Relaci�n de Expedientes de Personal'" + c + " onclick=" + c + "irA('fAnexo3iv5.html');" + c + " onmouseout=" + c + "MouseFuera(this,'#ffffff');" + c + ">";
sArchivo += "\n         	<TD><A class='OpcionMenu'><IMG alt='Relaci�n de Expedientes de Personal '" + c + " src='" + sPath + "Images/Vineta.gif' border=0>&nbsp;Anexo III.4.5</A></TD></TR>";
sArchivo += "\n      <TR onmouseover=" + c + "MouseDentro(this);window.status = 'Programa y Avance de Capacitaci�n del Personal '" + c + " onclick=" + c + "irA('fAnexo3iv6.html');" + c + " onmouseout=" + c + "MouseFuera(this,'#ffffff');" + c + ">";
sArchivo += "\n         	<TD><A class='OpcionMenu'><IMG alt='Programa y Avance de Capacitaci�n del Personal '" + c + " src='" + sPath + "Images/Vineta.gif' border=0>&nbsp;Anexo III.4.6</A></TD></TR>";
sArchivo += "\n      <TR onmouseover=" + c + "MouseDentro(this);window.status = 'Resumen de Inventarios '" + c + " onclick=" + c + "irA('fAnexo3v.html');" + c + " onmouseout=" + c + "MouseFuera(this,'#ffffff');" + c + ">";
sArchivo += "\n	   		<TD><A class='OpcionMenu'><IMG alt='Resumen de Inventarios'" + c + " src='" + sPath + "Images/Vineta.gif' border=0>&nbsp;Anexo III.5</A></TD></TR>";
sArchivo += "\n      <TR onmouseover=" + c + "MouseDentro(this);window.status = 'Mobiliario y Equipo de Oficina '" + c + " onclick=" + c + "irA('fAnexo3v1.html');" + c + " onmouseout=" + c + "MouseFuera(this,'#ffffff');" + c + ">";
sArchivo += "\n         	<TD><A class='OpcionMenu'><IMG alt='Mobiliario y Equipo de Oficina '" + c + " src='" + sPath + "Images/Vineta.gif' border=0>&nbsp;Anexo III.5.1	</A></TD></TR>";
sArchivo += "\n      <TR onmouseover=" + c + "MouseDentro(this);window.status = 'Relaci�n de Equipo de C�mputo'" + c + " onclick=" + c + "irA('fAnexo3v2.html');" + c + " onmouseout=" + c + "MouseFuera(this,'#ffffff');" + c + ">";
sArchivo += "\n         	<TD><A class='OpcionMenu'><IMG alt='Relaci�n de Equipo de C�mputo'" + c + " src='" + sPath + "Images/Vineta.gif' border=0>&nbsp;Anexo III.5.2</A></TD></TR>";
sArchivo += "\n      <TR onmouseover=" + c + "MouseDentro(this);window.status = 'Relaci�n de Sistemas Desarrollados Internamente'" + c + " onclick=" + c + "irA('fAnexo3v2i.html');" + c + " onmouseout=" + c + "MouseFuera(this,'#ffffff');" + c + ">";
sArchivo += "\n         	<TD><A class='OpcionMenu'><IMG alt='Relaci�n de Sistemas Desarrollados Internamente'" + c + " src='" + sPath + "Images/Vineta.gif' border=0>&nbsp;Anexo III.5.2.1</A></TD></TR>";
sArchivo += "\n      <TR onmouseover=" + c + "MouseDentro(this);window.status = 'Relaci�n de Programas Tipo Paquete '" + c + " onclick=" + c + "irA('fAnexo3v2ii.html');" + c + " onmouseout=" + c + "MouseFuera(this,'#ffffff');" + c + ">";
sArchivo += "\n         	<TD><A class='OpcionMenu'><IMG alt='Relaci�n de Programas Tipo Paquete'" + c + " src='" + sPath + "Images/Vineta.gif' border=0>&nbsp;Anexo III.5.2.2</A></TD></TR>";
sArchivo += "\n      <TR onmouseover=" + c + "MouseDentro(this);window.status = 'Relaci�n de Equipo de Video'" + c + " onclick=" + c + "irA('fAnexo3v3.html');" + c + " onmouseout=" + c + "MouseFuera(this,'#ffffff');" + c + ">";
sArchivo += "\n         	<TD><A class='OpcionMenu'><IMG alt='Relaci�n de Equipo de Video'" + c + " src='" + sPath + "Images/Vineta.gif' border=0>&nbsp;Anexo III.5.3</A></TD></TR>";
sArchivo += "\n      <TR onmouseover=" + c + "MouseDentro(this);window.status = 'Relaci�n de Equipo de Transporte y Maquinaria'" + c + " onclick=" + c + "irA('fAnexo3v4.html');" + c + " onmouseout=" + c + "MouseFuera(this,'#ffffff');" + c + ">";
sArchivo += "\n         	<TD><A class='OpcionMenu'><IMG alt='Relaci�n de Equipo de Transporte y Maquinaria'" + c + " src='" + sPath + "Images/Vineta.gif' border=0>&nbsp;Anexo III.5.4</A></TD></TR>";
sArchivo += "\n      <TR onmouseover=" + c + "MouseDentro(this);window.status = 'Relaci�n de Armamento'" + c + " onclick=" + c + "irA('fAnexo3v5.html');" + c + " onmouseout=" + c + "MouseFuera(this,'#ffffff');" + c + ">";
sArchivo += "\n         	<TD><A class='OpcionMenu'><IMG alt='Relaci�n de Armamento'" + c + " src='" + sPath + "Images/Vineta.gif' border=0>&nbsp;Anexo III.5.5</A></TD></TR>";
sArchivo += "\n      <TR onmouseover=" + c + "MouseDentro(this);window.status = 'Relaci�n de Obras de Arte y Decoraci�n'" + c + " onclick=" + c + "irA('fAnexo3v6.html');" + c + " onmouseout=" + c + "MouseFuera(this,'#ffffff');" + c + ">";
sArchivo += "\n         	<TD><A class='OpcionMenu'><IMG alt='Relaci�n de Obras de Arte y Decoraci�n '" + c + " src='" + sPath + "Images/Vineta.gif' border=0>&nbsp;Anexo III.5.6</A></TD></TR>";
sArchivo += "\n      <TR onmouseover=" + c + "MouseDentro(this);window.status = 'Relaci�n de Libros, Publicaciones, Material Bibliogr�fico e Informativo'" + c + " onclick=" + c + "irA('fAnexo3v7.html');" + c + " onmouseout=" + c + "MouseFuera(this,'#ffffff');" + c + ">";
sArchivo += "\n         	<TD><A class='OpcionMenu'><IMG alt='Relaci�n de Libros, Publicaciones, Material Bibliogr�fico e Informativo'" + c + " src='" + sPath + "Images/Vineta.gif' border=0>&nbsp;Anexo III.5.7</A></TD></TR>";
sArchivo += "\n      <TR onmouseover=" + c + "MouseDentro(this);window.status = 'Inventario de Almac�n'" + c + " onclick=" + c + "irA('fAnexo3vi.html');" + c + " onmouseout=" + c + "MouseFuera(this,'#ffffff');" + c + ">";
sArchivo += "\n         	<TD><A class='OpcionMenu'><IMG alt='Inventario de Almac�n'" + c + " src='" + sPath + "Images/Vineta.gif' border=0>&nbsp;Anexo III.6</A></TD></TR>";
sArchivo += "\n      <TR onmouseover=" + c + "MouseDentro(this);window.status = 'Relaci�n de Formas Oficiales'" + c + " onclick=" + c + "irA('fAnexo3vii.html');" + c + " onmouseout=" + c + "MouseFuera(this,'#ffffff');" + c + ">";
sArchivo += "\n        	<TD><A class='OpcionMenu'><IMG alt='Relaci�n de Formas Oficiales'" + c + " src='" + sPath + "Images/Vineta.gif' border=0>&nbsp;Anexo III.7</A></TD></TR>";
sArchivo += "\n      <TR onmouseover=" + c + "MouseDentro(this);window.status = 'Sobre Cerrado con la Combinaci�n de Cajas Fuertes'" + c + " onclick=" + c + "irA('fAnexo3viii.html');" + c + " onmouseout=" + c + "MouseFuera(this,'#ffffff');" + c + ">";
sArchivo += "\n        	<TD><A class='OpcionMenu'><IMG alt='Sobre Cerrado con la Combinaci�n de Cajas Fuertes'" + c + " src='" + sPath + "Images/Vineta.gif' border=0>&nbsp;Anexo III.8</A></TD></TR>";
sArchivo += "\n      <TR onmouseover=" + c + "MouseDentro(this);window.status = 'Relaci�n de Bienes Inmuebles'" + c + " onclick=" + c + "irA('fAnexo3ix.html');" + c + " onmouseout=" + c + "MouseFuera(this,'#ffffff');" + c + ">";
sArchivo += "\n         	<TD><A class='OpcionMenu'><IMG alt='Relaci�n de Bienes Inmuebles'" + c + " src='" + sPath + "Images/Vineta.gif' border=0>&nbsp;Anexo III.9</A></TD></TR>";
sArchivo += "\n      <TR onmouseover=" + c + "MouseDentro(this);window.status = 'Relaci�n de Obras en Proceso'" + c + " onclick=" + c + "irA('fAnexo3x.html');" + c + " onmouseout=" + c + "MouseFuera(this,'#ffffff');" + c + ">";
sArchivo += "\n	   		<TD><A class='OpcionMenu'><IMG alt='Relaci�n de Obras en Proceso'" + c + " src='" + sPath + "Images/Vineta.gif' border=0>&nbsp;Anexo III.10</A></TD></TR>";
sArchivo += "\n      <TR onmouseover=" + c + "MouseDentro(this);window.status = 'Relaci�n de Obras Terminadas  por Programa'" + c + " onclick=" + c + "irA('fAnexo3xi.html');" + c + " onmouseout=" + c + "MouseFuera(this,'#ffffff');" + c + ">";
sArchivo += "\n         	<TD><A class='OpcionMenu'><IMG alt='Relaci�n de Obras Terminadas  por Programa'" + c + " src='" + sPath + "Images/Vineta.gif' border=0>&nbsp;Anexo III.11</A></TD></TR>";
sArchivo += "\n      <TR onmouseover=" + c + "MouseDentro(this);window.status = 'Relaci�n de Anticipos de Obras por Amortizar'" + c + " onclick=" + c + "irA('fAnexo3xii.html');" + c + " onmouseout=" + c + "MouseFuera(this,'#ffffff');" + c + ">";
sArchivo += "\n         	<TD><A class='OpcionMenu'><IMG alt='Relaci�n de Anticipos de Obras por Amortizar'" + c + " src='" + sPath + "Images/Vineta.gif' border=0>&nbsp;Anexo III.12</A></TD></TR>";
sArchivo += "\n      <TR onmouseover=" + c + "MouseDentro(this);window.status = 'Relaci�n de Compromisos Presidenciales'" + c + " onclick=" + c + "irA('fAnexo3xiii.html');" + c + " onmouseout=" + c + "MouseFuera(this,'#ffffff');" + c + ">";
sArchivo += "\n         	<TD><A class='OpcionMenu'><IMG alt='Relaci�n de Compromisos Presidenciales'" + c + " src='" + sPath + "Images/Vineta.gif' border=0>&nbsp;Anexo III.13</A></TD></TR>";
sArchivo += "\n      <TR onmouseover=" + c + "MouseDentro(this);window.status = 'Relaci�n de Compromisos Gubernamentales'" + c + " onclick=" + c + "irA('fAnexo3xiv.html');" + c + " onmouseout=" + c + "MouseFuera(this,'#ffffff');" + c + ">";
sArchivo += "\n         	<TD><A class='OpcionMenu'><IMG alt='Relaci�n de Compromisos Gubernamentales'" + c + " src='" + sPath + "Images/Vineta.gif' border=0>&nbsp;Anexo III.14</A></TD></TR>";
sArchivo += "\n      <TR onmouseover=" + c + "MouseDentro(this);window.status = 'Relaci�n de Archivo Vigente'" + c + " onclick=" + c + "irA('fAnexo3xv.html');" + c + " onmouseout=" + c + "MouseFuera(this,'#ffffff');" + c + ">";
sArchivo += "\n         	<TD><A class='OpcionMenu'><IMG alt='Relaci�n de Archivo Vigente'" + c + " src='" + sPath + "Images/Vineta.gif' border=0>&nbsp;Anexo III.15</A></TD></TR>";
sArchivo += "\n      <TR onmouseover=" + c + "MouseDentro(this);window.status = 'Relaci�n de Respaldos de Archivo en Diskettes o CDs'" + c + " onclick=" + c + "irA('fAnexo3xv1.html');" + c + " onmouseout=" + c + "MouseFuera(this,'#ffffff');" + c + ">";
sArchivo += "\n         	<TD><A class='OpcionMenu'><IMG alt='Relaci�n de Respaldos de Archivo en Diskettes o CDs'" + c + " src='" + sPath + "Images/Vineta.gif' border=0>&nbsp;Anexo III.15.1</A></TD></TR>";
sArchivo += "\n      <TR onmouseover=" + c + "MouseDentro(this);window.status = 'Relaci�n de Archivo Muerto'" + c + " onclick=" + c + "irA('fAnexo3xvi.html');" + c + " onmouseout=" + c + "MouseFuera(this,'#ffffff');" + c + ">";
sArchivo += "\n         	<TD><A class='OpcionMenu'><IMG alt='Relaci�n de Archivo Muerto'" + c + " src='" + sPath + "Images/Vineta.gif' border=0>&nbsp;Anexo III.16</A></TD></TR>";
sArchivo += "\n      <TR onmouseover=" + c + "MouseDentro(this);window.status = 'Relaci�n de Asuntos en Tr�mite'" + c + " onclick=" + c + "irA('fAnexo3xvii.html');" + c + " onmouseout=" + c + "MouseFuera(this,'#ffffff');" + c + ">";
sArchivo += "\n         	<TD><A class='OpcionMenu'><IMG alt='Relaci�n de Asuntos en Tr�mite'" + c + " src='" + sPath + "Images/Vineta.gif' border=0>&nbsp;Anexo III.17</A></TD></TR>";
sArchivo += "\n      <TR onmouseover=" + c + "MouseDentro(this);window.status = 'Relaci�n de Estudios y Proyectos No Desarrollados'" + c + " onclick=" + c + "irA('fAnexo3xviii.html');" + c + " onmouseout=" + c + "MouseFuera(this,'#ffffff');" + c + ">";
sArchivo += "\n         	<TD><A class='OpcionMenu'><IMG alt='Relaci�n de Estudios y Proyectos No Desarrollados'" + c + " src='" + sPath + "Images/Vineta.gif' border=0>&nbsp;Anexo III.18</A></TD></TR>";
sArchivo += "\n	</TBODY>	";
sArchivo += "\n</TABLE>		";


	oArchivo.Escribe(sArchivo);
	oArchivowa.Escribe(sArchivo);
	sArchivo  = "\n		</td>";
//	sArchivo += "\n		<td valign='top'>"; CVSP
	sArchivo += "\n		<td valign='top' width='100%'>";
	sArchivo += "\n			<TABLE align=center border=0 cellPadding=0 cellSpacing=0 width='100%'>";
	sArchivo += sAux;
	oArchivo.Escribe(sArchivo);
	oArchivowa.Escribe(sArchivo);
			vArchivoA = oArchivoA.GetAll(iIdAnexo, iIdFuncionario);
			if(vArchivoA.getNumRows()>0){
			sArchivo = "\n				<TR>";
			sArchivo += "\n					<TD colspan='3'><b>Archivos Adjuntos (Attachment):</b>";
				boolean bBandera = false;
				for(int i=0;i<vArchivoA.getNumRows();i++){
					String	sAnexoArchivo = (((Vector)vArchivoA.getVMatrixAll().elementAt(0)).elementAt(i)+"").trim();
					String  sRuta 		= (((Vector)vArchivoA.getVMatrixAll().elementAt(3)).elementAt(i)+"").trim();
					String 	sArchivos 	= (((Vector)vArchivoA.getVMatrixAll().elementAt(4)).elementAt(i)+"").trim();
					String	sLink		= (((Vector)vArchivoA.getVMatrixAll().elementAt(5)).elementAt(i)+"").trim() + (((Vector)vArchivoA.getVMatrixAll().elementAt(4)).elementAt(i)+"").trim();
					sArchivo += "\n						<a target='new' onmouseover=" + c + "this.style.cursor='hand'" + c + " style='cursor:normal' href='" + sLinkAttach + "1\\" + sArchivos + "'><font color='Blue'>" + sArchivos + "</font></a>";
					bBandera = true;
				}
	oArchivowa.Escribe(sArchivo);
//	sArchivo = iIdAnexo + "-" + iIdFuncionario + "\n					</TD>";
	sArchivo = "\n				</TR>";
	oArchivowa.Escribe(sArchivo);
			}
	sArchivo = "\n				</TABLE>";
	oArchivo.Escribe(sArchivo);
	oArchivowa.Escribe(sArchivo);

 %>

