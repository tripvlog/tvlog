<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
<meta charset="utf-8">
<title>Bootply snippet - Bootstrap Blue Template Fixed Sidebar +
	Header</title>
<meta name="generator" content="Bootply" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1">
<meta name="description"
	content="Bootstrap Uses a fixed left sidebar, that attaches after scrolling past a large top header. example snippet for Bootstrap." />
<link
	href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.1/css/bootstrap.min.css"
	rel="stylesheet">

<!--[if lt IE 9]>
          <script src="//html5shim.googlecode.com/svn/trunk/html5.js"></script>
        <![endif]-->
<link rel="apple-touch-icon" href="/bootstrap/img/apple-touch-icon.png">
<link rel="apple-touch-icon" sizes="72x72"
	href="/bootstrap/img/apple-touch-icon-72x72.png">
<link rel="apple-touch-icon" sizes="114x114"
	href="/bootstrap/img/apple-touch-icon-114x114.png">










<!-- CSS code from Bootply.com editor -->

<style type="text/css">
body {
	padding-top: 50px;
}

#masthead {
	min-height: 270px;
	background-color: #000044;
	color: #aaaacc;
}

#masthead h1 {
	font-size: 55px;
	line-height: 1;
}

#masthead .well {
	margin-top: 13%;
	background-color: #111155;
	border-color: #000033;
}

.icon-bar {
	background-color: #fff;
}

@media screen and (min-width: 768px) {
	#masthead h1 {
		font-size: 100px;
	}
}

.navbar-bright {
	background-color: #111155;
	color: #fff;
}

.navbar-bright a, #masthead a, #masthead .lead {
	color: #aaaacc;
}

.navbar-bright li>a:hover {
	background-color: #000033;
}

.affix-top, .affix {
	position: static;
}

@media ( min-width : 979px) {
	#sidebar.affix-top {
		position: static;
		margin-top: 30px;
		width: 228px;
	}
	#sidebar.affix {
		position: fixed;
		top: 70px;
		width: 228px;
	}
}

#sidebar li.active {
	border: 0 #eee solid;
	border-right-width: 4px;
}

#mainCol h2 {
	padding-top: 55px;
	margin-top: -55px;
}
</style>
</head>

<!-- HTML code from Bootply.com editor -->

