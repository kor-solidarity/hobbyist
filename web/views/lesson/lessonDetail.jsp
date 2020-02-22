<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link
	href="https://fonts.googleapis.com/css?family=Do+Hyeon|ZCOOL+QingKe+HuangYou&display=swap"
	rel="stylesheet">
<style>
	#wrapTable {
		border: 1px solid black;
		margin: 20px auto 0px auto;
		font-family: 'Do Hyeon', sans-serif;
		font-size: 22px;
	}
	
	#wrapTable td {
		border: 1px solid black;
	}
	 
	#carouselTd {
		/* width: 612px; */
		
	}
	
	.container {
		width: 700px;
		height: 460px;
		/* carousel-indicators가 td 바깥으로 벗어나 안쪽으로 집어넣기 위해 margin-top설정  */
		/* argin-top: 20px; */
		/* padding: 0px; */
	}
	
	.slide {
		width: 608px;
	}

	.carousel-inner {
		width: 608px;
	}

/* carousel 관련 CSS */
	.carousel-inner > .item > img,
	.carousel-inner > .item > a > img {
    	/* width: 70%; */
    	width: 608px;
		height: 400px;
    	margin: auto;
	}
	
	.active {
		width: 608px;
	}
	
	.left {
		/* margin-left: 136px; */
		z-index: 15;
	}
	
	.right {
		/* margin-right: 136px; */
		z-index: 15;
	}
	
	.stNum {
		background-color: #DAB554;
		border-radius: 90px;
		padding: 10px;
		color: white;
	}
</style>
</head>
<body>
<%@ include file="../common/categorybar.jsp" %>


<table id="wrapTable">
	<tr style="height:15%;">
		<td id="carouselTd" colspan="2" rowspan="4">
			<!-- carousel 영역 -->
			<div class="container">
			  <br>
			  <div id="myCarousel" class="carousel slide" data-ride="carousel">
			    <!-- Indicators -->
			    <ol class="carousel-indicators">
			      <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
			      <li data-target="#myCarousel" data-slide-to="1"></li>
			      <li data-target="#myCarousel" data-slide-to="2"></li>
			      <li data-target="#myCarousel" data-slide-to="3"></li>
			    </ol>
			
			    <!-- Wrapper for slides -->
			    <div class="carousel-inner" role="listbox">
			
			      <div class="item active">
			        <img src="<%=request.getContextPath() %>/static/images/beauty02.jpg" alt="Chania" width="460" height="345">
			        <!-- <div class="carousel-caption">
			          <h3>Chania</h3>
			          <p>The atmosphere in Chania has a touch of Florence and Venice.</p>
			        </div> -->
			      </div>
			
			      <div class="item">
			        <img src="<%=request.getContextPath() %>/static/images/beauty03.PNG" alt="Chania" width="460" height="345">
			      </div>
			    
			      <div class="item">
			        <img src="<%=request.getContextPath() %>/static/images/beauty04.PNG" alt="Flower" width="460" height="345">
			      </div>
			
			      <div class="item">
			        <img src="<%=request.getContextPath() %>/static/images/beauty05.PNG" alt="Flower" width="460" height="345">
			      </div>
			  
			    </div>
			
			    <!-- Left and right controls -->
			    <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
			      <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
			      <span class="sr-only">Previous</span>
			    </a>
			    <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
			      <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
			      <span class="sr-only">Next</span>
			    </a>
			  </div>
			</div>
			<!-- carousle 영영 끝 -->
		</td>
		<td style="width:200px;"><span class="stNum">최소 2명</span></td>
		<td style="width:200px;"><span class="stNum">최대 2명</span></td>
	</tr>
	<tr style="height:45%;">
		<td colspan="2">
			<div>강남 | 1회차 | 02.03(월)</div>
			<div>강남 | 1회차 | 02.10(월)</div>
			<div>강남 | 1회차 | 02.17(월)</div>			
		</td>
	</tr>
	<tr style="height:20%;">
		<td colspan="2">+ 추가 일정 보기</td>
	</tr>
	<tr style="height:20%;">
		<td colspan="2">원하시는 수업일정을 선택해주세요</td>
	</tr>
</table>

</body>
</html>