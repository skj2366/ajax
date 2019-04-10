<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div align="center">
		<label for="ad_dong">읍면동 : </label><input type="text" name="ad_dong"
			id="ad_dong" onkeypress="enter()">
		<button onclick="search()">검색</button>
		<select id="pageCount" name="pageCount"
			onchange="changePageCount(this)">
			<option value="10">10</option>
			<option value="20">20</option>
			<option value="30">30</option>
			<option value="40">40</option>
			<option value="50">50</option>
		</select>
	</div>


	<table border="1" align="center">
		<tr>
			<th>번호</th>
			<th>시도</th>
			<th>구군</th>
			<th>동</th>
			<th>리</th>
			<th>번지</th>
			<th>호</th>
			<!-- <th>삭제</th> -->
		</tr>
		<tbody id="tBody">
		</tbody>
	</table>
	<div id="dView"></div>
	<script>
	function changePageCount(obj){
		location.href='/views/addr2/list?pageCount=' + obj.value + '&page=${param.page}';
	}
	function search(){
		var ad_dong = document.querySelector('#ad_dong').value;
		location.href="/views/addr2/list?pageCount=${param.pageCount}&ad_dong=" + ad_dong;
		document.querySelector('#ad_dong').value = ad_dong;
	}
	function enter(){
		if(event.keyCode==13){
			search();
		}
	}
	function view(adNum){
		var xhr = new XMLHttpRequest();
		xhr.open('GET','/addr2/view?ad_num=' + adNum);
		xhr.onreadystatechange = function(){
			if(xhr.readyState==4){
				if(xhr.status==200){
					document.querySelector('#dView').innerHTML = xhr.response;
				}
			}	
		}
		xhr.send();
		
	}
	
	function updateAddr(){
		var xhr = new XMLHttpRequest();
		var inputs = document.querySelectorAll('input[id]'); //모든 아이디 값을 가져온드앙
		var params = {};
		for(var i=0;i<inputs.length;i++){
			var input = inputs[i];
			//console.log(input);
			//params += input.id + '=' + input.value + '&';
			params[input.id]=input.value;
		}
		//xhr.open('POST','/addr2');
		xhr.open('POST','/addr2/update');
		xhr.setRequestHeader('Content-Type','application/json');
		xhr.onreadystatechange = function(){
			if(xhr.readyState===4 && xhr.status===200){
				var res = JSON.parse(xhr.response);
				alert(res.msg);
				if(res.update==='true'){
					/* location.href='/views/addr2/list';
					view(params.adNum); */
					getList();
					view(params.adNum);
				}else{
					//location.href='/views/addr2/list';
					getList();
					view(params.adNum);
				}
			}
		}
		xhr.send(JSON.stringify(params));
	}
	
	function deleteAddr(){
		var xhr = new XMLHttpRequest();
		var inputs = document.querySelectorAll('input[id]'); //모든 아이디 값을 가져온드앙
		var params = {};
		for(var i=0;i<inputs.length;i++){
			var input = inputs[i];
			params[input.id]=input.value;
		}
		xhr.open('POST','/addr2/delete');
		xhr.setRequestHeader('Content-Type','application/json');
		xhr.onreadystatechange = function(){
			if(xhr.readyState===4 && xhr.status===200){
				var res = JSON.parse(xhr.response);
				alert(res.msg);
				if(res.update==='true'){
					getList();
					closeTable();
					
				}else{
					getList();
					closeTable();
				}
			}
		}
		xhr.send(JSON.stringify(params));
	}
	
	function deleteAddr2(addrNum){
		var xhr = new XMLHttpRequest();
		var inputs = document.querySelectorAll('input[id]'); //모든 아이디 값을 가져온드앙
		var params = {};
		for(var i=0;i<inputs.length;i++){
			var input = inputs[i];
			params[input.id]=input.value;
		}
		xhr.open('POST','/addr2/delete');
		xhr.setRequestHeader('Content-Type','application/json');
		xhr.onreadystatechange = function(){
			if(xhr.readyState===4 && xhr.status===200){
				var res = JSON.parse(xhr.response);
				alert(res.msg);
				if(res.update==='true'){
					getList();
					closeTable();
					
				}else{
					getList();
					closeTable();
				}
			}
		}
		xhr.send(JSON.stringify(params));
	}
	
	function getList(){
		var xhr = new XMLHttpRequest();
		xhr.open('GET','/addr2/list?pageCount=${param.pageCount}&page=${param.page}&ad_dong=${param.ad_dong}');
		xhr.onreadystatechange = function(){
			if(xhr.readyState==4){
				if(xhr.status==200){
					console.log(xhr.response);
					var res = JSON.parse(xhr.response);
					document.querySelector('#pageCount').value = res.pageCount;
					var html = '';
					for(var addr of res.list){
						html += '<tr>';
						html += '<td>' + addr.ad_num + '</td>';
						html += '<td>' + addr.ad_sido + '</td>';
						html += '<td>' + addr.ad_gugun + '</td>';
						html += '<td><a href="javascript:view('+ addr.ad_num +')">' + addr.ad_dong + '</a></td>';
						html += '<td>' + (addr.ad_lee?addr.ad_lee:'') + '</td>';
						html += '<td>' + addr.ad_bunji + '</td>';
						html += '<td>' + addr.ad_ho + '</td>';
						//html += '<td><button onclick="deleteAddr2(' + addr.ad_num + ')">삭제</button>'
						html += '</tr>';
					}
					html +='<tr>';
					html += '<td colspan="7">';
					
					if(i<10){
						html += '<a href="/views/addr2/list?pageCount=' + res.pageCount + 1 + '&page='+ i +'&ad_dong='+ res.ad_dong + '">[' + i + ']</a>'; 
					}
					
					for(var i=res.fBlock;i<=res.lBlock;i++){
						if(i==res.page){
							html += '<b>[' + i + ']</b>';
						}else{
							html += '<a href="/views/addr2/list?pageCount=' + res.pageCount + '&page=' + i + '&ad_dong=' + res.ad_dong + '">[' + i + ']</a>';
						}
					}
					html += '</td>';
					html +='</tr>';				
					document.querySelector('#tBody').innerHTML = html;
					
				}
			}
		}
		xhr.send();
	}
	getList();
	function closeTable(){
		document.querySelector('#addrTable').style.display='none';
	}
</script>
</body>
</html>