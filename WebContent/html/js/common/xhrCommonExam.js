/*
 * 
 */

var AjaxUtilExam = function(){
	var xhr = new XMLHttpRequest();
	this.open = function(url,method,async){
		method = method?method:'GET';
		async = async?async:true;
		xhr.open(method, url, async);
		xhr.onreadystatechange = function(){
			if(xhr.readyState==4 && xhr.status==200){
				this.callback(xhr.response);
				//처음에는 밑에 있는 this.callback ...나중에는 xhr?존ㄴ러ㅏㅁ넝리뮤라;ㅑㅁㄴ유ㅣ;ㅏㅠㅁㄴㅇㄹ
			}
		}
	}
	
	this.callback = function(res){
		console.log(res);
	}
	
	this.setCallback = function(call){
		xhr.callback = call;
	}
	
	this.send = function(){
		xhr.send();
	}
	
}

/*var AjaxUtilExam = function(){
	var xhr = new XMLHttpRequest();
	this.open = function(url,method,async){
		method = method?method:'GET'; //아무것도 적지 않았을시 default값을 'GET'으로 
		async = async?async:true;
		xhr.open(method, url, async);
		xhr.onreadystatechange = function(){
			if(xhr.readyState==4 && xhr.status==200){
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
}*/