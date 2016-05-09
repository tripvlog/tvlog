<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
    	<meta charset="UTF-8">
    	<title>bootstrap test</title>
    	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
    	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap-theme.min.css">
    	<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css">
    	<script src="//code.jquery.com/jquery-1.11.0.min.js"  ></script>
    	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"  ></script>
    	<style>
    		td{
    			text-align: center;
    		}
    		.add-my {
    			position:absolute;
			    width: 210px;
			}
			.add-my-box {
			    width: 200px;
			}
			#colmd{
				width: 60px;
			}
			#stock_table{
				padding: 10px;
			}
    	</style>
		<script>
		var staticNum = 1;
		function test(){
			var colCount = document.getElementById('count').value;
			if(staticNum < colCount){
				add_col();
				staticNum = colCount;
			}else{
				del_col();
				staticNum = colCount;
			}
		}
		function add_col() 
		{
			var colCount = document.getElementById('count').value;
			var stock_table = document.getElementById('stock_table');
			var stock_tbody = document.getElementById('stock_tbody');
			var stock_tr = null;
			var stock_td = null;
			var stock_x = 0;
			var stock_y = 0;
			var msg = document.getElementById('msg');
			
		    var stock_tbody_tr = stock_table.getElementsByTagName('tr');
			for (i=0; i<stock_tbody_tr.length; i++) {
			    stock_td = document.createElement('td');
			    stock_tbody_tr[i].appendChild(stock_td);
			    stock_td.addEventListener('click', function(event){
			    	infowindow(event);
			    });
			}
		}
		
		function del_col(){
			var stock_table = document.getElementById('stock_table');
		    var stock_thead_tr = stock_table.getElementsByTagName('tr');
		    var stock_thead_td = stock_table.getElementsByTagName('td');
		    if (stock_thead_td.length > 2) {
		        var stock_tbody_tr = stock_table.getElementsByTagName('tr');
		        for (i=0; i<stock_tbody_tr.length; i++) {
		            var tr_td = stock_tbody_tr[i].getElementsByTagName('td');
		            stock_tbody_tr[i].deleteCell(tr_td.length-1);
		        }
		    }
		}
		function aa(idNum){
			icon = document.getElementById("plus"+idNum);
			icon.style.visibility = "visible";
		}
		function bb(idNum){
			icon = document.getElementById("plus"+idNum);
			icon.style.visibility = "hidden";
		}
		function infowindow(event){
			my = document.getElementById("my");
			my.style.display="block";
			my.style.top=(parseInt(event.clientY)-55)+"px";
			my.style.left=(parseInt(event.clientX)-80)+"px";

		}
		</script>
    </head>
<body>
	<div class="add-my"  id="my" style="display :none">
		<div class="add-my-box" >
				<table cellpadding="20" cellspacing="20" width="200" >
					<tr>
						<td>
							<a href="naver.com">
								<i class="fa fa-bus fa-2x" aria-hidden="true"></i>
							</a>
						</td>
						<td>
							<a href="naver.com">
								<i class="fa fa-map-marker fa-2x" aria-hidden="true"></i>
							</a>
						</td>
						<td>
							<a href="naver.com">
								<i class="fa fa-home fa-2x" aria-hidden="true"></i>
							</a>
						</td>
						<td>
							<a href="naver.com">
								<i class="fa fa-file-o fa-2x" aria-hidden="true"></i>
							</a>
						</td>
					</tr>
					<tr>
						<td>교통</td>
						<td>장소</td>
						<td>숙박</td>
						<td>메모</td>
					</tr>
					<tr >
						<td colspan="4"><i class="fa fa-circle" aria-hidden="true" ></i></td>
					</tr>
				</table>
		</div>
	</div>
<div class="container">
	<form method=post action="">
	
	<input type="number" name="count" id="count" value="1" onchange="test()" min="1"  />
	
	<p></p>
	<table id='stock_table' class="table table-bordered" border=1>
		<tr><td width="100" >ALL</td><td>&nbsp;</td></tr>

		<c:forEach var="i" begin="1" end="24" step="1" varStatus="k">
			<tr><td rowspan="2">${i}시</td><td onclick="infowindow(event)" ></td></tr>
	   		<tr><td onclick="infowindow(event)"></td></tr>
		</c:forEach>
	</table>
</form>
</div>
</body>
</html>


