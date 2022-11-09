function Consiss(Portal){
	var ancho = 750;
	var alto = 500;
	var x = (screen.width - ancho) / 2;
	var y = (screen.height - alto) / 2;
	var url = "http://www.consiss.com"
	window.open(url, "Consiss", "width=" + ancho + ",height=" + alto + ",top=" + y + ",left=" + x + ",toolbar=1,location=1,directories=1,status=1,menubar=1,scrollbars=1,resizable=0");
}
/*****************************************************
** Arma una cadena reemplazando cada coma con "|^|" **
*****************************************************/
function sacaComa(strFrase)
{	
	var hayComa;

	hayComa = strFrase.search(',');	
	while (hayComa > 0)
	{
		strFrase = strFrase.replace(',', '|^|');
		hayComa = strFrase.search(',');
	}
	return strFrase;
}

/*********************************************************
** Arma una cadena reemplazando cada "|^|" por una coma **
*********************************************************/
function poneComa(strFrase)
{
	var hayCaracter;
		
	hayCaracter = strFrase.indexOf('|^|', 0);
	while (hayCaracter > 0)
	{
		strFrase = strFrase.replace('|^|', ',');
		hayCaracter = strFrase.indexOf('|^|', 0);
	}
	return strFrase;	
}

/*****************************************************
** Arma una cadena reemplazando cada comilla con "|@|" **
*****************************************************/
function sacaComilla(strFrase)
{	
	var hayComa;

	hayComa = strFrase.search("'");	
	while (hayComa > -1)
	{
		strFrase = strFrase.replace("'", "/^/");
		hayComa = strFrase.search("'");
	}	
	return strFrase;
}

/*********************************************************
** Arma una cadena reemplazando cada "|@|" por una comilla **
*********************************************************/
function poneComilla(strFrase)
{
	var hayCaracter;
		
	hayCaracter = strFrase.indexOf("/^/", 0);
	while (hayCaracter > -1)
	{
		strFrase = strFrase.replace("/^/", "'");
		hayCaracter = strFrase.indexOf("/^/", 0);
	}
	return strFrase;	
}


/*****************************************************
** Arma una cadena reemplazando cada comilla con "|@|" **
*****************************************************/
function sacaComillaDoble(strFrase)
{	
	var hayComa;

	hayComa = strFrase.search('"');	
	while (hayComa > -1)
	{
		strFrase = strFrase.replace('"', '!^!');
		hayComa = strFrase.search('"');
	}	
	return strFrase;
}

/*********************************************************
** Arma una cadena reemplazando cada "|@|" por una comilla **
*********************************************************/
function poneComillaDoble(strFrase)
{
	var hayCaracter;
		
	hayCaracter = strFrase.indexOf('!^!', 0);
	while (hayCaracter > -1)
	{
		strFrase = strFrase.replace('!^!', '"');
		hayCaracter = strFrase.indexOf('!^!', 0);
	}
	return strFrase;	
}

/*****************************************************
** Arma una cadena reemplazando cada Enter con "|$|" **
*****************************************************/
function sacaEnter(strFrase)
{	
	//alert(strFrase);
	var hayComa;
	
	hayComa = strFrase.search( String.fromCharCode(13)+String.fromCharCode(10));	
	while (hayComa > 0)
	{
		strFrase = strFrase.replace(String.fromCharCode(13)+String.fromCharCode(10) , '|$|');
		hayComa = strFrase.search( String.fromCharCode(13)+String.fromCharCode(10));
	}
	return strFrase;
}


/*********************************************************
** Arma una cadena reemplazando cada "|$|" por un Enter **
*********************************************************/
function poneEnter(strFrase)
{
	var hayCaracter;
		
	hayCaracter = strFrase.indexOf('|$|', 0);
	while (hayCaracter > 0)
	{
		strFrase = strFrase.replace('|$|', String.fromCharCode(13)+String.fromCharCode(10) );
		hayCaracter = strFrase.indexOf('|$|', 0);
	}
	return strFrase;	
}


/*********************************************************
** Arma una cadena reemplazando cada "|$|" por un <BR> **
*********************************************************/
function poneEnterBR(strFrase)
{
	var hayCaracter;
	hayCaracter = strFrase.indexOf('|$|', 0);
	while (hayCaracter > 0)
	{
		strFrase = strFrase.replace('|$|', '<br>');
		hayCaracter = strFrase.indexOf('|$|', 0);
	}
	return strFrase;	
}



