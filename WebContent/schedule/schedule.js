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
	    	mymemo(event);
	    });
	}
}

function del_col() {
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
function mymemo(event){
	my = document.getElementById("my");
	my.style.display="block";
	my.style.top=(parseInt(event.clientY)+500)+"px";
	my.style.left=(parseInt(event.clientX)-380)+"px";
}
function scheduleSave() {
	//저장하기 버튼 누르면 보여줄 화면
}