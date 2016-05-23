<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <html>
    	<head>
    		<meta charset="UTF-8">
    		<title>bootstrap test</title>
    	</head>
    	<body> 
    	<div class="header">
    <div class="main-nav-con">
      <h1><a class="logo" href="/"><img src="https://d254i4serkgq8u.cloudfront.net/images/h1_logo_wishbeen.png"></a></h1>
      <div class="gnb">
        <ul>
          <li>
            <a class="" href="/plans" onclick="WebTrackingSendEvent('header', 'planSearch');">여행일정 찾기</a>
          </li>
          <li>
            <a href="/travelspots#!/spots" class="spot-curation-btn" onclick="WebTrackingSendEvent('header', 'spotSearch');">명소 찾기</a>
          </li>
          <li>
            <a class="" href="/community" onclick="WebTrackingSendEvent('header', 'community');">커뮤니티</a>
          </li>
          <li>
            <a class="btn-new-plan">일정 만들기</a>
          </li>
        </ul>
      </div> <!-- gnb -->

      <div class="nav-login-search">
        <div class="nav-htl-flight">
          <a target="_blank" href="/redirect/HOTELS_COMBINE?productId=HOTELS_COMBINE" class="find_hotels" onclick="WebTrackingSendEvent('header','hotelSearch');">최저가 호텔</a><!-- 호텔예약 -->
          <a target="_blank" href="/redirect/SKY_SCANNER?productId=SKY_SCANNER" class="book_flights" onclick="WebTrackingSendEvent('header', 'flightSearch');">항공권 조회</a><!--항공권 예약-->
        </div>
        <div class="login-and-profile">
          
          <div>
            <a id="nav-fb-login" class="fb"></a>
            <a id="nav-ggl-login" class="ggl"></a>
            <a id="nav-login-btn" class="nav-btn-login">로그인</a>
          </div>
          
          
        </div><!-- login-and-profile -->
      </div>
    </div>
  </div>
		
    	</body>
    </html>