<%@page import="cumtrip.vo.MemberVO"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>


<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="<%= request.getContextPath() %>/view/css/main.css">
  <meta name="viewport" content="width=device-width, initial-scale=1">
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
  <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
 <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
  <link rel="stylesheet" type="text/css" href="../css/gallery.css" media="screen" />
<script src="<%= request.getContextPath() %>/view/js/main.js"></script> 
<script src="<%= request.getContextPath() %>/view/admin/js/typeahead.bundle.js"></script>
      <script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=uhaf2smrg5"></script>
  
<script>  
 $(document).ready(function(){
    // Defining the local dataset
    var citys = ['서울특별시', '서울특별시 종로구', '서울특별시 중구', '서울특별시 용산구', '서울특별시 성동구', '서울특별시 광진구', '서울특별시 동대문구', '서울특별시 중랑구', '서울특별시 성북구', '서울특별시 강북구'
    	,'서울특별시 도봉구','서울특별시 노원구','서울특별시 은평구','서울특별시 서대문구','서울특별시 마포구','서울특별시 양천구','서울특별시 강서구','서울특별시 구로구','서울특별시 금천구','서울특별시 영등포구','서울특별시 동작구','서울특별시 관악구','서울특별시 서초구'
    	,'서울특별시 강남구','서울특별시 송파구','서울특별시 강동구','부산광역시 중구','부산광역시 서구','부산광역시 동구','부산광역시 영도구','부산광역시 부산진구','대구광역시 중구','대구광역시 동구','대구광역시 서구','대구광역시 남구'
    	,'대구광역시 북구','인천광역시 중구','인천광역시 동구','인천광역시 미추홀구','인천광역시 연수구','인천광역시 남동구','광주광역시 동구','광주광역시 서구','광주광역시 남구','광주광역시 북구','광주광역시 광산구'
    	,'대전광역시 동구','대전광역시 중구','대전광역시 서구','대전광역시 유성구','대전광역시 대덕구','울산광역시 중구','울산광역시 남구','울산광역시 동구','울산광역시 북구','울산광역시 울주군','세종특별자치시'
    	,'수원시','고양시','용인시','성남시','부천시','안산시','화성시','남양주시','안양시','평택시','의정부시','파주시','시흥시','김포시','광명시','광주시','군포시','이천시','오산시','하남시'
    	,'양주시','구리시','안성시','포천시','의왕시','여주시','양평군','동두천시','과천시','가평군','연천군',''];
    
    // Constructing the suggestion engine
     var citys = new Bloodhound({
        datumTokenizer: Bloodhound.tokenizers.whitespace,
        queryTokenizer: Bloodhound.tokenizers.whitespace,
        local: citys
       
    });
    
    
    // Initializing the typeahead
     $('.typeahead').typeahead(null, {
         name: 'countries',
         limit: 100,    // 입력하면 아래에 나오는 예시 갯수 
         minLength: 1, // 검색창의 자동완성 기능 글자 나오는 설정 (숫자가 올라갈수록 숫자만큼 글자를 입력해야 미리보기가 나옴)
         source: citys   
     });
});  
 
</script>


<style>
.bs-example {
	font-family: sans-serif;
	position: relative;
	margin: 100px;
}

.typeahead, .tt-query, .tt-hint {
	box-shadow: 2px 3px 5px 0px;
	outline: medium none;
}

.typeahead:focus {
	border: 2px solid #0097CF;
}

.tt-hint { /* 입력창에 나오는 예시 검색어 색상변경 가능 */
	color: #999999;
	margin-left: 2px;
	margin-top: 2px;
}

.tt-menu { /* 입력하면 아래 지역별 입력창 폼  */
	background-color: #FFFFFF;
	border: 1px solid rgba(0, 0, 0, 0.2);
	border-radius: 8px;
	box-shadow: 0 5px 10px rgba(0, 0, 0, 0.2);
	margin-top: 12px;
	padding: 8px 0;
	width: 422px;
	overflow: scroll;
	max-height: 400px;
}

