<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<script src="https://kit.fontawesome.com/0661566fd2.js"
   crossorigin="anonymous"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
 <link rel="stylesheet" href="/cumtrip/view/css/main.css"> 
 <script src="https://kit.fontawesome.com/0661566fd2.js" crossorigin="anonymous"></script>
 <meta name="viewport" content="width=device-width, initial-scale=1">
 <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script src="/cumtrip/view/js/main.js"></script> 
<script src="/cumtrip/view/js/sub_tour.js"></script>
  <!-- 로딩중 -->
<link rel="stylesheet" href="/cumtrip/view/css/fakeLoader.css">
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
<script src="/cumtrip/view/js/fakeLoader.js"></script>
<!--  메인 인기순 추천 여행지 -->
<script src="/cumtrip/view/js/typeahead.bundle.js"></script>


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

.tt-hint {/* 입력창에 나오는 예시 검색어 색상변경 가능 */
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
.tt-suggestion:hover {  /* 자동완성 창 마우스 올리면 효과 */
   cursor: pointer;
   background-color: #E0E0E0;
   
}


.backgroundimg{ /* 검색창 배경 설정    */
    background-image: url(https://static.tacdn.com/img2/brand/home/homemar2022_dt_trans.png);
    background-size: 100% 100%;
    height: 320px;
    display: table-cell;
    vertical-align: middle;
  
}
.twitter-typeahead{ /*검색 창 부모 (검색 창 크기 조절은 여기서)   */
    width: 60%; /*.mainsch width에 영향줌 */
}
.mainsch{ /*검색 창 자식  */ 
   border-style: none;
    border-radius: 80px;
     width: 100%; 
    line-height: 50px;  /*.icon에 margin-top 영향줌 */
    padding-left: 40px;
    padding-right: 17px;
}

.icon {/* 검색창 안의 돋보기 모양   */
    position: absolute;
    margin-left: 720px;
    margin-top: 13px;
    z-index: 1;
}    

.btn1{ /* 돋보기 배경  */
   background: url(../images/돋보기.png) no-repeat;
   border: 0;
}



.contain_box{
text-align: left !important;

}

.maintrip{
  float: left;

} 
 
 
.carousel-inner img {
   width: 100%;
   height: 100%;
   margin-top: 50px;
   margin-bottom: 10px;
}

.carousel slide {
   width: 800px;
   height: 700px;
}

.carousel-inner span {
   width: 22%;
   height: 300px;
   display: inline-block;
}

h4, h5{
   font-weight: bold;
}

#mycarousel2{
   margin-bottom: 100px;
}

#l1 {
   float: left;
   display: inline-block;
   width: 25%;
   margin-top: 60px;
   margin-bottom: 230px;
}

#l2 {
   float: left;
   display: inline-block;
   width: 25%;
   margin-top: 170px;
   margin-bottom: 240px;
}

#l3 {
   float: left;
   display: inline-block;
   width: 25%;
   margin-top: 160px;
}

.carousel-inner {
   float: right;
   display: inline-block;
   margin: 0 auto;
   margin-bottom: 10px;
   width: 75%;
}

.carousel-inner span {
   width: 30%;
   padding: 10px;
}

.carousel-indicators{
   width: 150px;
   margin: 0 auto;
   bottom: 80px;
}



#plz{
   display: block;
   flex: justify-content;
   margin-bottom: 10px;
}




#wrap {
    margin-bottom: 100px !important;
}

.container mt-3{

max-width: 1200px;
}

*, ::after, ::before {
    box-sizing: content-box;
}


</style>
  
