<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
    	<meta charset="UTF-8">
    	<title>bootstrap test</title>
    	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
    	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap-theme.min.css">
    	<script src="//code.jquery.com/jquery-1.11.0.min.js"  ></script>
    	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"  ></script>
		<script>
	


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
		        stock_td.innerHTML='&nbsp;';
		    }
	    
	}
	function add_input(name)
	{
	    var inp = document.createElement('input');
	    inp.setAttribute('type', 'text');
	    inp.setAttribute('size', '10');
	    inp.setAttribute('name', name);
	    stock_td.appendChild(inp);
	}
</script>
    </head>
<body>
<div class="container">
	<form method=post action="">
	<input type="number" name="count" id="count" value="1" onchange="add_col()"/>
	<p></p>
	<table id='stock_table' class="table table-bordered" border=1>
	   <tr><td width="100" rowspan="2">1시</td><td>&nbsp;</td></tr>
	   <tr><td>&nbsp;</td></tr>
	   <tr><td rowspan="2">2시</td><td>&nbsp;</td></tr>
	   <tr><td>&nbsp;</td></tr>
	   <tr><td rowspan="2">3시</td><td>&nbsp;</td></tr>
	   <tr><td>&nbsp;</td></tr>
	   <tr><td rowspan="2">4시</td><td>&nbsp;</td></tr>
	   <tr><td>&nbsp;</td></tr>
	   <tr><td rowspan="2">5시</td><td>&nbsp;</td></tr>
	   <tr><td>&nbsp;</td></tr>
	   <tr><td rowspan="2">6시</td><td>&nbsp;</td></tr>
	   <tr><td>&nbsp;</td></tr>
	   <tr><td rowspan="2">7시</td><td>&nbsp;</td></tr>
	   <tr><td>&nbsp;</td></tr>
	   <tr><td rowspan="2">8시</td><td>&nbsp;</td></tr>
	   <tr><td>&nbsp;</td></tr>
	   <tr><td rowspan="2">9시</td><td>&nbsp;</td></tr>
	   <tr><td>&nbsp;</td></tr>
	   <tr><td rowspan="2">10시</td><td>&nbsp;</td></tr>
	   <tr><td>&nbsp;</td></tr>
	   <tr><td rowspan="2">11시</td><td>&nbsp;</td></tr>
	   <tr><td>&nbsp;</td></tr>
	   <tr><td rowspan="2">12시</td><td>&nbsp;</td></tr>
	   <tr><td>&nbsp;</td></tr>
	   <tr><td rowspan="2">13시</td><td>&nbsp;</td></tr>
	   <tr><td>&nbsp;</td></tr>
	   <tr><td rowspan="2">14시</td><td>&nbsp;</td></tr>
	   <tr><td>&nbsp;</td></tr>
	   <tr><td rowspan="2">15시</td><td>&nbsp;</td></tr>
	   <tr><td>&nbsp;</td></tr>
	   <tr><td rowspan="2">16시</td><td>&nbsp;</td></tr>
	   <tr><td>&nbsp;</td></tr>
	   <tr><td rowspan="2">17시</td><td>&nbsp;</td></tr>
	   <tr><td>&nbsp;</td></tr>
	   <tr><td rowspan="2">18시</td><td>&nbsp;</td></tr>
	   <tr><td>&nbsp;</td></tr>
	   <tr><td rowspan="2">19시</td><td>&nbsp;</td></tr>
	   <tr><td>&nbsp;</td></tr>
	   <tr><td rowspan="2">20시</td><td>&nbsp;</td></tr>
	   <tr><td>&nbsp;</td></tr>
	   <tr><td rowspan="2">21시</td><td>&nbsp;</td></tr>
	   <tr><td>&nbsp;</td></tr>
	   <tr><td rowspan="2">22시</td><td>&nbsp;</td></tr>
	   <tr><td>&nbsp;</td></tr>
	   <tr><td rowspan="2">23시</td><td>&nbsp;</td></tr>
	   <tr><td>&nbsp;</td></tr>
	   <tr><td rowspan="2">24시</td><td>&nbsp;</td></tr>
	   <tr><td>&nbsp;</td></tr>    
	</table>
</form>
</div>
</body>
</html>