.tt-suggestion { /* 자동완성 창  */
	font-size: 20px;
	padding: 3px 20px;
	font-weight: bold;
	text-align: left;
	border-bottom: 1px solid #dae0e5;
}

.tt-suggestion:hover { /* 자동완성 창 마우스 올리면 효과 */
	cursor: pointer;
	background-color: #E0E0E0;
}

.twitter-typeahead { /*검색 창 부모 (검색 창 크기 조절은 여기서)   */
	width: 60%; /*.mainsch width에 영향줌 */
}

.mainsch { /*검색 창 자식  */
	border-style: none;
	border-radius: 80px;
	width: 100%;
	line-height: 50px; /*.icon에 margin-top 영향줌 */
	padding-left: 40px;
	padding-right: 17px;
}

.icon { /* 검색창 안의 돋보기 모양   */
	background-image: url(../images/돋보기.png);
	width: 20px;
	height: 20px;
	position: absolute;
	background-size: 100% 100%;
	margin-left: 15px;
	margin-top: 15px;
	z-index: 1;
}

.card-body {
	width: 300px;
	height: 400px;
	margin-left: 15%;
	border-radius: 30px;
	float: left;
}

#name {
	margin-left: 15%;
}

#web {
	text-decoration: underline;
}

#demo {
	width: 500px;
	height: 300px;
	float: right;
	margin-right: 15%;
}

.clear {
	clear: both;
}

#localintro, #review {
	margin-left: 15%;
	margin-right: 15%;
}

#restaurant, #space, #reviewscore {
	width: 300px;
	float: left;
	margin-right: 5px;
}

#map {
	width: 200px;
	height: 300px;
	float: left;
	margin-right: 5px;
}

.aroundimg {
	width: 70px;
	height: 70px;
	float: left;
}

.around {
	width: 200px;
	margin: 5px;
}

#reviewlist {
	float: right;
	width: 550px;
}

.star {
	position: relative;
	font-size: 2rem;
	color: #ddd;
}

.star input {
	width: 100%;
	height: 100%;
	position: absolute;
	left: 0;
	opacity: 0;
	cursor: pointer;
}

.star #substar {
	width: 0;
	position: absolute;
	left: 0;
	color: red;
	overflow: hidden;
	pointer-events: none;
}

.comment {
	border: 0.1px solid whitegray;
	text-align: center
}

.carousel-inner img {
	width: 100%;
	height: 100%;
}

body {
	width: 1200px;
}

.reivewphoto {
	width: 300px;
	height: 300px;
}

#btn1 {
	border: none;
	margin: auto 17px;
	display: inline-block;
}

#btn2 {
	border: none;
}
.date{
	display: inline-block;
}
.re{
	margin: 60px;
}

#modify, #falsemodify{
	margin-left: 260px;
	display: inline-block;
}
#delete, #falsedelete{
	margin-left: 10px;
}
.id {
	display: inline-block;
}

</style>


