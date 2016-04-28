<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <html>
    	<head>
    		<meta charset="EUC-KR">
    		<title>bootstrap test</title>
    		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
    		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap-theme.min.css">
    		<script src="//code.jquery.com/jquery-1.11.0.min.js"  ></script>
    		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"  ></script>
    		<style type="text/css">
    			#navlink:hover{
    				color : #6B9900;
    				font-weight : bold;
    				font-size : 120%;
    			}
    			#date{
					width : 200px;
				}		
				#modalSize{
					width : 450px;
				}
			
    		</style>
    	</head>
    	<body> 
    	<nav class="navbar navbar-default" role="navigation">
    		<div class="container-fluid">
    			<div class="navbar-header">
    				<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target=".navbar-collapse">
    					<span class="icon-bar"></span>
    					<span class="icon-bar"></span>
    					<span class="icon-bar"></span>
    				</button>
    				<a class="navbar-brand" href="#">Trip Blog</a>
    			</div>
    			<div class="collapse navbar-collapse">
    				<ul class="nav navbar-nav">
    					<li class="#about"><a href="#" id="navlink">�������� ã��</a></li>
    					<li class="#about"><a href="#" id="navlink">��� ã��</a></li>
    					<li class="#about"><a href="#" id="navlink">Ŀ�´�Ƽ</a></li>
    					<li class="#about"><a href="#" id="navlink"  data-toggle="modal" data-target="#exampleModal" data-whatever="@mdo">���� �����</a></li>
    				</ul>
    			</div>
    		</div>
    	</nav>	
    	<!-- -----------��������� --- ���  -->
    	<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    		<div class="modal-dialog" >
    		<div class="modal-content" id="modalSize">
      		<div class="modal-header" >
		    	<form action="" method="post">
				<div class="panel panel-success" >
					<div class="panel-heading">
						<h3>�� ���� �����</h2>
					</div>
					<div class="panel-body" >
						<h4>���� ����</h4>
						<input type="text" name="subject" class="form-control"  placeholder="�� : 5�� 6�� ���� ��ҿ���" />
					</div>
					<div class="panel-body">
						<h4>���� �ܰ�</h4>
						<input type="radio" name="step" />���� ��
						<input type="radio" name="step" />���� ��
					</div>
					<div class="panel-body" id="date">
						<h4>���� ���۳�¥</h4>
						<input type="date" name="date" class="form-control hasDatepicker"  size="10" />
					</div>
					<div class="panel-body">
						<h4>���� �׸�</h4>
						<input type="checkbox" value="theme" /> ��Ȧ�ο���
						<input type="checkbox" value="theme" /> ģ���� �Բ� 
						<input type="checkbox" value="theme" /> ������ �Բ�
						<input type="checkbox" value="theme" /> ��ü����
						<input type="checkbox" value="theme" /> ��Ű�� ���� 
						<input type="checkbox" value="theme" /> Ŀ�� 
					</div>
					<div class="panel-body">
						<input type="submit" value="�� ���� �����"  class="btn btn-success" />
						<input type="button" value="���" class="btn btn-warning"  />
					</div>
				</div>
				</form>
			</div>
			</div>
			</div>
		</div>
    	</body>
    </html>
    
    
    
    
    
    
    
    
    
    