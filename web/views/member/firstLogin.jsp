<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script> 
<title>Insert title here</title>
<style>

	#main {
		width: 1024px;
		height:900px;
		margin:auto;
	}
	
	#title {
		 font-size: 30px;
		 font-family: 'Do Hyeon', sans-serif;
		 color:darkolivegreen;
		 font-weight: 100;
		 padding-top: 70px;
		 padding-left:30px;
		
	}
	#content {
		font-family: 'Nanum Gothic', sans-serif;
		color:gray;
		padding-left:30px;
		margin-top:-20px;
		padding-bottom:70px;
		font-size:20px;
	}
	
	.category-list {
		margin-left:50px;
		margin-right:130px;
		display:block;
	}
	.cTitle {
		font-family: 'Do Hyeon', sans-serif;
		color:darkolivegreen;
		font-size:22px;
	}
	#pCategory {
		width:150px;
		height:33px;
		font-family: 'Nanum Gothic', sans-serif;
		font-size:16px;
	
		
	}
	#cCategory {
		width:150px;
		height:33px;
		font-family: 'Nanum Gothic', sans-serif;
		font-size:16px;
		
	}
	
	#category-list2 {
		margin-top: 150px;
	}
	
	#category-list3 {
		margin-left: 450px;
		margin-top: -348px;
	}
	
	
	#selectCategory {
		width:500px;
		height:400px;
		border:1px solid darkolivegreen;
	}
	
	
	
	
	#btn {
		width:100px;
		height:35px;
		color:white;
		background:darkolivegreen;
		border:1px solid darkolivegreen;
		font-family: 'Nanum Gothic', sans-serif;
		font-size:16px;
		float:right;
		margin-top:100px;
		margin-right:50px;
	}
	
	.myCategory-list {
		max-width:230px;
		height:33px;
		border-radius:20px;
		background:darkolivegreen;
		color:white;
		font-family: 'Nanum Gothic', sans-serif;
		font-weight:900;
		font-size:17px;
		text-align:center;
		line-height:33px;
		margin-top:20px;
		margin-left:20px;
		display: none;
	}
	
	
</style>
</head>
<body>
	<%@ include file="/views/common/menubar.jsp"  %>
	<% if(loginMember != null) { %>
	<div id="main">
	<h2 id="title">관심 카테고리 등록</h2>
	<h3 id="content">관심 카테고리(3개 이하)를 설정하면 관심수업을 추천해드립니다!</h3>
	<form action="<%=request.getContextPath() %>/category.me" method="post">
	<div class="category-list" id="category-list1">
		<p class="cTitle">카테고리</p>
		<select id="pCategory">
		<option>----선택----</option>
		<option value="1">음악</option>
		<option value="9">댄스</option>
		<option value="15">영상/사진</option>
		<option value="20">라이프스타일</option>
		<option value="25">뷰티</option>
		<option value="33">디자인</option>
		<option value="37">스포츠</option>
		</select>
	</div>

	<div class="category-list" id="category-list2">
		<p class="cTitle">상세 카테고리</p>
		<select id="cCategory">
		<option>----선택----</option>
		<script>
			$(function() {
				$("#pCategory").change(function() {
					var categoryName = $("#pCategory").val();
					
					$.ajax({
						url: "/hobbyist/category.su",
						type: "get",
						data: {categoryName: categoryName},
						success: function(data) {
							
							$select = $("#cCategory");
							$select.find("option").remove();
							$select.append($("<option>").text("----선택----"));
							
							for(var i = 0; i < data.length; i++) {
								var $option = $("<option>");
								$option.val(data[i].categoryCode);
								$option.text(data[i].nodeName);
								$select.append($option);
							}
						},
						error: function(error) {
							console.log(error);
						}
					});
				});
			});
		</script>
		</select>
	</div>
	
	
	<div class="category-list" id="category-list3">
		<p class="cTitle">내가 선택한 카테고리</p>
		<div id="selectCategory">
		<input type="hidden" name="categoryCode" id="myCategory1">	
		<span  class="myCategory-list" id="myCategory1">
		</span>		
		<script>
			$("#cCategory").change(function() {
				var $selectOp1 = $("#pCategory option:selected");
				var $selectOp2 = $("#cCategory option:selected");
				
					if($("#cCategory option").is(":selected")) {
						$(".myCategory-list").text($selectOp1.text() + "-" +  $selectOp2.text());
						$("#myCategory1").val($selectOp2.val());
						$(".myCategory-list").css({'display':'block'});

						console.log($selectOp2.val());
						console.log(typeof $selectOp2.val());
					}
			});
			
		</script>

		</div>
	</div>
	<%-- <input type="hidden" name="memberCode" value="<%=loginMember.getMemberCode()%>"> --%>
	<button type="submit" id="btn">확인</button>
	</form>
	</div>
	<%@ include file="/views/common/footer.jsp"  %>
	
	<% } else { 
		request.setAttribute("msg", "잘못된 경로로 접근하셨습니다.");
		request.getRequestDispatcher("../common/errorPage.jsp").forward(request, response);
	} %>
	

</body>
</html>