/**********************************/
// Otro Portal					  //
/**********************************/
function TraePortal(portal,vendis){
	if (vendis=='True'){
		var ancho = 500;
		var alto = 400;
		var x = (screen.width - ancho) / 2;
		var y = (screen.height - alto) / 2;
		window.open("VistaPrevia.asp?Parametros=&Portal="+portal, "portal", "width=" + ancho + ",height=" + alto + ",top=" + "20" + ",left=" + x + ",toolbar=0,location=0,directories=0,status=0,menubar=0,scrollbars=1,resizable=1");
	}else{
		document.location.href = "VistaPrevia.asp?Parametros=&Portal="+portal;
	}
}

/**********************************/
// URL      					  //
/**********************************/
function TraeURL(origen,vendis,por,id){
	if (vendis=='True' || vendis=='Verdadero' || vendis=='1'){
		var ancho = 500;
		var alto = 400;
		var x = (screen.width - ancho) / 2;
		var y = (screen.height - alto) / 2;
		//window.open("http://"+origen, "URL", "width=" + ancho + ",height=" + alto + ",top=" + "20" + ",left=" + x + ",toolbar=0,location=0,directories=0,status=0,menubar=0,scrollbars=1,resizable=1");
		window.open(origen, "URL", "width=" + ancho + ",height=" + alto + ",top=" + "20" + ",left=" + x + ",toolbar=0,location=0,directories=0,status=0,menubar=0,scrollbars=1,resizable=1");
	}else{
		document.location.href = "VistaPrevia.asp?por="+por+"&MView=1&TipoOrigen=2&Origen="+origen+"&Parametros=&Portal="+por;
	}	
}


/**********************************/
// Banner      				
/**********************************/
function TraeBanner(origen,vendis,por,id,tipo){
	if (vendis=='True' || vendis=='Verdadero' || vendis=='1'){
		var ancho = 200;
		var alto = 200;
		var x = (screen.width - ancho) / 2;
		var y = (screen.height - alto) / 2;
		window.open("VistaPreviaBanner.asp?origen="+origen+"&tipo="+tipo+"&por="+por+"&despliega="+vendis, "URL", "width=" + ancho + ",height=" + alto + ",top=" + "20" + ",left=" + x + ",toolbar=0,location=0,directories=0,status=0,menubar=0,scrollbars=1,resizable=0");
	}else{
		document.location.href = "VistaPrevia.asp?por="+por+"&MView=7&TipoOrigen=5&Origen="+origen+"&Parametros=&Portal="+por+"&Tipo="+tipo;
	}
}

function TraePrograma(origen,vendis,por,id,pgm,bm,bu,bid){
	if (bm == '0' && bu == '0' && bid == '0'){
		if (vendis=='True' || vendis=='Verdadero' || vendis=='1'){
		var ancho = 500;
		var alto = 400;
		var x = (screen.width - ancho) / 2;
		var y = (screen.height - alto) / 2;
		//window.open("http://"+origen, "URL", "width=" + ancho + ",height=" + alto + ",top=" + "20" + ",left=" + x + ",toolbar=0,location=0,directories=0,status=0,menubar=0,scrollbars=1,resizable=1");
		window.open(origen, "URL", "width=" + ancho + ",height=" + alto + ",top=" + "20" + ",left=" + x + ",toolbar=0,location=0,directories=0,status=0,menubar=0,scrollbars=1,resizable=1");
	}else{
		document.location.href = "VistaPrevia.asp?por="+por+"&MView=1&TipoOrigen=2&Origen="+origen+"&Parametros=&Portal="+por;
	}	
		
	}else{ 
	
	if (vendis=='True' || vendis=='Verdadero' || vendis=='1'){
		var ancho = 500;
		var alto = 400;
		var x = (screen.width - ancho) / 2;
		var y = (screen.height - alto) / 2;
		window.open("../VistasProgramasV2_1/VistaPrevia.asp?Parametros=&Portal="+por+"&Opt1="+pgm+"&Origen="+origen+"&Opt9="+bm+bu+bid, "URL", "width=" + ancho + ",height=" + alto + ",top=" + "20" + ",left=" + x + ",toolbar=0,location=0,directories=0,status=0,menubar=0,scrollbars=1,resizable=1");
	}else{
		document.location.href = "../VistasProgramasV2_1/VistaPrevia.asp?Parametros=&Portal="+por+"&Opt1="+pgm+"&Origen="+origen+"&Opt9="+bm+bu+bid;
	}	
	
	}
}

