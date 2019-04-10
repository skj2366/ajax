/**
 * 
 */
var CommonFunc = function(){
	this.callFunc = function(){
		alert('난 중요한 공통 함수');
		callFunc2();
	}
	var callFunc2 = function(){
		alert('난 외부에서 호출 안될껄~');
	}
	
}

var AjaxUtil = function(){
	var xhr = new XMLHttpRequest();
	this.open = function(config){
		config.method = config.method?config.method:'GET'; //아무것도 적지 않았을시 default값을 'GET'으로 
		config.async = config.async?config.async:true;
		xhr.open(config.method, config.url, config.async);
		xhr.onreadystatechange = function(){
			if(xhr.readyState===xhr.DONE && xhr.status===200){
				this.callback(xhr.response);
				//console.log(xhr.response);
			}
		}
	}
	this.callback = function(res){
		console.log(res);
	}
	//xhr.callback = this.callback; //21번 라인에 this.는 xhr이라서 없는 xhr에 없는 callback을 만들어주는 작업.
	this.setCallback = function(call){
		//this.callback = call;
		xhr.callback = call;
	}
	this.send = function(){
		xhr.send();	
	}
}