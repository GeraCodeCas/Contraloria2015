	function isAlfa(){
		if( (event.keyCode >= 48 && event.keyCode <= 57) || // De 0 - 9
			(event.keyCode >= 65 && event.keyCode <= 90) || // De A - Z
			(event.keyCode >= 97 && event.keyCode <= 122) ) // De a - z
			event.returnValue = true;
		else
			event.returnValue = false;
	}
	
	function isInValid(){
		if( (event.keyCode == 34 ) || // "
			(event.keyCode == 39 ) || // '
			(event.keyCode == 60 ) || // <
			(event.keyCode == 62 ) ) // >
			event.returnValue = false;
		else
			event.returnValue = true;
	}
	
	function validaPasteStr(Opcion){
		var str = window.clipboardData.getData("Text");
		if( (str.search('"') >= 0) || // "
			(str.search("'") >= 0) || // '
			(str.search("<") >= 0) || // <
			(str.search(">") >= 0) ) { // > 
		   	alert("Por favor, capture texto válido.");// 'claudia' < > ""d	
			event.returnValue = false;
		} 
	}
	
	function isInt(){
		if (event.keyCode < 48 || event.keyCode > 57)
			event.returnValue = false;
	}
	
	function validaPasteInt(){
		var str = window.clipboardData.getData("Text");
		hayComa = str.search(',');	
		while (hayComa >= 0){
			str = str.replace(',', '');
			hayComa = str.search(',');
		}
		hayComa = str.search(' ');
		while (hayComa >= 0){
			str = str.replace(' ', '');
			hayComa = str.search(' ');
		}
		
		if (isNaN(str) || str.search(/\.|\,/g)>=0 ){
		   	alert("Por favor, capture una cantidad válida.");
			event.returnValue = false;
		} else {
			window.clipboardData.setData("Text", str);//$9,876,543,210.00  
			event.returnValue = true;
		}		
	}
	
	function valida(Opcion){
		var str = Opcion.value;
		if (event.keyCode < 46 || event.keyCode > 57)
			event.returnValue = false;
		
		if (event.keyCode == 47)    
			event.returnValue = false;
		
		if (event.keyCode == 46 && str.indexOf(".") > -1){
			event.returnValue = false;
			Opcion.focus();
		}
	}
	
	function validaNeg(Opcion){
		var str = Opcion.value;
		if (event.keyCode < 46 || event.keyCode > 57)
			event.returnValue = false;
		
		if (event.keyCode == 47)    
			event.returnValue = false;
		
		if (event.keyCode == 46 && str.indexOf(".") > -1){
			event.returnValue = false;
			Opcion.focus();
		}
		
		if (event.keyCode == 45 && str.length==0  ){
		//if (event.keyCode == 45){
			//&& str.indexOf("-") > -1 && str.indexOf("-")==0 && str.lastIndexOf("-")==0
			event.returnValue = true;
			//Opcion.focus();
			
		}
	}
	
	function validaPasteNum(Opcion){
		var str = window.clipboardData.getData("Text");
		hayComa = str.search(',');	
		while (hayComa >= 0){
			str = str.replace(',', '');
			hayComa = str.search(',');
		}
		hayComa = str.search(' ');
		while (hayComa >= 0){
			str = str.replace(' ', '');
			hayComa = str.search(' ');
		}
		str = str.replace('$', '');
		str = str.replace('-', '');
		str = str.replace('(', '');
		str = str.replace(')', '');
		if (isNaN(str)){
		   	alert("Por favor, capture numéro válido.");
			return false;
		} else {
			window.clipboardData.setData("Text", str);//$9,876,543,210.00  
			return true;
		}
	}
	
	function validaPasteNumNeg(Opcion){
		var str = window.clipboardData.getData("Text");
		hayComa = str.search(',');	
		while (hayComa >= 0){
			str = str.replace(',', '');
			hayComa = str.search(',');
		}
		hayComa = str.search(' ');
		while (hayComa >= 0){
			str = str.replace(' ', '');
			hayComa = str.search(' ');
		}
		str = str.replace('$', '');
		str = str.replace('(', '-');
		str = str.replace(')', '');
		if (isNaN(str)){
		   	alert("Por favor, capture numéro válido.");
			return false;
		} else {
			window.clipboardData.setData("Text", str);//$9,876,543,210.00  
			return true;
		}
	}
	
	function isNum(txtcntrl,min,max) {
		str=txtcntrl.value;
		for (var i=0; i < str.length; i++) {
  			num = parseInt(str);
			if (isNaN(num)){
			   	alert("Please enter an integer.");
				return false;
  			}
			else{
				if (num < min) {
					alert("Please enter an integer greater than " + (min-1) + ".");
					return false;
				}
				if (num > max) {
					alert("Please enter an integer less than " + (max + 1) + ".");
					return false;
				}			
			}
	 	}
		return true;
	}

	function popBox(title, width, height, filename){
		width=width +25;
		height=height + 50;				
		popbox=window.open(filename,title,"screenX=100,screenY=100,toolbar=no,scrollbars=yes,directories=no,menubar=no,titlebar=no, width="+width+",height="+height);
		if(popbox !=null){
			if (popbox.opener==null){
				popbox.opener=self;
			}
		}
		return popbox;
	}

	function popBoxRize(title, width, height, filename){
		width=width +25;
		height=height + 50;				
		popbox=window.open(filename,title,"screenX=100,screenY=100,toolbar=no,resizable=yes,scrollbars=yes,directories=no,menubar=no,titlebar=no, width="+width+",height="+height);
		if(popbox !=null){
			if (popbox.opener==null){
				popbox.opener=self;
			}
		}
	}
	
	/*PARA HACER APARECER LA BARRA DE PROGRESO*/
	var progressEnd = 33;			// set to number of progress <span>'s.
	var progressColor = '#2010D8';	// set to progress bar color
	var progressInterval = 500;	// set to time between updates (milli-seconds)
	var progressAt = progressEnd;
	var progressTimer;
	
	function setProgressEnd(pProgressEnd) { 
		progressEnd = pProgressEnd;
		progressAt = progressEnd;
	} 
	
	function setProgressColor(pProgressColor) 		{ progressColor = pProgressColor; }
	
	function setProgressInterval(pProgressInterval) { progressInterval = pProgressInterval; }
		
	function progress_clear(oProgress) {
		for (var i = 1; i <= progressEnd; i++) document.getElementById(oProgress + i).style.backgroundColor = 'transparent';
		progressAt = 0;
	}
	function progress_update(oProgress) {
		progressAt++;
		if (progressAt > progressEnd) progress_clear(oProgress);
		else document.getElementById(oProgress + progressAt).style.backgroundColor = progressColor;
		progressTimer = setTimeout("progress_update('" + oProgress + "')", progressInterval);
	}
	function progress_stop(oProgress) {
		clearTimeout(progressTimer);
		progress_clear(oProgress);
	}
