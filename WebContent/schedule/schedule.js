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

function startDay(dayCount){
	alert(dayCount);
	co = parseInt(dayCount);
	var i = 0;
	while(i < co){
	    add_col();
	    i++;
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
    var td_length = stock_tbody_tr[0].getElementsByTagName('td').length;

	for (i=0; i<stock_tbody_tr.length; i++) {
	    stock_td = document.createElement('td');
	    var idvalue="";
	    if(i % 2 == 0){
	    	idvalue=td_length+"_"+(Math.floor(i/2))+"_30";
	    	stock_td.innerHTML="<i class='fa fa-plus-circle' aria-hidden='true' style='visibility:hidden;' id='plus"+idvalue+"' data-toggle='modal' data-target='#detail-create'>";
	    	stock_td.setAttribute("id", td_length+"_"+(Math.floor(i/2))+"_30");
	    }else{
	    	idvalue = td_length+"_"+(Math.floor(i/2)+1);
	    	stock_td.innerHTML="<i class='fa fa-plus-circle' aria-hidden='true' style='visibility:hidden;' id='plus"+idvalue+"' data-toggle='modal' data-target='#detail-create'>";
	    	stock_td.setAttribute("id", td_length+"_"+(Math.floor(i/2)+1));
	    }
	    stock_tbody_tr[i].appendChild(stock_td);
	    
	    stock_td.addEventListener('mouseover', function(event){
	    	a= this.getAttribute("id");
	    	icon = document.getElementById("plus"+a);
	    	icon.style.visibility = "visible";
	    });
	    stock_td.addEventListener('mouseout', function(event){
	    	a= this.getAttribute("id");
	    	icon = document.getElementById("plus"+a);
	    	icon.style.visibility = "hidden";
	    });
	}
	return true ;
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
function aa(j,idNum){
	icon = document.getElementById("plus"+j+""+idNum);
	icon.style.visibility = "visible";
}
function bb(j,idNum){
	
	icon = document.getElementById("plus"+j+""+idNum);
	icon.style.visibility = "hidden";
}

var tdObj;
function mymemo(event,td){
	my = document.getElementById("my");
	tdObj = td;
	my.style.display="block";
	my.style.top=(parseInt(event.clientY)+500)+"px";
	my.style.left=(parseInt(event.clientX)-380)+"px";
}

function scheduleSave() {
	alert("저장");
	document.scheduleUpdate.submit();
}


function btnicon1(transport){
	var tdicon = document.getElementById('btnicon');
	tdicon.innerHTML="<i class='fa fa-plane' aria-hidden='true'></i><br/>비행기 <input type='hidden' id='selectTransport' name='selectTransport' value='"+transport+"' />";
}
function btnicon2(transport){
	var tdicon = document.getElementById('btnicon');
	tdicon.innerHTML="<i class='fa fa-train' aria-hidden='true'></i><br/>기  차<input type='hidden' id='selectTransport' name='selectTransport' value='"+transport+"' />";
}
function btnicon3(transport){
	var tdicon = document.getElementById('btnicon');
	tdicon.innerHTML="<i class='fa fa-subway' aria-hidden='true'></i><br/>지하철<input type='hidden' id='selectTransport' name='selectTransport' value='"+transport+"' />";
}
function btnicon4(transport){
	var tdicon = document.getElementById('btnicon');
	tdicon.innerHTML="<i class='fa fa-bus' aria-hidden='true'></i><br/>버  스<input type='hidden' id='selectTransport' name='sd_transport' value='"+transport+"' />";
}
function btnicon5(transport){
	var tdicon = document.getElementById('btnicon');
	tdicon.innerHTML="<i class='fa fa-road' aria-hidden='true'></i><br/>도  보<input type='hidden' id='selectTransport' name='sd_transport' value='"+transport+"' />";
}
function btnicon6(transport){
	var tdicon = document.getElementById('btnicon');
	tdicon.innerHTML="<i class='fa fa-taxi' aria-hidden='true'></i><br/>택  시<input type='hidden' id='selectTransport' name='sd_transport' value='"+transport+"' />";
}
function btnicon7(transport){
	var tdicon = document.getElementById('btnicon');
	tdicon.innerHTML="<i class='fa fa-ship' aria-hidden='true'></i><br/> 배 <input type='hidden' id='selectTransport' name='sd_transport' value='"+transport+"' />";
}
function btnicon8(transport){
	var tdicon = document.getElementById('btnicon');
	tdicon.innerHTML="<i class='fa fa-car' aria-hidden='true'></i><br/>자가용<input type='hidden' id='selectTransport' name='sd_transport' value='"+transport+"' />";
}
function btnicon9(transport){
	var tdicon = document.getElementById('btnicon');
	tdicon.innerHTML="<i class='fa fa-bicycle' aria-hidden='true'></i><br/>기  타<input type='hidden' id='selectTransport' name='sd_transport' value='"+transport+"' />";
}
