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
		border-collapse: separate;
		border-spacing: 10px;
	}
	
	
	
	
	#btn {
		width:100px;
		height:35px;
		color:white;
		background:darkolivegreen;
		/* border:1px solid darkolivegreen; */
		font-family: 'Nanum Gothic', sans-serif;
		font-size:16px;
		float:right;
		text-align:center;	
		margin-top:100px;
		margin-right:50px;
		line-height: 35px;
		cursor: pointer;
	}
	
	.myCategory-list {
		max-width:270px;
		height:33px;
		border-radius:15px;
		background:darkolivegreen;
		color:white;
		font-family: 'Nanum Gothic', sans-serif;
		font-weight:900;
		font-size:17px;
		text-align:center;
		line-height:33px;
		margin-top:15px;
		margin-left:20px;
		display: inline-block;
		padding: 4px;
		padding-left: 10px;
		padding-right:10px;
	}
	
	
</style>
</head>
<body>
	<%@ include file="/views/common/menubar.jsp"  %>
	<% if(loginMember != null) { %>
	<div id="main">
	<h2 id="title">관심 카테고리 등록</h2>
	<h3 id="content">관심 카테고리(최대 3개)를 설정하면 관심수업을 추천해드립니다!</h3>
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
		<table id="selectCategory">
		<!-- <input type="hidden" name="categoryCode" id="myCategory1">	
		<div  class="myCategory-list" id="myCategory1">
		</div> -->
			<tr>
				<td>
					<div  id="myCategory" ></div>
				</td>
			</tr>	
			<tr>
				<td><input type="hidden" name="categoryCode1" id="selectCate1"></td>
			</tr>
			<tr>
				<td><input type="hidden" name="categoryCode2" id="selectCate2"></td>
			</tr>
			<tr>
				<td><input type="hidden" name="categoryCode3" id="selectCate3"></td>
			</tr>
		</table>
	</div>
	<div id="btn" onclick="insertCategory();">확인</div>
	</form>
	</div>
	<script>
			/* $("#cCategory").change(function() {
				var $selectOp1 = $("#pCategory option:selected");
				var $selectOp2 = $("#cCategory option:selected");
				
					if($("#cCategory option").is(":selected")) {
						$(".myCategory-list").text($selectOp1.text() + "-" +  $selectOp2.text());
						$("#myCategory1").val($selectOp2.val());
						$(".myCategory-list").css({'display':'block'});

						console.log($selectOp2.val());
						console.log(typeof $selectOp2.val());
					}
			}); */
			
			ck = false;
			
			function insertCategory() {
				if(ck == true) {
					$('form').submit();
				}else {
					alert("관심 카테고리 1~3개를 선택해주세요.");
				}
					
			}
			
			$(function() {
				var selectIndex = 1;
				
				$("#cCategory").change(function() {
					var selectOp1 = $("#pCategory option:selected").val();
					var selectOp2 = $("#cCategory option:selected").val();
					
					if(selectIndex <= 3) {
						if(selectOp1 != '' && selectOp2 != '') {
							
							console.log('selectIndex : ' + selectIndex);
							$("#selectCate" + selectIndex).val(selectOp2);
							selectIndex++;
							
							
								$div = $("#myCategory");
								var $inDiv = $("<div class='myCategory-list'>").text($("#pCategory option:selected").text() + " | " + $("#cCategory option:selected").text());
								$div.append($inDiv);
								$div.append("<br><br>"); 
								
								ck = true;
						}else {
							alert("관심 카테고리를 설정해주세요.");
							ck = false;
						}
					}else {
						alert("관심 카테고리는 최대 3개까지만 입력 가능합니다.")
						ck = false;
					}
					
					
					console.log(selectOp2);
				});
			});
			
		</script>
	
	
	<%@ include file="/views/common/footer.jsp"  %>
	
	<% } else { 
		request.setAttribute("msg", "잘못된 경로로 접근하셨습니다.");
		request.getRequestDispatcher("../common/errorPage.jsp").forward(request, response);
	} %>
	

</body>
</html>