<%
String midno = request.getParameter("midno");
%>

  <script type="text/javascript">

  
  	$(function(){
  		midno = "<%=midno%>";
  		$.ajax({
  			url : "/cumtrip/detailplace.do",
  			type :'post',
  			async:false,
  			data : {"midno" : midno},
  			success : function(res){
  				str = '<p><h3>'+res.mid_name +'</h3></p>';
  				str += '<a href="'+res.mid_web+'" id="web">웹사이트 접속</a>';
  				$("#name").append(str);
  				$("#intro").append(res.mid_ex);
  				location2 = res.mid_location;
  				$("#addr").text(location2);
  				midx = res.mid_x;
  				midy = res.mid_y;
  				midno = res.mid_no;
  				$('.inputmidno').html('<input type="hidden" value="'+midno+'" name="midno">');
  				
  				
  			    first = location2.indexOf(" ");
  				temp = location2.substr(first+1);
  				second = temp.indexOf(" ");
  				si = location2.substr(0, first);
  				gun = location2.substr(first+1,second);
  			},
  			
  			error: function(xhr){
  			},
  			dataType: 'json'
  		})
  		
  		
  			$.ajax({
				url: "/cumtrip/views.do",
				type: 'get',
				data : {"midno" : midno},
				success : function(res){
				},
				error: function(xhr){
					alert(xhr.status);
				},
				dataType: 'json'
				})
  		$.ajax({
  			
  			url: "/cumtrip/selectonephoto.do",
  			type: "post",
  			data:{"midno" :midno },
  			success : function(res){
  				str = "";
  				main = midno.substr(0,1);
  				$.each(res, function(i, v){
  				if(i==0){
  				str += '<div class="carousel-item active">';
  			    str += '<img src="/cumtrip/'+main+'Photo.do?filename='+v+'" alt="'+v+'" class="slidephoto" >';
  			    str += '</div>';
  				}else{
  			    
  			    str += '<div class="carousel-item">';
  			    str += '<img src="/cumtrip/'+main+'Photo.do?filename='+v+'" alt="'+v+'" class="slidephoto" >';
  			    str += '</div>';}
  				})
  				$('.carousel-inner').html(str);
  			}
  		})
  		
  			$.ajax({
  		
  			url: "/cumtrip/aroundspace.do",
  			type: "get",
  			data:{"si" : si,
  				 "gun" : gun},
  			success : function(res){
  				str = "";
  				$.each(res, function(i, v){
  				str += '<div class="around">';
  			    str += '<a href="detailpage.jsp?midno='+v.mid_no+'"><img src="/cumtrip/TPhoto.do?filename='+v.photo_path+'" alt="'+v.photo_path+'" class="aroundimg"></a>';
  			    str += '<p>'+v.mid_name+'</p>';
  			    str += '<p>'+v.main_cate+'</p>';
  			    str += '</div>';
  				})
  				$('#space').append(str);
  			}
  		})
  			$.ajax({
  			
  			url: "/cumtrip/aroundrestaurant.do",
  			type: "get",
  			async:false,
  			data:{"si" : si,
 				 "gun" : gun},
  			success : function(res){
  				str = "";
  				$.each(res, function(i, v){
  				str += '<div class="around">';
  			    str += '<a href="detailpage.jsp?midno='+v.mid_no+'"><img src="/cumtrip/FPhoto.do?filename='+v.photo_path+'" alt="'+v.photo_path+'" class="aroundimg"></a>';
  			    str += '<p>'+v.mid_name+'</p>  ';
  			    str += '<p>'+v.main_cate+'</p>  ';
  			    str += '</div>';
  				})
  				$('#restaurant').append(str);
  			}
  		})
  		
  		

  		
  			$.ajax({
  			url: "/cumtrip/selectallreview.do",
  			type : "post",
  			data: {
  				"midno" : midno
  			},
  			success: function(res){
  				 
  				$.each(res, function(i,v){
  				str  = '<div class="detailreview">';
  			   	str += '<div>';
  			   	str += '<img src="" class="profile">';
  			    str += '<div id="d2"><span class="id">'+v.mem_email+'</span>';
  			    
  			    <% 
					//JSP문서에서 세션은 'session'이라는 이름으로 이미 생성되어 있다.
					MemberVO loginMemVo = (MemberVO)session.getAttribute("loginMember");
  			    
  			  		if(loginMemVo == null){
				%>
		  			    str += '<input type="button" id="falsemodify" value="수정" data-toggle="modal" data-target="#loginModal" style="width: 50px; height: 30px;">';
		  			    str += '<input type="button" id="falsedelete" value="삭제" data-toggle="modal" data-target="#loginModal" style="width: 50px; height: 30px;"></div>';
  			    <%
  			  		} else { //로그인관련 세션이 있을때(로그인이 되었을때)
  			  	%>
		  			  	str += '<input type="button" id="modify" idx="' +  v.mre_no   + '" value="수정"  style="width: 50px; height: 30px;">';
					    str += '<input type="button" id="delete" idx="' +  v.mre_no   + '" value="삭제" style="width: 50px; height: 30px;"></div>';
  			  	<%	
  			  		}
  			    %>
  			    
  			   	str += '<img src="" class="like" style="float: right">';
  			   	str += '</div>';	
  			   	str += '<div class="clear"></div>';
  			   	str += '<span class="star">★★★★★<span style="width:'+v.mre_point*15 +'px;  position: absolute;  left: 0;';  
  			   	str += 'pointer-events: none;  color: red;    overflow: hidden;">★★★★★</span>';
  	 			str += '</span>';
  			   	str += '<div class="contentbox">';
  			   	str += '<h5>'+v.mre_title+'</h5>';
  	 			str += '<div id="d1"><p class="date">'+v.mre_date+'<span class="re">';
  	 			str += '<button type="button" id="btn1" data-toggle="modal" data-target="#loginModal"><img  src="../images/좋아요.png" style="width: 23px; height: 23px;"></button>';
  	 			str += '<button type="button" id="btn2" data-toggle="modal" data-target="#loginModal"><img  src="../images/신고.png" style="width: 25px; height: 23px;"></button>';
  	 			str += '</span></p></div>';
  			   	str +=	'<div class="content">'+v.mre_content+'</div>';
  			    str +=  '<img src="/cumtrip/reviewphoto.do?filename='+v.mre_imgpath+'" class="reivewphoto">';
  			   	str += '<a href="#" class="reviewLike_button_d">좋아요</a>';
  			   	str +=	'<div class="accordion accordion-flush">';
  			   	str +=  '<div class="accordion-item">';
  			    str += '<h2 class="accordion-header" id="flush-headingOne">';
  			    str +=  '<button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapse'+i+'" aria-expanded="false" aria-controls="flush-collapse'+i+'">';
  			    str +=   '댓글창<input type="hidden" value="'+v.mre_no+'" class="mreno"></button>';
  			    str += '</h2> ';
  			    str +='<div id="flush-collapse'+i+'" class="accordion-collapse collapse" aria-labelledby="flush-headingOne" data-bs-parent="#accordionFlushExample">';
  			    str += '<div class="accordion-body"> </div>';
  			    str += '</div>';
  			    str += '</div>';
  			    str += '</div></div></div><hr>';
  			   	$('#reviewlist').append(str);
  			   	
  	
  				})
  			},
  			error: function(xhr){
  				alert(xhr.status);
  			},
  			dataType: 'json'
  			})
  			
  			
  			$(document).on('click','.accordion-button', function(){
  			 mreno = $(this).find('.mreno').val();
  		   commentplace	 = $(this).parents('.accordion-item').find('.accordion-body')
  		   
  				$.ajax({
  					url : "/cumtrip/selectcomment.do",
  					type : 'get',
  					data : {"mreno" : mreno},
  					success : function(res){
  						
  						str = '<input type="text" name="reviewcontent" placeholder="댓글추가" class="form-control"><br>';
  						str += '<input type="button" value="댓글달기" class="btn-success commentsubmit" style="float:right" >';
  						
  						if(res == ""){
  							str +="<br><div>등록된 댓글이 없습니다.</div>";
  							
  						}else{
  					
  						$.each(res, function(i,v){
  						str += '<div>';
  						str += '<span>'+v.mem_email+'<span><p style="text-align: right">작성일 : '+v.com_date+'</p>';
  						str += '<p>'+v.com_content+'<p>';
  						str += '</div>';
  					
  						})
  						
  					}
  						
  						$(commentplace).html(str);
  					},
  					
  					error: function(xhr){
  						alert(xhr.status);
  					},
  					dataType: 'json'
  
  				})
  				
  			})
  			
  			$(document).on('click','.commentsubmit',function(){
  				content = $(this).prev().prev().val();
  				mreno =  $(this).parents('.accordion-item').find('.mreno').val();

  				$.ajax({
  					url: '/cumtrip/insertcomment.do',
  					type : 'post',
  					data : {"content" : content,
  							"mreno" : mreno},
  					success: function(res){
  						str = '<div>';
  						str += '<span><span><p style="text-align: right">작성일 : </p>';
  						str += '<p>'+content+'<p>';
  						str += '</div>';
  						$(commentplace).append(str);
  						
  					},
  					error: function(xhr){
  						
  					},
  					dataType : 'json'
  				})
  				
  				
  			} )
  			
		
  		var HOME_PATH = window.HOME_PATH || '.';
  		var cityhall = new naver.maps.LatLng(midx, midy),
  		    map = new naver.maps.Map('map', {
  		        center: cityhall,
  		        zoom: 18
  		    }),
  		    marker = new naver.maps.Marker({
  		        map: map,
  		        position: cityhall
  		    });

  
  		var infowindow = new naver.maps.InfoWindow({
  		    maxWidth: 140,
  		    backgroundColor: "#eee",
  		    borderColor: "#2db400",
  		    borderWidth: 5,
  		    anchorSize: new naver.maps.Size(30, 30),
  		    anchorSkew: true,
  		    anchorColor: "#eee",
  		    pixelOffset: new naver.maps.Point(20, -20)
  		});

  		naver.maps.Event.addListener(marker, "click", function(e) {
  		    if (infowindow.getMap()) {
  		        infowindow.close();
  		    } else {
  		        infowindow.open(map, marker);
  		    }
  		});
  		 drawStar = (target) => {
 		    $('.star span').css({ 'width': target.value*15 });
 		    var star = '<p>별점 '+ target.value + '점</p>'; 
 		    $('#starlabel').html(star);
 		  }
		$('#inputsubmit').on('click', function(){
			$('#input').submit();
			
		})
		$('#inputsubmit2').on('click',function(){
			$('#inputphoto').submit();
		})
		
		$('#upinputsubmit').on('click',function(){
			$('#upinput').submit();
		})
		
		$('#deinputsubmit').on('click',function(){
			$('#deinput').submit();
		})
		
		// 수정버튼 클릭 이벤트 
		$(document).on('click', '#modify', function(){
			
			//alert($(this).attr('idx'));
			
			$('#modifyModal .mreno').val($(this).attr('idx'));
			$('#modifyModal').modal('show');
			$('.mreno').attr('value', mreno);
			
		})
					
		
		// 삭제버튼 클릭 이벤트 
		$(document).on('click', '#delete', function(){
			
			//alert($(this).attr('idx'));
			
			$('#deleteModal .mreno').val($(this).attr('idx'));
			$('#deleteModal').modal('show');
			$('.mreno').attr('value', mreno);
		})
		
  		$('.close').on('click',function(){
  			$(this).parents('.modal').modal('hide');
  		})		
		

  	})
  </script>
