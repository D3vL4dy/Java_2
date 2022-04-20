<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://kit.fontawesome.com/0661566fd2.js" crossorigin="anonymous"></script>
<meta charset="UTF-8">
<title>sunMain_tour.jsp</title>
<link rel="stylesheet" href="<%= request.getContextPath() %>/view/css/main.css">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script src="<%= request.getContextPath() %>/view/js/main.js"></script>
<script src="<%= request.getContextPath() %>/view/js/sub_tour.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
<link rel="stylesheet" href="<%= request.getContextPath() %>/view/css/sub_tour.css">

<script>
	$(function() {
		// 관광지 1-9
		$.ajax({
			url : '/cumtrip/TourListUpload1.do',
			type : 'get',
			
			success : function(res) {
				$.each(res, function(i, v) {
					if (i < 3) {
						str = "<span>";
						str += '<a href="detailpage.jsp?midno='+v.mid_no+'"><img src="/cumtrip/TourList.do?filename=' + v.photo_path + '" alt="' + v.photo_path + '" ></a>';
						str += '<h5>' + v.mid_name + '</h5>';
						str += '<b>' + v.main_cate + '</b></span>';
						$('#t1').append(str);
					} else if (i < 6) {
						str = "<span>";
						str += '<a href="detailpage.jsp?midno='+v.mid_no+'"><img src="/cumtrip/TourList.do?filename=' + v.photo_path + '" alt="' + v.photo_path + '" ></a>';
						str += '<h5>' + v.mid_name + '</h5>';
						str += '<b>' + v.main_cate + '</b></span>';
						$('#t2').append(str);

					} else if (i < 9) {
						str = "<span>";
						str += '<a href="detailpage.jsp?midno='+v.mid_no+'"><img src="/cumtrip/TourList.do?filename=' + v.photo_path + '" alt="' + v.photo_path + '" ></a>';
						str += '<h5>' + v.mid_name + '</h5>';
						str += '<b>' + v.main_cate + '</b></span>';
						$('#t3').append(str);
					} 
				})
			},
			error : function(xhr) {
				alert("상태 : " + xhr.status);
			},
			dataType : 'json'
		})
		
 		// 관광지 10-18
		$.ajax({
			url : '/cumtrip/TourListUpload2.do',
			type : 'get',
			
			success : function(res) {
				$.each(res, function(i, v) {

					if (i < 3) {
						str = "<span>";
						str += '<a href="detailpage.jsp?midno='+v.mid_no+'"><img src="/cumtrip/TourList.do?filename=' + v.photo_path + '" alt="' + v.photo_path + '" ></a>';
						str += '<h5>' + v.mid_name + '</h5>';
						str += '<b>' + v.main_cate + '</b></span>';
						$('#s1').append(str);
					} else if (i < 6) {
						str = "<span>";
						str += '<a href="detailpage.jsp?midno='+v.mid_no+'"><img src="/cumtrip/TourList.do?filename=' + v.photo_path + '" alt="' + v.photo_path + '" ></a>';
						str += '<h5>' + v.mid_name + '</h5>';
						str += '<b>' + v.main_cate + '</b></span>';
						$('#s2').append(str);

					} else if (i < 9) {
						str = "<span>";
						str += '<a href="detailpage.jsp?midno='+v.mid_no+'"><img src="/cumtrip/TourList.do?filename=' + v.photo_path + '" alt="' + v.photo_path + '" ></a>';
						str += '<h5>' + v.mid_name + '</h5>';
						str += '<b>' + v.main_cate + '</b></span>';
						$('#s3').append(str);
					} 
				})
			},
			error : function(xhr) {
				alert("상태 : " + xhr.status);
			},
			dataType : 'json'
		})
		
		// 관광지 19-27
		$.ajax({
			url : '/cumtrip/TourListUpload3.do',
			type : 'get',
			
			success : function(res) {
				$.each(res, function(i, v) {
					if (i < 3) {
						str = "<span>";
						str += '<a href="detailpage.jsp?midno='+v.mid_no+'"><img src="/cumtrip/TourList.do?filename=' + v.photo_path + '" alt="' + v.photo_path + '" ></a>';
						str += '<h5>' + v.mid_name + '</h5>';
						str += '<b>' + v.main_cate + '</b></span>';
						$('#f1').append(str);
					} else if (i < 6) {
						str = "<span>";
						str += '<a href="detailpage.jsp?midno='+v.mid_no+'"><img src="/cumtrip/TourList.do?filename=' + v.photo_path + '" alt="' + v.photo_path + '" ></a>';
						str += '<h5>' + v.mid_name + '</h5>';
						str += '<b>' + v.main_cate + '</b></span>';
						$('#f2').append(str);

					} else if (i < 9) {
						str = "<span>";
						str += '<a href="detailpage.jsp?midno='+v.mid_no+'"><img src="/cumtrip/TourList.do?filename=' + v.photo_path + '" alt="' + v.photo_path + '" ></a>';
						str += '<h5>' + v.mid_name + '</h5>';
						str += '<b>' + v.main_cate + '</b></span>';
						$('#f3').append(str);
					} 
				})
			},
			error : function(xhr) {
				alert("상태 : " + xhr.status);
			},
			dataType : 'json'
		})
		 
	})