function TraeColaboracion(Tipo,origen,vendis,por,id){
	if (vendis=='True' || vendis=='Verdadero' || vendis=='1'){
		var ancho = 500;
		var alto = 400;
		var x = (screen.width - ancho) / 2;
		var y = (screen.height - alto) / 2;
		window.open("VistaPreviaColaboracion.asp?Portal="+origen+"&por="+por+"&despliega="+vendis+"&TipoColaboracionM="+Tipo, "portal", "width=" + ancho + ",height=" + alto + ",top=" + "20" + ",left=" + x + ",toolbar=0,location=0,directories=0,status=0,menubar=0,scrollbars=1,resizable=1");
	}else{		
		document.location.replace ("VistaPrevia.asp?por="+por+"&MView=1&TipoOrigen=3&Origen="+origen+"&Parametros=&Portal="+por+"&despliega="+vendis);
	}
}

function TraeTrama(origen,vendis,por,id){
	if (vendis=='True' || vendis=='Verdadero' || vendis=='1'){
		var ancho = 500;
		var alto = 400;
		var x = (screen.width - ancho) / 2;
		var y = (screen.height - alto) / 2;
		window.open("VistaPrevia.asp?IdTrama="+id+"&Trama=5&Portal="+por+"&ColInicio="+origen, "ViewTrama", "width=" + ancho + ",height=" + alto + ",top=" + "20" + ",left=" + x + ",toolbar=0,location=0,directories=0,status=0,menubar=0,scrollbars=1,resizable=1");
	}else{
		document.location.href = "VistaPrevia.asp?IdTrama="+id+"&Trama=5&Portal="+por+"&ColInicio="+origen;
	}
}

//////////////////////////////////////////////////////
function TraePortalMenu(Origen,Portal,Id,Id2){
	document.location.href = "VistaPrevia.asp?Parametros=&Portal="+Origen;
}
function TraeURLMenu(Origen,Portal,Id,Id2){
	document.location.href = "VistaPrevia.asp?MenuActivo="+Id+"&MenuActivo2="+Id2+"&por="+Portal+"&MView=1&TipoOrigen=2&Origen="+Origen+"&Parametros=&Portal="+Portal;
}
function TraeColaboracionMenu(Origen,Portal,Id,Id2){
	document.location.href = "VistaPrevia.asp?MenuActivo="+Id+"&MenuActivo2="+Id2+"&por="+Portal+"&MView=1&TipoOrigen=3&Origen="+Origen+"&Parametros=&Portal="+Portal;
}
//function TraeBannerMenu(Origen,Portal,Id,Id2){
//	document.location.href = "VistaPrevia.asp?Parametros=&Portal="+Origen;
//}
function TraeTramaMenu(Origen,Portal,Id,Id2,IdT){
	document.location.href = "VistaPrevia.asp?MenuActivo="+Id+"&MenuActivo2="+Id2+"&IdTrama="+IdT+"&Trama=5&Portal="+Portal+"&ColInicio="+Origen;
}



function TraePortalMenuH(Origen,Portal,Id,Id2,d1,d2){
	document.location.href = "VistaPrevia.asp?Parametros=&Portal="+Origen+"&d1="+d1+"&d2="+d2;
}
function TraeURLMenuH(Origen,Portal,Id,Id2,d1,d2){
	document.location.href = "VistaPrevia.asp?MenuActivo="+Id+"&MenuActivo2="+Id2+"&por="+Portal+"&MView=1&TipoOrigen=2&Origen="+Origen+"&Parametros=&Portal="+Portal+"&d1="+d1+"&d2="+d2;
}
function TraeColaboracionMenuH(Origen,Portal,Id,Id2,d1,d2){
	document.location.href = "VistaPrevia.asp?MenuActivo="+Id+"&MenuActivo2="+Id2+"&por="+Portal+"&MView=1&TipoOrigen=3&Origen="+Origen+"&Parametros=&Portal="+Portal+"&d1="+d1+"&d2="+d2;
}
//function TraeBannerMenuH(Origen,Portal,Id,Id2,d1,d2){
//	document.location.href = "VistaPrevia.asp?Parametros=&Portal="+Origen+"&d1="+d1+"&d2="+d2;
//}
function TraeTramaMenuH(Origen,Portal,Id,Id2,IdT,d1,d2){
	document.location.href = "VistaPrevia.asp?MenuActivo="+Id+"&MenuActivo2="+Id2+"&IdTrama="+IdT+"&Trama=5&Portal="+Portal+"&ColInicio="+Origen+"&d1="+d1+"&d2="+d2;
}



function Consiss(){
	window.open("www.consiss.com","ventana");
}

function traeBusqueda(portal){
	txt=document.frmBusqueda.txtBusca.value;
	if(txt==''){
		alert("Indique el texto a buscar");
	}else{
		document.location.href = "VistaPrevia.asp?Portal="+portal+"&MView=9&txtBusca="+txt;
	}
}