</head>
<body>

<header id="header"><!-- 상단 헤더 불러오기 -->
	  <article style="margin: 5px 18%;">
	   <div class="box" style="display:table; width: 100%;">
	    <div class="backgroundimg">
	     <span class="icon"></span>
		  <input type="search" autocomplete="off" spellcheck="false"  class="mainsch typeahead tt-query" 
		  placeholder="어디로 가시나요?" >
		</div>
	   </div>
	  </article>
</header>
<div class="name_Box">
<div id ="name" class="nameDetailpage">
	
 </div>
<div class ="name_rightBox">
	<a href="#">좋아요</a>
 </div> 
 </div>
  <div>
    <div class="card-body Light card " id="intro">
    <h3>소개</h3><br>
    
    </div>
     
	<div id="demo" class="carousel slide" data-ride="carousel">
  
  <!-- The slideshow -->
  <div class="carousel-inner" style ="width:500px; height: 500px;">
 
  
  </div>
 
  <!-- Left and right controls -->
  <a class="carousel-control-prev" href="#demo" data-slide="prev">
    <span class="carousel-control-prev-icon"></span>
  </a>
  <a class="carousel-control-next" href="#demo" data-slide="next">
    <span class="carousel-control-next-icon"></span>
  </a>
</div>
	</div>