<script>  
 $(document).ready(function(){
       var citys = [];
      $.ajax({
          url:'<%=request.getContextPath()%>/SearchSido.do' ,
          type:'post',
          success: function(res){
              
          $.each(res, function(i,v){   
              citys.push(''+v.sido+" "+v.gugun+'');
            })

            
            citys = new Bloodhound({
                  datumTokenizer: Bloodhound.tokenizers.whitespace,
                  queryTokenizer: Bloodhound.tokenizers.whitespace,
                  local: citys 
                 
              });
          
            $('.typeahead').typeahead(null, {
                   name: 'countries',
                   limit: 100,    // 입력하면 아래에 나오는 예시 갯수 
                   minLength: 1, // 검색창의 자동완성 기능 글자 나오는 설정 (숫자가 올라갈수록 숫자만큼 글자를 입력해야 미리보기가 나옴)
                   source: citys
                   
               });
            
          
                         
          },
          error: function(xhr){
             alert('상태 :'+ xhr.status)
          },
          dataType:'json'
             
       })
     
      
      
       
      $('#submit').on('click',function(){
         
        addr =  $('#search').val();
         
        location.href= '<%=request.getContextPath()%>/view/jsp/submain.jsp?addr='+addr+'';
        
     
   })   
   
   
   $.ajax({
         url : '/cumtrip/MainRandomTourList.do',
         type : 'get',
         
         success : function(res) {
            console.log(res)
            $.each(res, function(i, v) {
               if (i < 3) {
                  str = "<span>";
                  str += '<a href="detailpage.jsp?midno='+v.mid_no+'"><img src="/cumtrip/MainTourList.do?filename=' + v.photo_path + '" alt="' + v.photo_path + '" ></a>';
                  str += '<h5>' + v.mid_name + '</h5>';
                  str += '<b>' + v.main_cate + '</b></span>';
                  $('#t1').append(str);
               } else if (i < 6) {
                  str = "<span>";
                  str += '<a href="detailpage.jsp?midno='+v.mid_no+'"><img src="/cumtrip/MainTourList.do?filename=' + v.photo_path + '" alt="' + v.photo_path + '" ></a>';
                  str += '<h5>' + v.mid_name + '</h5>';
                  str += '<b>' + v.main_cate + '</b></span>';
                  $('#t2').append(str);

               } else if (i < 9) {
                  str = "<span>";
                  str += '<a href="detailpage.jsp?midno='+v.mid_no+'"><img src="/cumtrip/MainTourList.do?filename=' + v.photo_path + '" alt="' + v.photo_path + '" ></a>';
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
         url : '/cumtrip/MainRecTourList.do',
         type : 'get',
         
         success : function(res) {
            $.each(res, function(i, v) {

               if (i < 3) {
                  str = "<span>";
                  str += '<a href="detailpage.jsp?midno='+v.mid_no+'"><img src="/cumtrip/MainTourList.do?filename=' + v.photo_path + '" alt="' + v.photo_path + '" ></a>';
                  str += '<h5>' + v.mid_name + '</h5>';
                  str += '<b>' + v.main_cate + '</b></span>';
                  $('#s1').append(str);
               } else if (i < 6) {
                  str = "<span>";
                  str += '<a href="detailpage.jsp?midno='+v.mid_no+'"><img src="/cumtrip/MainTourList.do?filename=' + v.photo_path + '" alt="' + v.photo_path + '" ></a>';
                  str += '<h5>' + v.mid_name + '</h5>';
                  str += '<b>' + v.main_cate + '</b></span>';
                  $('#s2').append(str);

               } else if (i < 9) {
                  str = "<span>";
                  str += '<a href="detailpage.jsp?midno='+v.mid_no+'"><img src="/cumtrip/MainTourList.do?filename=' + v.photo_path + '" alt="' + v.photo_path + '" ></a>';
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
         url : '/cumtrip/MainTourListUpload3.do',
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
   
   
   
   

});  
</script> 
  
  
  
</head>
<body>
<header id="header"><!-- 상단 헤더 불러오기 --></header>

   
   <contain>
      
   <article style="margin: auto; width: 1200px;">
      <div class="box" style="display:table; width: 100%;">
       <div class="backgroundimg">
        <form>
         <span class="icon">
         <button type="button" id="submit" class="btn1"><img  src="../images/돋보기.png" style="width: 23px;
            height: 23px;">
         </button>
         </span>
        <input type="text"  id="search" name="search" autocomplete="off" spellcheck="false"  class="mainsch typeahead tt-query" 
        placeholder="어디로 가시나요?">    
        </form>
      </div>
      </div>
     </article>
      
       <section>
         <article>
            <ol class="contain_box" style= "height: 1500px;">
               <div class="container mt-3">
               

                  <div id="myCarousel" class="carousel slide">
                     <!-- The slideshow -->
                     <div class="plz">
                        <div id="l1">
                           <span class="att">
                              <h4>추천 여행지</h4>
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
                              <h4>인기순</h4>
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
                              <h4>맞춤 추천</h4>
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
      


<footer id="footer"><!-- 하단불러오기 --></footer>
<!-- 로딩 -->
 <div class="fakeLoader"></div>
 <script src="<%= request.getContextPath() %>/view/js/fakeLoader_speed.js"></script>
   

</body>
</html>