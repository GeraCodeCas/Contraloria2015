function ArchivoAdjunto(pLink){
	window.open(pLink);
}
	function imprimir(iIdFuncionario, sAnexoImprimir){
		var ancho = 800;
		var alto = 500;
		var x = (screen.width - ancho) / 2;
		var y = (screen.height - alto)- 150 / 2;		
		var strUrl  = sAnexoImprimir + "?iIdFuncionario=" + iIdFuncionario;
		window.open(strUrl, "Imprimir", "width=" + ancho + ",height=" + alto + ",top=" + y + ",left=" + x + ",toolbar=0,location=0,directories=0,status=0,menubar=0,scrollbars=1,resizable=0");
	}

	function imprimirUnidad(iIdUnidad, sAnexoImprimir, sUnidad){
		var ancho = 800;
		var alto = 500;
		var x = (screen.width - ancho) / 2;
		var y = (screen.height - alto)- 150 / 2;		
		var strUrl  = sAnexoImprimir + "?iIdUnidad=" + iIdUnidad + "&sUnidad=" + sUnidad;
		window.open(strUrl, "Imprimir", "width=" + ancho + ",height=" + alto + ",top=" + y + ",left=" + x + ",toolbar=0,location=0,directories=0,status=0,menubar=0,scrollbars=1,resizable=0");
	}
	
	function imprimirTipo(iIdFuncionario, vIdTipoOrigen, sAnexoImprimir){
		var ancho = 800;
		var alto = 500;
		var x = (screen.width - ancho) / 2;
		var y = (screen.height - alto)- 150 / 2;		
		var strUrl  = sAnexoImprimir + "?iIdFuncionario=" + iIdFuncionario + "&sIdTipoOrigen=" + vIdTipoOrigen;
		window.open(strUrl, "Imprimir", "width=" + ancho + ",height=" + alto + ",top=" + y + ",left=" + x + ",toolbar=0,location=0,directories=0,status=0,menubar=0,scrollbars=1,resizable=0");
	}

	function ayuda(sAnexoAyuda){
		var ancho = 620;
		var alto = 500;
		var x = (screen.width - ancho) / 2;
		var y = (screen.height - alto) - 150 / 2;
		window.open(sAnexoAyuda, "Ayuda", "width=" + ancho + ",height=" + alto + ",top=" + y + ",left=" + x + ",toolbar=0,location=0,directories=0,status=0,menubar=0,scrollbars=1,resizable=0");
	}
	
	var vLoadAd = 1;
	var vPopbAd = null;
	var vLoadCM = 1;
	var vPopbCM = null;
	function Adjuntar(pIdFuncionario, pIdAnexo){
		vLoadAd = 0;
		vPopbAd = popBox("Attachments", 550, 280, "pUpLoad.jsp?sIdFuncionario=" + pIdFuncionario + "&sIdAnexo=" + pIdAnexo);
	}
	
	function Carga(pIdFuncionario, pIdAnexo, sAnexoC){
		vLoadCM = 1;
		vPopbCM = popBox("Carga", 550, 280, sAnexoC + "?sIdFuncionario=" + pIdFuncionario + "&sIdAnexo=" + pIdAnexo);
	}
	
	function MouseDentro(texto){
		texto.style.background='#bebebe'
	}
	
	function MouseFuera(texto,color){
		texto.style.background=color;
	}
	
	
	document.onfocus=fReload();
	
	function fReload(){
		if(vLoadAd == 0 && vPopbAd != null ) {
			if(vPopbAd.closed) 
				document.forma.submit();
		}
		if(vLoadCM == 0 && vPopbCM != null ) {
			if(vPopbCM.closed) 
				document.forma.submit();
		}
	}
	
	function Undo() {
		if(confirm("¿Desea Deshacer la ultima carga?")){
			document.forma.sCodigo.value = 0;
			document.forma.sOpcion.value = 'UNDO';
			document.forma.submit();
		}
	}