<body>


	<header class="navbar navbar-bright navbar-fixed-top" role="banner">
		<div class="container">
			<div class="navbar-header">
				<button class="navbar-toggle" type="button" data-toggle="collapse"
					data-target=".navbar-collapse">
					<span class="sr-only">Toggle navigation</span> <span
						class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a href="/" class="navbar-brand">Bootply</a>
			</div>
			<nav class="collapse navbar-collapse" role="navigation">
				<ul class="nav navbar-nav">
					<li><a href="#">Get Started</a></li>
					<li><a href="#">Edit</a></li>
					<li><a href="#">Visualize</a></li>
					<li><a href="#">Prototype</a></li>
				</ul>
			</nav>
		</div>
	</header>

	<!-- 여행 일정 제목 들어갈 곳 -->
	<div id="masthead">
		<div class="container">
			<div class="row">
				<div class="col-md-7">
					<h1>
						Bootply
						<p class="lead">The easiest way to apply Bootstrap</p>
					</h1>
				</div>
				<div class="col-md-5">
					<div class="well well-lg">
						<div class="row">
							<div class="col-sm-6">
								<img src="//placehold.it/180x100" class="img-responsive">
							</div>
							<div class="col-sm-6">
								<strong>Important</strong>
								<p>Blah blah blah blah bla!</p>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- /cont -->
	</div>

	<!-- Begin Body -->
	<div class="container">
		<div class="row">
			<div class="col-md-3" id="leftCol">

				<ul class="nav nav-stacked" id="sidebar">
					<li><a href="#sec0">Section 0</a></li>
					<li><a href="#sec1">Section 1</a></li>
					<li><a href="#sec2">Section 2</a></li>
					<li><a href="#sec3">Section 3</a></li>
					<li><a href="#sec4">Section 4</a></li>
				</ul>

			</div>
			<div class="col-md-9" id="mainCol">

				<br>

				<h2 id="sec0">Content</h2>
				At Bootply we like to build simple Bootstrap templates that utilize
				the code Bootstap CSS without a lot of customization. Sure you can
				find a lot of Bootstrap themes and inspiration, but these templates
				tend to be heavy on customization.



				<hr class="col-md-12">
				Rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi
				architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam
				voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia
				cor magni dolores eos qui ratione voluptatem sequi nesciunt. Neque
				porro quisquam est, qui dolorem ipsum quia dolor sit amet,
				consectetur, adipisci velit, sed quia non numquam eius modi tempora
				incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut
				enim ad minima veniam, quis nostrum exercitationem ullam corporis
				suscipit laboriosam, nisi ut. Rem aperiam, eaque ipsa quae ab illo
				inventore veritatis et quasi architecto beatae vitae dicta sunt
				explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur
				aut odit aut fugit, sed quia cor magni dolores eos qui ratione
				voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem
				ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non
				numquam eius modi tempora incidunt ut labore et dolore magnam
				aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum
				exercitationem ullam corporis suscipit laboriosam, nisi ut!



				<h2 id="sec1">Content</h2>
				<p>Rem aperiam, eaque ipsa quae ab illo inventore veritatis et
					quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam
					voluptatem quia voluptas sit aspernatur aut odit aut.</p>
				<div class="row">
					<div class="col-md-6">
						<div class="panel panel-default">
							<div class="panel-heading">
								<h3>Hello.</h3>
							</div>
							<div class="panel-body">Lorem ipsum dolor sit amet,
								consectetur adipiscing elit. Duis pharetra varius quam sit amet
								vulputate. Quisque mauris augue, molestie tincidunt condimentum
								vitae, gravida a libero. Aenean sit amet felis dolor, in
								sagittis nisi. Sed ac orci quis tortor imperdiet venenatis. Duis
								elementum auctor accumsan. Aliquam in felis sit amet augue.</div>
						</div>
					</div>
					<div class="col-md-6">
						<div class="panel panel-default">
							<div class="panel-heading">
								<h3>Hello.</h3>
							</div>
							<div class="panel-body">Lorem ipsum dolor sit amet,
								consectetur adipiscing elit. Duis pharetra varius quam sit amet
								vulputate. Quisque mauris augue, molestie tincidunt condimentum
								vitae, gravida a libero. Aenean sit amet felis dolor, in
								sagittis nisi. Sed ac orci quis tortor imperdiet venenatis. Duis
								elementum auctor accumsan. Aliquam in felis sit amet augue.</div>
						</div>
					</div>
				</div>

				<hr>

				<h2 id="sec2">Section 2</h2>
				<p>Rem aperiam, eaque ipsa quae ab illo inventore veritatis et
					quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam
					voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed
					quia cor magni dolores eos qui ratione voluptatem sequi nesciunt.
					Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet,
					consectetur, adipisci velit, sed quia non numquam eius modi tempora
					incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut
					enim ad minima veniam, quis nostrum exercitationem ullam corporis
					suscipit laboriosam, nisi ut!</p>
				<div class="row">
					<div class="col-md-4">
						<img src="//placehold.it/300x300" class="img-responsive">
					</div>
					<div class="col-md-4">
						<img src="//placehold.it/300x300" class="img-responsive">
					</div>
					<div class="col-md-4">
						<img src="//placehold.it/300x300" class="img-responsive">
					</div>
				</div>

				<hr>

				<h2 id="sec3">Section 3</h2>
				Images are responsive sed @mdo but sum are more fun peratis unde
				omnis iste natus error sit voluptatem accusantium doloremque
				laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore
				veritatis et quasi architecto beatae vitae dicta sunt explicabo.
				Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut
				fugit, sed quia cor magni dolores eos qui ratione voluptatem sequi
				nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit
				amet, consectetur, adipisci velit, sed quia non numquam eius modi
				tempora incidunt ut labore et dolore magnam aliquam quaerat
				voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem
				ullam corporis suscipit laboriosam, nisi ut

				<h2 id="sec4">Section 4</h2>
				Sed ut perspiciatis unde omnis iste natus error sit voluptatem
				accusantium doloremque laudantium, totam rem aperiam, eaque ipsa
				quae ab illo inventore veritatis et quasi architecto beatae vitae
				dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit
				aspernatur aut odit aut fugit, sed quia cor magni dolores eos qui
				ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui
				dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed
				quia non numquam eius modi tempora incidunt ut labore et dolore
				magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis
				nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut


				<hr>
				<h4>
					<a href="http://bootply.com/75781">Edit on Bootply</a>
				</h4>
				<hr>


			</div>
		</div>
	</div>




	<script type='text/javascript'
		src="//ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>


	<script type='text/javascript'
		src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.1/js/bootstrap.min.js"></script>







	<!-- JavaScript jQuery code from Bootply.com editor  -->

	<script type='text/javascript'>
        
        $(document).ready(function() {
        
            $('#sidebar').affix({
      offset: {
        top: 245
      }
});

var $body   = $(document.body);
var navHeight = $('.navbar').outerHeight(true) + 10;

$body.scrollspy({
	target: '#leftCol',
	offset: navHeight
});
        
        });
        
        </script>

	<script>
          (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
          (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
          m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
          })(window,document,'script','//www.google-analytics.com/analytics.js','ga');
          ga('create', 'UA-40413119-1', 'bootply.com');
          ga('send', 'pageview');
        </script>


</body>
</html>