<div class="clear"></div><br><br>
<div id="localintro">
<h3>지역 설명</h3>
<p id="addr" style="text-decoration: underline;"></p><br>
<p>베스트 주변</p>
<div id="restaurant">
	<p>음식점</p><br>
</div>
<div id="space">
	<p>관광명소</p><br>
</div>
<div id="map" >
</div>
</div>
<div class="clear"></div>
<hr><br><br>

<div id="review">
	<h3>리뷰 작성</h3>
	<input type = "button" value ="리뷰작성하기" class= "btn-outline-secondary" style="margin: 5px" data-toggle="modal" data-target="#myModal" >
	<input type = "button" value ="사진업로드" class="btn-outline-secondary" data-toggle="modal" data-target="#myModal2">
	<br>
	<br>
	<div>
		<h3>리뷰</h3>
		<div id="reviewscore">
			리뷰 스코어
		
		</div>
		<div id="reviewlist">
		   
		
		</div>
	</div>
</div>
<div class="clear"></div>


<footer id="footer"><!-- 하단불러오기 --></footer>
		<!-- Copyright(c)2021 Hong -->


			<div class="modal" id="myModal">
			<div class="modal-dialog"><div class="modal-content"><div class="modal-header">
		    <h4 class="modal-title">리뷰 작성</h4>                                           
		    <button type="button" class="close" data-dismiss="modal">&times;</button>
		    </div>                                                                                   
		    <div class="modal-body">                                                                  
		  	<form id="input" action='/cumtrip/insertmreview.do' method="post"  enctype="multipart/form-data" >
		    <table>                                                                          
		     <tr>                                                                                    
		     <td style="text-align: left"><label>리뷰 제목</label>                                                                   
		     <input type="text" name ="title" placeholder="제목을 입력해 주세요." style="width: 300px"></td>
		    </tr>  
		    <tr>
		    <label id='starlabel'>별점</label><br>
		    	<span class="star">
  				★★★★★
 				 <span id="substar">★★★★★</span>
 				 <input type="range" oninput="drawStar(this)" value="1" step="1" min="0" max="10" id='star' name="point">
				</span>
		                                                                                    
		     <tr>                                                                                     
		     <td colspan = '2' style="text-align: left">리뷰 내용<br>                                                                      
		     <textarea name="content" placeholder="내용을 입력해 주세요." style="width: 100%; height: 200px; boarder: none; resize: none;"></textarea></td>   		                                 
		     </tr>                                                                                  
		     <tr>
		     <td colspan='2' style="text-align: left; font-weight: bold">사진첨부<input type="file" name="file">    <span class="inputmidno"></span>  </td>                                                                        
		     </tr>                                                                                                                                                                        
		    </table>
		 	</form>   
		    </div>                                                                          
		     <div class="modal-footer">
		    <input type="button" value="입력" id="inputsubmit" class="btn btn-success"> 
		    <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>  
		     
		   </div></div></div></div>     
		   
		   
		   	<div class="modal" id="myModal2">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
		    				<h4 class="modal-title">사진 업로드</h4>                                           
		    				<button type="button" class="close" data-dismiss="modal">&times;</button>
		    			</div>                                                                                   
		    			<div class="modal-body">                                                                  
		    				<h4>업로드할 사진을 선택하세요.</h4> 
		  					<form id="inputphoto" action='/cumtrip/insertphotorestaurant.do' method="post"  enctype="multipart/form-data" >
		    					<table>                                                                          
		     						<tr>                                                                                    
		     							<td style="text-align: left">
		     								<input type="file" name="file" multiple><span class="inputmidno"></span>
										</td> 
		                                                                     
		     						</tr>                                                                                                                                                                        
		    					</table>
		 		     		</form>   
		    			</div>                                                                          
		     			<div class="modal-footer">
		    				<input type="button" value="업로드" id="inputsubmit2" class="btn btn-success">
		    				<button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>  
		     			</div>
		     		</div>
		     	</div>
		     </div>   



			<div class="login_wrap_TopRight">
				<!-- 로그인시작 -->
	
				<a data-toggle="modal" href="#loginModal" id="top_login">LOGIN</a>
					<div class="modal fade" id="loginModal" role="dialog">
						<div class="modal-dialog">
							<div class="modal-content">
								<div class="modal-header">
									<h1 class="modal-title" align="center">로그인</h1>
									<button type="button" class="close" data-dismiss="modal">×</button>
				
								</div>
				     			<div class="modal-body">
					         		<!-- 본문시작 -->
									<form id="login_form" action="<%= request.getContextPath() %>/sessionLogin.do" method="get">
						      			<label for="id">ID</label><input type="text" class="form-control" id="id" name="memid" placeholder="id"><br>
						      			<label for="pass">PASS</label><input type="text" class="form-control" id="pass" name="mempass" placeholder="pass"><br>
						      			<input type="submit" value="확인" id="login_button"  class="btn btn-dark"><br><br>
						      			<a href="<%= request.getContextPath() %>/view/jsp/memberLogin/findID.jsp">아이디 찾기</a>
						      			<a href="<%= request.getContextPath() %>/view/jsp/memberLogin/findPass.jsp">비밀번호 찾기</a>
						      			<a href="<%= request.getContextPath() %>/view/jsp/memberLogin/singIn.jsp">회원가입</a>
						      		</form>
								</div>
							</div>
						</div>
					</div>
				  
				<!-- 로그인 마침 -->
			  
				<a href="<%= request.getContextPath() %>/view/jsp/memberLogin/singIn.jsp" class="topButton" id="SignUp">회원가입</a>
			</div>
		
		
	
			<div class="modal" id="modifyModal">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
		    				<h4 class="modal-title">리뷰 수정</h4>                                           
							<button type="button" class="close" data-dismiss="modal" >×</button>
						</div>                                                                                   
						<div class="modal-body">                                                                  
							<form id="upinput" method="post" action="/cumtrip/upatemreview.do" enctype="multipart/form-data" >
								<table>                                                                          
									<tr>                                                                                    
										<td style="text-align: left"><label>리뷰 제목</label>                                                                   
											<input type="text" name ="title" placeholder="수정할 제목을 입력해 주세요." style="width: 300px">
											<input type="hidden" name="mreno" class="mreno" >
											
											
										</td>
									</tr>  
									<tr>
										<label id='starlabel'>별점</label><br>
										<span class="star">
											★★★★★
											<span id="substar">★★★★★</span>
											<input type="range" oninput="drawStar(this)" value="1" step="1" min="0" max="10" id='star' name="point">
										</span>
									</tr>	
									<tr>                                                                                     
										<td colspan = '2' style="text-align: left">리뷰 내용<br>                                                                      
											<textarea name="content" placeholder="수정할 내용을 입력해 주세요." style="width: 100%; height: 200px; boarder: none; resize: none;"></textarea>
										</td>   		                                 
									</tr>                                                                                  
									<tr>
										<td colspan='2' style="text-align: left; font-weight: bold">사진첨부
											<input type="file" name="file"><span class="inputmidno"></span>
										</td>                                                                        
									</tr>                                                                                                                                                                        
								</table>
							</form>   
						</div>                                                                          
						<div class="modal-footer">
							<input type="button" value="수정완료"  id="upinputsubmit" class="btn btn-success"> 
							<button type="button" class="close btn btn-danger" data-dismiss="modal">Close</button> 
						</div>
					</div>
				</div>	
			</div>	
	
			<!-- The Modal -->
			<div class="modal" id="deleteModal">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
	        				<h4 class="modal-title">리뷰 삭제</h4>
	        				<button type="button" class="close" data-dismiss="modal">×</button>
	        			</div>
	
						<!-- Modal body -->
						<div class="modal-body">
							<form id="deinput" method="post" action="/cumtrip/Deletemreview.do" >
								<input type="hidden" name="mreno" class="mreno" >
								<span class="inputmidno"></span>
								<label>리뷰를 삭제하시겠습니까?</label>
							</form> 
						</div>
					
	
						<!-- Modal footer -->
						<div class="modal-footer">
							<input type="button" value="삭제" id="deinputsubmit" class="btn btn-success"> 
							<button type="button" class="close btn btn-danger" data-dismiss="modal">Close</button> 
						</div>
					</div>
				</div>
			</div>
  
</body>
</html>