</script>
</head>

<body>
	<header id="header">
		<!-- 상단 헤더 불러오기 -->
	</header>
	<div id="wrap">

		<contain>
		<section>
			<article>
				<ol class="contain_box">
					<div class="container mt-3">
						<h1>대전의 관광명소</h1>

						<div id="myCarousel" class="carousel slide">
							<!-- The slideshow -->
							<div class="plz">
								<div id="l1">
									<span class="att">
										<h4>랜드마크</h4>
									</span>
								</div>

								<div class="carousel-inner" data-interval="false">
									<div class="carousel-item active" id="t1"></div>
									<div class="carousel-item" id="t2"></div>
									<div class="carousel-item" id="t3"></div>
									<br><br>

									<!-- Indicators 몇 개의 슬라이드가 있고 현재 어느 슬라이드인지 알려주는 부분 -->
									<div class="in">
										<ul class="carousel-indicators">
											<li class="item1 active"></li>
											<li class="item2"></li>
											<li class="item3"></li>
										</ul>
									</div>
								</div>
								<!-- carousel-inner 끝 -->
							</div>
							<!-- plz 끝 -->
						</div>
						<!-- myCarousel 끝 -->

<!-- 
						Left and right controls 이전, 다음 버튼
						<a class="carousel-control-prev" href="#myCarousel"> 
							<span class="carousel-control-prev-icon"></span>
						</a> 
						<a class="carousel-control-next" href="#myCarousel"> 
							<span class="carousel-control-next-icon"></span>
						</a>
						 -->
						
						<!-- 관광지 끝 -->

						
						<div id="myCarousel2" class="carousel slide">
							<!-- The slideshow -->
							<div class="plz">
								<div id="l2">
									<span class="att">
										<h4>레저 & 박물관</h4>
									</span>
								</div>

								<div class="carousel-inner" data-interval="false">
									<div class="carousel-item active" id="s1"></div>
									<div class="carousel-item" id="s2"></div>
									<div class="carousel-item" id="s3"></div>
									<br><br>

									<!-- Indicators 몇 개의 슬라이드가 있고 현재 어느 슬라이드인지 알려주는 부분 -->
									<div class="in">
										<ul class="carousel-indicators">
											<li class="item21 active"></li>
											<li class="item22"></li>
											<li class="item23"></li>
										</ul>
									</div>
								</div>
								<!-- carousel-inner 끝-->
							</div>
							<!-- plz 끝-->
						</div>
						<!-- myCarousel2 끝 -->
<!-- 
						Left and right controls 이전, 다음 버튼
						<a class="carousel-control-prev" href="#myCarousel"> 
							<span class="carousel-control-prev-icon"></span>
						</a> 
						<a class="carousel-control-next" href="#myCarousel"> 
							<span class="carousel-control-next-icon"></span>
						</a>
						 -->
						
						<!-- 숙소 끝 -->
						
						
						<div id="myCarousel3" class="carousel slide">
							<!-- The slideshow -->
							<div class="plz">
								<div id="l3">
									<span class="att">
										<h4>쇼핑 & 자연공원</h4>
									</span>
								</div>

								<div class="carousel-inner" data-interval="false">
									<div class="carousel-item active" id="f1" ></div>
									<div class="carousel-item" id="f2"></div>
									<div class="carousel-item" id="f3"></div>
									<br><br>

									<!-- Indicators 몇 개의 슬라이드가 있고 현재 어느 슬라이드인지 알려주는 부분 -->
									<div class="in">
										<ul class="carousel-indicators">
											<li class="item31 active"></li>
											<li class="item32"></li>
											<li class="item33"></li>
										</ul>
									</div>
								</div>
								<!-- carousel-inner 끝 -->
							</div>
							<!-- plz 끝 -->
						</div>
						<!-- myCarousel3 끝 -->

<!-- 
						Left and right controls 이전, 다음 버튼
						<a class="carousel-control-prev" href="#myCarousel"> 
							<span class="carousel-control-prev-icon"></span>
						</a> 
						<a class="carousel-control-next" href="#myCarousel"> 
						<span class="carousel-control-next-icon"></span>
						</a>
						 -->
						<!-- 음식점 끝 -->
					</div>
					<!-- container mt-3 끝 -->


				</ol>
			</article>

		</section>

		</contain>

	</div>


	<footer id="footer">
		<!-- 하단불러오기 -->
	</footer>
	<!-- Copyright(c)2021 Hong -->

</body>
</html></html>